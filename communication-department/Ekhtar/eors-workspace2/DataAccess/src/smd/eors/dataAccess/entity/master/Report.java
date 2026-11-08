package smd.eors.dataAccess.entity.master;

import java.util.Date;

import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;

public abstract class Report extends MasterEntity
{
    //public constructors region
    public Report()
    {
        this.userName=this.userNode=this.text=this.commandId=this.keyword="";
        this.date=this.gpsDate=null;
    }
    
    //public methods region   
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

    public float getTrusty()
    {
        return trusty;
    }

    public void setTrusty(float trusty)
    {
        this.trusty = trusty;
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

    //protected static final fields region
    protected static final String ID = "id";
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
    
    //private fields region
    private String userName;
    private String userNode;
    private String text;
    private Date date;
    private float trusty;
    private String commandId;
    private String keyword;
    private String provider;
    private Coordinate gpsCoordinate;
    private Date gpsDate;
    private CellCoordinate cellCoordinate;
    private float importance;
}
