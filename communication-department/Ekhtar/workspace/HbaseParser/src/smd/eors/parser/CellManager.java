package smd.eors.parser;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;

import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import smd.eors.entity.HbaseSchema;

import org.apache.hadoop.hbase.client.Scan;

public class CellManager
{
    //private fields region
    private static HashMap<String, String> cells;
    
    //static constructor region
    static
    {
        try
        {
            Connection connection=ConnectionFactory.createConnection();
            Table cellTable=connection.getTable(TableName.valueOf(HbaseSchema.CELLULAR_TABLE));
            cells=new HashMap<String,String>();
            Scan scan=new Scan();
            
            ResultScanner rs=cellTable.getScanner(scan);
            String x,y;
            
            for(Result r:rs)
            {
                x=Bytes.toString(r.getValue(Bytes.toBytes(HbaseSchema.CELLULAR_INFO),Bytes.toBytes(HbaseSchema.CELLULAR_INFO_X)));
                y=Bytes.toString(r.getValue(Bytes.toBytes(HbaseSchema.CELLULAR_INFO),Bytes.toBytes(HbaseSchema.CELLULAR_INFO_Y)));
                cells.put(Bytes.toString(r.getRow()),x+";"+y);
            }  
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    //public static methods region
    public static String getLocation(String cellGlobalId)
    {
        if(cellGlobalId!=null && cellGlobalId.length()>7)
        {
            cellGlobalId=cellGlobalId.substring(7);
            
            String result=cells.get(cellGlobalId);

            if(result==null || result=="")  
                System.out.println("Undefined cell with cgi: "+cellGlobalId);
            
            
            try
            {
                if(result==null) result="<null>";
                Files.write(Paths.get("/logs/test.txt"), String.format("%s = %s\n", cellGlobalId, result).getBytes(), StandardOpenOption.APPEND);
            }
            catch (IOException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return result;
        }  
        else
            return "";
    }
}
