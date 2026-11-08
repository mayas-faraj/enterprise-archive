package smd.eors.dataprovider;

import javax.ws.rs.core.MediaType;

import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.FormParam;

@Path("login")
public class LoginProvider
{
    //public post functions region
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String testConnection()
    {
        return "{'result':'test connection has successed.'}".replace('\'', '"');
    }
    
    @POST
    @Path("load")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadLogin(@FormParam("node") String node, @FormParam("publisher") String publisher, @FormParam("rowKey") String rowKey, @FormParam("offset") String offset)
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
        
        return Utility.getJsonArray(Entity.toArrayJson(DataAccess.loadLogin(node, publisher, startRow, offsetNum)));
    }
}
