package smd.eors.dataprovider;

import javax.ws.rs.core.MediaType;

import org.json.JSONException;

import java.util.Base64;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.FormParam;

import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.Statistic;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.DataAdapter;
import smd.eors.dataaccess.entity.Entity;
import smd.eors.dataprovider.GeoRect;
import smd.eors.mediaprocessor.MediaManager;

@Path("report")
public class ReportProvider
{
    //public post functions region
    @POST
    @Produces(MediaType.TEXT_PLAIN)
    public String testConnection()
    {
        return "{result:'test connection has successed with cp: "+System.getProperty("java.class.path")+".'}".replace('\'', '"');
    }
    
    @POST
    @Path("load")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReportsByArgs(@FormParam("node") String node, @FormParam("user") String user, @FormParam("hasCommand") String hasCommand, @FormParam("keywords") String keywords, @FormParam("classify") String classify,
            @FormParam("useSeenFilter") String useSeenFilter, @FormParam("isSeenFilter") String isSeenFilter,@FormParam("useImportantFilter") String useImportantFilter, @FormParam("isImportantFilter") String isImportantFilter,
            @FormParam("lowestImportance") String lowestImportance, @FormParam("maximumImportance") String maximumImportance,
            @FormParam("startTimestamp") String startTimestamp, @FormParam("endTimestamp") String endTimestamp, @FormParam("longitude1") String longitude1, @FormParam("latitude1") String latitude1, @FormParam("longitude2") String longitude2,
            @FormParam("latitude2") String latitude2, @FormParam("includeEmplyLocations") String includeEmplyLocations, @FormParam("startKey") String startKey, @FormParam("offset") String offset)
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
            return Utility.getJsonArray(Entity.toArrayJson(DataAccess.loadReports(node, user, hasCommand.equals(Utility.TRUE), keywords, classify, useSeenFilter.equals(Utility.TRUE), isSeenFilter.equals(Utility.TRUE), useImportantFilter.equals(Utility.TRUE), isImportantFilter.equals(Utility.TRUE) ,minImportance, maxImportance, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude, includeEmplyLocations.equals(Utility.TRUE), rowKey, offsetValue)));

        }
        else
            return "[{error='Coordinates are not in an valid number format.'}]";
    }
    

    @POST
    @Path("notification")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReportsNotification(@FormParam("node") String node, @FormParam("startKey") String startKey, @FormParam("offset") String offset)
    {
        if(node=="") node=null;

        byte[] rowKey=Entity.getBytesFromHex(startKey);
        rowKey=Entity.incrementBytes(rowKey);
        
        int offsetValue=Integer.parseInt(offset);
        return Utility.getJsonArray(Entity.toArrayShortJson(DataAccess.loadReports(node, rowKey, offsetValue)));
    }
    
    @POST
    @Path("command")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReportsCommand(@FormParam("node") String node, @FormParam("users") String users, @FormParam("commandId") String commandId, @FormParam("keywords") String keywords, @FormParam("startTimestamp") String startTimestamp, @FormParam("endTimestamp") String endTimestamp)
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

        return Utility.getJsonArray(Entity.toArrayShortJson(DataAccess.loadReports(node, users, true, commandId, keywords, startDate, endDate)));
    }
    
    @POST
    @Path("byid")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReportsById(@FormParam("node") String node, @FormParam("id") String id)
    {
        if(node=="") node=null;
        return Utility.getJsonArray(Entity.toArrayShortJson(DataAccess.loadReports(node, id)));
    }
    
    @POST
    @Path("realtime")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReportsRealtime(@FormParam("node") String node)
    {
        if(node=="") node=null;
        return Utility.getJsonArray(Entity.toArrayShortJson(DataAdapter.loadReports(null, null, true, node, DataAdapter.getFilterReportByNode(node))));
    }
    
    @POST
    @Path("find")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String findReport(@FormParam("node") String node, @FormParam("rowKey") String rowKey)
    {
        if(node=="") node=null;

        byte[] key=Entity.getBytesFromHex(rowKey);
        
        //Report result=DataAccess.findReport(key, node);
        Report[] result=DataAccess.loadReports(node, key, 1);
         
        if(result!=null)
            try
            {
                return result[0].toJsonString();
            }
            catch (JSONException e)
            {
                return "[]";
            }
        
        else
            return "[]";
    }
    
    @POST
    @Path("media")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String findMedia(@FormParam("uri") String uri, @FormParam("position") String position)
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
    
    @POST
    @Path("statistic")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String findStatistic(@FormParam("name") String name, @FormParam("es") String es)
    {
        Statistic result= DataAccess.findStatistic(name, es);
        if(result!=null)
            try
            {
                return result.toShortJsonString();
            }
            catch (JSONException e)
            {
                return "";
            }
        else
            return "";
    }

    @POST
    @Path("countbyunseen")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String countReportsByUnseen(@FormParam("node") String node, @FormParam("replayOnly") String replayOnly)
    {
        return  String.valueOf(DataAccess.countReports(node, null, replayOnly.equals(Utility.TRUE), true, false, false, false, 0, 0, 0, 0, 0, 0, false, false, null, 0));
    } 
    
    @POST
    @Path("countbycoverage")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String countReportsByCoverage(@FormParam("node") String node, @FormParam("hasGps") String hasGps, @FormParam("hasCell") String hasCell){
        return  String.valueOf(DataAccess.countReports(node, null, false, false, false, false, false, 0, 0, 0, 0, 0, 0, hasGps.equals(Utility.TRUE), hasCell.equals(Utility.TRUE), null, 0));
    }
    
    @POST
    @Path("countbycoordinate")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String countReportsByCoordinate(@FormParam("node") String node, @FormParam("longitude1") String longitude1, @FormParam("latitude1") String latitude1, @FormParam("longitude2") String longitude2, @FormParam("latitude2") String latitude2)
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
    
    @POST
    @Path("countbyusers")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String countReportsByUsers(@FormParam("node") String node, @FormParam("users") String users, @FormParam("onlyImportant") String onlyImportant)
    {
        return  String.valueOf(DataAccess.countReports(node, users, false, false, false, onlyImportant.equals(Utility.TRUE), onlyImportant.equals(Utility.TRUE), 0, 0, 0, 0, 0, 0, false, false, null, 0));
    }
    
    @POST
    @Path("importantbyid")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setReportImportantById(@FormParam("node") String node, @FormParam("id") String id, @FormParam("isImportant") String isImportant, @FormParam("timestamp") String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.setReportImportant(node, id, isImportant.equals(Utility.TRUE), time);
    }
    
    @POST
    @Path("important")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setReportImportant(@FormParam("node") String node, @FormParam("rowKey") String rowKey, @FormParam("isRealtime") String isRealtime, @FormParam("isImportant") String isImportant, @FormParam("timestamp") String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.setReportImportant(node, rowBytes, isRealtime.equals(Utility.TRUE), isImportant.equals(Utility.TRUE), time));
    }
    
    @POST
    @Path("seenbyid")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setReportSeenById(@FormParam("node") String node, @FormParam("id") String id, @FormParam("isSeen") String isSeen, @FormParam("timestamp") String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.setReportSeen(node, id, isSeen.equals(Utility.TRUE), time);
    }
    
    @POST
    @Path("seen")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setReportSeen(@FormParam("node") String node, @FormParam("rowKey") String rowKey, @FormParam("isRealtime") String isRealtime, @FormParam("isSeen") String isSeen, @FormParam("timestamp") String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.setReportSeen(node, rowBytes, isRealtime.equals(Utility.TRUE), isSeen.equals(Utility.TRUE), time));
    }
    
    @POST
    @Path("allseen")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setReportsSeen(@FormParam("node") String node, @FormParam("timestamp") long timestamp)
    {
        return String.valueOf(DataAccess.setReportsSeen(node, timestamp));
    }
    
    @POST
    @Path("commentsavebyid")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String saveReportCommentById(@FormParam("node") String node, @FormParam("id") String id, @FormParam("comment") String comment, @FormParam("timestamp") String timestamp)
    {
        long time=Long.parseLong(timestamp);
        return DataAccess.saveReportComment(node, id, comment, time);
    }
    
    @POST
    @Path("commentsave")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String saveReportComment(@FormParam("node") String node, @FormParam("rowKey") String rowKey, @FormParam("isRealtime") String isRealtime, @FormParam("comment") String comment, @FormParam("timestamp") String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long time=Long.parseLong(timestamp);
        return Entity.getHexFromBytes(DataAccess.saveReportComment(node, rowBytes, isRealtime.equals(Utility.TRUE), comment, time));
    }
    
    @POST
    @Path("commentdelete")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String deleteComment(@FormParam("node") String node, @FormParam("rowKey") String rowKey, @FormParam("realtime") String realtime, @FormParam("commentId") String commentId)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        return String.valueOf(DataAccess.deleteComment(node, realtime.equals(Utility.TRUE), rowBytes, commentId));
    }
    
    @POST
    @Path("stem")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String getStem(@FormParam("keywords") String keywords)
    {
        return DataAccess.getStem(keywords);
    }
    
    @POST
    @Path("keywords")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
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
}
