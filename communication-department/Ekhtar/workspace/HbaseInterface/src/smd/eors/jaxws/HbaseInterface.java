package smd.eors.jaxws;

import smd.eors.entity.Report;
import smd.eors.entity.CellGroup;
import smd.eors.entity.HbaseSchema;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;

public class HbaseInterface
{
    //public static methods region
    public static Report getReport(String hexReportId)
    {
        try
        {
            Get get=new Get(Bytes.fromHex(hexReportId));
            Result result=reportTable.get(get);
            Report report=new Report();
            report.setValueFromHbaseResult(result);
            return report;
        }
        catch (Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex, hexReportId); 
            return null;
        }
    }
   
    public static String[] getReports(byte[] startRowId,byte[] stopRowId,long minTimestamp,long maxTimestamp,
            String commandId,double startLongitude, double startLatitude, double endLongitue, double endLatitude, String keywords, boolean realtimeOnly)
    {
        List<String> reports=new ArrayList<String>();
        FilterList filters=null;
        
        try
        { 
            Scan scan=new Scan();
            
            if(startRowId!=null)
                scan.setStartRow(startRowId);
            
            if(stopRowId!=null)
                scan.setStopRow(stopRowId);
         
            //creating command filter
            if(commandId!=null && commandId!="")
            {
                if(filters==null)
                    filters=new FilterList(Operator.MUST_PASS_ALL);
                
                SingleColumnValueFilter commandFilter=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_COMMAND),CompareOp.EQUAL,Bytes.toBytes(commandId));
                commandFilter.setFilterIfMissing(true);
                filters.addFilter(commandFilter); 
            }
            
            //creating keywords filter
            if(keywords!=null && keywords!="")
            {
                if(filters==null)
                    filters=new FilterList(Operator.MUST_PASS_ALL);
             
                SingleColumnValueFilter keywordsFilter=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_TEXT), CompareOp.EQUAL, new SubstringComparator(keywords));
                keywordsFilter.setFilterIfMissing(true);
                filters.addFilter(keywordsFilter);
            }
            
            //creating coordinate filter
            if(startLongitude!=0||startLatitude!=0||endLongitue!=0||endLatitude!=0)
            {
                if(filters==null)
                    filters=new FilterList(Operator.MUST_PASS_ALL);
                
                filters.addFilter(getLocationFilter(startLongitude, startLatitude, endLongitue, endLatitude)); 
            }
            
            //checking time boundary
            if(minTimestamp>0)
                if(maxTimestamp>0)
                    scan.setTimeRange(minTimestamp,maxTimestamp);
                else
                    scan.setTimeRange(minTimestamp,Long.MAX_VALUE);
            else
                if(maxTimestamp>0)
                    scan.setTimeRange(0, maxTimestamp);
            
            //setting filter
            if(filters!=null)
                scan.setFilter(filters);
            
            //scanning runtime reports
            ResultScanner rs=reportRealtimeTable.getScanner(scan);

            for(Result r:rs)
            {
                Report report=new Report();
                report.setValueFromHbaseResult(r);
                reports.add(report.toShortJsonString());
            }
            
            if(!realtimeOnly)
            {
                //scanning historical reports
                rs=reportTable.getScanner(scan);

                for(Result r:rs)
                {
                    Report report=new Report();
                    report.setValueFromHbaseResult(r);
                    reports.add(report.toShortJsonString());
                }
            }
            
            //sort array list
            
            Collections.sort(reports);  
            return reports.toArray(new String[0]);
        }
        catch (Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,Bytes.toString(startRowId),Bytes.toString(stopRowId),String.valueOf(minTimestamp),
                        String.valueOf(maxTimestamp),commandId,keywords,String.valueOf(realtimeOnly)
                        ,String.valueOf(startLongitude),String.valueOf(endLongitue),String.valueOf(startLatitude),String.valueOf(endLatitude));
            return null;
        } 
    }
  
    public static String[] getUsersNavigation(long minTimestamp, long maxTimestamp,
            double startLongitude, double startLatitude, double endLongitude,
            double endLatitude,boolean lastPointOnly)
    {
        HashMap<String, String> users=new HashMap<String, String>();
        List<String> result=new ArrayList<String>();
        
        try
        {
            Scan scan=new Scan();
            
            if(minTimestamp>0)
                if(maxTimestamp>0)
                    scan.setTimeRange(minTimestamp,maxTimestamp);
                else
                    scan.setTimeRange(minTimestamp,Long.MAX_VALUE);
            else
                if(maxTimestamp>0)
                    scan.setTimeRange(0, maxTimestamp);
                
            //getting real time cell navigation info
            ResultScanner rs=userRealtimeTable.getScanner(scan);
            StringBuilder cellBuilder=new StringBuilder();
            
            for(Result r:rs)
            {
                CellGroup userCells=new CellGroup();
                userCells.setValueFromHbaseResult(r);
                cellBuilder.setLength(0);
                
                cellBuilder.append('[');

                for(CellGroup.Cell userCell:userCells.getCells())  
                    if(userCell!=null&&userCell.getLongitude()>=startLatitude && userCell.getLongitude()<endLongitude
                    &&userCell.getLatitude()>=startLatitude && userCell.getLatitude()<endLatitude)
                    {
                        if(lastPointOnly)
                            cellBuilder.setLength(1);
                        
                        cellBuilder.append('\"');
                        cellBuilder.append(userCell.getLongitude());
                        cellBuilder.append(';');
                        cellBuilder.append(userCell.getLatitude());
                        cellBuilder.append(';');
                        cellBuilder.append(userCell.getDate().toString());
                        cellBuilder.append('\"');
                        cellBuilder.append(',');
                    }

                users.put(userCells.getUser(), cellBuilder.toString());
            }
            
            //getting batch cell navigation info
            rs=userTable.getScanner(scan);
            
            for(Result r:rs)
            {
                CellGroup userCells=new CellGroup();
                userCells.setValueFromHbaseResult(r);
                cellBuilder.setLength(0);
                cellBuilder.append('[');

                for(CellGroup.Cell userCell:userCells.getCells())
                    if(userCell!=null&&userCell.getLongitude()>=startLatitude && userCell.getLongitude()<endLongitude
                    &&userCell.getLatitude()>=startLatitude && userCell.getLatitude()<endLatitude)
                    {
                        if(lastPointOnly)
                            cellBuilder.setLength(1);
                        
                        cellBuilder.append('\"');
                        cellBuilder.append(userCell.getLongitude());
                        cellBuilder.append(';');
                        cellBuilder.append(userCell.getLatitude());
                        cellBuilder.append(';');
                        cellBuilder.append(userCell.getDate().toString());
                        cellBuilder.append('\"');
                        cellBuilder.append(',');
                    }

                if(cellBuilder.length()>1)
                    cellBuilder.setCharAt(cellBuilder.length()-1, ']');
                else
                    cellBuilder.append(']');
                
                if(users.containsKey(userCells.getUser()))
                    users.put(userCells.getUser(),users.get(userCells.getUser())+cellBuilder.toString());
                else
                    users.put(userCells.getUser(), cellBuilder.toString());
                
                cellBuilder.setCharAt(cellBuilder.length()-1, ']');
            } 
        }
        catch (Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,String.valueOf(minTimestamp),  String.valueOf(maxTimestamp),
                String.valueOf(startLongitude),  String.valueOf(startLatitude),  String.valueOf(endLongitude),
                String.valueOf(endLatitude));
            return null;
        }
        
        JSONObject jObj;
        
        for(String key:users.keySet())
        {
            jObj=new JSONObject();

            try
            {
                jObj.put("name", key);
                jObj.put("cells", users.get(key));
            }
            catch (JSONException ex)
            {
                if(logStream!=null)
                    logStream.writeLog(ex,key,users.get(key));
            }
            
            
            result.add(jObj.toString());
        }
 
        return result.toArray(new String[0]);
    }

    public static String[] getCommands()
    {
        // TODO Auto-generated method stub
        return null;
    }

    public static String getUsersNavigation(String user)
    {
        return null;
    }

    public static boolean deleteReport(String reportId)
    {
        try
        {
            Delete delete=new Delete(Bytes.fromHex(reportId));
            reportTable.delete(delete);
            return true;
        }
        catch (Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,reportId);
            return false;
        }
    }
    
    public static boolean addCommand(String commandId, String adminName,
            String text, String[] users)
    {
        // TODO Auto-generated method stub
        //broadcast is null users
        return false;
    }

    //private constructions region
    private HbaseInterface() {}
    
    //private methods region
    private static Filter getLocationFilter(double startLongitude, double startLatitude, double endLongitude, double endLatitude)
    {
        double tempValue;
        
        if(endLongitude<startLongitude)
        {
            tempValue=startLongitude;
            startLongitude=endLongitude;
            endLongitude=tempValue;
        }
        
        if(endLatitude<startLatitude)
        {
            tempValue=startLatitude;
            startLatitude=endLatitude;
            endLatitude=tempValue;
        }

        Filter filter1=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_LONGITUDE),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLongitude));
        Filter filter2=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_LONGITUDE),CompareOp.LESS,Bytes.toBytes(endLongitude));
        Filter filter3=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_LATITUDE),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLatitude));
        Filter filter4=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_LATITUDE),CompareOp.LESS,Bytes.toBytes(endLatitude));
        FilterList filterListGps=new FilterList(Operator.MUST_PASS_ALL);
        ((SingleColumnValueFilter)filter1).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter2).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter3).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter4).setFilterIfMissing(true);
        
        filterListGps.addFilter(filter1);
        filterListGps.addFilter(filter2);
        filterListGps.addFilter(filter3);
        filterListGps.addFilter(filter4);
        
        Filter filter5=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLONGITUDE),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLongitude));
        Filter filter6=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLONGITUDE),CompareOp.LESS,Bytes.toBytes(endLongitude));
        Filter filter7=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLATITUDE),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLatitude));
        Filter filter8=new SingleColumnValueFilter(Bytes.toBytes(HbaseSchema.REPORT_INFO),Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLATITUDE),CompareOp.LESS,Bytes.toBytes(endLatitude));  
        FilterList filterListCell=new FilterList(Operator.MUST_PASS_ALL);
        ((SingleColumnValueFilter)filter5).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter6).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter7).setFilterIfMissing(true);
        ((SingleColumnValueFilter)filter8).setFilterIfMissing(true); 
        filterListCell.addFilter(filter5);
        filterListCell.addFilter(filter6);
        filterListCell.addFilter(filter7);
        filterListCell.addFilter(filter8);
        
        FilterList filterList=new FilterList(Operator.MUST_PASS_ONE);
        filterList.addFilter(filterListGps);
        filterList.addFilter(filterListCell);
        
        return filterList;
    }
    
   
    //public static fields region
    public static LogStream logStream;

    //private static fields region
    private static Connection connection;
    private static Table reportTable;
    private static Table reportRealtimeTable;
    private static Table userTable;
    private static Table userRealtimeTable;

    static
    {
        try
        {
            Configuration configuration=new Configuration();
            
            //configuration.addResource("/ecosystem/hbase-1.2.4/conf/hbase-site.xml");
            configuration.set("hbase.zookeeper.quorum", "192.168.90.14");
            
            connection=ConnectionFactory.createConnection(configuration);           
            reportTable=connection.getTable(TableName.valueOf(HbaseSchema.REPORT_TABLE));
            reportRealtimeTable=connection.getTable(TableName.valueOf(HbaseSchema.REPORT_TABLE+HbaseSchema.REAL_TIME_SUFFIX));
            userTable=connection.getTable(TableName.valueOf(HbaseSchema.USER_TABLE));
            userRealtimeTable=connection.getTable(TableName.valueOf(HbaseSchema.USER_TABLE+HbaseSchema.REAL_TIME_SUFFIX));
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
