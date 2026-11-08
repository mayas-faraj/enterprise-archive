package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Media extends SlaveEntity
{
    //public constructors region
    public Media(MasterEntity masterEntity, byte[] content)
    {
        super(masterEntity);
        this.content=content;
    }
    
    public Media(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();  
        
        try
        {
            jsonObject.put(NAME, getName());   
        }
        catch(JSONException ex)     {}  
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString()
    {
        String contentString=base64Encode(getContent());
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(NAME, getName());
            jsonObject.put(CONTENT, contentString);
        }
        catch(JSONException ex)     {}  
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] toKey()
    {
        return getContent();
    }

    @Override
    public byte[] toValue()
    {
        if(getName()!=null)
            return Bytes.toBytes(getName());
        else
            return null;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Media media=new Media(this.getRowKey());
        media.setContent(key);
    
        if(value!=null)
            media.setName(Bytes.toString(value));
        
        return media;
    }
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }


    public byte[] getContent()
    {
        return content;
    }

    public void setContent(byte[] content)
    {
        this.content = content;
    }

    //static final fields region
    private static final String NAME = "Name";
    private static final String CONTENT = "Content";
    
    //private fields region
    private String name;
    private byte[] content;
}
