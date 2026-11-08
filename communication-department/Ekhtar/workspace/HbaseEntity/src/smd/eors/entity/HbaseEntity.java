package smd.eors.entity;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

public abstract class HbaseEntity
{
    //public abstract methods region
    public abstract  void setValueFromJson(String jsonEntity);
    
    public abstract  void setValueFromJson(long entityId,String jsonEntity);
    
    public abstract void setValueFromHbaseResult(Result  result);
    
    public abstract Put getPut();
    
    public abstract String toJsonString();
    
    //public methods region
    public void setRowId(byte[] rowId)
    {
        this.rowId=rowId;
    }
    
    
    public byte[] getRowId()
    {
        return rowId;
    }
    
    public void setHexRowId(String rowId)
    {
        this.rowId=Bytes.fromHex(rowId);
    }
    
    
    public String getHexRowId()
    {
        return Bytes.toHex(this.rowId);
    }
    
    //protected static functions region
    protected static void exceptionHandler(Exception ex)
    {
        System.out.println(ex.toString());
        ex.printStackTrace();
    }
    
    protected void putValue(Put put,String columnFamily,String key, String value)
    {
        //precondition: put is not null
        if(value!=null && value!="")
            put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(key), Bytes.toBytes(value));
    }
        
    protected void putValue(Put put,String columnFamily,String key, double value)
    {
        //precondition: put is not null
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(key), Bytes.toBytes(value));
    }
    
    protected void putValue(Put put,String columnFamily,String key, float value)
    {
        //precondition: put is not null
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(key), Bytes.toBytes(value));
    }
    
    protected void putValue(Put put,String columnFamily,String key, long value)
    {
        //precondition: put is not null
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(key), Bytes.toBytes(value));
    }
    
    protected void putValue(Put put,String columnFamily,long key, String value)
    {
        //precondition: put is not null
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(key), Bytes.toBytes(value));
    }
    
    protected static String getValue(byte[] value,String defaultValue)
    {
        if(value==null || value.length==0)
            return defaultValue;
        else
            return Bytes.toString(value);
    }
    
    protected static int getValue(byte[] value,int defaultValue)
    {
        if(value==null || value.length==0)
            return defaultValue;
        else
        {
            try
            {
                return Bytes.toInt(value);
            }
            catch(Exception ex)
            {
                System.out.println("error while getting integer from bytes, "+ex.getMessage());
                return defaultValue;
            }
        }
    }
    
    protected static double getValue(byte[] value,double defaultValue)
    {
        if(value==null || value.length==0)
            return defaultValue;
        else
        {
            try
            {
                return Bytes.toDouble(value);
            }
            catch(Exception ex)
            {
                System.out.println("error while getting double from bytes, "+ex.getMessage());
                return defaultValue;
            }
        }
    }
    
    protected static float getValue(byte[] value,float defaultValue)
    {
        if(value==null || value.length==0)
            return defaultValue;
        else
        {
            try
            {
                return Bytes.toFloat(value);
            }
            catch(Exception ex)
            {
                System.out.println("error while getting float from bytes, "+ex.getMessage());
                return defaultValue;
            }
        }
    }
    
    //fields region
    protected byte[] rowId;
      
    //static final fields region
    public static final String DATE_FORMAT_STRING="dd-MM-yyyy HH:mm:ss";
    protected static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(DATE_FORMAT_STRING);
    protected static final String ROW_ID="RowId";
    

}
