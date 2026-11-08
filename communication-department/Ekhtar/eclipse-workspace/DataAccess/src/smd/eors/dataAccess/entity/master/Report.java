package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Action;
import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataAccess.entity.slave.Comment;
import smd.eors.dataaccess.DataSchema;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.Entity;
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
        jsonObject.put(PUBLISHER, getUserName());
        jsonObject.put(IS_REALTIME,isRealtime()); 
        jsonObject.put(ES, getUserNode());
        jsonObject.put(TEXT,getText());
        
        if(getTimestamp()!=0)
            jsonObject.put(TIMESTAMP,getTimestamp());
        
        if(getReceivedTimestamp()!=0)
            jsonObject.put(RECEIVED_TIMESTAMP, getReceivedTimestamp());
        
        if(getCommandId()!=null && !getCommandId().equals(""))
            jsonObject.put(COMMAND_ID, getCommandId());
        
        jsonObject.put(PROVIDER,getProvider());
        
        if(getAttachments()!=null && !getAttachments().equals(""))
            jsonObject.put(ATTACHMENTS,getAttachments());
        
        if(getAttachmentFiles()!=null && !getAttachmentFiles().equals(""))
            jsonObject.put(ATTACHMENTFILES,getAttachmentFiles());  
        
        if(getGpsCoordinate()!=null)
        {
            jsonObject.put(GPS_COORDINATE, new JSONObject(getGpsCoordinate().toJsonString()));

            if(getGpsTimestamp()!=0)
                jsonObject.put(GPS_TIMESTAMP, getGpsTimestamp());
        }

        if(getCellCoordinate()!=null)
            jsonObject.put(CELLINFO, new JSONObject(getCellCoordinate().toJsonString()));
        
        if(getComments()!=null && getComments().length>0)
            jsonObject.put(REPORT_COMMENTS, new JSONArray(SlaveEntity.toShortJsonArray(getComments())));
        
        if(getActions()!=null && getActions().length>0)
            jsonObject.put(REPORT_ACTION, new JSONArray(SlaveEntity.toShortJsonArray(getActions())));
        
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
        jsonObject.put(PUBLISHER, getUserName());
        jsonObject.put(ES, getUserNode());
        jsonObject.put(TEXT,getText());
        jsonObject.put(IP,getIp());
        
        if(getTimestamp()!=0)
            jsonObject.put(TIMESTAMP,getTimestamp());
        
        if(getReceivedTimestamp()!=0)
            jsonObject.put(RECEIVED_TIMESTAMP, getReceivedTimestamp());
        
        jsonObject.put(CELL_TIMESTAMP, getCellTimpstamp());
        
        if(getCommandId()!=null && !getCommandId().equals(""))
            jsonObject.put(COMMAND_ID, getCommandId());
        
        jsonObject.put(KEYWORDS,getKeyword());
        jsonObject.put(PROVIDER,getProvider()); 
        
        if(getAttachments()!=null && !getAttachments().equals(""))
            jsonObject.put(ATTACHMENTS,getAttachments());
        
        if(getAttachmentFiles()!=null && !getAttachmentFiles().equals(""))
            jsonObject.put(ATTACHMENTFILES,getAttachmentFiles());  
        
        if(getGpsCoordinate()!=null)
        {
            jsonObject.put(GPS_COORDINATE, new JSONObject(getGpsCoordinate().toJsonString()));

            if(getGpsTimestamp()!=0)
                jsonObject.put(GPS_TIMESTAMP, getGpsTimestamp());
        }

        if(getCellCoordinate()!=null)
            jsonObject.put(CELLINFO, new JSONObject(getCellCoordinate().toJsonString()));
        
        if(getComments()!=null && getComments().length>0)
            jsonObject.put(REPORT_COMMENTS, new JSONArray(SlaveEntity.toShortJsonArray(getComments())));
        
        if(getActions()!=null && getActions().length>0)
            jsonObject.put(REPORT_ACTION, new JSONArray(SlaveEntity.toShortJsonArray(getActions())));
        
        jsonObject.put(IMPORTANCE, (double)getImportance());     

        return jsonObject.toString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
        JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
        
        String id=payloadObj.getString(ID);
        id=id.substring(id.indexOf('*')+1);

        this.setId(Long.parseLong(id));
        this.setCommandId(payloadObj.getString(DataSchema.REPORT_INFO_COMMANDID));
        this.setText(payloadObj.getString(DataSchema.REPORT_INFO_TEXT));
        this.setUserName(payloadObj.getString(DataSchema.REPORT_INFO_PUBLISHER));
        this.setImportance((float)payloadObj.getDouble(DataSchema.REPORT_INFO_RELEVANCE));
        this.setUserNode(payloadObj.getString(DataSchema.REPORT_INFO_ES));
        this.setTimestamp(payloadObj.getLong(TIMESTAMP));
        
        if(payloadObj.has(DataSchema.REPORT_INFO_RECEIVEDTIMESTAMP))
            this.setReceivedTimestamp(payloadObj.getLong(DataSchema.REPORT_INFO_RECEIVEDTIMESTAMP));
   
        if(payloadObj.has(JSON_CELL_LOCATION))
        { 
            String cellString=payloadObj.getString(JSON_CELL_LOCATION);
            
            if(Entity.checkJsonValue(cellString))
            {
                JSONObject cellObj = new JSONObject(payloadObj.getString(JSON_CELL_LOCATION));
                
                if(!cellObj.getString(DataSchema.REPORT_INFO_CELLLONGITUDE).equals("null") && !cellObj.getString(DataSchema.REPORT_INFO_CELLLATITUDE).equals("null"))
                {
                    double longitude=cellObj.getDouble(DataSchema.REPORT_INFO_CELLLONGITUDE);
                    double latitude=cellObj.getDouble(DataSchema.REPORT_INFO_CELLLATITUDE);
                    String cgi=cellObj.getString(DataSchema.REPORT_INFO_CGI);
                    float azimuth=(float)cellObj.getDouble(DataSchema.REPORT_INFO_CELLAZIMUTH);
                    float height=(float)cellObj.getDouble(DataSchema.REPORT_INFO_CELLHEIGHT);
                    String siteName=cellObj.getString(DataSchema.REPORT_INFO_CELLSITENAME);
                    
                    String generation;
                    if(cellObj.has(DataSchema.REPORT_INFO_GENERATION))
                        generation=cellObj.getString(DataSchema.REPORT_INFO_GENERATION);
                    else
                        generation=null;
                    
                    this.setCellCoordinate(new CellCoordinate(longitude, latitude, cgi , siteName, generation, azimuth, height));
                }
            } 
        }
        
        if(payloadObj.has(JSON_GPS_LOCATION))
        {
            String gpsLocationString=payloadObj.getString(JSON_GPS_LOCATION);
            
            if(Entity.checkJsonValue(gpsLocationString))
            {
                JSONObject gpsLocationObject=new JSONObject(gpsLocationString);
                
                double longitude=gpsLocationObject.getDouble(DataSchema.REPORT_INFO_LONGITUDE);
                double latitude=gpsLocationObject.getDouble(DataSchema.REPORT_INFO_LATITUDE);
                float accuracy=(float)gpsLocationObject.getDouble(DataSchema.REPORT_INFO_ACCURACY);

                if(gpsLocationObject.get(DataSchema.REPORT_INFO_GPSTIME)!=JSONObject.NULL)
                {
                    long time=gpsLocationObject.getLong(DataSchema.REPORT_INFO_GPSTIME);
                    this.setGpsTimestamp(time);
                }
                
                this.setGpsCoordinate(new Coordinate(longitude, latitude, accuracy));
                   
            }
        }
        
        if(payloadObj.has(ATTACHMENTS))
        {
            String attachmentsString=payloadObj.getString(ATTACHMENTS);
            
            if(Entity.checkJsonValue(attachmentsString))
                this.setAttachments(attachmentsString);
        }
    }
    
    @Override
    public byte[] designRowKey()
    {
        //precondition: none
        byte[] rowId = null;

        rowId=new byte[Bytes.SIZEOF_LONG + Bytes.SIZEOF_INT];

        long timestamp;

        if(this.getReceivedTimestamp()==0)
            timestamp=this.getTimestamp();
        else
            timestamp=getReceivedTimestamp();

        int offset=0;
        offset=Bytes.putLong(rowId, offset, Long.MAX_VALUE - timestamp);
        Bytes.putInt(rowId, offset, String.valueOf(this.getId()).hashCode());  

        return rowId;
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
    
    public void setActionFamilyspace(String actionFamilyspace)
    {
        this.actionFamilyspace=actionFamilyspace;
    }
    
    public String getActionFamilyspace()
    {
        return actionFamilyspace;
    }
    
    public void setCommentFamilyspace(String commentFamilyspace)
    {
        this.commentFamilyspace=commentFamilyspace;
    }
    
    public String getCommentFamilyspace()
    {
        return commentFamilyspace;
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
    
    public Action[] getActions()
    {
        return actions;  
    }
    
    public void setActions(Action[] actions)
    {
        this.actions=actions;
    }
    
    public Comment[] getComments()
    {
        return comments;  
    }
    
    public void setComments(Comment[] comments)
    {
        this.comments=comments;
    }

    //private static final fields region
    private static final String ID = "id";
    private static final String IP = "ip";
    protected static final String PUBLISHER = "publisher";
    protected static final String ES = "es";
    protected static final String TEXT = "text";
    protected static final String TIMESTAMP = "timestamp";
    protected static final String RECEIVED_TIMESTAMP = "receivedTimestamp";
    protected static final String TRUSTY = "trusty";
    protected static final String COMMAND_ID = "commandId";
    protected static final String KEYWORDS = "keywords";
    protected static final String COORDINATE = "location";
    protected static final String GPS_COORDINATE = "gps";
    protected static final String GPS_TIMESTAMP = "gpsTimestamp";
    protected static final String CELLINFO = "cellInfo";
    protected static final String IMPORTANCE = "importance";
    protected static final String PROVIDER = "provider";
    protected static final String TIME="time";
    protected static final String ATTACHMENTS = "attachments";
    protected static final String ATTACHMENTFILES = "attachmentFiles";
    protected static final String REPORT_ACTION="reportAction";
    protected static final String REPORT_COMMENTS="reportComments";
    
    protected static final String JSON_CELL_LOCATION="cell";
    protected static final String JSON_GPS_LOCATION="location";
    
    //private fields region
    private long id;
    private String userName;
    private String userNode;
    private String text;
    private long timestamp;
    private long receivedTimestamp;
    private String commandId;
    private String keyword;
    private String provider;
    private Coordinate gpsCoordinate;
    private long gpsTimestamp;
    private CellCoordinate cellCoordinate;
    private float importance;
    private String ip;
    private String attachments;
    private String attachmentFiles;
    private String actionFamilyspace;
    private String commentFamilyspace;
    
    private Classify[] classifies; 
    private Action[] actions;
    private Comment[] comments;

}
