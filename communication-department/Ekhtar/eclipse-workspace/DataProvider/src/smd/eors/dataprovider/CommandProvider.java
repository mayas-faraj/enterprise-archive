package smd.eors.dataprovider;

import javax.ws.rs.core.MediaType;

import org.json.JSONException;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;

import java.util.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.FormParam;

@Path("command")
public class CommandProvider
{
    //public post functions region
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String testConnection()
    {
        return "{'result':'test connection has successed.'}".replace('\'', '"');
    }
    
    @POST
    @Path("save")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String saveCommand(@FormParam("es") String es, @FormParam("text") String text, @FormParam("sets") String sets, @FormParam("users") String users, @FormParam("smsUsers") String smsUsers)
    {
        Event[] readers=null;
        Event[] smsReaders=null;
    
        if(users!=null && users.length()>0)
        {
            if(users.charAt(users.length()-1)==';')
                users=users.substring(0, users.length()-1);
            
            String[] names=users.split(";");
            readers=new Event[names.length];
            for(int i=0; i<names.length; i++)
                readers[i]=new Event(null, names[i], "", 0l);
        }
        else
            readers=new Event[0];
        
        if(smsUsers!=null && smsUsers.length()>0)
        {
            if(smsUsers.charAt(smsUsers.length()-1)==';')
                smsUsers=smsUsers.substring(0, smsUsers.length()-1);
            
            String[] smsNames=smsUsers.split(";");
            smsReaders=new Event[smsNames.length];
            for(int i=0; i<smsNames.length; i++)
                smsReaders[i]=new Event(null, smsNames[i], "sms", 0l);
        }
        else
            smsReaders=new Event[0];
        
        Event[] events=new Event[readers.length + smsReaders.length];
        for(int i=0; i<readers.length; i++)
            events[i]=readers[i];
        
        for(int i=0; i<smsReaders.length; i++)
            events[i+readers.length]=smsReaders[i];
        
        Command cmd=new Command(es, text, sets, new Date().getTime()); 
        cmd.setReaders(events);
        
        return Entity.getHexFromBytes(DataAccess.saveCommand(cmd));
    }
    
    @POST
    @Path("load")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadCommands(@FormParam("node") String node, @FormParam("keywords") String keywords, @FormParam("startTimestamp") String startTimestamp, @FormParam("endTimestamp") String endTimestamp, @FormParam("rowKey") String rowKey, @FormParam("offset") String offset)
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

            return Utility.getJsonArray(Entity.toArrayJson(DataAccess.loadCommands(node, keywords, startDate, endDate, startRow, offsetNum)));
        }
        else
            return "[{\"//Date values are not in an valid format.\"}]";
    }

    @POST
    @Path("find")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String findCommand(@FormParam("node") String node, @FormParam("rowKey") String rowKey)
    {
        if(node=="") node=null;

        byte[] key=Entity.getBytesFromHex(rowKey);
        Command result=DataAccess.findCommand(key, node);
        //Command[] result=DataAccess.loadCommands(node, key, 1);
        
        if(result!=null)
            try
            {
                return result.toJsonString();
            }
            catch (JSONException e)
            {
                return "";
            }
        else
            return "";
    }
    
    @POST
    @Path("read")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String setCommandRead(@FormParam("rowKey") String rowKey, @FormParam("reader") String reader, @FormParam("type") String type, @FormParam("timestamp") String timestamp)
    {
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long ts=Long.parseLong(timestamp);
        
        
        return Entity.getHexFromBytes(DataAccess.setCommandRead(rowBytes, reader, type, ts));
    } 
}
