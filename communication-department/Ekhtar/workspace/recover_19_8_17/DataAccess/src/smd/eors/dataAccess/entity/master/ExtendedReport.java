package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Action;
import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataAccess.entity.slave.Device;
import smd.eors.dataAccess.entity.slave.Media;
import smd.eors.dataAccess.entity.slave.Replay;
import smd.eors.dataAccess.entity.slave.Sim;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.SlaveEntity;

public class ExtendedReport extends Report
{
    //public constructors region
    public ExtendedReport()
    {
        this.ip="";
    }

    //public methods region
    @Override 
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(USER, getUserName());
        jsonObject.put(USER_NODE, getUserNode());
        jsonObject.put(TEXT,getText());
        
        if(getDate()!=null)
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
        else
            jsonObject.put(DATE,DATE_FORMAT.format(new Date(getTimpstamp())));
        
        jsonObject.put(TRUSTY,getTrusty());
        jsonObject.put(COMMAND_ID, getCommandId());  
        
        
        if(getGpsCoordinate()!=null && (getGpsCoordinate().getLongitude()!=0 || getGpsCoordinate().getLatitude()!=0))
        {
            jsonObject.put(LONGITUDE, getGpsCoordinate().getLongitude());
            jsonObject.put(LATITUDE, getGpsCoordinate().getLatitude());
            jsonObject.put(GPS_DATE, DATE_FORMAT.format(getGpsDate()));
        }
        else if(getCellCoordinate()!=null)
        {
            jsonObject.put(LONGITUDE, getCellCoordinate().getLongitude());
            jsonObject.put(LATITUDE, getCellCoordinate().getLatitude());
        }

        jsonObject.put(IMPORTANCE, getImportance());
        
        if(getDevice()!=null)
        {
            jsonObject.put("Mac address", getDevice().getMac());
            jsonObject.put("Imei", getDevice().getImei());
            jsonObject.put(DEVICE, getDevice().getOs());
            jsonObject.put(DEVICE, getDevice().getType());

        }

        if(getSim()!=null)
        {
            jsonObject.put(DEVICE, getDevice().getMac());
            jsonObject.put(DEVICE, getDevice().getMac());
            jsonObject.put(DEVICE, getDevice().getMac());
            jsonObject.put(DEVICE, getDevice().getMac());
            
            jsonObject.put(SIM, getSim().toJsonString().replace("\"", ""));
        }
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(IS_REALTIME,isRealtime());  
        jsonObject.put(ID, getId());
        jsonObject.put(USER, getUserName());
        jsonObject.put(USER_NODE, getUserNode());
        jsonObject.put(TEXT,getText());
        
        if(getDate()!=null)
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
        else
            jsonObject.put(DATE,DATE_FORMAT.format(new Date(getTimpstamp())));
        
        jsonObject.put(TRUSTY,getTrusty());
        jsonObject.put(COMMAND_ID, getCommandId());
        jsonObject.put(KEYWORDS,getKeyword());     
        jsonObject.put(IP,getIp());  

        if(getDevice()!=null)
            jsonObject.put(DEVICE, JSONObject.stringToValue(getDevice().toJsonString()));

        if(getSim()!=null)
            jsonObject.put(SIM, JSONObject.stringToValue(getSim().toJsonString()));

        if(getGpsCoordinate()!=null)
        {
            jsonObject.put(GPS_COORDINATE, JSONObject.stringToValue(getGpsCoordinate().toJsonString()));

            if(getGpsDate()!=null)
                jsonObject.put(GPS_DATE,DATE_FORMAT.format(getGpsDate()));
        }

        if(getCellCoordinate()!=null)
            jsonObject.put(CELL, JSONObject.stringToValue(getCellCoordinate().toJsonString()));
        
        jsonObject.put(IMPORTANCE, getImportance());

        /*
        for(Classify classify:getClassifies())
            jsonClassifies.put(classify.toJsonString());

        jsonObject.put(CLASSIFIES, jsonClassifies);

        for(Replay replay:replays)
            jsonReplays.put(replay);

        jsonObject.put(REPLAYS, jsonReplays);

        for(Media media:media)
            jsonMedia.put(media);

        jsonObject.put(MEDIA, jsonMedia);
         */

        return jsonObject.toString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
        String PAYLOAD="payload";
        String ID="id";
        String PUBLISHER="publisher";
        String TEXT="text";
        String RELEVANCE="relevance";
        String TRUSTY="trusty";
        String COMMANDID="commandId";
        String ES="es";
        String TIMESTAMP="timestamp";
        String DEVICE="device";
        String DEVICE_MACADDRESS="macAddress";
        String DEVICE_IMEI="imei";        
        String DEVICE_IMSI="imsi";
        String DEVICE_IP="ip";
        String DEVICE_DEVICETYPE="deviceType";
        String DEVICE_OSVERSION="osVersion";
        String DEVICE_SIMSERIALNUMBER="simSerialNumber";
        String CELL="cell";
        String CELL_CGI="cgi";
        String CELL_AZIMUTH="azimuth";
        String CELL_HEIGHT="height";
        String CELL_CELLX="cellX";
        String CELL_CELLY="cellY";
        String CELL_SITENAME="siteName";
        String LOCATION="location";
        String LOCATION_X="x";
        String LOCATION_Y="y";
        String LOCATION_A="a";
        String LOCATION_TIME="time";
    
        JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
        
        String id=payloadObj.getString(ID);
        id=id.substring(id.indexOf('*')+1);

        this.setId(Long.parseLong(id));
        this.setCommandId(payloadObj.getString(COMMANDID));
        this.setText(payloadObj.getString(TEXT));
        this.setUserName(payloadObj.getString(PUBLISHER));
        this.setImportance((float)payloadObj.getDouble(RELEVANCE));
        this.setTrusty(payloadObj.getInt(TRUSTY));
        this.setUserNode(payloadObj.getString(ES));
        this.setDate(new Date(payloadObj.getLong(TIMESTAMP)));
   
        if(payloadObj.has(CELL) && payloadObj.getString(CELL)!="")
        {
            JSONObject cellObj = new JSONObject(payloadObj.getString(CELL));
            
            double longitude=cellObj.getDouble(CELL_CELLX);
            double latitude=cellObj.getDouble(CELL_CELLY);
            String cgi=cellObj.getString(CELL_CGI);
            float azimuth=(float)cellObj.getDouble(CELL_AZIMUTH);
            float height=(float)cellObj.getDouble(CELL_HEIGHT);
            String address=cellObj.getString(CELL_SITENAME);
            
            this.setCellCoordinate(new CellCoordinate(longitude, latitude, cgi , address, azimuth, height));
        }
        
        if(payloadObj.has(LOCATION) && payloadObj.getString(LOCATION)!="")
        {
            JSONObject locationObj=new JSONObject(payloadObj.getString(LOCATION));
            
            double longitude=locationObj.getDouble(LOCATION_X);
            double latitude=locationObj.getDouble(LOCATION_Y);
            float accuracy=(float)locationObj.getDouble(LOCATION_A);
            long time=locationObj.getLong(LOCATION_TIME);
            
            this.setGpsCoordinate(new Coordinate(longitude, latitude, accuracy));
            this.setGpsDate(new Date(time));       
        }

        if(payloadObj.has(DEVICE))
        {
            JSONObject deviceObject=new JSONObject(payloadObj.getString(DEVICE));

            setDevice(new Device(this.getRowKey()));
            setSim(new Sim(this.getRowKey()));

            if(deviceObject.has(DEVICE_MACADDRESS))
                getDevice().setMac(deviceObject.getString(DEVICE_MACADDRESS));
            
            if(deviceObject.has(DEVICE_DEVICETYPE))
                getDevice().setType(deviceObject.getString(DEVICE_DEVICETYPE));
            
            if(deviceObject.has(DEVICE_IMEI))    
                getDevice().setImei(deviceObject.getString(DEVICE_IMEI));
            
            if(deviceObject.has(DEVICE_OSVERSION))
                getDevice().setOs(deviceObject.getString(DEVICE_OSVERSION));

            if(deviceObject.has(DEVICE_IMSI))
                getSim().setImsi(deviceObject.getString(DEVICE_IMSI));
            
            if(deviceObject.has(DEVICE_SIMSERIALNUMBER))
                getSim().setSsn(deviceObject.getString(DEVICE_SIMSERIALNUMBER));

            if(deviceObject.has(DEVICE_IP))
                setIp(deviceObject.getString(DEVICE_IP));
        }
    }

    public ReportPreview getPreview()
    {
        ReportPreview preview=new ReportPreview();

        preview.setRowKey(getRowKey());
        preview.setRealtime(isRealtime());
        preview.setCellCoordinate(getCellCoordinate());
        preview.setCommandId(getCommandId());
        preview.setDate(getDate());
        preview.setExtendedReportId(getRowKey());
        preview.setGpsCoordinate(getGpsCoordinate());
        preview.setGpsDate(getGpsDate());
        preview.setImportance(getImportance());
        preview.setKeyword(getKeyword());
        preview.setMediaCount(getMedia()!=null?getMedia().length:0);
        preview.setMediaCount(getReplays()!=null?getReplays().length:0);
        preview.setText(getText());
        preview.setTimpstamp(getTimpstamp());
        preview.setTrusty(getTrusty());
        preview.setUserNode(getUserNode());
        preview.setUserName(getUserName());

        return preview;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public Device getDevice()
    {
        return device;
    }

    public void setDevice(Device device)
    {
        this.device = device;
        SlaveEntity.setMasterEntity(this, device);
    }

    public Sim getSim()
    {
        return sim;
    }

    public void setSim(Sim sim)
    {
        this.sim = sim;
        SlaveEntity.setMasterEntity(this, sim);
    }

    public Classify[] getClassifies()
    {
        return classifies;
    }

    public void setClassifies(Classify[] classifies)
    {
        this.classifies = classifies;
        SlaveEntity.setMasterEntity(this, classifies);
    }

    public Replay[] getReplays()
    {
        return replays;
    }

    public void setReplays(Replay[] replays)
    {
        this.replays = replays;
        SlaveEntity.setMasterEntity(this, replays);
    }

    public Media[] getMedia()
    {
        return media;
    }

    public void setMedia(Media[] media)
    {
        this.media = media;
        SlaveEntity.setMasterEntity(this, media);
    }
    
    public Action[] getActions()
    {
        return actions;
    }

    public void setAction(Action[] actions)
    {
        this.actions = actions;
    }

    @Override
    public byte[] designRowKey()
    {
        byte[] rowId = null;

        if(isRealtime())
        {
            rowId=new byte[Bytes.SIZEOF_LONG + Bytes.SIZEOF_INT];

            int offset=0;
            offset=Bytes.putLong(rowId, offset, Long.MAX_VALUE - this.getDate().getTime());
            Bytes.putInt(rowId, offset, String.valueOf(this.getId()).hashCode());
        }
        else
        {
            rowId=new byte[Bytes.SIZEOF_FLOAT + Bytes.SIZEOF_LONG];

            int offset=0;
            offset=Bytes.putFloat(rowId, offset, Float.MAX_VALUE * (1-this.getImportance()));
            Bytes.putLong(rowId, offset, Long.MAX_VALUE - this.getId());   
        }      

        return rowId;
    }

    public boolean isRealtimeKey(byte[] rowKey) throws ArrayIndexOutOfBoundsException
    {
        if(rowKey.length==Bytes.SIZEOF_INT + Bytes.SIZEOF_INT + Bytes.SIZEOF_LONG)
            return true;
        else if(rowKey.length==Bytes.SIZEOF_FLOAT + Bytes.SIZEOF_LONG)
            return false;
        else
            throw(new ArrayIndexOutOfBoundsException(rowKey.length-1));
    }


    //private static final fields region
    private static final String PAYLOAD = "payload";
    private static final String ID = "Id";
    private static final String IP = "IP";

    private static final String SIM = "Sim";
    private static final String DEVICE = "Device";

    private static final String MAC="Macaddress";
    private static final String OS="Osversion";
    private static final String IMSI="IMSI";
    private static final String IMEI="IMEI";
    private static final String DEVICE_TYPE="DeviceType";
    private static final String SSN = "SimSerialNumber";

    private static final String LONGITUDE="Longitude";
    private static final String LATITUDE="Latitude";


    //private fields region
    private long id;
    private String ip;
    private Sim sim;
    private Device device;
    private Classify[] classifies;
    private Replay[] replays;
    private Media[] media;
    private Action[] actions;
}
