package smd.eors.jaxws;

import java.util.Base64;
import java.util.Date;

import javax.jws.WebService;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.Statistic;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.DataAdapter;
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
    public String[] loadReportsByArgs(String node, String user, String hasCommand, String keywords, String classify,
            String useSeenFilter, String isSeenFilter,String useImportantFilter, String isImportantFilter,
            String lowestImportance, String maximumImportance,
            String startTimestamp, String endTimestamp, String longitude1, String latitude1, String longitude2,
            String latitude2, String includeEmplyLocations, String startKey, String offset)
    {
            GeoRect geoRect=new GeoRect();

            //checking coordinates double format
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking date time format
                long startDate=Long.parseLong(startTimestamp);
                long endDate=Long.parseLong(endTimestamp);

                if(startDate>endDate && endDate!=0)
                {
                    long temp=startDate;
                    startDate=endDate;
                    endDate=temp;
                }
                
                if(keywords=="") keywords=null;
                if(node=="") node=null;
                if(user=="") user=null;

                float minImportance=Float.valueOf(lowestImportance);
                float maxImportance=Float.valueOf(maximumImportance);

                byte[] rowKey=Entity.getBytesFromHex(startKey);
                rowKey=Entity.incrementBytes(rowKey);

                int offsetValue=Integer.parseInt(offset);
                return Entity.toArrayJson(DataAccess.loadReports(node, user, hasCommand.equals(TRUE), keywords, classify, useSeenFilter.equals(TRUE), isSeenFilter.equals(TRUE), useImportantFilter.equals(TRUE), isImportantFilter.equals(TRUE) ,minImportance, maxImportance, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, includeEmplyLocations.equals(TRUE), rowKey, offsetValue));

            }
            else
                return new String[] {"//Coordinates are not in an valid number format."};
    }

    @Override
    public String[] loadReportsNotification(String node, String startKey, String offset)
    {
        if(node=="") node=null;

        byte[] rowKey=Entity.getBytesFromHex(startKey);
        rowKey=Entity.incrementBytes(rowKey);

        int offsetValue=Integer.parseInt(offset);
        return Entity.toArrayShortJson(DataAccess.loadReports(node, rowKey, offsetValue));
    }
    
    @Override
    public String[] loadReportsCommand(String node, String users, String commandId, String keywords, String startTimestamp, String endTimestamp)
    {
        //checking date time format
        long startDate=Long.parseLong(startTimestamp);
        long endDate=Long.parseLong(endTimestamp);

        if(startDate>endDate && endDate!=0)
        {
            long temp=startDate;
            startDate=endDate;
            endDate=temp;
        }

        if(keywords=="") keywords=null;
        if(node=="") node=null;
        if(users=="") users=null;

        return Entity.toArrayShortJson(DataAccess.loadReports(node, users, true, commandId, keywords, startDate, endDate));
    }
    
    @Override
    public String[] loadReportsById(String node, String id)
    {
        if(node=="") node=null;
        return Entity.toArrayShortJson(DataAccess.loadReports(node, id));
    }
    
    @Override
    public String[] loadReportsRealtime(String node)
    {
        if(node=="") node=null;
        return Entity.toArrayShortJson(DataAdapter.loadReports(null, null, true, node, DataAdapter.getFilterReportByNode(node)));
    }
    
    @Override
    public String[] loadUsersLastLocation(String node, String users)
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
    public String saveUser(String node, String name)
    {
        return Entity.getHexFromBytes(DataAccess.saveUser(new User(name, node)));
    }

    @Override
    public String saveCommand(String es, String text, String sets, String users)
    {
        Event[] readers=null;
    
        if(users!=null && users.length()>0)
        {
            if(users.charAt(users.length()-1)==';')
                users=users.substring(0, users.length()-1);
            
            String[] names=users.split(";");
            readers=new Event[names.length];
            for(int i=0; i<names.length; i++)
                readers[i]=new Event(null, names[i], 0);
        }
        
        Command cmd=new Command(es, text, sets, new Date().getTime()); 
        cmd.setReaders(readers);
        
        return Entity.getHexFromBytes(DataAccess.saveCommand(cmd));
    }
    
    @Override
    public String[] loadUsersLastLocationByCoordinate(String node, String users, String startTimestamp, String endTimestamp, String longitude1, String latitude1, String longitude2, String latitude2)
    {
            GeoRect geoRect=new GeoRect();
            
            if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
            {
                //checking date time format
                long startDate=Long.parseLong(startTimestamp);
                long endDate=Long.parseLong(endTimestamp);

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

    @Override
    public String[] loadUserShortLocations(String node, String userName)
    { 
            return Entity.toArrayShortJson(DataAccess.loadUserLocations(node, userName));
    }
    
    @Override
    public String[] loadUserLocations(String node, String userName)
    { 
            return Entity.toArrayJson(DataAccess.loadUserLocations(node, userName));
    }
    
    @Override
    public String[] loadLogin(String node, String publisher, String rowKey, String offset)
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
    public String loadUsers(String node)
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
    public String findReport(String node, String rowKey)
    {
        if(node=="") node=null;

        byte[] key=Entity.getBytesFromHex(rowKey);
        
        //Report result=DataAccess.findReport(key, node);
        Report[] result=DataAccess.loadReports(node, key, 1);
         
        if(result!=null)
            //return result.toJsonString();
            return result[0].toJsonString();
        else
            return "";
    }
    
    @Override
    public String findCommand(String node, String rowKey)
    {
        if(node=="") node=null;

        byte[] key=Entity.getBytesFromHex(rowKey);
        Command result=DataAccess.findCommand(key, node);
        //Command[] result=DataAccess.loadCommands(node, key, 1);
        
        if(result!=null)
            return result.toJsonString();
            //return result[0].toJsonString();
        else
            return "";
    }

    @Override
    public String findMedia(String uri, String position)
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
    public String findStatistic(String name, String es)
    {
        Statistic result= DataAccess.findStatistic(name, es);
        if(result!=null)
            return result.toShortJsonString();
        else
            return "";
    }

    @Override
    public String countReportsByUnseen(String node, String replayOnly)
    {
        return  String.valueOf(DataAccess.countReports(node, null, replayOnly.equals(TRUE), true, false, false, false, 0, 0, 0, 0, 0, 0, false, false, null, 0));
    } 
    
    @Override
    public String countReportsByCoverage(String node, String hasGps, String hasCell){
        return  String.valueOf(DataAccess.countReports(node, null, false, false, false, false, false, 0, 0, 0, 0, 0, 0, hasGps.equals(TRUE), hasCell.equals(TRUE), null, 0));
    }
    
    @Override
    public String countReportsByCoordinate(String node, String longitude1, String latitude1, String longitude2, String latitude2)
    {
        GeoRect geoRect=new GeoRect();

        //checking coordinates double format
        if(geoRect.valueOf(longitude1, latitude1, longitude2, latitude2))
        {
            return  String.valueOf(DataAccess.countReports(node, null, false, false, false, false, false, 0, 0, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, false, false, null, 0));
        }
        else
            return "";
    }
    
    @Override
    public String countReportsByUsers(String node, String users, String onlyImportant)
    {
        return  String.valueOf(DataAccess.countReports(node, users, false, false, false, onlyImportant.equals(TRUE), onlyImportant.equals(TRUE), 0, 0, 0, 0, 0, 0, false, false, null, 0));
    }
   
    @Override
    public String[] loadCommands(String node, String keywords, String startTimestamp, String endTimestamp, String rowKey, String offset)
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
        
        //checking date time format
        long startDate=Long.parseLong(startTimestamp);
        long endDate=Long.parseLong(endTimestamp);

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

            return Entity.toArrayJson(DataAccess.loadCommands(node, keywords, startDate, endDate, startRow, offsetNum));
        }
        else
            return new String[] {"//Date values are not in an valid format."};
    }
     
    @Override
    public String loadKeyword()
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
    public String[] loadUserSim(String user)
    {
        User userObject=DataAccess.findUser(user);
        return Entity.toArrayJson(userObject.getSims());
    }

    @Override
    public String[] loadUserDevices(String user)
    {
        User userObject=DataAccess.findUser(user);
        return Entity.toArrayJson(userObject.getDevices());
    }
    
    @Override
    public String setReportImportantById(String node, String id, String isImportant, String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.setReportImportant(node, id, isImportant.equals(TRUE), time);
    }
    
    @Override
    public String setReportImportant(String node, String rowKey, String isRealtime, String isImportant, String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.setReportImportant(node, rowBytes, isRealtime.equals(TRUE), isImportant.equals(TRUE), time));
    }
    
    @Override
    public String saveReportCommentById(String node, String id, String comment, String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.saveReportComment(node, id, comment, time);
    }
    
    @Override
    public String saveReportComment(String node, String rowKey, String isRealtime, String comment, String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.saveReportComment(node, rowBytes, isRealtime.equals(TRUE), comment, time));
    }
    
    @Override
    public String setReportSeenById(String node, String id, String isSeen, String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.setReportSeen(node, id, isSeen.equals(TRUE), time);
    }
    
    @Override
    public String setReportSeen(String node, String rowKey, String isRealtime, String isSeen, String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.setReportSeen(node, rowBytes, isRealtime.equals(TRUE), isSeen.equals(TRUE), time));
    }
    
    @Override
    public String setReportsSeen(String node, long timestamp)
    {
        return String.valueOf(DataAccess.setReportsSeen(node, timestamp));
    }
    
    @Override
    public String setCommandRead(String rowKey, String reader, String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long ts=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.setCommandRead(rowBytes, reader, ts));
    }
    
    @Override
    public String deleteComment(String node, String rowKey, String realtime, String commentId)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        return String.valueOf(DataAccess.deleteComment(node, realtime.equals(TRUE), rowBytes, commentId));
    }
    
    @Override
    public String getStem(String keywords)
    {
        return DataAccess.getStem(keywords);
        DataAccess.getStem(text)
    }
    
    //public static fields region
    public static LogStream logStream;

    //private fields region
    private final String TRUE="1";

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
