package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;

public class CoverageCell extends MasterEntity
{
    //public methods region
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(CELL_GLOBAL_ID, getCellGlobalId());
        jsonObject.put(LONGITUDE, getLongitude());
        jsonObject.put(LATITUDE, getLatitude());
        jsonObject.put(AZIMUTH, getAzimuth());
        jsonObject.put(HEIGHT, getHeight());   

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(CID, getCid());
        jsonObject.put(LAC, getLac());
        jsonObject.put(MNC, getMnc());
        jsonObject.put(MCC, getMcc());
        jsonObject.put(CELL_GLOBAL_ID, getCellGlobalId());
        jsonObject.put(CELL_NAME, getCellName());
        jsonObject.put(STIE_CODE, getSiteCode());
        jsonObject.put(SITE_NAME, getSiteName());
        jsonObject.put(LONGITUDE, getLongitude());
        jsonObject.put(LATITUDE, getLatitude());
        jsonObject.put(AZIMUTH, getAzimuth());
        jsonObject.put(HEIGHT, getHeight()); 

        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }

    public int getCid()
    {
        return cid;
    }

    public void setCid(int cid)
    {
        this.cid = cid;
    }

    public int getLac()
    {
        return lac;
    }

    public void setLac(int lac)
    {
        this.lac = lac;
    }

    public int getMnc()
    {
        return mnc;
    }

    public void setMnc(int mnc)
    {
        this.mnc = mnc;
    }

    public int getMcc()
    {
        return mcc;
    }

    public void setMcc(int mcc)
    {
        this.mcc = mcc;
    }

    public String getCellGlobalId()
    {
        return cellGlobalId;
    }

    public void setCellGlobalId(String cellGlobalId)
    {
        this.cellGlobalId = cellGlobalId;
    }

    public String getCellName()
    {
        return cellName;
    }

    public void setCellName(String cellName)
    {
        this.cellName = cellName;
    }

    public String getSiteCode()
    {
        return siteCode;
    }

    public void setSiteCode(String siteCode)
    {
        this.siteCode = siteCode;
    }

    public String getSiteName()
    {
        return siteName;
    }

    public void setSiteName(String siteName)
    {
        this.siteName = siteName;
    }

    public float getAzimuth()
    {
        return azimuth;
    }

    public void setAzimuth(float azimuth)
    {
        this.azimuth = azimuth;
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

    public float getHeight()
    {
        return height;
    }

    public void setHeight(float height)
    {
        this.height = height;
    }
    
    @Override
    public byte[] designRowKey()
    {
        return Bytes.toBytes(this.getCellGlobalId());
    }
    
    //public static final fields region
    public static final String CID = "cid";
    public static final String LAC = "Lac";
    public static final String MNC = "Mnc";
    public static final String MCC = "Mcc";
    public static final String CELL_GLOBAL_ID = "CellGlobalId";
    public static final String CELL_NAME = "CellName";
    public static final String STIE_CODE = "SiteCode";
    public static final String SITE_NAME = "StieName";
    public static final String AZIMUTH = "Azimuth";
    public static final String LONGITUDE = "longitude";
    public static final String LATITUDE = "latitude";
    public static final String HEIGHT = "Height";
    

    //private fields region
    private int cid;
    private int lac;
    private int mnc;
    private int mcc;
    private String cellGlobalId;
    private String cellName;
    private String siteCode;
    private String siteName;
    private float azimuth;
    private double longitude;
    private double latitude;
    private float height;
}
