package halux.cd.org;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import org.apache.hadoop.io.WritableUtils;
import org.apache.hadoop.io.Writable;

public class CommandWritable implements Writable
{
    
    public CommandWritable()
    {
        multicastUsers=new HashMap<String,Date>();
        broadcastUsers=new HashMap<String,Date>();
    }
    
    @Override
    public void write(DataOutput dataOutput) throws IOException
    {
        WritableUtils.writeString(dataOutput, getUser());
        WritableUtils.writeString(dataOutput, getText());   
        
        HashMap<String,Date> multicasts=getMulticastUsers();
        dataOutput.writeInt(multicasts.size());
        for(String key:multicasts.keySet())
        {
            WritableUtils.writeString(dataOutput, key);
            dataOutput.writeLong(multicasts.get(key).getTime());
        }
        
        HashMap<String,Date> boradcasts=getBroadcastUsers();
        dataOutput.writeInt(boradcasts.size());
        for(String key:boradcasts.keySet())
        {
            WritableUtils.writeString(dataOutput, key);
            dataOutput.writeLong(boradcasts.get(key).getTime());
        }
    }
    
    @Override
    public void readFields(DataInput dataInput) throws IOException
    {
        setUser(WritableUtils.readString(dataInput));
        setText(WritableUtils.readString(dataInput));
          
        int multicastSize=dataInput.readInt();
        HashMap<String,Date> multicasts=new HashMap<String,Date>(multicastSize);
        for(int i=0;i<multicastSize;i++)
            multicasts.put(WritableUtils.readString(dataInput), new Date(dataInput.readLong()));
        setMulticastUsers(multicasts);
        
        int broadcastSize=dataInput.readInt();
        HashMap<String,Date> broadcasts=new HashMap<String,Date>(broadcastSize);
        for(int i=0;i<broadcastSize;i++)
            broadcasts.put(WritableUtils.readString(dataInput), new Date(dataInput.readLong()));
        setBroadcastUsers(broadcasts); 
    }
    
    public String getUser()
    {
        return user;
    }
    
    public String getText()
    {
        return text;
    }
    
    public HashMap<String,Date> getMulticastUsers()
    {
        return multicastUsers;
    }
    
    public HashMap<String,Date> getBroadcastUsers()
    {
        return broadcastUsers;
    }
    
    
    public void setUser(String value)
    {
        user=value;
    }
    
    public void setText(String value)
    {
        text=value;
    }
    
    public void setMulticastUsers(HashMap<String,Date> value)
    {
        multicastUsers=value;
    }
    
    public void setBroadcastUsers(HashMap<String,Date> value)
    {
        broadcastUsers=value;
    }
    
    private String user;
    private String text;
    private HashMap<String,Date> multicastUsers;
    private HashMap<String,Date> broadcastUsers;
    
}
