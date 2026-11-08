package smd.eors.dataprovider;

import javax.ws.rs.core.MediaType;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.FormParam;

import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;

@Path("navigation")
public class NavigationProvider
{
    //public post functions region
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String testConnection()
    {
        return "{'result':'test connection has successed.'}".replace('\'', '"');
    }

    @POST
    @Path("lastlocation")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadUsersLastLocation(@FormParam("node") String node, @FormParam("users") String users)
    {
        Navigation[] navigations= DataAccess.loadUsersLastLocation(node ,users);

        if(navigations!=null)
        {
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

            return Utility.getJsonArray(result);      
        }
        else
            return "[]";
    }

    @POST
    @Path("lastlocationbycorrdinate")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadUsersLastLocationByCoordinate(@FormParam("node") String node, @FormParam("users") String users, @FormParam("startTimestamp") String startTimestamp, @FormParam("endTimestamp") String endTimestamp, @FormParam("longitude1") String longitude1, @FormParam("latitude1") String latitude1, @FormParam("longitude2") String longitude2, @FormParam("latitude2") String latitude2)
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
                return Utility.getJsonArray(Entity.toArrayJson(DataAccess.loadUsersLastLocation(node, users, startDate, endDate, geoRect.startLongitude, geoRect.startLatitude, geoRect.endLongitude, geoRect.endLatitude))); 
            }
            else
                return "[{\"//Date values are not in an valid format.\"}]";
        }
        else
            return "[{\"invalid coordinates numeric values.\"}]";

    }

    @POST
    @Path("shortlocations")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadUserShortLocations(@FormParam("node") String node, @FormParam("userName") String userName)
    { 
        return Utility.getJsonArray(Entity.toArrayShortJson(DataAccess.loadUserLocations(node, userName)));
    }

    @POST
    @Path("locations")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadUserLocations(@FormParam("node") String node, @FormParam("userName") String userName)
    { 
        return Utility.getJsonArray(Entity.toArrayJson(DataAccess.loadUserLocations(node, userName)));
    }

    @POST
    @Path("saveuser")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String saveUser(@FormParam("node") String node, @FormParam("name") String name)
    {
        return Entity.getHexFromBytes(DataAccess.saveUser(new User(name, node)));
    }

    @POST
    @Path("users")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public String loadUsers(@FormParam("node") String node)
    {
        String result="";

        try
        {
            User[] users=DataAccess.loadUsers(node);

            if(users!=null)
            {
                for(int i=0;i<users.length;i++)
                    if(users[i]!=null)
                        result+=users[i].getName()+";";
                return result;
            }
            else
                return "[]";  
        }
        catch(Exception ex)
        {
            return ex.getMessage();
        }
    }
}
