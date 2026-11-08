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
    String[] getRealtimeReportsByCoordinate(String rowKey, String longitude1, String latitude1, String longitude2, String latitude2);

    @WebMethod
    String[] getReportsByArgs(String keywords, String startDate, String endDate, String longitude1, String latitude1, String longitude2, String latitude2, String startRow, int offset);

    @WebMethod
    String[] getUsersLastPoint();
    
    @WebMethod
    String[] getUsersLastPointByCoordinate(String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String getUsers();
    
    @WebMethod
    String addCommand(String commandId, String adminName, String text, String users);
    
    @WebMethod
    String[] getUserNavigations(String userName);
    
    @WebMethod
    String[] getReportsByClassification(String name);
    
    @WebMethod
    String[] getReportsByImportanceRange(String lowestImportance, String maxImportance);
    
    @WebMethod
    String[] getReportsByReviewState(String reviewed, String processed);
    
    @WebMethod
    String[] getReportsStream(String rowKey, String offset);
    
    @WebMethod
    String[] getReportsStreamByKeyword(String rowKey, String offset, String keywords);
    
    @WebMethod
    String[] getCommands(String rowKey, String offset);
    
    @WebMethod
    String[] getUserSim(String user);
    
    @WebMethod
    String[] getUserDevices(String user);
    
    @WebMethod
    String[] getUserReports(String rowKey, String offset, String name);
    
    @WebMethod
    String getKeywords();
 
}