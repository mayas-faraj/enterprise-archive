package smd.eors.statisticsengine;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;

import MapCoordinate.AleepoCoordinate;
import MapCoordinate.DamascusCoordinate;
import MapCoordinate.DaraaCoordinate;
import MapCoordinate.DerzorCoordinate;
import MapCoordinate.HamaCoordinate;
import MapCoordinate.HasakaCoordinate;
import MapCoordinate.HomsCoordinate;
import MapCoordinate.IdlibCoordinate;
import MapCoordinate.LatakiaCoordinate;
import MapCoordinate.QunatiraCoordinate;
import MapCoordinate.RaqqaCoordinate;
import MapCoordinate.SwidaaCoordinate;
import MapCoordinate.TartousCoordinate;
import smd.eors.statisticsengine.StatisticsEngine.City;

public class CoordinateProcessor
{ 
    public static City getCity(double longitude, double latitude)
    {
        Point p=new Point(longitude, latitude);

        if(isInside(damascusPolygon, p))
            return City.damascus;
        else if(isInside(homsPolygon, p))
            return City.homs;
        else if(isInside(tartousPolygon, p))
            return City.tartous;
        else if(isInside(latakiaPolygon, p))
            return City.latakia;
        else if(isInside(aleepoPolygon, p))
            return City.aleepo;
        else if(isInside(hamaPolygon, p))
            return City.hama;
        else if(isInside(swidaaPolygon, p))
            return City.swidaa;
        else if(isInside(daraaPolygon, p))
            return City.daraa;
        else if(isInside(qunaiteraPolygon, p))
            return City.qunaitera;
        else if(isInside(raqqaPolygon, p))
            return City.raqqa;
        else if(isInside(derzorPolygon, p))
            return City.derzor;
        else if(isInside(hasakaPolygon, p))
            return City.hasaka;
        else if(isInside(idlibPolygon, p))
            return City.idlib;
        else
            return City.none;
    }
    
    public static String svgOsmTokenizer(String svgPoints) throws JSONException
    {
        String result="";
        JSONArray points=new JSONArray(svgPoints);

        for(int i=0; i<points.length(); i++)
        {
            String value=points.get(i).toString();
            int commaIndex=value.indexOf(',');
            double x=Double.parseDouble(value.substring(1, commaIndex));
            double y=Double.parseDouble(value.substring(commaIndex+1, value.length()-1));

           if(i!=0)
            {
                result+=",";
                if(i%2==0)
                    result+="\n";
            }

            result+=String.format("new Point(%f, %f)", y, x);
            
        }
        
        result+="";
        
        return result;
    }
    
    public static String svgJsTokenizer(String svgPoints)
    {
        double syriaLongitude1=35.715618, syriaLongitude2=42.385256,
               syriaLatitude1=32.310278, syriaLatitude2=37.317755;
        double svgWidth=660, svgHeight=600;
        
        String result="";
        svgPoints=svgPoints.substring(1, svgPoints.length()-1);
        String[] points=svgPoints.split("L");
        
        for(int i=0; i<points.length; i++)
        {
            int commaIndex=points[i].indexOf(',');
            double x=Double.parseDouble(points[i].substring(0, commaIndex));
            double y=Double.parseDouble(points[i].substring(commaIndex+1, points[i].length()));
            double transX=syriaLongitude1+x/300*((syriaLongitude2-syriaLongitude1)/svgWidth);
            double transY=syriaLatitude1+y/300*((syriaLatitude2-syriaLatitude1)/svgHeight);

            result+=String.format("map.addLayer(L.marker([%f, %f],  {icon: L.icon({iconUrl: 'imgs/redpoint.jpg', iconSize: [3,3]})}));\n", transX, transY);
            
        }   
        
        return result;
    }
    
    public static String svgClassToJsTokenizer(Point[] polygon)
    {
        String result="";
        
        for(int i=0; i<polygon.length; i++)
            result+=String.format("map.addLayer(L.marker([%f, %f],  {icon: L.icon({iconUrl: 'imgs/redpoint.jpg', iconSize: [3,3]})}));\n", polygon[i].getX(), polygon[i].getY());
        
        return result;
    }
    
    public static String svgJavaTokenizer(String svgPoints)
    {
        double syriaLongitude1=34.9, syriaLongitude2=42.7,
               syriaLatitude1=32, syriaLatitude2=37.6;
        double svgWidth=660, svgHeight=600;
        
        String result="{";
        svgPoints=svgPoints.substring(1, svgPoints.length()-1);
        String[] points=svgPoints.split("L");
        
        for(int i=0; i<points.length; i++)
        {
            int commaIndex=points[i].indexOf(',');
            double x=Double.parseDouble(points[i].substring(0, commaIndex));
            double y=Double.parseDouble(points[i].substring(commaIndex+1, points[i].length()));
            double transX=syriaLongitude1+x*((syriaLongitude2-syriaLongitude1)/svgWidth);
            double transY=syriaLatitude1+y*((syriaLatitude2-syriaLatitude1)/svgHeight);
            if(i!=0)
            {
                result+=",";
                if(i%2==0)
                    result+="\n";
            }
            result+=String.format("new Point(%f, %f)", transX, transY);
            
        }   
        
        result+="}";
        return result;
    }
    
    private static boolean onSegment(Point p, Point q, Point r)
    {
        return q.getX()<=Math.max(p.getX(), r.getX()) && q.getX()>Math.min(p.getX(), r.getX()) &&
               q.getY()<=Math.max(p.getY(), r.getY()) && q.getY()>Math.max(p.getY(), r.getY());
    }
    
    private static int orientation(Point p, Point q, Point r)
    {
        double val=(q.getY() - p.getY()) * (r.getX() - q.getX()) -
                   (q.getX() - p.getX()) * (r.getY() - q.getY());
        
        if(val==0)
            return 0;
        else if(val>0)
            return 1;
        else
            return 2;
    }
    
    private static boolean doIntersect(Point p1, Point q1, Point p2, Point q2)
    {
        int o1=orientation(p1, q1, p2);
        int o2=orientation(p1, q1, q2);
        int o3=orientation(p2, q2, p1);
        int o4=orientation(p2, q2, q1);
        
        return (o1!=o2 && o3!=o4) || 
               (o1==0 && onSegment(p1, p2, q1)) ||
               (o2==0 && onSegment(p1, q2, q1)) ||
               (o3==0 && onSegment(p2, p1, q2)) ||
               (o4==0 && onSegment(p2, q1, q2));
            
    }
    
    private static boolean isInside(Point[] polygon, Point p)
    {
        int INFINITY=10000;
        
        if(polygon.length<3)
            return false;

        Point exterme=new Point(INFINITY, p.getY());
        int count=0, i=0;
        
        do
        {
            int next=(i+1)%polygon.length;
            if(doIntersect(polygon[i], polygon[next], p, exterme))
            {
                if(orientation(polygon[i], p, polygon[next])==0)
                        return onSegment(polygon[i], p, polygon[next]);
                
                count++;
            }
            
            i=next;
        } while(i!=0);
        
        return (count &1) ==1;
    }

    
    private static final Point[] damascusPolygon=new DamascusCoordinate().polygon;
    private static final Point[] homsPolygon=new HomsCoordinate().polygon;
    private static final Point[] tartousPolygon=new TartousCoordinate().polygon;
    private static final Point[] latakiaPolygon=new LatakiaCoordinate().polygon;
    private static final Point[] aleepoPolygon=new AleepoCoordinate().polygon;
    private static final Point[] hamaPolygon=new HamaCoordinate().polygon;
    private static final Point[] swidaaPolygon=new SwidaaCoordinate().polygon;
    private static final Point[] daraaPolygon=new DaraaCoordinate().polygon;
    private static final Point[] qunaiteraPolygon=new QunatiraCoordinate().polygon;
    private static final Point[] raqqaPolygon=new RaqqaCoordinate().polygon;
    private static final Point[] derzorPolygon=new DerzorCoordinate().polygon;
    private static final Point[] hasakaPolygon=new HasakaCoordinate().polygon;
    private static final Point[] idlibPolygon=new IdlibCoordinate().polygon;
}


