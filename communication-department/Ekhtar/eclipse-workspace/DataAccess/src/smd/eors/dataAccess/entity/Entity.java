package smd.eors.dataaccess.entity;

import java.text.SimpleDateFormat;
import java.util.Base64;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class Entity
{
    //public methods region
    public abstract String toShortJsonString() throws JSONException;
    
    public abstract String toJsonString() throws JSONException;
    
    public abstract void fromJsonString(String jsonString) throws JSONException; 
    
    public byte[] getRowKey()
    {
        return rowKey;
    }

    public void setRowKey(byte[] rowKey)
    {
        this.rowKey = rowKey;
    }
    
    public String getHexRowKey()
    {
        if(rowKey!=null)
            return Bytes.toHex(rowKey);
        else
            return null;
    }
        
    public void setHexRowKey(String rowKey)
    {
        if(rowKey!=null)
            this.rowKey = getBytesFromHex(rowKey);
        else
            this.rowKey = null;
    }
    
    public static byte[] getBytesFromHex(String hexRowId)
    {
        //precondition: none
        if(hexRowId==null || hexRowId=="" || hexRowId=="0")
            return null;
        else
        {
            try
            {
                return Bytes.fromHex(hexRowId);
            }
            catch(Exception ex)
            {
                return null;
            }
        }  
    }
    
    public static String getHexFromBytes(byte[] rowId)
    {
        if(rowId!=null)
            return Bytes.toHex(rowId);
        else
            return null;
    }

    public static byte[] incrementBytes(byte[] rowKey)
    {
        try
        {
            for (int i = rowKey.length - 1; i >= 0; --i) 
                if (++rowKey[i] != 0) 
                    return rowKey;
        }
        catch(Exception ex)
        {
            
        }

        return rowKey;
    }

    //public static methods region
    public static String base64Encode(byte[] content)
    {
        //precondition: none
        if(content!=null)
            return Base64.getEncoder().encodeToString(content);
        else
            return null;
    }
    
    public static String toJsonArray(Entity[] entities)
    {
        //precondition: none
        JSONArray jsonEntities=null;
         
        if(entities!=null)
        {
            jsonEntities=new JSONArray();
            for(int i=0;i<entities.length;i++)
                if(entities[i]!=null)
                {
                    try
                    {
                        jsonEntities.put(new JSONObject(entities[i].toJsonString()));
                    }
                    catch(Exception ex)
                    {
                        jsonEntities.put(ex.getMessage());
                    }
                }
        }
        
        return jsonEntities.toString();
    }
    
    public static String toShortJsonArray(Entity[] entities)
    {
        //precondition: none
        JSONArray jsonEntities=null;
         
        if(entities!=null)
        {
            jsonEntities=new JSONArray();
            for(int i=0;i<entities.length;i++)
                if(entities[i]!=null)
                {
                    try
                    {
                        jsonEntities.put(new JSONObject(entities[i].toShortJsonString()));
                    }
                    catch(Exception ex)
                    {
                        jsonEntities.put(ex.getMessage());
                    }
                }
        }
        
        return jsonEntities.toString();
    }
    
    public static String[] toArrayShortJson(Entity[] entities)
    {
        //precondition: none
        if(entities!=null)
        {
            String[] result=new String[entities.length];

            for(int i=0;i<result.length;i++)
                if(entities[i]!=null)
                {
                    try
                    {
                        result[i]=entities[i].toShortJsonString();
                    }
                    catch(Exception ex)
                    {
                        result[i]=ex.getMessage();
                    }    
                }
                else
                    result[i]="";

            return result;
        }
        else
            return null;
    }

    public static String[] toArrayJson(Entity[] entities)
    {
        //precondition: none
        if(entities!=null)
        {
            String[] result=new String[entities.length];

            for(int i=0;i<result.length;i++)
                if(entities[i]!=null)
                {
                    try
                    {
                        result[i]=entities[i].toJsonString();
                    }
                    catch(Exception ex)
                    {
                        result[i]=ex.getMessage();
                    }    
                }
                else
                    result[i]="";

            return result;
        }
        else
            return null;
    }
    

    public long getCellTimpstamp()
    {
        return cellTimestamp;
    }

    public void setCellTimpstamp(long cellTimestamp)
    {
        this.cellTimestamp = cellTimestamp;
    }
    
    public boolean isRealtime()
    {
        return realtime;
    }

    public void setRealtime(boolean realtime)
    {
        this.realtime = realtime;
    }
    
    //protected functions region
    protected static boolean checkJsonValue(String value)
    {
        return value!=null && !value.equals("null") && !value.equals("");
    }

    //private fields region
    private byte[] rowKey;
    private long cellTimestamp;
    private boolean realtime;

    //protected final fields region
    protected static final String DATE_FORMAT_STRING="dd-MM-yyyy HH:mm:ss";
    protected static final String ROW_KEY = "rowKey";
    protected static final String CELL_TIMESTAMP = "cellTimestamp";
    protected static final String IS_REALTIME = "realtime";
    protected static final String PAYLOAD = "payload";
    
    protected static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(DATE_FORMAT_STRING);
    
}
