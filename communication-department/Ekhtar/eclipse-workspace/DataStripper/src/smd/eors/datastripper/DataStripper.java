package smd.eors.datastripper;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Mutation;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapreduce.TableMapper;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import smd.eors.dataaccess.DataSchema;


public class DataStripper
{  
    public static class MapStripper extends TableMapper<ImmutableBytesWritable, ImmutableBytesWritable>
    {
        private byte[] reportRowKey;
        private byte[] publisher;
        private byte[] es;
        private byte[] text;
        private byte[] timestamp;
        private byte[] commandId;
        private byte[] attachments;
        private byte[] attachmentFiles;
        
        private byte[] rowKey;      
        private int offset;

        @Override
        protected void map(ImmutableBytesWritable key, Result value,
                Mapper<ImmutableBytesWritable, Result, ImmutableBytesWritable, ImmutableBytesWritable>.Context context)
                        throws IOException, InterruptedException
        {
            reportRowKey=value.getRow();
            publisher=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_PUBLISHER));
            es=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ES));
            text=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TEXT));
            timestamp=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TIMESTAMP));
            commandId=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_COMMANDID));
            attachments=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTS));
            attachmentFiles=value.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTFILES));
            
            if(text!=null && text.length>0)
            {
                rowKey=new byte[Bytes.SIZEOF_INT+Bytes.SIZEOF_INT+Bytes.SIZEOF_INT+Bytes.SIZEOF_LONG]; 
                offset=Bytes.putInt(rowKey, 0, Bytes.toString(publisher).hashCode());
                Bytes.putInt(rowKey, offset, Bytes.toString(es).hashCode());
                Bytes.putLong(rowKey, offset, Bytes.toLong(timestamp));
                Bytes.putInt(rowKey, offset, Bytes.toString(text).hashCode());
                
                if(Program.stripReplication)
                    context.write(new ImmutableBytesWritable(rowKey), new ImmutableBytesWritable(reportRowKey));

                if(Program.stripInvalidCommand && commandId!=null && commandId.length!=24)
                    context.write(new ImmutableBytesWritable(Bytes.toBytes(COMMAND_STRIPPER)), new ImmutableBytesWritable(reportRowKey));

                if(Program.stripInvalidMedia && attachments!=null && attachments.length>0 && (attachmentFiles==null || attachmentFiles.length==0))
                    context.write(new ImmutableBytesWritable(Bytes.toBytes(MEDIA_STRIPPER)), new ImmutableBytesWritable(reportRowKey));
            }
        }
    }

    public static class ReduceStripper extends TableReducer<ImmutableBytesWritable, ImmutableBytesWritable, ImmutableBytesWritable> 
    {
        
        private Connection connection;
        private Table reportTable;
        private Get get;
        private Result result;
        
        private byte[] publisher;
        private byte[] es;
        private byte[] text;
        private byte[] timestamp;
        private byte[] commandId;
        private byte[] attachments;
        
        private String reasonString;
        
        @Override
        protected void setup(
                Reducer<ImmutableBytesWritable, ImmutableBytesWritable, ImmutableBytesWritable, Mutation>.Context context)
                throws IOException, InterruptedException
        {
            super.setup(context);
            
            if(Program.outputLog)
            {
                connection=ConnectionFactory.createConnection(context.getConfiguration());
                reportTable=connection.getTable(TableName.valueOf(DataSchema.REPORT_TABLE));
            }
        }
        
        @Override
        protected void reduce(ImmutableBytesWritable key, Iterable<ImmutableBytesWritable> values,
                Reducer<ImmutableBytesWritable, ImmutableBytesWritable , ImmutableBytesWritable, Mutation>.Context context)
                        throws IOException, InterruptedException
        {
            if(Bytes.toString(key.get()).equals(COMMAND_STRIPPER))
            {
                for(ImmutableBytesWritable value: values)
                {
                    Delete delete=new Delete(value.get());
                    delete.addColumn(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_COMMANDID));
                    
                    if(!Program.noExecute)
                        context.write(null, delete);
                    
                    if(Program.outputLog)
                            printReportDeleteStatus(value.get(), COMMAND_STRIPPER, true);
                }
            }
            else if(Bytes.toString(key.get()).equals(MEDIA_STRIPPER))
            {
                for(ImmutableBytesWritable value: values)
                {
                    Delete delete=new Delete(value.get());
                    delete.addColumn(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTS));

                    if(!Program.noExecute)
                        context.write(null, delete);

                    if(Program.outputLog)
                        printReportDeleteStatus(value.get(), MEDIA_STRIPPER, true);
                }
            }
            else
            {
                boolean execute=false;
                
                for(ImmutableBytesWritable value: values)
                {
                    
                    if(execute)
                    {
                        Delete delete=new Delete(value.get());
                        delete.addFamily(Bytes.toBytes(DataSchema.REPORT_INFO));
                        delete.addFamily(Bytes.toBytes(DataSchema.REPORT_ACTION));
                        delete.addFamily(Bytes.toBytes(DataSchema.REPORT_COMMENT));
                        delete.addFamily(Bytes.toBytes(DataSchema.REPORT_ACTION+"-ehq"));
                        delete.addFamily(Bytes.toBytes(DataSchema.REPORT_COMMENT+"-ehq"));
                        
                        if(!Program.noExecute)
                            context.write(null, delete);
                        
                        if(Program.outputLog)
                            printReportDeleteStatus(value.get(), REPLICATION_STRIPPER, execute);
                    }
                    else
                    {
                        if(Program.outputLog)
                            printReportDeleteStatus(value.get(), REPLICATION_STRIPPER, execute);
                        
                        execute=true;
                    }        
                }
            }
        }
        
        private void printReportDeleteStatus(byte[] reportRow, String reason, boolean status)
        {
            if(reportRow!=null)
            {
                get=new Get(reportRow);
                get.addFamily(Bytes.toBytes(DataSchema.REPORT_INFO));
                try
                {
                    result=reportTable.get(get);
                    
                    publisher=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_PUBLISHER));
                    es=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ES));
                    text=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TEXT));
                    timestamp=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TIMESTAMP));
                    commandId=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_COMMANDID));
                    attachments=result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTS));

                    if(publisher==null)
                        publisher=Bytes.toBytes("n/a");
                    
                    if(text==null)
                        text=Bytes.toBytes("n/a");
                    
                    if(es==null)
                        text=Bytes.toBytes("n/a");
                   
                    if(timestamp==null)
                        timestamp=Bytes.toBytes(0l);
                    
                    if(commandId==null)
                        commandId=Bytes.toBytes("n/a");
                    
                    if(reason==COMMAND_STRIPPER)
                        reasonString=Bytes.toString(commandId);
                    else if(reason==REPLICATION_STRIPPER)
                        reasonString=Bytes.toString(es);
                    else if(reason==MEDIA_STRIPPER)
                        reasonString=Bytes.toString(attachments);
                    else
                        reasonString="";
                    
                    System.out.println(String.format("%s,%s,%s,%s,%s,\"%s\"", reason, status?"delete":"ignore", Bytes.toString(publisher), sdf.format(new Date(Bytes.toLong(timestamp))), reasonString, Bytes.toString(text).replaceAll("[^\\p{L}\\s+\\r\\n]", "").trim()));
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                } 
            }
        }

    }

    private final static String COMMAND_STRIPPER="command-stripping";
    private final static String MEDIA_STRIPPER="media-stripping";
    private final static String REPLICATION_STRIPPER="replication-stripping";
    
    private final static SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
}
