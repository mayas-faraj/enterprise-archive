package halux.cd.org;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.HashMap;

import org.apache.hadoop.io.WritableUtils;
import org.apache.hadoop.io.Writable;

public class ReportWritable implements Writable
{
    
    public ReportWritable()
    {
        setMediaPaths(new HashMap<String,String>());
        setCategories(new HashMap<String,Integer>());
    }
    
    @Override
    public void write(DataOutput dataOutput) throws IOException
    {
        WritableUtils.writeString(dataOutput, getId()); 
        WritableUtils.writeString(dataOutput, getUser());
        WritableUtils.writeString(dataOutput, getMac());
        WritableUtils.writeString(dataOutput, getText());
        
        dataOutput.writeInt(getPrioriry());
        dataOutput.writeInt(getCid());
        dataOutput.writeInt(getMmc());
        dataOutput.writeByte(getMnc());
        
        WritableUtils.writeString(dataOutput, getIp());
        WritableUtils.writeString(dataOutput, getImsi());
        WritableUtils.writeString(dataOutput, getSsn());
        
        dataOutput.writeInt(getTrusty());
        
        WritableUtils.writeString(dataOutput, getCommand());
       
        dataOutput.writeDouble(getLongitude());
        dataOutput.writeDouble(getLatitude());
        
        WritableUtils.writeString(dataOutput, getComment());
        
        HashMap<String,String> media=getMediaPaths();
        dataOutput.writeInt(media.size());
        for(String key:media.keySet())
        {
            WritableUtils.writeString(dataOutput, key);
            WritableUtils.writeString(dataOutput, media.get(key));
        }
        
        HashMap<String, Integer> cats=getCategories();
        dataOutput.writeInt(cats.size());
        for(String key:cats.keySet())
        {
            WritableUtils.writeString(dataOutput,key);
            dataOutput.writeInt(cats.get(key));
        }
    }
    
    @Override
    public void readFields(DataInput dataInput) throws IOException
    {
        setId(WritableUtils.readString(dataInput));
        setUser(WritableUtils.readString(dataInput));
        setMac(WritableUtils.readString(dataInput));
        setText(WritableUtils.readString(dataInput));
        
        setPrioriry(dataInput.readInt());
        setCid(dataInput.readInt());
        setMmc(dataInput.readInt());
        setMnc(dataInput.readByte());
        
        setIp(WritableUtils.readString(dataInput));
        setImsi(WritableUtils.readString(dataInput));
        setSsn(WritableUtils.readString(dataInput));
        
        setTrusty(dataInput.readInt());
        
        setCommand(WritableUtils.readString(dataInput));
        
        setLongitude(dataInput.readDouble());
        setLatitude(dataInput.readDouble());
        
        setComment(WritableUtils.readString(dataInput));
        
        int mediaSize=dataInput.readInt();
        HashMap<String,String> media=new HashMap<String,String>(mediaSize);
        for(int i=0;i<mediaSize;i++)
            media.put(WritableUtils.readString(dataInput), WritableUtils.readString(dataInput));
        setMediaPaths(media);
        
        int catsSize=dataInput.readInt();
        HashMap<String,Integer> cats=new HashMap<String,Integer>(catsSize);
        for(int i=0;i<catsSize;i++)
            cats.put(WritableUtils.readString(dataInput), dataInput.readInt());
        setCategories(cats);
    }
    

    
    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getUser()
    {
        return user;
    }

    public void setUser(String user)
    {
        this.user = user;
    }

    public String getMac()
    {
        return mac;
    }

    public void setMac(String mac)
    {
        this.mac = mac;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public int getPrioriry()
    {
        return prioriry;
    }

    public void setPrioriry(int prioriry)
    {
        this.prioriry = prioriry;
    }

    public int getCid()
    {
        return cid;
    }

    public void setCid(int cid)
    {
        this.cid = cid;
    }

    public int getMmc()
    {
        return mmc;
    }

    public void setMmc(int mmc)
    {
        this.mmc = mmc;
    }

    public byte getMnc()
    {
        return mnc;
    }

    public void setMnc(byte mnc)
    {
        this.mnc = mnc;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getImsi()
    {
        return imsi;
    }

    public void setImsi(String imsi)
    {
        this.imsi = imsi;
    }

    public String getSsn()
    {
        return ssn;
    }

    public void setSsn(String ssn)
    {
        this.ssn = ssn;
    }

    public int getTrusty()
    {
        return trusty;
    }

    public void setTrusty(int trusty)
    {
        this.trusty = trusty;
    }

    public String getCommand()
    {
        return command;
    }

    public void setCommand(String command)
    {
        this.command = command;
    }

    public double getLongitude()
    {
        return longitude;
    }

    public void setLongitude(double longitude)
    {
        this.longitude = longitude;
    }

    public double getLatitude()
    {
        return latitude;
    }

    public void setLatitude(double latitude)
    {
        this.latitude = latitude;
    }

    public String getComment()
    {
        return comment;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public HashMap<String, String> getMediaPaths()
    {
        return mediaPaths;
    }

    public void setMediaPaths(HashMap<String, String> mediaPaths)
    {
        this.mediaPaths = mediaPaths;
    }

    public HashMap<String, Integer> getCategories()
    {
        return categories;
    }

    public void setCategories(HashMap<String, Integer> categories)
    {
        this.categories = categories;
    }
    

    private String id;
    private String user;
    private String mac;
    private String text;
    private int prioriry;
    private int cid;
    private int mmc;
    private byte mnc;
    private String ip;
    private String imsi;
    private String ssn;
    private int trusty;
    private String command;
    private double longitude;
    private double latitude;
    private String comment;
    private HashMap<String,String> mediaPaths;
    private HashMap<String,Integer> categories;
    
}
