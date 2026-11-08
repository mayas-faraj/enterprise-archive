package smd.eors.dataAccess.entity.slave;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Event extends SlaveEntity
{
    //public constructors region
    public Event(MasterEntity masterEntity, String name, Date date)
    {
        super(masterEntity);
        this.name=name;
        this.date=date;
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
            return Bytes.toBytes(getName());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        if(getDate()!=null)
            return Bytes.toBytes(getDate().getTime());
        else
            return null;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Event event=new Event(this.getRowKey());
        
        if(key!=null)
            event.setName(Bytes.toString(key));
        
        if(value!=null)
            event.setDate(new Date(Bytes.toLong(value)));

        return event;
    }

    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(NAME, getName());
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
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
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
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

    public void setName(String name)
    {
        this.name = name;
    }

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    //public static final fields region
    public static final String NAME = "Name";
    public static final String DATE = "Date";

    //private fields region
    private String name;
    private Date date;
}
