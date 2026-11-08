package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Info extends smd.eors.dataaccess.entity.SlaveEntity
{
    //public constructors region
    public Info(MasterEntity masterEntity, String name, int value)
    {
        super(masterEntity);
        this.name=name;
        this.value=value;
    }
    
    public Info(MasterEntity masterEntity)
    {
        this(masterEntity, null, 0);
    }
    
    public Info(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    @Override
    public byte[] toKey()
    {
        if(name!=null)
            return Bytes.toBytes(name);
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        return Bytes.toBytes(value);
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Info statistic=new Info(this.getRowKey());
        
        statistic.setName(Bytes.toString(key));
        statistic.setValue(Bytes.toInt(value));
           
        return statistic;
    }

    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(NAME, getName());
            jsonObject.put(VALUE, getValue());
        }
        catch(JSONException ex)     
        {} 
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(NAME, getName());
            jsonObject.put(VALUE, getValue());
        }
        catch(JSONException ex)     
        {} 
        
        return jsonObject.toString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
    }
    
    public String getName()
    {
        return this.name;
    }
    
    public void setName(String name)
    {
        this.name=name;
    }

    public long getValue()
    {
        return this.value;
    }
    
    public void setValue(int value)
    {
        this.value=value;
    }
    
    //private constant fields region
    private final String NAME="name";
    private final String VALUE="value";

    //private fields region
    private String name;
    private int value;
}
 