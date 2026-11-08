package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Setting extends SlaveEntity
{
    //public constructors region
    public Setting(MasterEntity masterEntity, String name, String value)
    {
        super(masterEntity);
        this.name=name;
        this.value=value;
    }
    
    public Setting(byte[] rowKey)
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
            jsonObject.put(VALUE, getValue());
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
            jsonObject.put(IS_PRIVILEGE, isPrivilegeSetting());
            jsonObject.put(NAME, getName());
            jsonObject.put(VALUE, getValue());
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
        if(name!=null)
            return Bytes.toBytes(getName());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        if(value!=null)
            return Bytes.toBytes(getValue());
        else
            return null;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Setting setting=new Setting(this.getRowKey());
        
        if(key!=null)
            setting.setName(Bytes.toString(key));
        
        if(value!=null)
            setting.setValue(Bytes.toString(value));

        return setting;
    }
    
    public boolean isPrivilegeSetting()
    {
        return isPrivilegeSetting;
    }

    public void setPrivilegeSetting(boolean isPrivilegeSetting)
    {
        this.isPrivilegeSetting = isPrivilegeSetting;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
    {
        this.value = value;
    }

    //private fields region 
    private boolean isPrivilegeSetting;
    private String name;
    private String value;
    
    //private static fields region
    private static final String IS_PRIVILEGE = "IsPrivelege";
    private static final String NAME = "Name";
    private static final String VALUE = "Value";
}
