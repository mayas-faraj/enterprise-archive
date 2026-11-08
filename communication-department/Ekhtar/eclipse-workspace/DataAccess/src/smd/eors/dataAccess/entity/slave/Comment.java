package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Comment extends SlaveEntity
{
    //public constructors region
    public Comment(MasterEntity masterEntity, String text, long timestamp)
    {
        this(masterEntity);
        
        this.text=text;
        this.timestamp=timestamp;
    }
    
    public Comment(MasterEntity masterEntity)
    {
        super(masterEntity);
        
        this.text=null;
        this.timestamp=0;
    }
    
    public Comment(byte[] rowKey)
    {
        super(rowKey);
        
        this.text=null;
        this.timestamp=0;
    }
    
    //public methods region
    @Override
    public byte[] toKey()
    {
        return Bytes.toBytes(getTimestamp());
    }

    @Override
    public byte[] toValue()
    {
        if(text!=null)
            return Bytes.toBytes(text);
        else
            return null;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Comment comment=new Comment(this.getMasterEntity());
        
        if(key!=null)
            comment.setTimestamp(Bytes.toLong(key));
        
        if(value!=null)
            comment.setText(Bytes.toString(value));
        
        return comment;
    }

    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(TEXT, getText());
            jsonObject.put(TIMESTAMP, getTimestamp());
        }
        catch(JSONException ex)     {} 
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(TEXT, getText());
            jsonObject.put(TIMESTAMP, getTimestamp());
        }
        catch(JSONException ex)     {} 
        
        return jsonObject.toString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
    }
    
    public String getText()
    {
        return this.text;
    }
    
    public void setText(String text)
    {
        this.text=text;
    }
    
    public long getTimestamp()
    {
        return this.timestamp;
    }
    
    public void setTimestamp(long timestamp)
    {
        this.timestamp=timestamp;
    }
    
    public void setFamilyspace(String familyspace)
    {
        this.familyspace=familyspace;
    }
    
    //private constants region
    private final String TEXT="text";
    private final String TIMESTAMP="timestamp";
    
    //private fields region
    private String text;
    private long timestamp;
}
