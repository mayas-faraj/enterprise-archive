package smd.eors.dataaccess.common;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

public class Coordinate
{
    //public constructors region
    public Coordinate(double longitude, double latitude, float accuracy)
    {
        this.longitude=longitude;
        this.latitude=latitude;
        this.accuracy=accuracy;
    }
    
    public Coordinate(double cellLongitude, double cellLatitude)
    {
        this(cellLongitude, cellLatitude, -1f);
    }
    
    public Coordinate()
    {
        this(0d, 0d, -1f);
    }

    //public methods region
    public double calculateTheta()
    {
        double longitude=SYRIA_END_LONGITUDE-this.longitude;
        double latitude=this.latitude-SYRIA_START_LATITUDE;
        double theta=Math.atan2(latitude,longitude);
        
        if(latitude<0)
            theta+=Math.PI*2;
        
        return theta;
    }
    
    public boolean isGps()
    {
        return accuracy!=-1;
    }
    
    public double getLongitude()
    {
        return longitude;
    }

    public void setLongitude(double longitude)
    {
        this.longitude = longitude;
    }

    public double getLatitude()
    {
        return latitude;
    }

    public void setLatitude(double latitude)
    {
        this.latitude = latitude;
    }
    
    public float getAccuracy()
    {
        return accuracy;
    }

    public void setAccuracy(float accuracy)
    {
        this.accuracy = accuracy;
    }
    
    public byte[] toBytes()
    {
        byte[] result=new byte[Bytes.SIZEOF_DOUBLE+Bytes.SIZEOF_DOUBLE+Bytes.SIZEOF_FLOAT];
        int offset=0;
        offset=Bytes.putDouble(result, offset, getLongitude());
        offset=Bytes.putDouble(result, offset, getLatitude());
        offset=Bytes.putFloat(result, offset, getAccuracy());

        return result; 
    }
    
    public void setFromBytes(byte[] value)
    {
        if(value!=null)
        {
            this.setLongitude(Bytes.toDouble(value, 0));
            this.setLatitude(Bytes.toDouble(value, Bytes.SIZEOF_DOUBLE));
            this.setAccuracy(Bytes.toFloat(value, Bytes.SIZEOF_DOUBLE+Bytes.SIZEOF_DOUBLE));
        }
    }
    
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(LONGITUDE, getLongitude());
        jsonObject.put(LATITUDE, getLatitude());
        jsonObject.put(ACCURACY, (int)getAccuracy());
        
        return jsonObject.toString();
    }
     
    //static final fields region
    public static final double SYRIA_START_LONGITUDE = 35;
    public static final double SYRIA_END_LONGITUDE = 43;
    public static final double SYRIA_START_LATITUDE = 31;
    public static final double SYRIA_END_LATITUDE = 37;
    
    public static final String LONGITUDE = "longitude";
    public static final String LATITUDE = "latitude";
    public static final String ACCURACY = "accuracy";
    
    //private fields region
    private double longitude;
    private double latitude;
    private float accuracy;
}
