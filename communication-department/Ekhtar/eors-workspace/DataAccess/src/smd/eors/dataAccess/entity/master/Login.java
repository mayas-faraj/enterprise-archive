package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;

public class Login extends MasterEntity
{
    //public construction region
    public Login(String publisher, String es, String mac, String imei, String os, String type, String imsi, String ssn, String provider, String version, Coordinate gpsCoordinate, Date gpsDate, CellCoordinate cellCoordinate, Date date)
    {
        this.publisher=publisher;
        this.es=es;
        this.mac=mac;
        this.imei=imei;
        this.os=os;
        this.type=type;
        this.imsi=imsi;
        this.ssn=ssn;
        this.provider=provider;
        this.version=version;
        this.gpsCoordinate=gpsCoordinate;
        this.gpsDate=gpsDate;
        this.cellCoordinate=cellCoordinate;
        this.date=date;
    }
    
    public Login(String publisher)
    {
        this(publisher, "", "", "", "", "", "", "", "", "", null, null, null, null);
    }
    
    public Login()
    {
        this("");
    }
    
    //public methods region
    @Override
    public byte[] designRowKey()
    {
        byte[] rowId=new byte[Bytes.SIZEOF_INT + Bytes.SIZEOF_LONG];
        
        int userHash;
        long timestamp;
        
        if(getPublisher()!=null)
            userHash=getPublisher().hashCode();
        else
            userHash=0; 
        
        if(getDate()!=null)
            timestamp=this.getDate().getTime();
        else 
            timestamp=0;
        
        int offset=0;  
        offset=Bytes.putInt(rowId, offset, userHash);
        Bytes.putLong(rowId, offset, Long.MAX_VALUE - timestamp);
        
        return rowId; 
    }
 
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(PUBLISHER, getPublisher());
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
            jsonObject.put(PUBLISHER, getPublisher());
            jsonObject.put(ES, getEs());
            jsonObject.put(MAC, getMac());
            jsonObject.put(IMEI, getImei());
            jsonObject.put(OS_VERSION, getOs());
            jsonObject.put(DEVICE_TYPE, getType());
            jsonObject.put(IMSI, getImsi());
            jsonObject.put(SSN, getSsn());
            jsonObject.put(PROVIDER, getProvider());
            jsonObject.put(VERSION, getVersion());
            
            if(getGpsCoordinate()!=null)
                jsonObject.put(GPS_COORDINATE, new JSONObject(getGpsCoordinate().toJsonString()));
            
            if(getGpsDate()!=null)
                jsonObject.put(GPS_DATE, DATE_FORMAT.format(getGpsDate()));
            
            if(getCellCoordinate()!=null)
                jsonObject.put(COORDINATE, new JSONObject(getCellCoordinate().toJsonString()));
            
            if(getDate()!=null)
                jsonObject.put(DATE, DATE_FORMAT.format(getDate()));
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
                   
                setPublisher(deviceObject.getString(PUBLISHER));
                setEs(deviceObject.getString(ES));
                setType(deviceObject.getString(DEVICE_TYPE));
                setProvider(deviceObject.getString(PROVIDER));
                setVersion(deviceObject.getString(VERSION));
                setMac(deviceObject.getString(MAC));
                setType(deviceObject.getString(DEVICE_TYPE));
                setImei(deviceObject.getString(IMEI));
                setOs(deviceObject.getString(OS_VERSION));
                setImsi(deviceObject.getString(IMSI));
                setSsn(deviceObject.getString(SSN));
            }
            catch(Exception ex)
            {
                
            } 
        }
        else
        {
            setPublisher("");
            setEs("");
            setProvider("");
            setVersion("");
            setMac("");
            setType("");
            setImei("");
            setOs("");
            setImsi("");
            setSsn("");
            setGpsCoordinate(new Coordinate());
            setCellCoordinate(new CellCoordinate());
            setGpsDate(new Date(0));
            setDate(new Date(0));
        }
    }
    
    public String getPublisher()
    {
        return publisher;
    }

    public void setPublisher(String publisher)
    {
        this.publisher = publisher;
    }
    
    public String getEs()
    {
        return es;
    }

    public void setEs(String es)
    {
        this.es = es;
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
    
    public String getProvider()
    {
        return provider;
    }

    public void setProvider(String provider)
    {
        this.provider = provider;
    }
    
    public String getVersion()
    {
        return version;
    }

    public void setVersion(String version)
    {
        this.version = version;
    }
    
    public Coordinate getGpsCoordinate()
    {
        return gpsCoordinate;
    }

    public void setGpsCoordinate(Coordinate gpsCoordinate)
    {
        this.gpsCoordinate = gpsCoordinate;
    }
    
    public Date getGpsDate()
    {
        return gpsDate;
    }

    public void setGpsDate(Date gpsDate)
    {
        this.gpsDate = gpsDate;
    }
    
    public CellCoordinate getCellCoordinate()
    {
        return cellCoordinate;
    }

    public void setCellCoordinate(CellCoordinate cellCoordinate)
    {
        this.cellCoordinate = cellCoordinate;
    }
    
    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }
    
    //private fields region
    private String publisher;
    private String es;
    private String mac;
    private String imei;
    private String os;
    private String type;
    private String imsi;
    private String ssn;
    private String provider;
    private String version;
    private Coordinate gpsCoordinate;
    private Date gpsDate;
    private CellCoordinate cellCoordinate;
    private Date date;
    
    //private static fields region
    private static final String PUBLISHER = "Publisher";
    private static final String ES="Node";
    private static final String MAC = "Macaddress";
    private static final String IMEI = "IMEI";
    private static final String DEVICE_TYPE = "DeviceType";
    private static final String OS_VERSION = "Osversion";
    private static final String IMSI = "IMSI";
    private static final String SSN = "SimSerialNumber";
    private static final String PROVIDER = "Provider";
    private static final String VERSION = "Version";
    protected static final String COORDINATE = "Location";
    protected static final String GPS_COORDINATE = "Gps";
    protected static final String GPS_DATE = "GpsDate";
    protected static final String DATE = "Date";
}
