package smd.eors.parser;

import smd.eors.entity.HbaseSchema;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.MultipleOutputs;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.Put;

public class Program extends Configured implements Tool
{
    public static void main(String[] args)
    {   
        try
        {
            int result=ToolRunner.run(new Program(), args);
            System.out.println(result);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    @Override
    public int run(String[] args)
    {
        if(args.length==0)
        {
            printUsage();
            return 1;
        }

        Configuration configuration=getConf();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yy-HH-mm-ss");

        String bulkInputPath=args[0];
        String bulkOutputPath="/logs/hbaseparser/"+sdf.format(new Date());

        if(args.length>=2)
            //add stop words path to configuration
            configuration.set("stopwords", args[1]);
            
            
        if(args.length>=3)
        {
            //add dictionaries paths to configuration 
            int directoryCount=args.length-2;
            configuration.set("dic_count", String.valueOf(directoryCount));

            for(int i=1;i<=directoryCount;i++)
                configuration.set("dic"+String.valueOf(i), args[i+1]);                 
        }

        try
        {   
            //Database entity declaration
            Connection connect=ConnectionFactory.createConnection(configuration);
            Table reportTable=connect.getTable(TableName.valueOf(HbaseSchema.REPORT_TABLE));
            //Table userTable=connect.getTable(TableName.valueOf(HbaseSchema.USER_TABLE));
            
            //job declaration
            Job job=Job.getInstance(configuration);

            job.setJobName("HBase Parser Job");
            job.setJarByClass(Program.class);
            job.setMapperClass(EorsMap.class);
            job.setMapOutputKeyClass(ImmutableBytesWritable.class);
            job.setMapOutputValueClass(Put.class);

            FileInputFormat.setInputPaths(job, new Path(bulkInputPath));
            FileOutputFormat.setOutputPath(job, new Path(bulkOutputPath));

            //MultipleOutputs.addNamedOutput(job, "report", TextOutputFormat.class, ImmutableBytesWritable.class, Put.class);
            //MultipleOutputs.addNamedOutput(job, "user", TextOutputFormat.class, ImmutableBytesWritable.class, Put.class);
            
            HFileOutputFormat2.configureIncrementalLoad(job, reportTable, connect.getRegionLocator(reportTable.getName()));            
            //HFileOutputFormat2.configureIncrementalLoad(job, userTable, connect.getRegionLocator(userTable.getName()));            

            if(job.waitForCompletion(true))
            {
                Loader.doBulkLoad(configuration, bulkOutputPath, HbaseSchema.REPORT_TABLE);
                Loader.doBulkLoad(configuration, bulkOutputPath, HbaseSchema.USER_TABLE);
                return 0;
            }
            else
                return 3;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();     
            return -1;
        }

        //return:0; all OK
        //return:1; no input directory
        //return:2; empty directory path
        //return:3; something wrong
        //return:-1; exception
    }

    private static void printUsage()
    {
        System.out.println("usage: HBaseParser input_path [stopwords_file_path [keywords_file_path ...]]");
    }
}
