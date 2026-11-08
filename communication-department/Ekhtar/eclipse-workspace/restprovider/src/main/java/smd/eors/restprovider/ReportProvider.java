package smd.eors.restprovider;

import javax.ws.rs.core.MediaType;

import java.util.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.FormParam;

import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.DataAdapter;
import smd.eors.dataaccess.entity.Entity;

@Path("reports")
public class ReportProvider
{
    //public post functions region
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String getReports()
    {
        Utility.logger.debug(String.format("log 4 j on %s", (new Date()).toString()));
        return "{'args':'no value and logged'}";
    }
    
    @POST
    @Path("byargs")
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
}
