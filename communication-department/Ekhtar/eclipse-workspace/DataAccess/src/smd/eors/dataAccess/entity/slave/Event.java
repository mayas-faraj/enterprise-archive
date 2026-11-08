package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Event extends SlaveEntity
{
    //public constructors region
    public Event(MasterEntity masterEntity, String name, String type, long timestamp)
    {
        super(masterEntity);
        this.name=name;
        this.type=type;
        this.timestamp=timestamp;
    }
    
    public Event(byte[] rowKey)
    {
        super(rowKey);
    }
   
    //public methods region
    @Override
    public byte[] toKey()
    {
        if(getName()!=null)
            if(getType()!=null && getType()!="")
                return Bytes.toBytes(getName() + TYPE_SEPERATOR + getType());
            else
                return Bytes.toBytes(getName());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        return Bytes.toBytes(getTimestamp());
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Event event=new Event(this.getRowKey());
        
        if(key!=null)
        {
            String eventKey=Bytes.toString(key);
            int seperator_index;
            if((seperator_index=eventKey.indexOf(TYPE_SEPERATOR))>=0)
            {
                event.setName(eventKey.substring(0, seperator_index));
                event.setType(eventKey.substring(seperator_index+1));
            }
            else   
                event.setName(eventKey);
        }
        
        if(value!=null && value.length>0)
            event.setTimestamp(Bytes.toLong(value));

        return event;
    }

    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(NAME, getName());
            jsonObject.put(TYPE, getType());
            jsonObject.put(TIMESTAMP, getTimestamp());
            
            
        }
        catch(JSONException ex)     {}
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString()
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(NAME, getName());
            jsonObject.put(TYPE, getType());
            jsonObject.put(TIMESTAMP, getTimestamp());
        }
        catch(JSONException ex)     {}
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }

    public String getName()
    {
        return name;
    }

    public void setType(String type)
    {
        this.type = type;
    }
    
    public String getType()
    {
        return type;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public long getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(long timestamp)
    {
        this.timestamp = timestamp;
    }

    //public static final fields region
    public static final String NAME = "name";
    public static final String TIMESTAMP = "timestamp";
    public static final String TYPE = "type";
    public static final String TYPE_SEPERATOR="#";

    //private fields region
    private String name;
    private String type;
    private long timestamp;
}
