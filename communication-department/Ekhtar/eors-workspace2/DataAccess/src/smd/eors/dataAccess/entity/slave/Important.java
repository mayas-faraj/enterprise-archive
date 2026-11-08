 package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Important extends SlaveEntity
{ 
    public Important(MasterEntity masterEntity, String admin, boolean value)
    {
        super(masterEntity);
        
        this.admin=admin;
        this.value=value;
    }

    public Important(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(VALUE, getValue());
        
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

    public boolean getValue()
    {
        return value;
    }

    public void setValue(boolean value)
    {
        this.value = value;
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
        return new byte[] {getValue()?(byte)1:(byte)0};
    }

    @Override
    public Important fromKeyValue(byte[] key, byte[] value)
    {
        Important action=new Important(this.getRowKey());
          
        if(key!=null)
            action.setAdmin(Bytes.toString(key));
        
        if(value!=null)
        {
            action.setValue(value[0]!=0);
        }
        
        return action;
    }

    //public static fields region
    public static final String ADMIN = "Admin";
    public static final String VALUE = "value";

    //private fields region
    private String admin;
    private boolean value;
}
