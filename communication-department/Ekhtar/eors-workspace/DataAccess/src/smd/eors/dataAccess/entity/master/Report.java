package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Report extends MasterEntity
{
    //public constructors region
    public Report()
    {
        id=-1;
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

        jsonObject.put(IMPORTANCE, (double)getImportance());

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
        jsonObject.put(TIMESTAMP,getTimpstamp());
        jsonObject.put(IP,getIp());
        
        if(getDate()!=null)
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
        else
            jsonObject.put(DATE,DATE_FORMAT.format(new Date(getTimpstamp())));
        
        jsonObject.put(COMMAND_ID, getCommandId());
        jsonObject.put(KEYWORDS,getKeyword());
        jsonObject.put(PROVIDER,getProvider());     
        jsonObject.put(ATTACHMENTS,getAttachments());
        jsonObject.put(ATTACHMENTFILES,getAttachmentFiles());  
        jsonObject.put(ADMIN_COMMENT,getAdminComment());
        jsonObject.put(ADMIN_COMMENT_DATE,getAdminCommentDate());
        jsonObject.put(COMMENT,getComment());
        jsonObject.put(COMMENT_DATE,getCommentDate());
        jsonObject.put(IS_ADMIN_IMPORTANT,IsAdminImportant());
        jsonObject.put(ADMIN_IMPORTANT_DATE,getAdminImportantDate());
        jsonObject.put(IS_IMPORTANT,IsImportant());
        jsonObject.put(IMPORTANT_DATE,getImportantDate());
        jsonObject.put(IS_ADMIN_READ,IsAdminRead());
        jsonObject.put(ADMIN_READ_DATE,getAdminReadDate());
        jsonObject.put(IS_READ,IsRead());
        jsonObject.put(READ_DATE,getReadDate());
        jsonObject.put(EXPORT_DATE,getExportDate());

        if(getGpsCoordinate()!=null)
        {
            jsonObject.put(GPS_COORDINATE, new JSONObject(getGpsCoordinate().toJsonString()));

            if(getGpsDate()!=null)
                jsonObject.put(GPS_DATE,DATE_FORMAT.format(getGpsDate()));
        }

        if(getCellCoordinate()!=null)
            jsonObject.put(CELL, new JSONObject(getCellCoordinate().toJsonString()));
        
        if(getMedia()!=null && getMedia().length>0)
        {
            JSONArray mediaArray=new JSONArray();
            for(Media media:getMedia()) 
                mediaArray.put(media.getStringThnumbnail());
                //mediaArray.put(new JSONObject(media.toJsonString()));
            
            jsonObject.put(MEDIA, mediaArray);
        }
        
        jsonObject.put(IMPORTANCE, (double)getImportance());     

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
        String COMMANDID="commandId";
        String ES="es";
        String TIMESTAMP="timestamp";
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
        String ATTACHMENTS="attachments";
    
        JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
        
        String id=payloadObj.getString(ID);
        id=id.substring(id.indexOf('*')+1);

        this.setId(Long.parseLong(id));
        this.setCommandId(payloadObj.getString(COMMANDID));
        this.setText(payloadObj.getString(TEXT));
        this.setUserName(payloadObj.getString(PUBLISHER));
        this.setImportance((float)payloadObj.getDouble(RELEVANCE));
        this.setUserNode(payloadObj.getString(ES));
        this.setDate(new Date(payloadObj.getLong(TIMESTAMP)));
   
        if(payloadObj.has(CELL) && !payloadObj.getString(CELL).equals("") && !payloadObj.getString(CELL).equals("null"))
        {
            JSONObject cellObj = new JSONObject(payloadObj.getString(CELL));
            
            if(!cellObj.getString(CELL_CELLX).equals("null") && !cellObj.getString(CELL_CELLY).equals("null"))
            {
                double longitude=cellObj.getDouble(CELL_CELLX);
                double latitude=cellObj.getDouble(CELL_CELLY);
                String cgi=cellObj.getString(CELL_CGI);
                float azimuth=(float)cellObj.getDouble(CELL_AZIMUTH);
                float height=(float)cellObj.getDouble(CELL_HEIGHT);
                String address=cellObj.getString(CELL_SITENAME);
                
                this.setCellCoordinate(new CellCoordinate(longitude, latitude, cgi , address, azimuth, height));
            }
        }
        
        if(payloadObj.has(LOCATION) && !payloadObj.getString(LOCATION).equals("") && !payloadObj.getString(LOCATION).equals("null"))
        {
            JSONObject locationObj=new JSONObject(payloadObj.getString(LOCATION));
            
            if(!locationObj.getString(LOCATION_X).equals("null") && !locationObj.getString(LOCATION_Y).equals("null"))
            {
                double longitude=locationObj.getDouble(LOCATION_X);
                double latitude=locationObj.getDouble(LOCATION_Y);
                float accuracy=(float)locationObj.getDouble(LOCATION_A);
                long time=locationObj.getLong(LOCATION_TIME);
                
                this.setGpsCoordinate(new Coordinate(longitude, latitude, accuracy));
                this.setGpsDate(new Date(time));   
            }
        }
        
        if(payloadObj.has(ATTACHMENTS) && !payloadObj.getString(ATTACHMENTS).equals("") && !payloadObj.getString(ATTACHMENTS).equals("null"))
            this.setAttachments(payloadObj.getString(ATTACHMENTS));
    }
    
    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserNode()
    {
        return userNode;
    }

    public void setUserNode(String userAdmin)
    {
        this.userNode = userAdmin;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public String getCommandId()
    {
        return commandId;
    }

    public void setCommandId(String commandId)
    {
        this.commandId = commandId;
    }

    public String getKeyword()
    {
        return keyword;
    }

    public void setKeyword(String keyword)
    {
        this.keyword = keyword;
    }
    
    public String getProvider()
    {
        return provider ;
    }

    public void setProvider(String provider)
    {
        this.provider = provider;
    }
    
    public String getAttachments()
    {
        return attachments ;
    }

    public void setAttachments(String attachments)
    {
        this.attachments = attachments;
    }
    
    public String getAttachmentFiles()
    {
        return attachmentFiles ;
    }

    public void setAttachmentFiles(String attachmentFiles)
    {
        this.attachmentFiles = attachmentFiles;
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

    public float getImportance()
    {
        return importance;
    }

    public void setImportance(float importance)
    {
        this.importance = importance;
    }
    
    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
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
    
    public String getAdminComment()
    {
        return adminComment;
    }

    public void setAdminComment(String adminComment)
    {
        this.adminComment=adminComment;
    }
    
    public Date getAdminCommentDate()
    {
        return adminCommentDate;
    }
    
    public void setAdminCommentDate(Date adminCommentDate)
    {
        this.adminCommentDate=adminCommentDate;
    }
    
    public String getComment()
    {
        return comment;
    }
    
    public void setComment(String comment)
    {
        this.comment=comment;
    }
    
    public String getCommentDate()
    {
        return commentDate;
    }
    
    public void setCommentDate(String commentDate)
    {
        this.commentDate=commentDate;
    }
    
    public boolean IsAdminImportant()
    {
        return isAdminImportant;
    }
    
    public void setAdminImportant(boolean isAdminImportant)
    {
        this.isAdminImportant=isAdminImportant;
    }
    
    public Date getAdminImportantDate()
    {
        return adminImportantDate;
    }
    
    public void setAdminImportantDate(Date adminImportantDate)
    {
        this.adminImportantDate=adminImportantDate;
    }
    
    public boolean IsImportant()
    {
        return isImportant;
    }
    
    public void setImportant(boolean isImportant)
    {
        this.isImportant=isImportant;
    }
    
    public Date getImportantDate()
    {
        return importantDate;
    }
    
    public void setImportantDate(Date importantDate)
    {
        this.importantDate=importantDate;
    }
    
    public boolean IsAdminRead()
    {
        return isAdminRead;
    }
    
    public void setAdminRead(boolean isAdminRead)
    {
        this.isAdminRead=isAdminRead;
    }
    
    public Date getAdminReadDate()
    {
        return adminReadDate;
    }
    
    public void setAdminReadDate(Date adminReadDate)
    {
        this.adminReadDate=adminReadDate;
    }
    
    public boolean IsRead()
    {
        return isRead;
    }
    
    public void setRead(boolean isRead)
    {
        this.isRead=isRead;
    }
    
    public Date getReadDate()
    {
        return readDate;
    }
    
    public void setReadDate(Date readDate)
    {
        this.readDate=readDate;
    }
    
    public Date getExportDate()
    {
        return exportDate;
    }
    
    public void setExportDate(Date exportDate)
    {
        this.exportDate=exportDate;
    }
    
    public Media[] getMedia()
    {
        return media;  
    }
    
    public void setMedia(Media[] media)
    {
        this.media=media;
    }

    @Override
    public byte[] designRowKey()
    {
        //precondition: none
        byte[] rowId = null;

        rowId=new byte[Bytes.SIZEOF_LONG + Bytes.SIZEOF_INT];

        long timestamp;

        if(this.getDate()!=null)
            timestamp=this.getDate().getTime();
        else
            timestamp=0;

        int offset=0;
        offset=Bytes.putLong(rowId, offset, Long.MAX_VALUE - timestamp);
        Bytes.putInt(rowId, offset, String.valueOf(this.getId()).hashCode());  

        return rowId;
    }

    //private static final fields region
    private static final String ID = "Id";
    private static final String IP = "IP";

    private static final String LONGITUDE="Longitude";
    private static final String LATITUDE="Latitude";
    
    protected static final String USER = "Publisher";
    protected static final String USER_NODE = "Es";
    protected static final String TEXT = "Message";
    protected static final String DATE = "Date";
    protected static final String TRUSTY = "Trusty";
    protected static final String COMMAND_ID = "Command_id";
    protected static final String KEYWORDS = "Keywords";
    
    protected static final String COORDINATE = "Location";
    protected static final String GPS_COORDINATE = "Gps";
    protected static final String GPS_DATE = "GpsDate";
    protected static final String CELL = "CellInfo";
    protected static final String IMPORTANCE = "Importance";
    protected static final String PROVIDER = "Provider";
    
    protected static final String DEVICVE = "Device";
    protected static final String TIME="Time";
    
    protected static final String ATTACHMENTS = "attachments";
    protected static final String ATTACHMENTFILES = "attachmentFiles";
    protected static final String ADMIN_COMMENT = "adminComment";
    protected static final String ADMIN_COMMENT_DATE = "adminCommentDate";
    protected static final String COMMENT = "comment";
    protected static final String COMMENT_DATE = "commentDate";
    protected static final String IS_ADMIN_IMPORTANT = "isAdminImportant";
    protected static final String ADMIN_IMPORTANT_DATE = "adminImportantDate";
    protected static final String IS_IMPORTANT = "isImportant";
    protected static final String IMPORTANT_DATE = "importantDate";
    protected static final String IS_ADMIN_READ = "isAdminRead";
    protected static final String ADMIN_READ_DATE = "adminReadDate";
    protected static final String IS_READ = "isRead";
    protected static final String READ_DATE = "readDate";
    protected static final String EXPORT_DATE = "exportDate";
    protected static final String MEDIA = "media";
    
    //private fields region
    private long id;
    private String userName;
    private String userNode;
    private String text;
    private Date date;
    private String commandId;
    private String keyword;
    private String provider;
    private Coordinate gpsCoordinate;
    private Date gpsDate;
    private CellCoordinate cellCoordinate;
    private float importance;
    private String ip;
    private String attachments;
    private String attachmentFiles;
    private String adminComment;
    private Date adminCommentDate;
    private String comment;
    private String commentDate;
    private boolean isAdminImportant;
    private Date adminImportantDate;
    private boolean isImportant;
    private Date importantDate;
    private boolean isAdminRead;
    private Date adminReadDate;
    private boolean isRead;
    private Date readDate;
    private Date exportDate;
    
    //TODO depricated fields
    public String deviceType, imei, imsi, macAddress, osVersion, simSerialNumber;
    
    private Classify[] classifies; 
    private Media[] media;
}
