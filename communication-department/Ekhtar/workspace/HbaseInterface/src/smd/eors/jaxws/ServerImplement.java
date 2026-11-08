package smd.eors.jaxws;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.jws.WebMethod;
import javax.jws.WebService;

import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.util.Bytes;

import smd.eors.entity.Report;

@WebService(endpointInterface="smd.eors.jaxws.ServerInterface")
public class ServerImplement implements ServerInterface
{
    @Override
    public String TestConnection()
    {
        return "Connection successful.";
    }

    @Override
    public String TestArguments(String arg)
    {
        return String.format("Connection successful with arg.",arg);
    }

    @Override
    public String getReport(String reportId)
    {
        try
        {
            Report report=HbaseInterface.getReport(reportId);
            
            if(report!=null)
                return report.toJsonString();
            else
                return "report is not exist!";
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,reportId);
            
            return ex.toString();
        }
    }

    @Override
    public String[] getReports()
    {
        return _getReports("", "", "", "", "", "", "0", "0", "0", "0", false);
    }
    
    @Override
    public String[] getReportsByOffset(String hexIdOffset)
    {
        return _getReports("", "", hexIdOffset, "", "", "", "0", "0", "0", "0", false);
    }

    @Override
    public String[] getReportsByCoordinate(String longitude1, String latitude1,
            String longitude2, String latitude2)
    {
        return _getReports("", "", "", "", "", "", longitude1, latitude1, longitude2, latitude2, false);
    }
    
    @Override
    public String[] getReportsByCoordinateOffset(String hexIdOffset, String longitude1, String latitude1, String longitude2, String latitude2)
    {
        return _getReports("", "", hexIdOffset, "", "", "", longitude1, latitude1, longitude2, latitude2, false);
    }
    
    @Override
    public String[] getReportsByTimespan(String keywords, String timespan, String longitude1,
            String latitude1, String longitude2, String latitude2)
    {
        String startDate;
        int span;
        
        try
        {
            span=Integer.parseInt(timespan);
        }
        catch(NumberFormatException ex)
        {
            return new String[] {"//invalid time span integer value."};
        }
        
        if(span!=0)
        {
            Date date=new Date((new Date()).getTime()-(span*1000));
            startDate=dateFormatter.format(date);
        }
        else
            startDate="";
        
        return _getReports(keywords, "", "", "", startDate, "", longitude1, latitude1, longitude2, latitude2, false);
    }

    @Override
    public String[] getReportsByArgs(String keywords, String date1,
            String date2, String longitude1, String latitude1,
            String longitude2, String latitude2)
    {
       return _getReports(keywords, "", "", "", date1, date2, longitude1, latitude1, longitude2, latitude2, false);
    }

    @Override
    public String[] getReportsByCommand(String commandId)
    {
        return _getReports("", commandId, "", "", "", "", "0", "0", "0", "0", false);
    }

    @Override  
    public String[] getRealtimeReports()
    { 
        return _getReports("", "", "", "", "", "", "0", "0", "0", "0", true);
    }
    
    @Override
    public String[] getRealtimeReportsByOffset(String stopIdOffset)
    {
        String startDate="";
        
        if(stopIdOffset==null || stopIdOffset=="" || stopIdOffset=="00" || stopIdOffset=="0000")
        {
            stopIdOffset=null;
            Date date=new Date((new Date()).getTime()-(15*60*1000));
            startDate=dateFormatter.format(date);
        }

        return _getReports("", "", "", stopIdOffset, startDate, "", "0", "0", "0", "0", true);
    }

    @Override
    public String[] getRealtimeReportsByCoordinate(String longitude1,
            String latitude1, String longitude2, String latitude2)
    {
        return _getReports("", "", "", "", "", "", longitude1, latitude1, longitude2, latitude2, true);
    }

    @Override
    public String[] getRealtimeReportsByArgs(String date1, String date2,
            String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
        return _getReports("", "", "", "", date1, date2, longitude1, latitude1, longitude2, latitude2, true);
    }

    @Override
    public String[] getRealtimeReportsByTimespan(String timespan,
            String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
        String startDate;
        int span;
        
        try
        {
            span=Integer.parseInt(timespan);
        }
        catch(NumberFormatException ex)
        {
            return new String[] {"//invalid time span integer value."};
        }
        
        if(span!=0)
        {
            Date date=new Date((new Date()).getTime()-(span*1000));
            startDate=dateFormatter.format(date);
        }
        else
            startDate="";
        
        return _getReports("", "", "", "", startDate, "", longitude1, latitude1, longitude2, latitude2, true);
    }

    @Override
    public String[] getRealtimeReportsByCommand(String commandId)
    {
        return _getReports("", commandId, "", "", "", "", "0", "0", "0", "0", true);
    }

    @Override
    public boolean deleteReport(String hexReportId)
    {
        try
        {
            return HbaseInterface.deleteReport(hexReportId);
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex);
            
            return false;
        }
    }
    
    @Override
    public String[] getCommands()
    {
        try
        {
            return HbaseInterface.getCommands();
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex);
            
            return new String[] {ex.getMessage()};
        }
    }

   // @Override
    //public String[] getUsersNavigation()
    //{
    //    return getUsersNavigationByArgs("","","0","0","0","0");
    //}
    
    @Override
    public String[] getUsersNavigationByCoordinate(String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
        return getUsersNavigationByArgs("", "", longitude1, latitude1, longitude2, latitude2);
    }
    
    @Override
    public String[] getUsersNavigationByTimespan(String timespan,
            String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
        try
        {
            String startDate;
            int span=Integer.parseInt(timespan);
            
            if(span!=0)
            {
                Date date=new Date((new Date()).getTime()-(span*1000));
                startDate=dateFormatter.format(date);
            }
            else
                startDate="";
            
            return getUsersNavigationByArgs(startDate, "", longitude1, latitude1, longitude2, latitude2);
        }
        catch(NumberFormatException ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex, timespan);
            
            return new String[] {"//Timespan value are not in a valid integer format."};
        }
    }
   
    @Override
    public String[] getUsersNavigationByArgs(String date1, String date2,
            String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
        try
        {
            GeoRect geoRect=new GeoRect();
            
            
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking date time format
                long startDate=parseDate(date1);
                long endDate=parseDate(date2);
                
                if(startDate!=-1&&endDate!=-1)
                {
                    return HbaseInterface.getUsersNavigation(startDate,endDate,geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude,false);
                }
                else
                {
                    return new String[] {"//Date values are not in an valid format."};
                }
            }
            else
            {
                return new String[] {"//Coordinates are not in an valid number format."};
            }
        }
        catch(Exception ex)
        {  
            if(logStream!=null)
                logStream.writeLog(ex,date1,date2,longitude1, latitude1, longitude2, latitude2);
            return new String[] {ex.getMessage()};
        } 
    }
    
    @Override
    public String[] getUsersLastPoint(String timespan, String longitude1,
            String latitude1, String longitude2, String latitude2)
    {
        try
        {
            GeoRect geoRect=new GeoRect();
            
            
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking time span format
                long date;
                int span;
                
                try
                {
                    span=Integer.parseInt(timespan);
                }
                catch(NumberFormatException ex)
                {
                    return new String[] {"//invalid time span integer value."};
                }
                
                if(span!=0)
                    date=(new Date()).getTime()-(span*1000);
                else
                    date=0;
                

               return HbaseInterface.getUsersNavigation(date,0,geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude,true);
               
            }
            else
            {
                return new String[] {"//Coordinates are not in an valid number format."};
            }
        }
        catch(Exception ex)
        {  
            if(logStream!=null)
                logStream.writeLog(ex,timespan,longitude1, latitude1, longitude2, latitude2);
            return new String[] {ex.getMessage()};
        } 
    }

    @Override
    public String getUserNavigation(String user)
    {
        try
        {
            return HbaseInterface.getUsersNavigation(user);
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,user);
            return null;
        }
    }   
    
    @Override
    public boolean addCommand(String commandId, String adminName, String text,
            String agentName)
    {
        return addMulticastCommand(commandId, adminName, text, new String[] {agentName});
    }

    @Override
    public boolean addBroadcastCommand(String commandId, String adminName,
            String text)
    {
        return addMulticastCommand(commandId, adminName, text, null);
    }

    @Override
    public boolean addMulticastCommand(String commandId, String adminName,
            String text, String[] users)
    {
        try
        {
            return HbaseInterface.addCommand(commandId, adminName, text, users);          
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,commandId,adminName,text,String.valueOf(users==null));
            return false;
        }
    }
    
    //private functions region
    /*
    private String[] _getReports(boolean realtimeOnly)
    {
        return _getReportsByArgs("", "", "", "0", "0", "0", "0", realtimeOnly);
    }

    private String[] _getReportsByCoordinate(String longitude1, String latitude1,
            String longitude2, String latitude2, boolean realtimeOnly)
    {
        return _getReportsByArgs("", "", "", longitude1, latitude1, longitude2, latitude2, realtimeOnly);
    }
    
    private String[] _getReportsByOffset(String hexIdOffset,String longitude1, String latitude1,
            String longitude2, String latitude2)
    {
        if(hexIdOffset==null || hexIdOffset=="" || hexIdOffset=="0")
            hexIdOffset="00";
        
        try
        {
            GeoRect geoRect=new GeoRect();
              
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
                return HbaseInterface.getReportsByOffset(hexIdOffset,geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude);
            else
                return new String[] {"//Coordinates are not in an valid number format."};
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,longitude1, latitude1, longitude2, latitude2);
            return new String[] {ex.getMessage()};
        } 
    }
    
    private String[] _getReportsByTimespan(String keywords, String timespan, String longitude1,
            String latitude1, String longitude2, String latitude2, boolean realtime)
    {
        try
        {
            String startDate;
            int span=Integer.parseInt(timespan);
            
            if(span!=0)
            {
                Date date=new Date((new Date()).getTime()-(span*1000));
                startDate=dateFormatter.format(date);
            }
            else
                startDate="";
            
            return _getReportsByArgs(keywords, startDate, "", longitude1, latitude1, longitude2, latitude2,realtime);
        }
        catch(NumberFormatException ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex, timespan);
            
            return new String[] {"//Timespan value are not in a valid integer format."};
        }
    }

    private String[] _getReportsByArgs(String keywords, String date1,
            String date2, String longitude1, String latitude1,
            String longitude2, String latitude2, boolean realtime)
    {
        try
        {
            GeoRect geoRect=new GeoRect();
            
            
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking date time format
                long startDate=parseDate(date1);
                long endDate=parseDate(date2);
                
                if(startDate!=-1&&endDate!=-1)
                {
                    return HbaseInterface.getReportsByArgs(keywords,startDate,endDate,geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude,realtime);
                }
                else
                {
                    return new String[] {"//Date values are not in an valid format."};
                }
            }
            else
            {
                return new String[] {"//Coordinates are not in an valid number format."};
            }
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,longitude1, latitude1, longitude2, latitude2);
            return new String[] {ex.getMessage()};
        } 
    }

    private String[] _getReportsByCommand(String commandId, boolean realtimeOnly)
    {
        try
        {
            return _getReports("", commandId, "", "", "", "", "0", "0", "0", "0", realtimeOnly);
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,commandId, String.valueOf(realtimeOnly));
            return null;
        }
    }
    
    */

    private String[] _getReports(String keywords, String commandId, String row1, String row2, 
            String date1, String date2, String longitude1, String latitude1,
            String longitude2, String latitude2, boolean realtimeOnly)
    {
        try
        {
            GeoRect geoRect=new GeoRect();
            
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking date time format
                long startDate=parseDate(date1);
                long endDate=parseDate(date2);
                
                if(startDate>endDate && endDate!=0)
                {
                    long temp=startDate;
                    startDate=endDate;
                    endDate=temp;
                }
                
                if(startDate!=-1&&endDate!=-1)
                {
                    byte[] startRowId=parseHex(row1);
                    byte[] endRowId=parseHex(row2);
                    
                    return HbaseInterface.getReports(startRowId, endRowId, startDate, endDate, commandId, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, keywords, realtimeOnly);
                }
                else
                {
                    return new String[] {"//Date values are not in an valid format."};
                }
            }
            else
            {
                return new String[] {"//Coordinates are not in an valid number format."};
            }
        }
        catch(Exception ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,longitude1, latitude1, longitude2, latitude2);
            return new String[] {ex.getMessage()};
        } 
    }

    
    private long parseDate(String dateValue)
    {
        try
        {
            if(dateValue==null||dateValue==""|| dateValue=="\"\"")
                return 0;
            else
            {
                Date date=dateFormatter.parse(dateValue);
                return date.getTime();
            }
        }
        catch (ParseException ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,dateValue,String.valueOf(dateValue.length()));
            
            return 0;
        }
    }
    
    private byte[] parseHex(String hexValue)
    {
        if(hexValue!=null && hexValue!="" && hexValue!="0")
        {
            try
            {
                return Bytes.fromHex(hexValue);
            }
            catch(Exception ex)
            {
                if(logStream!=null)
                    logStream.writeLog(ex,hexValue);
            }
        }
        
        return null;
    }
    
    //public static fields region
    public static LogStream logStream;

    //private fields region
    private final String DATE_FORMAT="dd-MM-yyyy HH:mm:ss";
    private final SimpleDateFormat dateFormatter=new SimpleDateFormat(DATE_FORMAT);
     
    //private types region
    private class GeoRect
    {
        //public methods region
        public boolean valueOf(String longitude1,String latitude1,String longitude2,String latitude2)
        {         
            try
            {
                double lng1,lat1,lng2,lat2;
                
                lng1=Double.parseDouble(longitude1);
                lng2=Double.parseDouble(longitude2);
                lat1=Double.parseDouble(latitude1);
                lat2=Double.parseDouble(latitude2);
                
                if(lng1!=0&&lng2!=0&&lat1!=0&&lat2!=0)
                { 
                    if(lng1<lng2)
                    {
                        startLongitude=lng1;
                        endLongitude=lng2;
                    }
                    else
                    {
                        startLongitude=lng2;
                        endLongitude=lng1;
                    }
                    
                    if(lat1<lat2)
                    {
                        startLatitude=lat1;
                        endLatitude=lat2;
                    }
                    else
                    {
                        startLatitude=lat2;
                        endLatitude=lat1;
                    }
                    
                    //adding margin
                    startLongitude-=MAP_MARGIN;
                    startLatitude-=MAP_MARGIN;
                    endLongitude+=MAP_MARGIN;
                    endLatitude+=MAP_MARGIN;
                }
                
                return true;
            }
            catch(NumberFormatException ex)
            {
                if(logStream!=null)
                    logStream.writeLog(ex, String.valueOf(longitude1), String.valueOf(longitude2), String.valueOf(latitude1), String.valueOf(latitude2));
                return false;
            } 
        }
        
        //private fields region
        private double startLongitude;
        private double endLongitude;
        private double startLatitude;
        private double endLatitude;
        
        private final double MAP_MARGIN=1;
    }


}
