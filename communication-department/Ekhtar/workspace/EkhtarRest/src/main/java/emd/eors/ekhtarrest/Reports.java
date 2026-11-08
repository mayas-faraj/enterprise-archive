package emd.eors.ekhtarrest;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;;;

@Path("reports")
public class Reports
{
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String noArgs()
    {
        return "no args";
    }
    
    @Path("byargs")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String byArgs(@FormParam("x") String x, @FormParam("y") String y)
    {
        return "by args" + x + ", "+ y +".";
    }
}
