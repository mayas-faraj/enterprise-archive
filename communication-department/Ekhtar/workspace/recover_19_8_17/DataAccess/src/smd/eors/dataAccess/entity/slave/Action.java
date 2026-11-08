 package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Action extends SlaveEntity
{ 
    public Action(MasterEntity masterEntity, String admin, String comment, boolean processed, float priority)
    {
        super(masterEntity);
        
        this.admin=admin;
        this.comment=comment;
        this.processed=processed;
        this.priority=priority;
    }

    public Action(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(COMMENT, getComment());
        jsonObject.put(PROCESSED, isProcessed());
        jsonObject.put(PRIORITY, getPriority());
        
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

    public String getComment()
    {
        return comment;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public boolean isProcessed()
    {
        return processed;
    }

    public void setProcessed(boolean processed)
    {
        this.processed = processed;
    }

    public float getPriority()
    {
        return priority;
    }

    public void setPriority(float priority)
    {
        this.priority = priority;
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
        byte[] commnetBytes=Bytes.toBytes(getComment());
        
        byte[] value=new byte[Bytes.SIZEOF_INT+
                              Bytes.SIZEOF_FLOAT+
                              commnetBytes.length];
        
        int offset=0;
        
        offset=Bytes.putInt(value, offset, (isProcessed()?1:0));
        offset=Bytes.putFloat(value, offset, getPriority());
        offset=Bytes.putBytes(value, offset, commnetBytes, 0, commnetBytes.length);
        
        return value;   
    }

    @Override
    public Action fromKeyValue(byte[] key, byte[] value)
    {
        Action action=new Action(this.getRowKey());
          
        if(key!=null)
            action.setAdmin(Bytes.toString(key));
        
        if(value!=null)
        {
            action.setProcessed(Bytes.toInt(value, 0)!=0);
            action.setPriority(Bytes.toFloat(value, Bytes.SIZEOF_INT));    
            action.setComment(Bytes.toString(value, Bytes.SIZEOF_INT + Bytes.SIZEOF_FLOAT));
        }
        
        return action;
    }

    //public static fields region
    public static final String ADMIN = "Admin";
    public static final String COMMENT = "Comment";
    public static final String PROCESSED = "Processed";
    public static final String PRIORITY = "Priority";

    //private fields region
    private String admin;
    private String comment;
    private boolean processed;
    private float priority;
}
