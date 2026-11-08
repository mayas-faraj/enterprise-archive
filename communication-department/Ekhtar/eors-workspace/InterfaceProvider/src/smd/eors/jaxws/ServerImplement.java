package smd.eors.jaxws;

import java.text.ParseException; 
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.jws.WebService;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;
import smd.eors.mediaprocessor.MediaManager;
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
    public String[] getRealtimeReportsByCoordinate(String node, String rowKey, String offset,
            String longitude1, String latitude1, String longitude2, String latitude2)
    {
            GeoRect geoRect=new GeoRect();
            
            //check end row value
            byte[] startRow=Entity.getBytesFromHex(rowKey);
            startRow=Entity.incrementBytes(startRow);
            int theOffset=Integer.parseInt(offset);
                 
            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
                return Entity.toArrayJson(DataAccess.loadRealtimeReportsByCoordinate(node, startRow, theOffset, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude));
            else
                return new String[] {"//Coordinates are not in an valid number format."};
    }

    @Override
    public String[] getReportsByArgs(String node, String user, String keywords, String date1,
            String date2,String longitude1, String latitude1, String longitude2,
            String latitude2, String startKey, String offset)
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
                    if(keywords=="") keywords=null;
                    if(node=="") node=null;
                    if(user=="") user=null;
                    
                    byte[] rowKey=Entity.getBytesFromHex(startKey);
                    rowKey=Entity.incrementBytes(rowKey);

                    int offsetValue=Integer.parseInt(offset);
                    return Entity.toArrayJson(DataAccess.loadReportsByArgs(node, user, keywords, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, rowKey, offsetValue));
                }
                else
                    return new String[] {"//Date values are not in an valid format."};
            }
            else
                return new String[] {"//Coordinates are not in an valid number format."};
    }

    @Override
    public String[] getUsersLastPoint(String node, String users)
    {
        Navigation[] navigations= DataAccess.loadUsersLastLocation(node ,users);
        String[] result=new String[navigations.length];
        
        for(int i=0;i<navigations.length;i++)
            if(navigations[i]!=null)
            {
                try
                {
                    result[i]=navigations[i].toJsonString();
                }
                catch(Exception ex)
                {
                    result[i]="";
                }
            }
                
          return result;      
    }
    
    @Override
    public String addUser(String node, String name)
    {
        return String.valueOf(DataAccess.saveUser(new User(name, node)));
    }

    @Override
    public String addCommand(String commandId, String adminName, String node, String text,
            String users)
    {
        Event[] readers=null;
    
        if(users!=null && users.length()>0)
        {
            if(users.charAt(users.length()-1)==';')
                users=users.substring(0, users.length()-1);
            
            String[] names=users.split(";");
            readers=new Event[names.length];
            for(int i=0; i<names.length; i++)
                readers[i]=new Event(null, names[i], null);
        }
        
        Command cmd=new Command(commandId, adminName, node, text, new Date()); 
        cmd.setReaders(readers);
        
        return String.valueOf(DataAccess.saveCommand(cmd));
    }
    
    @Override
    public String[] getUsersLastPointByCoordinate(String node, String users, String date1, String date2, String longitude1, String latitude1, String longitude2, String latitude2)
    {
            GeoRect geoRect=new GeoRect();
            
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
                    return Entity.toArrayJson(DataAccess.loadUsersLastLocation(node, users, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude)); 
                }
                else
                    return new String[] {"//Date values are not in an valid format."};
            }
            else
                return new String[] {"invalid coordinates numeric values."};

    }
    
    //TODO: Deprecated
    @Override
    public String[] getShortNavigations(String node, String userName)
    { 
            return Entity.toArrayShortJson(DataAccess.loadUserLocations(node, userName));
    }
    
    @Override
    public String[] getUserNavigations(String node, String userName)
    { 
            return Entity.toArrayJson(DataAccess.loadUserLocations(node, userName));
    }
    
    @Override
    public String[] getUserLogin(String node, String publisher, String rowKey, String offset)
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
        
        return Entity.toArrayJson(DataAccess.loadLogin(node, publisher, startRow, offsetNum));
    }
    
    @Override
    public String[] getRealtimeUserLogin(String node, String publisher, String rowKey, String offset)
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
        
        return Entity.toArrayJson(DataAccess.loadRealtimeLogin(node, publisher, startRow, offsetNum));
    }
    
    @Override
    public String getUsers(String node)
    {
        String result="";
        
        try
        {
            User[] users=DataAccess.loadUsers(node);
            
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
    public String getMedia(String uri, String position)
    {
        try
        {
            long pos=Long.valueOf(position);
            return Base64.getEncoder().encodeToString(MediaManager.read(new MediaManager.FileAddress(uri, pos)));
        }
        catch(Exception ex)
        {
            return ex.getMessage();
        }
    }
    
    @Override
    public String[] getReportsByClassification(String node, String name)
    {
        return Entity.toArrayJson(DataAccess.loadReportsByClassification(node, name, null, 0));
    }

    @Override
    public String[] getReportsByImportanceRange(String node, String lowestImportance, String maxImportance)
    {
        return Entity.toArrayJson(DataAccess.loadReportsByImportanceRange(node, null, 0, Float.parseFloat(lowestImportance), Float.parseFloat(maxImportance)));
    }

    @Override
    public String[] getReportsByReviewState(String node, String reviewed, String processed)
    {
        return null;
    }
    
    @Override
    public String[] getReportsStreamByKeyword(String node, String rowKey, String offset, String keywords)
    {
        //check rowKey value
        byte[] startRow=Entity.getBytesFromHex(rowKey);
        startRow=Entity.incrementBytes(startRow); 
        
        @SuppressWarnings("unused")
        int offsetNum=0;
        try
        {
            offsetNum=Integer.parseInt(offset);
        }
        catch(Exception ex)
        {
            offsetNum=0;
        }

        //return Entity.toArrayJson(DataAccess.loadExtendedReportsStream(node, startRow, offsetNum, keywords));
        return null;
    }
    
    @Override
    public String[] getReportsStream(String node, String rowKey, String offset)
    {
        return getReportsStreamByKeyword(node, rowKey, offset, null);
    }
    
    @Override
    public String setReportComment(String admin, String rowKey, String text)
    {
       return null;
    }
    
    @Override
    public String setReportImportant(String admin, String rowKey, String value)
    {
        return null;
    }
    
    @Override
    public String[] getCommands(String node, String rowKey, String offset)
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

        
        return Entity.toArrayJson(DataAccess.loadCommands(node ,startRow, offsetNum));
    }
    
    @Override
    public String getKeywords()
    {
        Keyword[] keywords=DataAccess.loadKeyword();
        String result="";
        
        if(keywords!=null)
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

    
    //private methods region  
    private long parseDate(String dateValue)
    {
        if(dateValue==null||dateValue.equals("")|| dateValue.equals("\"\""))
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
                try
                {
                    date=dateFormatter.parse(dateValue);
                }
                catch(ParseException failureEx)
                {
                    if(logStream!=null)
                        logStream.writeLog(ex,new Parameter("dateValue",dateValue),new Parameter("dateValue.length",String.valueOf(dateValue.length())));

                    return -1;
                }
            }

            return date.getTime();
        }
    }
    
    
    //public static fields region
    public static LogStream logStream;

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
