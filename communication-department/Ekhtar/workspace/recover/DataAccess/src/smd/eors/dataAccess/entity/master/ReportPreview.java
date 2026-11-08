package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

public class ReportPreview extends Report
{
    //public methods region
    @Override 
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(EXTENDED_REPORT_ID, Bytes.toHex(getExtendedReportId()));
        jsonObject.put(USER, getUserName());
        jsonObject.put(TEXT,getText());
        
        if(getDate()!=null)
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
        else
            jsonObject.put(DATE,DATE_FORMAT.format(new Date(getTimpstamp())));
     
        jsonObject.put(TRUSTY,getTrusty());

        if(getGpsCoordinate()!=null)
            jsonObject.put(COORDINATE, getGpsCoordinate().toJsonString());
        else
            jsonObject.put(COORDINATE, getCellCoordinate().toJsonString());

        if(getGpsDate()!=null)
            jsonObject.put(GPS_DATE,DATE_FORMAT.format(getGpsDate()));
        
        jsonObject.put(IMPORTANCE, getImportance());
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(IS_REALTIME,isRealtime());  
        jsonObject.put(EXTENDED_REPORT_ID, Bytes.toHex(getExtendedReportId()));
        jsonObject.put(USER, getUserName());
        jsonObject.put(USER_ADMIN, getUserAdmin());
        jsonObject.put(TEXT,getText());
        
        if(getDate()!=null)
            jsonObject.put(DATE,DATE_FORMAT.format(getDate()));
        else
            jsonObject.put(DATE,DATE_FORMAT.format(new Date(getTimpstamp())));
        
        jsonObject.put(TRUSTY,getTrusty());
        jsonObject.put(COMMAND_ID, getCommandId());
        jsonObject.put(KEYWORDS,getKeyword());

        if(getGpsCoordinate()!=null)
        {
            jsonObject.put(GPS_COORDINATE, JSONObject.stringToValue(getGpsCoordinate().toJsonString()));

            if(getGpsDate()!=null)
                jsonObject.put(GPS_DATE,DATE_FORMAT.format(getGpsDate()));
        }

        if(getCellCoordinate()!=null)
            jsonObject.put(CELL, JSONObject.stringToValue(getCellCoordinate().toJsonString()));

        jsonObject.put(IMPORTANCE, getImportance());

        if(getAction()!=null)
            jsonObject.put(ACTION, JSONObject.stringToValue(getAction().toJsonString()));

        return jsonObject.toString();
    } 
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] designRowKey()
    {
        byte[] rowId=new byte[Bytes.SIZEOF_INT + Bytes.SIZEOF_LONG];
        
        int userHash;
        long timestamp;
        
        if(getUserName()!=null)
            userHash=getUserName().hashCode();
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
    
    public byte[] getExtendedReportId()
    {
        return extendedReportId;
    }

    public void setExtendedReportId(byte[] extendedReportId)
    {
        this.extendedReportId = extendedReportId;
    }
    
    public int getReplayCount()
    {
        return replayCount;
    }

    public void setReplayCount(int replayCount)
    {
        this.replayCount = replayCount;
    }

    public int getMediaCount()
    {
        return mediaCount;
    }

    public void setMediaCount(int mediaCount)
    {
        this.mediaCount = mediaCount;
    }

    //protected static final fields region
    protected static final String EXTENDED_REPORT_ID = "ExtendedReportId";
    protected static final String REPLAY_COUNT = "ReplayCount";
    protected static final String MEDIA_COUNT = "MediaCount";
    
    //private fields region
    private byte[] extendedReportId;
    private int replayCount;
    private int mediaCount;
}
