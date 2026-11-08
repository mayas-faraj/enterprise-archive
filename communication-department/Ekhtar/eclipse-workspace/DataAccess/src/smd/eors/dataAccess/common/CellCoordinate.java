package smd.eors.dataaccess.common;

import org.json.JSONException;
import org.json.JSONObject;

public class CellCoordinate extends Coordinate
{
    //public constructors region
    public CellCoordinate(double longitude, double latitude, float accuracy, String cgi, String siteName, String generation, float azimuth, float height)
    {
        super(longitude, latitude, accuracy);
        this.cgi=cgi;
        this.siteName=siteName;
        this.azimuth=azimuth;
        this.height=height;
    }
    
    public CellCoordinate(double cellLongitude, double cellLatitude, String cgi, String siteName, String generation, float azimuth, float height)
    {
        super(cellLongitude, cellLatitude);
        this.cgi=cgi;
        this.siteName=siteName;
        this.azimuth=azimuth;
        this.height=height;
    }
    
    public CellCoordinate()
    {
        this(0,0,0,"","","",0f,0f);
    }
    
    //public methods region
    public String getCgi()
    {
        return cgi;
    }
    public void setCgi(String cgi)
    {
        this.cgi = cgi;
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
     
    public float getHeight()
    {
        return height;
    }
    public void setHeight(float height)
    {
        this.height = height;
    }
    
    public String getGeneration()
    {
        return generation;
    }
    public void setGeneration(String generation)
    {
        this.generation = generation;
    }
    
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(LONGITUDE, getLongitude());
        jsonObject.put(LATITUDE, getLatitude());
        jsonObject.put(ACCURACY, (int)getAccuracy());
        jsonObject.put(CGI, getCgi());
        jsonObject.put(SITE_NAME, getSiteName());
        
        if(azimuth!=-1)
            jsonObject.put(AZIMUTH, (double)getAzimuth());
        
        if(height!=-1)
        jsonObject.put(HEIGHT, (double)getHeight());
            
        if(generation!=null && generation!="")
            jsonObject.put(GENERATION, getGeneration());
        
        return jsonObject.toString();
    }
    
    //static final fields region
    public static final String CGI = "cgi";
    public static final String SITE_NAME = "siteName";
    public static final String AZIMUTH = "azimuth";
    public static final String HEIGHT = "height";
    public static final String GENERATION = "generation";
    
    //private fields region
    private String cgi;
    private String siteName;
    private float azimuth;
    private float height;
    private String generation;
}
