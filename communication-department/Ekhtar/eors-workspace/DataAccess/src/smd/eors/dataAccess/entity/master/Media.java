package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;

public class Media extends MasterEntity
{
    //public constructors region
    public Media(String name, byte[] content, byte[] thumbnail)
    {
        this.name=name;
        this.content=content;
        this.thumbnail=thumbnail;  
    }
    
    public Media(String name, byte[] content)
    {
        this(name, content, null);
    }
    
    public Media()
    {
        this("", null, null); 
    }

    //public methods region
    @Override
    public byte[] designRowKey()
    { 
        return Bytes.toBytes(name.hashCode());
    }
    
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();  
        
        try
        {
            jsonObject.put(NAME, getName());  
            jsonObject.put(CONTENT, getStringContent());
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
            jsonObject.put(CONTENT, getStringContent());
            jsonObject.put(THUMBNAIL, getStringThnumbnail());
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


    public byte[] getContent()
    {
        return content;
    }
    
    public String getStringContent()
    {
        return base64Encode(getContent());
    }

    public void setContent(byte[] content)
    {
        this.content = content;
    }
    
    public byte[] getThumbnail()
    {
        return thumbnail;
    }
    
    public String getStringThnumbnail()
    {
        return base64Encode(getThumbnail());
    }


    public void setThumbnail(byte[] thumbnail)
    {
        this.thumbnail = thumbnail;
    }
    

    //static final fields region
    private static final String NAME = "Name";
    private static final String CONTENT = "Content";
    private static final String THUMBNAIL = "Thumbnial";
    
    //private fields region
    private String name;
    private byte[] content;
    private byte[] thumbnail;
}
