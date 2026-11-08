package halux.cd.org;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import org.apache.hadoop.io.WritableUtils;
import org.apache.hadoop.io.Writable;

public class UserWritable implements Writable
{
    
    public UserWritable()
    {
        deviceMacs=new HashMap<String,String>();
        jpsLocations=new HashMap<Date,String>();
        settings=new HashMap<String,String>();
    }
    
    @Override
    public void write(DataOutput dataOutput) throws IOException
    {
        WritableUtils.writeString(dataOutput, getLoginName());
        WritableUtils.writeString(dataOutput, getLoginFullName());
        WritableUtils.writeString(dataOutput, getLoginPassword());
        WritableUtils.writeString(dataOutput, getAgentAddress());
        WritableUtils.writeString(dataOutput, getAgentSection());
        dataOutput.writeBoolean(getAgentMuted());
        dataOutput.writeBoolean(getAgentDisabled());
        dataOutput.writeBoolean(getManagerFullControl());
        dataOutput.writeBoolean(getManagerDisabled());
        
        HashMap<String,String> macs=getDeviceMacs();
        dataOutput.writeInt(macs.size());
        for(String key:macs.keySet())
        {
            WritableUtils.writeString(dataOutput, key);
            WritableUtils.writeString(dataOutput, macs.get(key));
        }
        
        HashMap<Date, String> locations=getJpsLocations();
        dataOutput.writeInt(locations.size());
        for(Date key:locations.keySet())
        {
            dataOutput.writeLong(key.getTime());
            WritableUtils.writeString(dataOutput,locations.get(key));
        }
        
        HashMap<String,String> settings=getSettings();
        dataOutput.writeInt(settings.size());
        for(String key:settings.keySet())
        {
            WritableUtils.writeString(dataOutput, key);
            WritableUtils.writeString(dataOutput, settings.get(key));
        }
    }
    
    @Override
    public void readFields(DataInput dataInput) throws IOException
    {
        setLoginName(WritableUtils.readString(dataInput));
        setLoginFullName(WritableUtils.readString(dataInput));
        setLoginPassword(WritableUtils.readString(dataInput));
        setAgentAddress(WritableUtils.readString(dataInput));
        setAgentSection(WritableUtils.readString(dataInput));
        setAgentMuted(dataInput.readBoolean());
        setAgentDisabled(dataInput.readBoolean());
        setManagerFullControl(dataInput.readBoolean());
        setManagerDisabled(dataInput.readBoolean());
        
        int macsSize=dataInput.readInt();
        HashMap<String,String> macs=new HashMap<String,String>(macsSize);
        for(int i=0;i<macsSize;i++)
            macs.put(WritableUtils.readString(dataInput), WritableUtils.readString(dataInput));
        setDeviceMacs(macs);
        
        int locationsSize=dataInput.readInt();
        HashMap<Date,String> locations=new HashMap<Date,String>(locationsSize);
        for(int i=0;i<locationsSize;i++)
            locations.put(new Date(dataInput.readLong()), WritableUtils.readString(dataInput));
        setJpsLocations(locations);
        
        int settingsSize=dataInput.readInt();
        HashMap<String,String> settings=new HashMap<String,String>(settingsSize);
        for(int i=0;i<settingsSize;i++)
            settings.put(WritableUtils.readString(dataInput), WritableUtils.readString(dataInput));
        setSettings(settings); 
    }
    
    public String getLoginName()
    {
        return loginName;
    }
    
    public String getLoginFullName()
    {
        return loginFullName;
    }
    
    public String getLoginPassword()
    {
        return loginPassword;
    }
    
    public String getAgentAddress()
    {
        return agentAddress;
    }
    
    public String getAgentSection()
    {
        return agentSection;
    }
    
    public boolean getAgentMuted()
    {
        return agentMuted;
    }
    
    public boolean getAgentDisabled()
    {
        return agentDisabled;
    }
    
    public boolean getManagerFullControl()
    {
        return managerFullControl;
    }
    
    public boolean getManagerDisabled()
    {
        return managerDisabled;
    }
    
    public HashMap<String,String> getDeviceMacs()
    {
        return deviceMacs;
    }
    
    public HashMap<Date,String> getJpsLocations()
    {
        return jpsLocations;
    }
    
    public HashMap<String,String> getSettings()
    {
        return settings;
    }
    
    
    public void setLoginName(String value)
    {
        loginName=value;
    }
    
    public void setLoginFullName(String value)
    {
        loginFullName=value;
    }
    
    public void setLoginPassword(String value)
    {
        loginPassword=value;
    }
    
    public void setAgentAddress(String value)
    {
        agentAddress=value;
    }
    
    public void setAgentSection(String value)
    {
        agentSection=value;
    }
    
    public void setAgentMuted(boolean value)
    {
        agentMuted=value;
    }
    
    public void setAgentDisabled(boolean value)
    {
        agentDisabled=value;
    }
    
    public void setManagerFullControl(boolean value)
    {
        managerFullControl=value;
    }
    
    public void setManagerDisabled(boolean value)
    {
        managerDisabled=value;
    }
    
    public void setDeviceMacs(HashMap<String,String> value)
    {
        deviceMacs=value;
    }
    
    public void setJpsLocations(HashMap<Date,String> value)
    {
        jpsLocations=value;
    }
    
    public void setSettings(HashMap<String,String> value)
    {
        settings=value;
    }
    
    private String loginName;
    private String loginFullName;
    private String loginPassword;
    private String agentAddress;
    private String agentSection;
    private boolean agentMuted;
    private boolean agentDisabled;
    private boolean managerFullControl;
    private boolean managerDisabled;
    private HashMap<String,String> deviceMacs;
    private HashMap<Date,String> jpsLocations;
    private HashMap<String,String> settings;
    
}
