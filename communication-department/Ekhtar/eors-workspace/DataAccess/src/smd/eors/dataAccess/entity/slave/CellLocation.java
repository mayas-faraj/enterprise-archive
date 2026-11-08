package smd.eors.dataAccess.entity.slave;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class CellLocation extends SlaveEntity
{
    //public constructors region
    public CellLocation(MasterEntity masterEntity, double longitude, double latitude, String cgi, String address, float azimuth, float height, Date date)
    {
        super(masterEntity);
        this.cellCoordinate=new CellCoordinate(longitude, latitude, cgi, address, azimuth, height);
        this.date=date;
    }
    
    public CellLocation(MasterEntity masterEntity, double cellLongitude, double cellLatitude, Date date)
    {
        this(masterEntity, cellLongitude, cellLatitude, "", "", 0, 0, date);
    }
    
    public CellLocation(MasterEntity masterEntity)
    {
        this(masterEntity, 0, 0, null);
    }

    public CellLocation(byte[] rowKey)
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
            jsonObject.put(Coordinate.LONGITUDE, getCellCoordinate().getLongitude());
            jsonObject.put(Coordinate.LATITUDE, getCellCoordinate().getLatitude());
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
            jsonObject.put(LOCATION, cellCoordinate.toJsonString());
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
        //precondition: CGI, address are not null
        byte[] infoBytes=Bytes.toBytes(getCellCoordinate().getCgi()+ ';'+ getCellCoordinate().getAddress());
        
        byte[] value=new byte[Bytes.SIZEOF_DOUBLE+ Bytes.SIZEOF_DOUBLE+ 
                              Bytes.SIZEOF_FLOAT+ Bytes.SIZEOF_FLOAT+
                              infoBytes.length];
        int offset=0;
        
        offset=Bytes.putDouble(value, offset, getCellCoordinate().getLongitude());
        offset=Bytes.putDouble(value, offset, getCellCoordinate().getLatitude());
        offset=Bytes.putFloat(value, offset, getCellCoordinate().getAzimuth());
        offset=Bytes.putFloat(value, offset, getCellCoordinate().getHeight());
        offset=Bytes.putBytes(value, offset, infoBytes, 0, infoBytes.length);
        
        return value;
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        CellLocation location=new CellLocation(this.getRowKey());
        location.setCellCoordinate(new CellCoordinate());
        
        if(key!=null)
            location.setDate(new Date(Bytes.toLong(key)));
        
        if(value!=null)
        {
            location.getCellCoordinate().setLongitude(Bytes.toDouble(value, 0));
            location.getCellCoordinate().setLatitude(Bytes.toDouble(value, Bytes.SIZEOF_DOUBLE));
            location.getCellCoordinate().setAzimuth(Bytes.toFloat(value, Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE));
            location.getCellCoordinate().setHeight(Bytes.toFloat(value, Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_FLOAT));
            
            String info=Bytes.toString(value, Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_DOUBLE + Bytes.SIZEOF_FLOAT + Bytes.SIZEOF_FLOAT);
            
            location.getCellCoordinate().setCgi(info.substring(0, info.indexOf(';')));
            location.getCellCoordinate().setAddress(info.substring(info.indexOf(';')+1));
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
    
    public CellCoordinate getCellCoordinate()
    {
        return cellCoordinate;
    }

    public void setCellCoordinate(CellCoordinate cellCoordinate)
    {
        this.cellCoordinate = cellCoordinate;
    }

    //static final fields region
    public static final String LOCATION = "location";
    public static final String DATE = "LocationTime";

    //private fields region
    private Date date;
    private CellCoordinate cellCoordinate;
}