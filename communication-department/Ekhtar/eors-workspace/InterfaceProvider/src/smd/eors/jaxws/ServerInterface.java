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
    public String TestConnection();
    
    @WebMethod
    public String TestArguments(String arg); 
    
    @WebMethod
    String[] getRealtimeReportsByCoordinate(String node, String rowKey, String offset, String longitude1, String latitude1, String longitude2, String latitude2);

    @WebMethod
    String[] getReportsByArgs(String node, String user, String keywords, String startDate, String endDate, String longitude1, String latitude1, String longitude2, String latitude2, String startRow, String offset);

    @WebMethod
    String[] getUsersLastPoint(String node, String users);
    
    @WebMethod
    String[] getUsersLastPointByCoordinate(String node, String users, String date1, String date2, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String getUsers(String node);
    
    @WebMethod
    String addCommand(String commandId, String adminName, String node, String text, String users);
    
    @WebMethod
    String addUser(String node, String name);
    
    @WebMethod
    String[] getUserNavigations(String node, String userName);
    
    @WebMethod
    String[] getUserLogin(String node, String publisher, String rowKey, String offset);
    
    @WebMethod
    String[] getRealtimeUserLogin(String node, String publisher, String rowKey, String offset);
    
    @WebMethod
    String[] getShortNavigations(String node, String userName);
    
    @WebMethod
    String[] getReportsByClassification(String node, String name);
    
    @WebMethod
    String[] getReportsByImportanceRange(String node, String lowestImportance, String maxImportance);
    
    @WebMethod
    String[] getReportsByReviewState(String node, String reviewed, String processed);
    
    @WebMethod
    String[] getReportsStream(String node, String rowKey, String offset);
    
    @WebMethod
    String[] getReportsStreamByKeyword(String node, String rowKey, String offset, String keywords);
    
    @WebMethod
    String getMedia(String uri, String position);
    
    @WebMethod
    String setReportComment(String admin, String rowKey, String text);
    
    @WebMethod
    String setReportImportant(String admin, String rowKey, String value);
    
    @WebMethod
    String[] getCommands(String node, String rowKey, String offset);
    
    @WebMethod
    String[] getUserSim(String user);
    
    @WebMethod
    String[] getUserDevices(String user);
    
    @WebMethod
    String getKeywords();
}