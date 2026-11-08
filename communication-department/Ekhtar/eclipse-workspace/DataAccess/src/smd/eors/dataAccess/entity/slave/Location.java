package smd.eors.dataAccess.entity.slave;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Location extends SlaveEntity
{
    //public constructors region
    public Location(MasterEntity masterEntity, double longitude, double latitude, float accuracy, Date date)
    {
        super(masterEntity);
        this.coordinate=new Coordinate(longitude, latitude, accuracy);
        this.date=date;
    }
    
    public Location(MasterEntity masterEntity, double cellLongitude, double cellLatitude, Date date)
    {
        this(masterEntity, cellLongitude, cellLatitude, -1, date);
    }
    
    public Location(MasterEntity masterEntity)
    {
        this(masterEntity, 0, 0, -1, null);
    }

    public Location(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();

        try
        {
            jsonObject.put(Coordinate.LONGITUDE, getCoordinate().getLongitude());
            jsonObject.put(Coordinate.LATITUDE, getCoordinate().getLatitude());
            jsonObject.put(DATE, DATE_FORMAT.format(getDate()));
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
            jsonObject.put(LOCATION, new JSONObject(coordinate.toJsonString()));
            jsonObject.put(DATE, DATE_FORMAT.format(getDate()));
        }
        catch(JSONException ex)     {}


        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] toKey()
    {
        if(getDate()!=null)
            return Bytes.toBytes(getDate().getTime());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        byte[] value=new byte[Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_FLOAT];
        int offset=0;
        
        offset=Bytes.putDouble(value, offset, getCoordinate().getLongitude());
        offset=Bytes.putDouble(value, offset, getCoordinate().getLatitude());
        Bytes.putFloat(value, offset, getCoordinate().getAccuracy());
         
        return value;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Location location=new Location(this.getRowKey());
        location.setCoordinate(new Coordinate());
        
        if(key!=null && key.length>0)
            location.setDate(new Date(Bytes.toLong(key)));
        else
            location.setDate(new Date(0));
        
        if(value!=null)
        {
            location.getCoordinate().setLongitude(Bytes.toDouble(value, 0));
            location.getCoordinate().setLatitude(Bytes.toDouble(value, Bytes.SIZEOF_DOUBLE));
            location.getCoordinate().setAccuracy(Bytes.toFloat(value, Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE));
        }
        
        return location;
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

    //static final fields region
    public static final String LOCATION = "location";
    public static final String DATE = "locationTime";

    //private fields region
    private Date date;
    private Coordinate coordinate;
}