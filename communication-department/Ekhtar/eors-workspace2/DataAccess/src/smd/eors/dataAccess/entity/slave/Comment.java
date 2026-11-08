 package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Comment extends SlaveEntity
{ 
    public Comment(MasterEntity masterEntity, String admin, String text)
    {
        super(masterEntity);
        
        this.admin=admin;
        this.text=text;
    }

    public Comment(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(TEXT, getText());
        
        return jsonObject.toString();
    }
    
    @Override
    public String toShortJsonString() throws JSONException
    {
        return toJsonString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
        // TODO Auto-generated method stub
        
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
 
    @Override
    public byte[] toKey()
    {
        if(this.admin!=null)
            return Bytes.toBytes(admin);
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        return Bytes.toBytes(getText());
    }

    @Override
    public Comment fromKeyValue(byte[] key, byte[] value)
    {
        Comment action=new Comment(this.getRowKey());
          
        if(key!=null)
            action.setAdmin(Bytes.toString(key));
        
        if(value!=null)
        {
            action.setText(Bytes.toString(value));
        }
        
        return action;
    }

    //public static fields region
    public static final String ADMIN = "Admin";
    public static final String TEXT = "text";

    //private fields region
    private String admin;
    private String text;
}
