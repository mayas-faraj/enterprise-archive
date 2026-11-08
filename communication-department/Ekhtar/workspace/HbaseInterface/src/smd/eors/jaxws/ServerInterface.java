package smd.eors.jaxws;

import javax.jws.WebService;

import javax.jws.WebMethod;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService
@SOAPBinding(style=Style.RPC)
public interface ServerInterface
{
    @WebMethod
    String TestConnection();
    
    @WebMethod
    String TestArguments(String arg);
    
    @WebMethod
    String getReport(String hexReportId);
    
    @WebMethod
    String[] getReports();
    
    @WebMethod
    String[] getReportsByOffset(String hexIdOffset);
    
    @WebMethod
    String[] getReportsByCoordinate(String longitude1, String latitude1, String longitude2, String latitude2); 
    
    @WebMethod
    String[] getReportsByCoordinateOffset(String hexIdOffset, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String[] getReportsByTimespan(String keywords, String timespan, String longitude1, String latitude1, String longitude2, String latitude2);
  
    @WebMethod
    String[] getReportsByArgs(String keywords, String date1, String date2, String longitude1, String latitude1, String longitude2, String latitude2);
 
    @WebMethod
    String[] getReportsByCommand(String commandId);
   
    @WebMethod
    String[] getRealtimeReports();
   
    @WebMethod
    String[] getRealtimeReportsByCoordinate(String longitude1, String latitude1, String longitude2, String latitude2); 
 
    @WebMethod
    String[] getRealtimeReportsByOffset(String startIdOffset); 
 
    @WebMethod
    String[] getRealtimeReportsByTimespan(String timespan, String longitude1, String latitude1, String longitude2, String latitude2);
 
    @WebMethod
    String[] getRealtimeReportsByArgs(String date1, String date2, String longitude1, String latitude1, String longitude2, String latitude2); 
      
    @WebMethod
    String[] getRealtimeReportsByCommand(String commandId);
    
    @WebMethod
    boolean deleteReport(String hexReportId);
    
    @WebMethod
    String[] getCommands();
   
    //@WebMethod
    //public String[] getUsersNavigation();
    
    @WebMethod
    String[] getUsersNavigationByCoordinate(String longitude1, String latitude1,
            String longitude2, String latitude2);
 
    @WebMethod
    String[] getUsersNavigationByTimespan(String timespan, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String[] getUsersNavigationByArgs(String date1, String date2,
            String longitude1, String latitude1, String longitude2, String latitude2);


    @WebMethod
    public String getUserNavigation(String user);
    
    @WebMethod
    String[] getUsersLastPoint(String timespan, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    boolean addCommand(String commandId, String adminName, String text, String agentName);
    
    @WebMethod
    boolean addBroadcastCommand(String commandId, String adminName, String text);
    
    @WebMethod
    boolean addMulticastCommand(String commandId, String adminName, String text, String[] users);

     
}
