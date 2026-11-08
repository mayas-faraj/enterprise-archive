package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Sim extends SlaveEntity
{
    //public constructors region  
    public Sim(MasterEntity masterEntity, String imsi, String ssn)
    {
        super(masterEntity);
        this.imsi=imsi;
        this.ssn=ssn;
    }
    
    public Sim(MasterEntity masterEntity)
    {
        this(masterEntity, "", "");
    }

    public Sim(byte[] rowKey)
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
            jsonObject.put(IMSI, getImsi());
            jsonObject.put(SSN, getSsn());
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
            jsonObject.put(IMSI, getImsi());
            jsonObject.put(SSN, getSsn());
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
                
                setImsi(deviceObject.getString(IMSI));
                setSsn(deviceObject.getString(SSN));
            }
            catch(Exception ex)
            {
                
            } 
        }
        else
        {
            setImsi("");
            setSsn("");
        }
    }
    
    @Override
    public byte[] toKey()
    {
        if(getImsi()!=null)
            return Bytes.toBytes(getImsi());
        else
            return null;
    }
    
    @Override
    public byte[] toValue()
    {
        if(getSsn()!=null)
            return Bytes.toBytes(getSsn());
        else
            return null;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Sim sim=new Sim(this.getRowKey());

        if(key!=null)
            sim.setImsi(Bytes.toString(key));
        
        if(value!=null)
            sim.setSsn(Bytes.toString(value));
        
        return sim;
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

    //private static fields region
    private static final String IMSI = "imsi";
    private static final String SSN = "simSerialNumber";
    
    //private fields region
    private String imsi;
    private String ssn;
    
}
