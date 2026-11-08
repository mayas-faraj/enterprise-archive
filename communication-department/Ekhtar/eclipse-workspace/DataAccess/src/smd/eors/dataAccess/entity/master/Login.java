package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.DataSchema;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.Entity;
import smd.eors.dataaccess.entity.MasterEntity;

public class Login extends MasterEntity
{
    //public construction region
    public Login(String publisher, String es, String mac, String imei, String os, String type, String imsi, String ssn, String provider, String version, Coordinate gpsCoordinate, long gpsTimestamp, CellCoordinate cellCoordinate, long timestamp)
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
        this.gpsTimestamp=gpsTimestamp;
        this.cellCoordinate=cellCoordinate;
        this.timestamp=timestamp;
    }
    
    public Login(String publisher)
    {
        this(publisher, "", "", "", "", "", "", "", "", "", null, 0, null, 0);
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
        
        if(getReceivedTimestamp()==0)
            timestamp=this.getTimestamp();
        else 
            timestamp=this.getReceivedTimestamp();
        
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
            jsonObject.put(EMA_VERSION, getVersion());
            jsonObject.put(IS_REALTIME, isRealtime());
            
            if(getGpsCoordinate()!=null)
                jsonObject.put(GPS_COORDINATE, new JSONObject(getGpsCoordinate().toJsonString()));
            
            if(getGpsTimestamp()!=0)
                jsonObject.put(GPS_TIMESTAMP, getGpsTimestamp());
            
            if(getCellCoordinate()!=null)
                jsonObject.put(CELL_COORDINATE, new JSONObject(getCellCoordinate().toJsonString()));
            
            if(getTimestamp()!=0)
                jsonObject.put(TIMESTAMP, getTimestamp());
            
            if(getReceivedTimestamp()!=0)
                jsonObject.put(RECEIVED_TIMESTAMP, getReceivedTimestamp());
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
                JSONObject payloadObject = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
                
                String id=payloadObject.getString(DataSchema.LOGIN_INFO_ID);
                id=id.substring(id.indexOf('*')+1);
                   
                setPublisher(payloadObject.getString(DataSchema.LOGIN_INFO_PUBLISHER));
                setProvider(payloadObject.getString(DataSchema.LOGIN_INFO_PROVIDER));
                setTimestamp(payloadObject.getLong(DataSchema.LOGIN_INFO_TIMESTAMP));
                if(payloadObject.has(DataSchema.LOGIN_INFO_RECEIVEDTIMESTAMP))
                    setReceivedTimestamp(payloadObject.getLong(DataSchema.LOGIN_INFO_RECEIVEDTIMESTAMP));
                setEs(payloadObject.getString(DataSchema.LOGIN_INFO_ES));
                
                if(payloadObject.has(JSON_DEVICE))
                {
                    String deviceString=payloadObject.getString(JSON_DEVICE);
                    
                    if(Entity.checkJsonValue(deviceString))
                    {
                        JSONObject deviceObject= new JSONObject(deviceString);

                        setMac(deviceObject.getString(DataSchema.LOGIN_INFO_MACADDRESS));
                        setImei(deviceObject.getString(DataSchema.LOGIN_INFO_IMEI));
                        setImsi(deviceObject.getString(DataSchema.LOGIN_INFO_IMSI));
                        setSsn(deviceObject.getString(DataSchema.LOGIN_INFO_SIMSERIALNUMBER));
                        setType(deviceObject.getString(DataSchema.LOGIN_INFO_DEVICETYPE));
                        setOs(deviceObject.getString(DataSchema.LOGIN_INFO_OSVERSION)); 
                        setVersion(deviceObject.getString(DataSchema.LOGIN_INFO_EMAVERSION));
                    }
                }
                
                if(payloadObject.has(JSON_GPS_LOCATION))
                {
                    String gpsLocationString=payloadObject.getString(JSON_GPS_LOCATION);
                    
                    if(Entity.checkJsonValue(gpsLocationString))
                    {
                        JSONObject gpsLocationObject= new JSONObject(gpsLocationString);

                        setGpsCoordinate(new Coordinate());
                        getGpsCoordinate().setLongitude(gpsLocationObject.getDouble(DataSchema.LOGIN_INFO_LONGITUDE));
                        getGpsCoordinate().setLatitude(gpsLocationObject.getDouble(DataSchema.LOGIN_INFO_LATITUDE));
                        getGpsCoordinate().setAccuracy((float)gpsLocationObject.getDouble(DataSchema.LOGIN_INFO_ACCURACY));
                        
                        if(gpsLocationObject.has(DataSchema.LOGIN_INFO_GPSDATE))
                            setGpsTimestamp(gpsLocationObject.getLong(DataSchema.LOGIN_INFO_GPSDATE));
                    }
                }
                
                if(payloadObject.has(JSON_CELL_LOCATION))
                {
                    String cellLocationString=payloadObject.getString(JSON_CELL_LOCATION);
                    
                    if(Entity.checkJsonValue(cellLocationString))
                    {
                        JSONObject cellLocationObject= new JSONObject(cellLocationString);

                        setCellCoordinate(new CellCoordinate());
                        getCellCoordinate().setCgi(cellLocationObject.getString(DataSchema.LOGIN_INFO_CGI));
                        getCellCoordinate().setAzimuth((float)cellLocationObject.getDouble(DataSchema.LOGIN_INFO_AZIMUTH));
                        getCellCoordinate().setHeight((float)cellLocationObject.getDouble(DataSchema.LOGIN_INFO_HEIGHT));
                        getCellCoordinate().setLongitude(cellLocationObject.getDouble(DataSchema.LOGIN_INFO_CELLLONGITUDE));
                        getCellCoordinate().setLatitude(cellLocationObject.getDouble(DataSchema.LOGIN_INFO_CELLLATITUDE));
                        getCellCoordinate().setSiteName(cellLocationObject.getString(DataSchema.LOGIN_INFO_SITENAME));

                        if(cellLocationObject.has(DataSchema.REPORT_INFO_GENERATION))
                            getCellCoordinate().setGeneration(cellLocationObject.getString(DataSchema.LOGIN_INFO_GENERATION));
                        
                    }
                }
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
            setGpsTimestamp(0);
            setTimestamp(0);
            setReceivedTimestamp(0);
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
    
    public long getGpsTimestamp()
    {
        return gpsTimestamp;
    }

    public void setGpsTimestamp(long gpsTimestamp)
    {
        this.gpsTimestamp = gpsTimestamp;
    }
    
    public CellCoordinate getCellCoordinate()
    {
        return cellCoordinate;
    }

    public void setCellCoordinate(CellCoordinate cellCoordinate)
    {
        this.cellCoordinate = cellCoordinate;
    } 
    
    public long getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(long timestamp)
    {
        this.timestamp = timestamp;
    }
    
    public long getReceivedTimestamp()
    {
        return receivedTimestamp;
    }
    
    public void setReceivedTimestamp(long receivedTimestamp)
    {
        this.receivedTimestamp=receivedTimestamp;
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
    private long gpsTimestamp;
    private CellCoordinate cellCoordinate;
    private long timestamp;
    private long receivedTimestamp;
    
    //private static fields region
    private static final String PUBLISHER = "publisher";
    private static final String ES="es";
    private static final String MAC = "mac";
    private static final String IMEI = "imei";
    private static final String DEVICE_TYPE = "deviceType";
    private static final String OS_VERSION = "osVersion";
    private static final String IMSI = "imsi";
    private static final String SSN = "simSerialNumber";
    private static final String PROVIDER = "provider";
    private static final String EMA_VERSION = "emaVersion";
    protected static final String CELL_COORDINATE = "cell";
    protected static final String GPS_COORDINATE = "gps";
    protected static final String GPS_TIMESTAMP = "gpsTimestamp";
    protected static final String TIMESTAMP = "timestamp";
    protected static final String RECEIVED_TIMESTAMP = "receivedTimestamp";
    
    protected static final String JSON_DEVICE = "device";
    protected static final String JSON_CELL_LOCATION = "cell";
    protected static final String JSON_GPS_LOCATION = "location";
}
