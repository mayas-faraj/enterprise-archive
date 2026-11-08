package smd.eors.entity;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.NavigableMap;

import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Report extends HbaseEntity
{     
    //public methods region
    @Override
    public void setValueFromJson(long entityId, String jsonEntity)
    {
        try
        {
            JSONObject payloadObj = new JSONObject((new JSONObject(jsonEntity)).getString(PAYLOAD)); 
            
            this.setCommand(payloadObj.getString(COMMAND_ID));
            this.setCellInfo(payloadObj.getString(CELL)); 
            this.setText(payloadObj.getString(TEXT));
            this.setUser(payloadObj.getString(USER));
            this.setTrusty(Integer.valueOf(payloadObj.getString(TRUSTY)));
            
            this.setImei(payloadObj.getJSONObject(DEVICE).getString(IMEI));
            this.setImsi(payloadObj.getJSONObject(DEVICE).getString(IMSI));
            this.setSsn(payloadObj.getJSONObject(DEVICE).getString(SSN));
            this.setIp(payloadObj.getJSONObject(DEVICE).getString(IP));
            this.setMac(payloadObj.getJSONObject(DEVICE).getString(MAC));
            this.setOs(payloadObj.getJSONObject(DEVICE).getString(OS_VERSION));
            this.setDeviceType(payloadObj.getJSONObject(DEVICE).getString(DEVICE_TYPE));
            
            if(entityId!=Long.MIN_VALUE)
                this.setId(entityId);
            
            //row key design
            String command=this.getCommand();
            
            if(command==null)
                command="";
            
            rowId=new byte[Bytes.SIZEOF_INT+Bytes.SIZEOF_LONG];
            byte[] commandHash=Bytes.toBytes(command.hashCode());
            byte[] reportId=Bytes.toBytes(Long.MAX_VALUE-(this.getId()));
            int offset=Bytes.putBytes(rowId,0,commandHash,0,commandHash.length);
            Bytes.putBytes(rowId, offset, reportId, 0, reportId.length);   
            
            //put at least if there are an error while parsing
            this.setDate(DATE_FORMAT.parse(payloadObj.getString(DATE)));
        }
        catch (JSONException ex)
        {
            exceptionHandler(ex);
        }
        catch (ParseException ex)
        {
            exceptionHandler(ex);
        }
    }
    
    @Override
    public void setValueFromJson(String jsonEntity)
    {
        setValueFromJson(Long.MIN_VALUE,jsonEntity);
    }
    
    @Override
    public void setValueFromHbaseResult(Result result)
    {
        //extract report id
        this.setRowId(result.getRow());
 
        //getting values into report
        this.setId(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_ID)),0));
        this.setUser(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_USER)),""));
        this.setText(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_TEXT)),""));
        this.setCommand(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_COMMAND)),""));
        //this.setDate(new Date(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_DATE)),0)));
        this.setMac(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_MAC)),""));
        this.setPriority(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_PRIORITY)),0));
        this.setTrusty(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_TRUSTY)),0f));
        this.setCellInfo(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_CELL_INFO)),""));
        this.setCellLatitude(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLATITUDE)),0d));
        this.setCellLongitude(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_CELLLONGITUDE)),0d));
        this.setGpsLatitude(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_LATITUDE)),0d));
        this.setGpsLongitude(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_LONGITUDE)),0d));
        this.setGpsDate(new Date(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_GPS_DATE)),0)));
        this.setImei(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_IMEI)),""));
        this.setImsi(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_IMSI)),""));
        this.setIp(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_IP)),""));
        this.setSsn(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_SSN)),""));
        this.setCommand(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_COMMAND)),""));
        
        //extract date
        long timestamp=result.getColumnLatestCell(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_TEXT)).getTimestamp();
        this.setDate(new Date(timestamp));
        
        this.setOs(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_OS_VERSION)),""));
        this.setDeviceType(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_DEVICE_TYPE)),""));
        this.setKeyword(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_KEYWORDS)),"")); 
        this.setComment(getValue(result.getValue(Bytes.toBytes(HbaseSchema.REPORT_INFO), Bytes.toBytes(HbaseSchema.REPORT_INFO_COMMENT)),""));
        
        //getting category info
        NavigableMap<byte[], byte[]> familyMap = result.getFamilyMap(Bytes.toBytes(HbaseSchema.REPORT_CATEGORY));

        for(byte[] key : familyMap.keySet())
        {
            String keyString=Bytes.toString(key);
            int value=getValue(familyMap.get(key), 0);
            
            if(keyString==HbaseSchema.REPORT_CATEGORY_IMPORTANCE)
                this.setImportance(value);
            
            else
                this.getCategories().put(keyString, value);
        }  
    }
    
    @Override
    public Put getPut()
    {  
        //put the result
        Put put=new Put(getRowId());
        
        //putting the report info
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_ID,this.getId());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_USER,this.getUser());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_COMMAND,this.getCommand());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_TEXT,this.getText());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_PRIORITY,this.getPriority());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_TRUSTY,this.getTrusty());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_IP,this.getIp());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_CELL_INFO,this.getCellInfo());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_MAC,this.getMac());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_IMEI,this.getImei());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_IMSI,this.getImsi());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_SSN,this.getSsn());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_DEVICE_TYPE,this.getDeviceType());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_OS_VERSION,this.getOs());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_COMMENT,this.getComment());
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_KEYWORDS,this.getKeyword());
        
        if(this.getGpsLongitude()!=0)
            putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_LONGITUDE,this.getGpsLongitude());
        
        if(this.getGpsLatitude()!=0)
            putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_LATITUDE,this.getGpsLatitude());
          
        if(this.getCellLongitude()!=0)
        putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_CELLLONGITUDE,this.getCellLongitude());
        
        if(this.getCellLatitude()!=0)
            putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_CELLLATITUDE,this.getCellLatitude());
        
        if(this.getGpsDate()!=null)
            putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_GPS_DATE,this.getGpsDate().getTime());
      
        if(this.getDate()!=null)
            putValue(put,HbaseSchema.REPORT_INFO,HbaseSchema.REPORT_INFO_DATE,this.getDate().getTime());     
        
        //putting the report categories
        putValue(put,HbaseSchema.REPORT_CATEGORY,HbaseSchema.REPORT_CATEGORY_IMPORTANCE,this.getImportance());
        
        for(String key:getCategories().keySet())
            putValue(put,HbaseSchema.REPORT_CATEGORY,key,getCategories().get(key));
        
        return put;
    }
    
    @Override
    public String toString()
    {
        return String.format("{\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\",\"%s\":\"%s\"}", 
                                TEXT,this.getText(),
                                IP,this.getIp(),
                                LATITUDE,this.getLatitude(),
                                LONGITUDE,this.getLongitude(),
                                USE_JPS,this.isJpsSystem(),
                                DATE,this.getDate());
    }
    
    @Override
    public String toJsonString()
    {    
        JSONObject jsonObject=new JSONObject();
        JSONArray jsonArray=new JSONArray();
        
        try
        {
            jsonObject.put(ROW_ID, getHexRowId());
            jsonObject.put(TEXT,getText());
            jsonObject.put(DATE,getDate());
            jsonObject.put(CELL,getCellInfo());
            jsonObject.put(IP,getIp());
            jsonObject.put(USE_JPS,isJpsSystem());
            jsonObject.put(LONGITUDE,isJpsSystem()?getGpsLongitude():getCellLongitude());
            jsonObject.put(LATITUDE,isJpsSystem()?getGpsLatitude():getCellLatitude());
            jsonObject.put(LOCATION_TIME,isJpsSystem()?getGpsDate():getDate());      
            jsonObject.put(MAC,getMac());
            jsonObject.put(IMEI,getImei());
            jsonObject.put(IMSI,getImsi());
            jsonObject.put(SSN,getSsn());
            jsonObject.put(OS_VERSION,getOs());
            jsonObject.put(DEVICE_TYPE,getDeviceType());
            jsonObject.put(KEYWORDS,getKeyword());
            
            jsonObject.put(IMPORTANCE,getImportance());
            for(String key:getCategories().keySet())
                jsonArray.put(key+"("+String.valueOf(getCategories().get(key))+")");
            
            jsonObject.put(CATEGORIES, jsonArray);
            
            return jsonObject.toString();
        }
        catch (JSONException e)
        {
            e.printStackTrace();
            return "Error parsing report json object, ROW_ID: "+getRowId();
        }
    }
    
    public String toShortJsonString()
    {    
        JSONObject jsonObject=new JSONObject();
        try
        {
            jsonObject.put(ROW_ID, getHexRowId());
            jsonObject.put(TEXT,getText());
            jsonObject.put(DATE,getDate());
            jsonObject.put(CELL,getCellInfo());
            jsonObject.put(USE_JPS,isJpsSystem());
            jsonObject.put(LONGITUDE,isJpsSystem()?getGpsLongitude():getCellLongitude());
            jsonObject.put(LATITUDE,isJpsSystem()?getGpsLatitude():getCellLatitude());
            jsonObject.put(LOCATION_TIME,isJpsSystem()?getGpsDate():getDate());      
            jsonObject.put(MAC,getMac());
            
            return jsonObject.toString();
        }
        catch (JSONException e)
        {
            e.printStackTrace();
            return "Error parsing report json object, ROW_ID: "+getRowId();
        }
    }
   
    
    public long getId()
    {
        return id;
    }

    public void setId(long id)
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

    public float getPriority()
    {
        return priority;
    }
    
    public void setPriority(float priority)
    {
        this.priority = priority;
    }
    
    public String getCellInfo()
    {
        return cellInfo;
    }
    
    public void setCellInfo(String cellInfo)
    {
        this.cellInfo = cellInfo;
    }
    
    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getImei()
    {
        return imei;
    }

    public void setImei(String imei)
    {
        this.imei = imei;
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

    public float getTrusty()
    {
        return trusty;
    }

    public void setTrusty(float trusty)
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
    
    public String getComment()
    {
        return comment;
    }
 
    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public float getImportance()
    {
        return importance;
    }

    public void setImportance(float importance)
    {
        this.importance = importance;
    }

    public HashMap<String, Integer> getCategories()
    {
        return categories;
    }

    public void setCategories(HashMap<String, Integer> categories)
    {
        this.categories = categories;
    }

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public String getOs()
    {
        return os;
    }

    public void setOs(String os)
    {
        this.os = os;
    }

    public String getDeviceType()
    {
        return deviceType;
    }

    public void setDeviceType(String deviceType)
    {
        this.deviceType = deviceType;
    }

    public double getGpsLongitude()
    {
        return gpsLongitude;
    }

    public void setGpsLongitude(double jpaLongitude)
    {
        this.gpsLongitude = jpaLongitude;
    }

    public double getGpsLatitude()
    {
        return gpsLatitude;
    }

    public void setGpsLatitude(double jpsLatitude)
    {
        this.gpsLatitude = jpsLatitude;
    }

    public double getCellLongitude()
    {
        return cellLongitude;
    }

    public void setCellLongitude(double cellLongitude)
    {
        this.cellLongitude = cellLongitude;
    }

    public double getCellLatitude()
    {
        return cellLatitude;
    }

    public void setCellLatitude(double cellLatitude)
    {
        this.cellLatitude = cellLatitude;
    }

    public double getLatitude()
    {
        if(isJpsSystem())
            return getGpsLongitude();
        else
            return getCellLatitude();
    }
    
    public double getLongitude()
    {
        if(isJpsSystem())
            return getGpsLongitude();
        else
            return getCellLongitude();
    }
    
    public boolean isJpsSystem()
    {
        return getGpsLatitude()!=0 || getGpsLongitude()!=0;
    }
    
    public Date getGpsDate()
    {
        return gpsDate;
    }

    public void setGpsDate(Date jpsDate)
    {
        this.gpsDate=jpsDate;
    }

    public String getKeyword()
    {
        return keyword;
    }

    public void setKeyword(String keyword)
    {
        this.keyword = keyword;
    }
    
    //private fields region
    private long id;
    private String user;
    private String mac;
    private String text;
    private float priority;
    private String cellInfo;
    private String ip;
    private String imei;
    private String imsi;
    private String ssn;
    private float trusty;
    private String command;
    private double gpsLongitude;
    private double gpsLatitude;
    private Date gpsDate;
    private double cellLongitude;
    private double cellLatitude;
    private Date date;
    private String os;
    private String deviceType;
    private String keyword;
    private String comment;
    private float importance;
    private HashMap<String, Integer> categories=new HashMap<String,Integer>();
   
    //private static final fields region
    private static final String PAYLOAD = "payload";
    private static final String COMMAND_ID = "Command_id";
    private static final String MAC = "Macaddress";
    private static final String TEXT = "Message";
    private static final String DATE = "Date";
    private static final String CELL="CellInfo";
    private static final String IP = "IP";
    private static final String IMSI = "IMSI";
    private static final String IMEI = "IMEI";
    private static final String SSN = "SimSerialNumber";
    private static final String USE_JPS = "UseJps";
    private static final String LONGITUDE = "Longitude";
    private static final String LATITUDE = "Latitude";
    private static final String LOCATION_TIME = "LocationTime";
    private static final String OS_VERSION = "Osversion";
    private static final String DEVICE_TYPE = "DeviceType";
    private static final String DEVICE = "Device";
    private static final String USER = "Publisher";
    private static final String TRUSTY = "Trusty";
    private static final String IMPORTANCE = "Importance";
    private static final String KEYWORDS = "Keywords";
    private static final String CATEGORIES = "Categories";
}
