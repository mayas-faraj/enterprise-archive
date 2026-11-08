package smd.eors.dataAccess.entity.master;

import java.text.ParseException;
import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;

public class Navigation extends MasterEntity
{
    //public constructors region
    public Navigation(String user, double longitude, double latitude, float accuracy, Date date)
    {
        this.coordinate=new Coordinate(longitude, latitude, accuracy);
        this.user=user;     
        this.date=date;
    }
    
    public Navigation(double longitude, double latitude, Date date)
    {
        this("", longitude, latitude, -1, date);
    }
    
    public Navigation()
    {
        this("", 0d, 0d, -1f, null);
    }
    
    //public methods region
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(USER, getUser());
        jsonObject.put(DATE, DATE_FORMAT.format(getDate()));
        jsonObject.put(Coordinate.LONGITUDE, getCoordinate().getLongitude());
        jsonObject.put(Coordinate.LATITUDE, getCoordinate().getLatitude());

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(IS_REALTIME,isRealtime());  
        jsonObject.put(USER, getUser());
        jsonObject.put(DATE, DATE_FORMAT.format(getDate()));

        if(getCoordinate()!=null)
            jsonObject.put(COORDINATE, JSONObject.stringToValue(getCoordinate().toJsonString())); 

        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
        JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));

        this.setCoordinate(new CellCoordinate()); 
        this.setUser(payloadObj.getString(USER));

        ((CellCoordinate)this.getCoordinate()).setCgi(payloadObj.getString(CELL));
        try
        {
            this.setDate(DATE_FORMAT.parse(payloadObj.getString(DATE)));
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
    }

    public void fromJsonGpsString(String jsonString) throws JSONException
    {
        /*
         {\"A\":\"96.0\",\"Publisher\":\"932545736\",\"Time\":\"١٢-٠٥-٢٠١٧ ١٤:٤١:١٧ +0300\",
         \"Type\":\"GPS\",\"X\":\"36.325278610944615\",\"Y\":\"33.550227019681415\"}
         */
            JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
            
            this.setCoordinate(new Coordinate()); 
            this.setUser(payloadObj.getString(USER));
            
            this.getCoordinate().setAccuracy((float)(payloadObj.getDouble("A")));
            this.getCoordinate().setLongitude(payloadObj.getDouble("X"));
            this.getCoordinate().setLatitude(payloadObj.getDouble("Y"));
            try
            {
                this.setDate(DATE_FORMAT.parse(payloadObj.getString("Time")));
            }
            catch (ParseException e)
            {
                e.printStackTrace();
            }   
    }

    public String getUser()
    {
        return user;
    }

    public void setUser(String user)
    {
        this.user = user;
    }
    
    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public Coordinate getCoordinate()
    {
        return coordinate;
    }

    public void setCoordinate(Coordinate coordinate)
    {
        this.coordinate = coordinate;
    }

    @Override
    public byte[] designRowKey()
    {
        //row key: arc tan (long_trans/ lat_trans)+ userHash+ timeStamp  
        if(getCoordinate()!=null)
        {
            byte[] rowId=new byte[Bytes.SIZEOF_DOUBLE+Bytes.SIZEOF_INT+Bytes.SIZEOF_LONG];

            int offset=0;
            offset=Bytes.putDouble(rowId, offset, getCoordinate().calculateTheta());
            offset=Bytes.putInt(rowId, offset, this.getUser().hashCode());
            Bytes.putLong(rowId, offset, this.getDate().getTime());

            return rowId;
        }
        else
            return null;
    }

    //private static final fields region
    private static final String PAYLOAD = "payload";
    private static final String USER = "Publisher";
    private static final String DATE = "Date";
    private static final String COORDINATE = "Coordinate";
    
    private static final String CELL = "Cell";
    //private fields region
    private String user;
    private Date date;
    private Coordinate coordinate; //coordinate or cell coordinate
  
}
