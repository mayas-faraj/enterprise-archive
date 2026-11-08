package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Present extends SlaveEntity
{
    //public constructors region
    public Present(MasterEntity masterEntity, double longitude, double latitude, float accuracy, float percent)
    {
        super(masterEntity);
        this.coordinate=new Coordinate(longitude, latitude, accuracy);
        this.precent=percent;
    }

    public Present(byte[] rowKey)
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
            jsonObject.put(LOCATION, coordinate.toJsonString());
            jsonObject.put(PERCENT, getPrecent());
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
            jsonObject.put(LOCATION, coordinate.toJsonString());
            jsonObject.put(PERCENT, getPrecent());
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
        return Bytes.toBytes(getPrecent());
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
        Present present=new Present(this.getRowKey());
        
        if(key!=null)
            present.setPrecent(Bytes.toFloat(key));
        
        if(value!=null)
        {
            present.getCoordinate().setLongitude(Bytes.toDouble(value, 0));
            present.getCoordinate().setLatitude(Bytes.toDouble(value, Bytes.SIZEOF_DOUBLE));
            present.getCoordinate().setAccuracy(Bytes.toFloat(value, Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE));
        }
        
        return present;
    }
    
    public Coordinate getCoordinate()
    {
        return coordinate;
    }

    public void setCoordinate(Coordinate coordinate)
    {
        this.coordinate = coordinate;
    }

    public float getPrecent()
    {
        return precent;
    }

    public void setPrecent(float precent)
    {
        this.precent = precent;
    }

    //static final fields region
    public static final String LOCATION = "location";
    public static final String PERCENT = "Percent";

    //private fields region
    private float precent;
    private Coordinate coordinate;
}