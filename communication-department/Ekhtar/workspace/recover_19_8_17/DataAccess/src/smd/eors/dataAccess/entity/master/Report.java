package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;

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
    public byte[] getNodeStartKey()
    {
        if(this.getUserNode()!=null)
        {
            byte[] rowId=new byte[Bytes.SIZEOF_INT + Bytes.SIZEOF_INT + Bytes.SIZEOF_LONG];
            
            int offset=0;
            offset=Bytes.putInt(rowId, offset, getUserNode().hashCode());
            offset=Bytes.putInt(rowId, offset, 0);
            Bytes.putLong(rowId, offset, 0);
            
            return rowId;        
        }
        else
            return null;
    }
    
    public byte[] getNodeEndKey()
    {
        if(this.getUserNode()!=null)
        {
            byte[] rowId=new byte[Bytes.SIZEOF_INT + Bytes.SIZEOF_INT + Bytes.SIZEOF_LONG];
            
            int offset=0;
            offset=Bytes.putInt(rowId, offset, getUserNode().hashCode());
            offset=Bytes.putInt(rowId, offset, Integer.MAX_VALUE);
            Bytes.putLong(rowId, offset, Long.MAX_VALUE);
            
            return rowId;        
        }
        else
            return null;
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
    private Coordinate gpsCoordinate;
    private Date gpsDate;
    private CellCoordinate cellCoordinate;
    private float importance;
}
