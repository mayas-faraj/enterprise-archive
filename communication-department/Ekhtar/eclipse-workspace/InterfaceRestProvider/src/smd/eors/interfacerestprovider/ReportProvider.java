package smd.eors.interfacerestprovider;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/api")
public class ReportProvider
{
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String loadReports()
    {
        return "{'value':'no args', 'logs': 'no'}".replace('\'', '"');
    }

}
