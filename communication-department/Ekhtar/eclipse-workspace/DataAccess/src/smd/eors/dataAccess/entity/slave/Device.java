package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Device extends SlaveEntity
{
    //public constructors region  
    public Device(MasterEntity masterEntity, String mac, String imei, String os, String type, String userName)
    {
        super(masterEntity);
        this.mac=mac;
        this.imei=imei;
        this.os=os;
        this.type=type;
        this.userName=userName;  
    }
    
    public Device(MasterEntity masterEntity)
    {
        this(masterEntity, "", "", "", "", "");
    }
     
    public Device(byte[] rowKey)
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
            jsonObject.put(MAC, getMac());
            jsonObject.put(IMEI, getImei());
            jsonObject.put(DEVICE_TYPE, getType());

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
            jsonObject.put(MAC, getMac());
            jsonObject.put(IMEI, getImei());
            jsonObject.put(OS_VERSION, getOs());
            jsonObject.put(DEVICE_TYPE, getType());
            jsonObject.put(USER_NAME, getUserName());
        }
        catch(JSONException ex)     {} 
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        //precondition: none
        if(jsonString!=null && jsonString!="")
        {   
            try
            {
                JSONObject deviceObject=new JSONObject(jsonString);
                
                setMac(deviceObject.getString(MAC));
                setType(deviceObject.getString(DEVICE_TYPE));
                setImei(deviceObject.getString(IMEI));
                setOs(deviceObject.getString(OS_VERSION));
                
            }
            catch(Exception ex)
            {
                
            } 
        }
        else
        {
            setMac("");
            setType("");
            setImei("");
            setOs("");
            setUserName("");
        }
    }
    
    @Override
    public byte[] toKey()
    {
        if(getMac()!=null)
            return Bytes.toBytes(getMac());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        String value=getImei()+KEY_VALUE_SEPERATOR+getOs()+KEY_VALUE_SEPERATOR+getType();
        
        if(getUserName()!=null && getUserName()!="")
            value += KEY_VALUE_SEPERATOR + getUserName();
        
        return Bytes.toBytes(value);
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Device device=new Device(this.getRowKey());
        
        if(key!=null)
            device.setMac(Bytes.toString(key));
        
        if(value!=null)
        {
            String[] values=Bytes.toString(value).split(String.valueOf(KEY_VALUE_SEPERATOR));
  
            if(values.length>0)
                device.setImei(values[0]);
            
            if(values.length>1)
                device.setOs(values[1]);
            
            if(values.length>2)
                device.setType(values[2]);
            
            if(values.length>3)
                device.setUserName(userName);  
        }
        
        return device;
    }
    
    public String getMac()
    {
        return mac;
    }

    public void setMac(String mac)
    {
        this.mac = mac;
    }
    
    public String getImei()
    {
        return imei;
    }

    public void setImei(String imei)
    {
        this.imei = imei;
    }

    public String getOs()
    {
        return os;
    }

    public void setOs(String os)
    {
        this.os = os;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    //private fields region
    private String mac;
    private String imei;
    private String os;
    private String type;
    private String userName;
    
    //private static fields region
    private static final String MAC = "mac";
    private static final String IMEI = "imei";
    private static final String DEVICE_TYPE = "deviceType";
    private static final String OS_VERSION = "osVersion";
    private static final String USER_NAME = "userName";
}
