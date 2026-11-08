package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Command2 extends MasterEntity
{
    //public constructors region
    public Command2(String es, String text, String admin, long timestamp)
    {
        this.es=es;
        this.text=text;
        this.admin=admin;
        this.timestamp=timestamp;
    }
    
    public Command2(String es, String text)
    {
        this(es, text, "", 0);
    }
    
    public Command2()
    {
        this("", "", "", 0);
    }

    //public methods region
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put(ES, getEs());
        jsonObject.put(TEXT, getText());  
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(TIMESTAMP, getTimestamp());

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(ES, getEs());
        jsonObject.put(TEXT, getText());
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(TIMESTAMP, getTimestamp());

        JSONArray jsonReaders=new JSONArray();

        if(readers!=null)
            for(Event read: getReaders())
                jsonReaders.put(new JSONObject(read.toJsonString()));
        
        jsonObject.put(READERS, jsonReaders);
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] designRowKey()
    {
        //precondition: Es is not null
        byte[] key=new byte[Bytes.SIZEOF_LONG + Bytes.SIZEOF_INT];
        int offset=0;

        offset=Bytes.putLong(key, offset, Long.MAX_VALUE-timestamp);
        offset=Bytes.putInt(key,  offset, getEs().hashCode());
        return key;
    }
    
    public String getAdmin()
    {
        return admin;
    }

    public void setAdmin(String admin)
    {
        this.admin = admin;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public String getEs()
    {
        return es;
    }

    public void setEs(String es)
    {
        this.es = es;
    }
    
    public long getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(long timestamp)
    {
        this.timestamp = timestamp;
    }

    public Event[] getReaders()
    {
        return readers;
    }

    public void setReaders(Event[] readers)
    {
        this.readers = readers;
        SlaveEntity.setMasterEntity(this, readers);
    }

    //public static final fields region
    public static final String ES = "es";
    public static final String TEXT = "text";
    public static final String ADMIN = "admin";
    public static final String TIMESTAMP = "timestamp";
    public static final String READERS = "readers";
    
    //private fields region
    private String es;
    private String text;
    private String admin;
    private long timestamp;
    private Event[] readers;
    
}
