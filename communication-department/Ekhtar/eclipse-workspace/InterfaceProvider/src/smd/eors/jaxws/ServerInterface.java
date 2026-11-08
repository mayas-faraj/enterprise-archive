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
    String[] loadReportsById(String node, String id);
    
    @WebMethod
    String[] loadReportsByArgs(String node, String user, String hasCommand, String keywords, String classify, String useSeenFilter, String isSeenFilter,String useImportantFilter, String isImportantFilter, String lowestImportance, String maximumImportance, String startTimestamp, String endTimestamp,String longitude1, String latitude1, String longitude2, String latitude2, String includeEmplyLocations, String startKey, String offset);
    
    @WebMethod
    String[] loadReportsNotification(String node, String startKey, String offset);
    
    @WebMethod
    String[] loadReportsCommand(String node, String users, String commandId, String keywords, String startTimestamp, String endTimestamp);
    
    @WebMethod
    String[] loadReportsRealtime(String node);
    
    
    @WebMethod
    String[] loadUsersLastLocation(String node, String users);
    
    @WebMethod
    String[] loadUsersLastLocationByCoordinate(String node, String users, String startTimestamp, String endTimestamp, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String loadUsers(String node);
    
    @WebMethod
    String saveCommand(String es, String text, String sets, String users);
    
    @WebMethod
    String saveUser(String node, String name);
    
    @WebMethod
    String[] loadUserLocations(String node, String userName);
    
    @WebMethod
    String[] loadLogin(String node, String publisher, String rowKey, String offset);
    
    @WebMethod
    String[] loadUserShortLocations(String node, String userName);

    @WebMethod
    String findReport(String node, String rowKey);
    
    @WebMethod
    String findCommand(String node, String rowKey);
    
    @WebMethod
    String findMedia(String uri, String position);
    
    @WebMethod
    String findStatistic(String name, String es);
    
    @WebMethod
    String countReportsByUnseen(String node, String replayOnly);

    @WebMethod
    String countReportsByCoverage(String node, String hasGps, String hasCell);
    
    @WebMethod
    String countReportsByCoordinate(String node, String longitude1, String latitude1, String longitude2, String latitude2);
    
    @WebMethod
    String countReportsByUsers(String node, String users, String onlyImportant);
     
    @WebMethod
    String[] loadCommands(String node, String text, String startTimestamp, String endTimestamp, String rowKey, String offset);
    
    @WebMethod
    String[] loadUserSim(String user);
    
    @WebMethod
    String[] loadUserDevices(String user);
    
    @WebMethod
    String saveReportCommentById(String node, String id, String comment, String timestamp);
    
    @WebMethod
    String saveReportComment(String node, String rowKey, String realtime, String comment, String timestamp);
    
    @WebMethod
    String setReportImportantById(String node, String id, String isImportant, String timestamp);
    
    @WebMethod
    String setReportImportant(String node, String rowKey, String realtime, String isImportant, String timestamp);
    
    @WebMethod
    String setReportSeenById(String node, String id, String inSeen, String timestamp);
    
    @WebMethod
    String setReportSeen(String node, String rowKey, String realtime, String isSeen, String timestamp);
    
    @WebMethod
    String setReportsSeen(String node, long timestamp);
    
    @WebMethod
    String setCommandRead(String rowKey, String reader, String timestamp);
    
    @WebMethod
    String loadKeyword();
    
    @WebMethod
    String deleteComment(String node, String rowKey, String realtime, String commentId);
    
    @WebMethod
    String getStem(String keywords);
}