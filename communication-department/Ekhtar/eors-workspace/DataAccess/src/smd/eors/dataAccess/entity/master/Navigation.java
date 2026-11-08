package smd.eors.dataAccess.entity.master;

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
        jsonObject.put(NODE, getNode());
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
        jsonObject.put(NODE, getNode());
        jsonObject.put(DATE, DATE_FORMAT.format(getDate()));

        if(getCoordinate()!=null)
            jsonObject.put(COORDINATE, new JSONObject(getCoordinate().toJsonString())); 

        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
        String PAYLOAD="payload";
        String PUBLISHER="publisher";
        String TIMESTAMP="timestamp";
        String CELL="cell";
        String CELL_CGI="cgi";
        String CELL_AZIMUTH="azimuth";
        String CELL_HEIGHT="height";
        String CELL_CELLX="cellX";
        String CELL_CELLY="cellY";
        String CELL_SITENAME="siteName";
        
        String LOCATION="location";
        String LOCATION_TIME="time";
        String LOCATION_X="x";
        String LOCATION_Y="y";
        String LOCATION_A="a";
        
        
        /*
        "payload":
        {
            "id":"es-cd*1502366798740",
            "publisher":"user1",
            "cell":
            {
                "cgi":"417-01--10001","cid":10001,"lac":-1,"azimuth":30.0,"height":24.0,
                "cellX":36.484818,"cellY":33.611562,"siteName":"Adra"
            },
        "timestamp":1502366798641}}
        */
        
        /*
        "payload":
        {
            "id":"es-cd*1502365394948",
            "publisher":"user2",
            "location":
            {
                "x":34.2988576,"y":33.5165152,"a":26.4,"time":1502365393668,"type":"NETWORK"
            }
        }
        */
        if(!jsonString.equals(""))
        {
            JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));
    
            this.setUser(payloadObj.getString(PUBLISHER));
             
            if(payloadObj.has(CELL) && payloadObj.getString(CELL)!="")
            {
                JSONObject cellObj=new JSONObject(payloadObj.getString(CELL));
                String cgi=cellObj.getString(CELL_CGI);
                double longitude=cellObj.getDouble(CELL_CELLX);
                double latitude=cellObj.getDouble(CELL_CELLY);
                float azimuth=(float)cellObj.getDouble(CELL_AZIMUTH);
                float height=(float)cellObj.getDouble(CELL_HEIGHT);
                String address=cellObj.getString(CELL_SITENAME);
                
                this.setDate(new Date(payloadObj.getLong(TIMESTAMP)));
                
                this.setCoordinate(new CellCoordinate(longitude, latitude, -1, cgi, address, azimuth, height));
            }
            else if(payloadObj.has(LOCATION) && payloadObj.getString(LOCATION)!="")
            {
                JSONObject locationObj=new JSONObject(payloadObj.getString(LOCATION));
                
                double longitude=locationObj.getDouble(LOCATION_X);
                double latitude=locationObj.getDouble(LOCATION_Y);
                float accuracy=(float)locationObj.getDouble(LOCATION_A);
    
                this.setDate(new Date(locationObj.getLong(LOCATION_TIME)));
                
                this.setCoordinate(new Coordinate(longitude, latitude, accuracy));
            }
        }
    }

    public void fromJsonGpsString(String jsonString) throws JSONException
    {
        String PAYLOAD="payload";
        String PUBLISHER="publisher";
        String LOCATION="location";
        String LOCATION_TIME="height";
        String LOCATION_X="cellX";
        String LOCATION_Y="cellY";
        String LOCATION_A="siteName";
        
       
        
        JSONObject payloadObj = new JSONObject((new JSONObject(jsonString)).getString(PAYLOAD));

        this.setUser(payloadObj.getString(PUBLISHER));
        
        
        if(payloadObj.has(LOCATION) && payloadObj.getString(LOCATION)!="")
        {
            JSONObject locationObj=new JSONObject(payloadObj.getString(LOCATION));
            
            double longitude=locationObj.getDouble(LOCATION_X);
            double latitude=locationObj.getDouble(LOCATION_Y);
            float accuracy=(float)locationObj.getDouble(LOCATION_A);

            this.setDate(new Date(locationObj.getLong(LOCATION_TIME)));
            
            this.setCoordinate(new Coordinate(longitude, latitude, accuracy));
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
    
    public String getNode()
    {
        return node;
    }

    public void setNode(String node)
    {
        this.node = node;
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
    private static final String USER = "Publisher";
    private static final String NODE = "Node";
    private static final String DATE = "Date";
    private static final String COORDINATE = "Coordinate";
    
    //private fields region
    private String user;
    private String node; 
    private Date date;
    private Coordinate coordinate; //coordinate or cell coordinate
  
}
