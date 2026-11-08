package smd.eors.jaxws;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.jws.WebService;

import khoja.ArabicStemmerKhoja;
import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.ExtendedReport;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;
import smd.log.LogStream;
import smd.log.Parameter;

@WebService(endpointInterface="smd.eors.jaxws.ServerInterface")
public class ServerImplement implements ServerInterface
{
    @Override
    public String TestConnection()
    {
        return "Connection successful";
    }

    @Override
    public String TestArguments(String arg)
    {
        return "Connection successful with argument: "+arg;
    }

    @Override
    public String[] getRealtimeReportsByCoordinate(String rowKey,
            String longitude1, String latitude1, String longitude2,
            String latitude2)
    {
            GeoRect geoRect=new GeoRect();
            
            //check end row value
            byte[] endRow=Entity.getBytesFromHex(rowKey);
                 
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
                return Entity.toArrayShortJson(DataAccess.loadRealtimeReportsMapNotification(geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, endRow));
            else
                return new String[] {"//Coordinates are not in an valid number format."};
    }

    @Override
    public String[] getReportsByArgs(String keywords, String date1,
            String date2,String longitude1, String latitude1, String longitude2,
            String latitude2, String startKey, int offset)
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
                    try
                    {
                        keywords=stemmer.stem(keywords);
                    }
                    catch(Exception ex)
                    {
                        if(logStream!=null)
                            logStream.writeLog(ex, new Parameter("keywords", keywords));
                    } 
                    
                    if(keywords=="") keywords=null;
                    
                    byte[] rowKey=Entity.getBytesFromHex(startKey);
                    rowKey=Entity.incrementBytes(rowKey);
                    
                     return Entity.toArrayShortJson(DataAccess.loadExtendedReportsByArgs(keywords, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, rowKey, offset));
                }
                else
                    return new String[] {"//Date values are not in an valid format."};
            }
            else
                return new String[] {"//Coordinates are not in an valid number format."};
    }

    @Override
    public String[] getUsersLastPoint()
    {
        Navigation[] navigations= DataAccess.loadUsersLastLocation();
        String[] result=new String[navigations.length];
        
        for(int i=0;i<navigations.length;i++)
            if(navigations[i]!=null)
            {
                try
                {
                    result[i]=navigations[i].toShortJsonString();
                }
                catch(Exception ex)
                {
                    result[i]="";
                }
            }
                
          return result;      
    }

    @Override
    public String addCommand(String commandId, String adminName, String text,
            String users)
    {
        return String.valueOf(DataAccess.saveCommand(new Command(commandId, text, adminName, users, new Date())));
    }
    
    @Override
    public String[] getUsersLastPointByCoordinate(String longitude1, String latitude1, String longitude2, String latitude2)
    {
            GeoRect geoRect=new GeoRect();
            
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
                return Entity.toArrayShortJson(DataAccess.loadUsersLastLocation(geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude));
            else
                return new String[] {"invalid coordinates numeric values."};

    }
    
    @Override
    public String[] getUserNavigations(String userName)
    { 
            return Entity.toArrayShortJson(DataAccess.loadUserLocations(userName));
    }

    @Override
    public String getUsers()
    {
        String result="";
        
        try
        {
            User[] users=DataAccess.loadUsers();
            
            for(int i=0;i<users.length;i++)
                if(users[i]!=null)
                    result+=users[i].getName()+";";
            
            return result;  
        }
        catch(Exception ex)
        {
            return ex.getMessage();
        }
    }
    
    @Override
    public String[] getReportsByClassification(String name)
    {
        return Entity.toArrayJson(DataAccess.loadExtendedReportsByClassification(name, null, 0));
    }

    @Override
    public String[] getReportsByImportanceRange(String lowestImportance, String maxImportance)
    {
        return Entity.toArrayJson(DataAccess.loadExtendedReportsByImportanceRange(null, 0, Float.parseFloat(lowestImportance), Float.parseFloat(maxImportance)));
    }

    @Override
    public String[] getReportsByReviewState(String reviewed, String processed)
    {
        return Entity.toArrayJson(DataAccess.loadExtendedReportsByReviewState(reviewed=="1"?true:false, processed=="1"?true:false, null, 0));
    }
    
    @Override
    public String[] getReportsStreamByKeyword(String rowKey, String offset, String keywords)
    {
        //check rowKey value
        byte[] startRow=Entity.getBytesFromHex(rowKey);
        startRow=Entity.incrementBytes(startRow); 
        
        int offsetNum=0;
        try
        {
            offsetNum=Integer.parseInt(offset);
        }
        catch(Exception ex)
        {
            offsetNum=0;
        }

        return Entity.toArrayJson(DataAccess.loadExtendedReportsStream(startRow, offsetNum, keywords));
    }
    
    @Override
    public String[] getReportsStream(String rowKey, String offset)
    {
        return getReportsStreamByKeyword(rowKey, offset, null);
    }
    
    @Override
    public String[] getCommands(String rowKey, String offset)
    {
        //check rowKey value
        byte[] startRow=Entity.getBytesFromHex(rowKey);
        startRow=Entity.incrementBytes(startRow); 
        
        int offsetNum=0;
        try
        {
            offsetNum=Integer.parseInt(offset);
        }
        catch(Exception ex)
        {
            offsetNum=0;
        }

        
        return Entity.toArrayShortJson(DataAccess.loadCommands(startRow, offsetNum));
    }
    
    @Override
    public String getKeywords()
    {
        Keyword[] keywords=DataAccess.loadKeyword();
        String result="";
        
        for(Keyword kw:keywords)
            if(kw!=null && kw.isActive())
                result+=kw.getName()+';';
        
        return result;
    }
    
    @Override
    public String[] getUserSim(String user)
    {
        User userObject=DataAccess.findUser(user);
        return Entity.toArrayJson(userObject.getSims());
    }

    @Override
    public String[] getUserDevices(String user)
    {
        User userObject=DataAccess.findUser(user);
        return Entity.toArrayJson(userObject.getDevices());
    }

    @Override
    public String[] getUserReports(String rowKey, String offset, String name)
    {
        //check rowKey value
        byte[] startRow=Entity.getBytesFromHex(rowKey);
        startRow=Entity.incrementBytes(startRow); 
        
        int offsetNum=0;
        
        try
        {
            offsetNum=Integer.parseInt(offset);
        }
        catch(Exception ex)
        {
            offsetNum=0;
        }
        
        return Entity.toArrayJson(DataAccess.loadReportPreviewsByUser(startRow, offsetNum, name));
    }
    
    //private methods region  
    private long parseDate(String dateValue)
    {
        try
        {
            if(dateValue==null||dateValue==""|| dateValue=="\"\"")
                return 0;
            else
            {
                Date date;
                
                try
                {
                    date=stampFormatter.parse(dateValue);
                }
                catch(ParseException ex)
                {
                    date=dateFormatter.parse(dateValue);
                }
                
                return date.getTime();
            }
        }
        catch (ParseException ex)
        {
            if(logStream!=null)
                logStream.writeLog(ex,new Parameter("dateValue",dateValue),new Parameter("dateValue.length",String.valueOf(dateValue.length())));

            return 0;
        }
    }
    
    //public static fields region
    public static LogStream logStream;
    private static ArabicStemmerKhoja stemmer=new ArabicStemmerKhoja();

    //private fields region
    private final String DATE_FORMAT="dd-MM-yyyy HH:mm:ss";
    private final String STAMP_FORMAT="dd-MM-yyyy HH:mm:ss:SSS";
    private final SimpleDateFormat dateFormatter=new SimpleDateFormat(DATE_FORMAT);
    private final SimpleDateFormat stampFormatter=new SimpleDateFormat(STAMP_FORMAT);
    
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

                if(lng1!=0||lng2!=0||lat1!=0||lat2!=0)
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
                }

                return true;
            }
            catch(NumberFormatException ex)
            {
                if(logStream!=null)
                    logStream.writeLog(ex, new Parameter("longitude1",String.valueOf(longitude1)), new Parameter("longitude2",String.valueOf(longitude2)),
                                new Parameter("latitude1",String.valueOf(latitude1)), new Parameter("latitude2",String.valueOf(latitude2)));
                return false;
            }
        }  
        
        //private fields region
        private double startLongitude;
        private double endLongitude;
        private double startLatitude;
        private double endLatitude;
    }
}
