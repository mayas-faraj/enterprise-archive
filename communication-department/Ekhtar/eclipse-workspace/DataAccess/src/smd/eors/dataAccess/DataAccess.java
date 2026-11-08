package smd.eors.dataaccess;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.hadoop.hbase.util.Bytes;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.ar.ArabicAnalyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.CoverageCell;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.Statistic;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Login;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Device;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataAccess.entity.slave.Action;
import smd.eors.dataAccess.entity.slave.CellLocation;
import smd.eors.dataAccess.entity.slave.Comment;
import smd.eors.dataAccess.entity.slave.Sim;
import smd.eors.dataAccess.entity.slave.Info;
import smd.eors.dataAccess.entity.slave.Word;
import smd.eors.dataAccess.entity.slave.Action.ActionType;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.common.CellCoordinate;

public final class DataAccess
{  
    //public methods region
    public static User[] loadUsers(String node)
    {
        return DataAdapter.loadUsers(null, null, DataAdapter.getFilterUserByNode(node));   
    }
    
    public static User[] loadUsersPage(String node, byte[] startRow, int offset)
    {
        return DataAdapter.loadUsers(startRow, null, DataAdapter.getFilterUserByNode(node), DataAdapter.getFilterPage(offset));   
    }
     
    public static Location[] loadUserLocations(String node, String userName)
    {
        //get gps locations
        User user=DataAccess.findUser(userName);
        
        if(user!=null && user.getNode().equals(node) || node.equals("") || node==null || node.length()==0)
        {
            Location[] locations=DataAdapter.loadUserLocations(userName);
            Location[] realTimeLocations=DataAdapter.loadRealtimeUserLocations(userName);
            
            //get cell locations
            CellLocation[] cellLocations=DataAdapter.loadUserCellLocations(userName);
            CellLocation[] realTimeCellLocations=DataAdapter.loadRealtimeUserCellLocations(userName);
            
            Location[] AllLocations = mergeArray(locations, realTimeLocations);
            CellLocation[] AllCellLocations = mergeArray(cellLocations, realTimeCellLocations);
            
            if(AllLocations==null)
                AllLocations=new Location[0];
            
            if(AllCellLocations==null)
                AllCellLocations=new CellLocation[0];
            
            Location[] result= new Location[AllLocations.length+ AllCellLocations.length];
            
            int index1=0;
            int index2=0;
            
            for(int i=0;i<result.length;i++)
            {
                if(index1>=AllLocations.length)
                {
                    Location tempLocation=new Location(new byte[0]);
                    tempLocation.setCoordinate(AllCellLocations[index2].getCellCoordinate());
                    tempLocation.setDate(AllCellLocations[index2].getDate());
                    
                    result[i]=tempLocation;
                    index2++;
                }
                else if(index2>=AllCellLocations.length)
                    result[i]=AllLocations[index1++];
                else if(AllLocations[index1].getDate().getTime()<AllCellLocations[index2].getDate().getTime())
                    result[i]=AllLocations[index1++];
                else
                {
                    Location tempLocation=new Location(new byte[0]);
                    tempLocation.setCoordinate(AllCellLocations[index2].getCellCoordinate());
                    tempLocation.setDate(AllCellLocations[index2].getDate());
                    
                    result[i]=tempLocation;
                    index2++;
                }
            }
            
            return result;
        }
        else
            return null;
    }
  
    public static Navigation[] loadUsersLastLocation(String node, String users)
    {  
        List<Navigation> navigations=null;
        
        if(users!=null && users.length()>0)
        {
            if(users.charAt(users.length()-1)==';')
                users=users.substring(0,users.length()-1);
            
            String[] userArray=users.split(";");
            navigations=new ArrayList<Navigation>(userArray.length);
            
            for(String user: userArray)
                if(user!="")
                {    
                    User userObj=DataAccess.findUser(user);
                    
                    if(userObj!=null && userObj.getNode().equals(node) || node.equals("") || node==null || node.length()==0)
                    {
                        Location[] locations=loadUserLocations(node, user);
                        if(locations!=null && locations.length>0)
                        {
                            Location location=locations[locations.length-1];
                            Navigation navigation=new Navigation();
                            navigation.setUser(user);
                            navigation.setCoordinate(location.getCoordinate());
                            navigation.setDate(location.getDate());
                            
                            //unknown node
                            if(userObj!=null)
                                navigation.setNode(userObj.getNode());
                            else
                                navigation.setNode("es-unknown");
                            navigations.add(navigation);
                        } 
                    }
                }
            
            return navigations.toArray(new Navigation[0]);
        }
        else
            return null;
    }
    
    public static Navigation[] loadUsersLastLocation(String node, String users, long startDate, long endDate, double startLongitude, double startLatitude, double endLongitude, double endLatitude)
    {
        Navigation[] navigations=loadUsersLastLocation(node, users);

        List<Navigation> selectedNavigation=new ArrayList<Navigation>();
        
        boolean geoRangeExists;
        boolean timeRangeExists;
        
        geoRangeExists=startLongitude!=0 || startLatitude!=0 || startLongitude!=0 || startLatitude!=0;    
        timeRangeExists=startDate!=0 || endDate!=0;
        
        for(Navigation navigation:navigations)
            if((!geoRangeExists || 
               (navigation.getCoordinate()!=null &&
               navigation.getCoordinate().getLongitude()>=startLongitude &&
               navigation.getCoordinate().getLongitude()<endLongitude &&
               navigation.getCoordinate().getLatitude()>=startLatitude &&
               navigation.getCoordinate().getLatitude()<endLatitude)) &&
               (!timeRangeExists ||
               (navigation.getDate().getTime()>=startDate &&
               navigation.getDate().getTime()<=endDate)))
            {
                selectedNavigation.add(navigation);
            }
        
        return selectedNavigation.toArray(new Navigation[0]);    
    }

    public static Login[] loadLogin(String node, String publisher, byte[] startRow, int offset)
    {
        Login[] realtimeLogin;
        Login[] historicalLogin;
        
        int realtimeLoginLength=0;
        
        //load real time reports
        realtimeLogin=DataAdapter.loadLogin(startRow, null, true, DataAdapter.getFilterLoginByNode(node), DataAdapter.getFilterLoginByPublisher(publisher) ,DataAdapter.getFilterPage(offset));
        
        if(realtimeLogin!=null)
            realtimeLoginLength=realtimeLogin.length;
        
        //load historical reports
        if(offset==0 || realtimeLoginLength<offset)
        {
            int historicalOffset;
            
            if(offset==0)
                historicalOffset=0;
            else
                historicalOffset=offset-realtimeLoginLength;
            
            historicalLogin=DataAdapter.loadLogin(startRow, null, false, DataAdapter.getFilterLoginByNode(node), DataAdapter.getFilterLoginByPublisher(publisher) ,DataAdapter.getFilterPage(historicalOffset));
        }
        else
            historicalLogin=null;

        return mergeArray(realtimeLogin, historicalLogin);
    }
    
    public static Report[] loadReports(String node, String id)
    {
        return loadReports(node, id,  "", false, "", "", "", false, false, false, false, 0f, 0f, 0, 0, 0, 0, 0, 0, false, null, 1);
    }
    
    public static Report[] loadReports(String node, String users, boolean hasCommand, String commandId, String keywords, long minTimestamp, long maxTimestamp)
    {
        return loadReports(node, "", users, hasCommand, commandId, keywords, "", false, false, false, false, 0f, 0f, minTimestamp, maxTimestamp, 0, 0, 0, 0, false, null, 0);
    }
    
    public static Report[] loadReports(String node, byte[] startRow, int offset)
    {
        return loadReports(node, "", "", false, "", "", "", false, false, false, false, 0f, 0f, 0, 0, 0, 0, 0, 0, false, startRow, offset);
    }
    
    public static Report[] loadReports(String node, String users, boolean hasCommand, String keywords, String classifications, boolean useSeenFilter, boolean isSeen, boolean useImportantFilter, boolean isImportant, float minImportance, float maxImportance, long minTimestamp, long maxTimestamp, double startLongitude, double startLatitude, double endLongitude, double endLatitude, boolean includeEmptyLocation, byte[] startRow, int offset)
    {
        return loadReports(node, "", users, hasCommand, "", keywords, classifications, useSeenFilter, isSeen ,useImportantFilter, isImportant, minImportance, maxImportance, minTimestamp, maxTimestamp, startLongitude, startLatitude, endLongitude, endLatitude, includeEmptyLocation, startRow, offset);
    }

    public static Report[] loadReports(String node, String id, String users, boolean hasCommand, String commandId, String keywords, String classifications, boolean useSeenFilter, boolean isSeen, boolean useImportantFilter, boolean isImportant, float minImportance, float maxImportance, long minTimestamp, long maxTimestamp, double startLongitude, double startLatitude, double endLongitude, double endLatitude, boolean includeEmptyLocation, byte[] startRow, int offset)
    {
        //stemming text
        String stemKeywords=null;
        
        if(keywords!=null && keywords.length()>0)
            stemKeywords=getStem(keywords);

        Report[] realtimeReports;
        Report[] historicalReports;
        
        int realtimeReportsLengh=0;
        
        //load real time reports
        realtimeReports=DataAdapter.loadReports(startRow, null, true, node, DataAdapter.getFilterReportByNode(node), DataAdapter.getFilterReportById(id), DataAdapter.getFilterReportByUsers(users), DataAdapter.getFilterReportByDate(minTimestamp, maxTimestamp) ,DataAdapter.getFilterReportByKeywords(stemKeywords), DataAdapter.getFilterReportBySeen(node, useSeenFilter, isSeen), DataAdapter.getFilterReportByImportant(node, useImportantFilter, isImportant), DataAdapter.getFilterReportByCoordinate(startLongitude, startLatitude, endLongitude, endLatitude, includeEmptyLocation), DataAdapter.getFilterReportByClassifications(classifications), DataAdapter.getFilterReportByImportanceRange(minImportance, maxImportance), DataAdapter.getFilterReportByCommand(hasCommand, commandId), DataAdapter.getFilterReportByNotEmptyText(), DataAdapter.getFilterPage(offset));
        
        if(realtimeReports!=null)
            realtimeReportsLengh=realtimeReports.length;
        
        //load historical reports
        if(offset==0 || realtimeReportsLengh<offset)
        {
            int historicalOffset;
            
            if(offset==0)
                historicalOffset=0;
            else
                historicalOffset=offset-realtimeReportsLengh;
            
            historicalReports=DataAdapter.loadReports(startRow, null, false, node, DataAdapter.getFilterReportByNode(node), DataAdapter.getFilterReportById(id), DataAdapter.getFilterReportByUsers(users), DataAdapter.getFilterReportByDate(minTimestamp, maxTimestamp), DataAdapter.getFilterReportByKeywords(stemKeywords), DataAdapter.getFilterReportBySeen(node, useSeenFilter, isSeen), DataAdapter.getFilterReportByImportant(node, useImportantFilter, isImportant), DataAdapter.getFilterReportByCoordinate(startLongitude, startLatitude, endLongitude, endLatitude, includeEmptyLocation), DataAdapter.getFilterReportByClassifications(classifications), DataAdapter.getFilterReportByImportanceRange(minImportance, maxImportance), DataAdapter.getFilterReportByCommand(hasCommand, commandId), DataAdapter.getFilterReportByNotEmptyText(), DataAdapter.getFilterPage(historicalOffset));
        }
        else
            historicalReports=null;

        return mergeArray(realtimeReports, historicalReports);
    }
      
    public static Keyword[] loadKeyword()
    {
        Keyword[] keyword=DataAdapter.loadKeywords(null, null);
        
        if(keyword!=null)    
            for(Keyword kw:keyword)
                kw.setWords(DataAdapter.loadKeywordWords(kw.getName()));
        
        return keyword;
    }
    
    public static CoverageCell[] loadCoverageCells()
    {
        return DataAdapter.loadCoverageCells(null ,null);
    }
    
    public static Command[] loadCommands(String node, byte[] startRow, int offset)
    {
        return DataAdapter.loadCommands(startRow, null, DataAdapter.getFilterCommandByNode(node), DataAdapter.getFilterPage(offset));
    }
    
    public static Command[] loadCommands(String node ,String text, long minTimestamp, long maxTimestamp, byte[] startRow, int offset)
    {
        return DataAdapter.loadCommands(startRow, null, DataAdapter.getFilterCommandByNode(node), DataAdapter.getFilterCommandByText(text), DataAdapter.getFilterCommandByDate(minTimestamp, maxTimestamp), DataAdapter.getFilterPage(offset));
    }

    public static byte[] saveCommand(Command command)
    {
        //precondition: none
        byte[] id = DataAdapter.saveCommand(command);
        boolean result=id!=null;
        if(result && command.getReaders()!=null)
            for(Event reader: command.getReaders())
                result &= DataAdapter.saveCommandRead(reader)!=null;
        
        if(result)
            return id;
        else
            return null;
    }
    
    public static byte[] saveStatistic(Statistic statistic)
    {
        //precondition: none
        byte[] id = DataAdapter.saveStatistic(statistic);
        boolean result=id!=null;
        if(result && statistic.getInfo()!=null)
            for(Info info: statistic.getInfo())
                result &= DataAdapter.saveInfo(info)!=null;
        
        if(result)
            return id;
        else
            return null;
    }
    
    public static byte[] saveUser(User user)
    {
        //precondition: none
        return DataAdapter.saveUser(user);
    }
    
    public static byte[] saveLogin(Login login)
    {
        //precondition: none
        return DataAdapter.saveLogin(login);
    }
    
    public static byte[] setCommandRead(byte[] rowKey, String reader, String type, long timestamp)
    {
        //precondition: none
        Event read=new Event(rowKey);
        read.setName(reader);
        read.setTimestamp(timestamp);
        read.setType(type);
        
        return DataAdapter.saveCommandRead(read);
    }
    
    public static boolean saveBatchReports(Report[] reports)
    {
        //precondition: none
        return DataAdapter.saveBatchReports(reports);
    }
    
    public static boolean saveBatchLogin(Login[] logins)
    {
        //precondition: none
        return DataAdapter.saveBatchLogins(logins);
    }

    public static boolean saveBatchLocations(Location[] locations)
    {
        //precondition: none
        List<Location> gpsLocations=new ArrayList<Location>();
        List<CellLocation> cellLocations=new ArrayList<CellLocation>();

        for(int i=0;i<locations.length;i++)
            if(locations[i]!=null && 
            locations[i].getCoordinate().getLongitude()!=0 && 
            locations[i].getCoordinate().getLatitude()!=0)
            {
                   
                   if(locations[i].getCoordinate() instanceof CellCoordinate)
                   {
                       CellLocation location=new CellLocation(locations[i].getRowKey());
                       location.setCellCoordinate((CellCoordinate)locations[i].getCoordinate());
                       location.setDate(locations[i].getDate());
                       cellLocations.add(location);
                   }
                   else
                   {
                       gpsLocations.add(locations[i]);
                   }
               }
        
        boolean result;
        
        result = DataAdapter.saveBatchLocations(gpsLocations.toArray(new Location[0]));
        result &= DataAdapter.saveBatchCellLocations(cellLocations.toArray(new CellLocation[0]));
        
        return result;
    }
    
    public static byte[] saveKeyword(Keyword keyword)
    {
        //precondition: none 
        byte[] id=DataAdapter.saveKeyword(keyword);
        boolean result=id!=null;
        
        if(result)
            for(Word word:keyword.getWords())
                result &= DataAdapter.saveWord(word)!=null;

        if(result)
            return id;
        else
            return null;
    }
    
    public static byte[] saveLocation(Location location)
    {
        //precondition: none        
        return DataAdapter.saveLocation(location);
    }
    
    public static byte[] saveCellLocation(CellLocation location)
    {
        //precondition: none        
        return DataAdapter.saveCellLocation(location);
    }
    
    public static String saveReportComment(String node, String id, String text, long timestamp)
    {
        Report[] reports=loadReports(node, id);
       
        if(reports.length>0)
        {
            byte[] rowKey=reports[0].getRowKey();
            saveReportComment(node, rowKey, true, text, timestamp);
            return id;
        }
        else 
            return null;
    }
    
    public static byte[] saveReportComment(String node, byte[] rowKey, boolean isRealtime, String text, long timestamp)
    {
        Comment comment=new Comment(rowKey);
        
        comment.setFamilyspace(node);
        
        comment.setText(text);
        comment.setTimestamp(timestamp);
        
        byte[] id=DataAdapter.saveComment(comment);
        boolean result=id!=null;
        
        if(isRealtime)
        {
            comment.setRealtime(true);
            result &= DataAdapter.saveComment(comment)!=null;
        }
        
        if(result)
            return id;
        else
            return null;
    }
    
    public static String setReportImportant(String node, String id, boolean isImportant, long timestamp)
    {
        Report[] reports=loadReports(node, id);
       
        if(reports.length>0)
        {
            byte[] rowKey=reports[0].getRowKey();
            setReportImportant(node, rowKey, true, isImportant, timestamp);
            return id;
        }
        else 
            return null;
    }
    
    public static byte[] setReportImportant(String node, byte[] rowKey, boolean isRealtime, boolean isImportant, long timestamp)
    {
        Action action=new Action(rowKey);
        action.setTimestamp(timestamp);
        action.setFamilyspace(node);
      
        //save current action
        if(isImportant)
            action.setType(ActionType.currentImportant);
        else
            action.setType(ActionType.currentUnimportant);
        
        byte[] id = DataAdapter.saveAction(action);
        boolean result=id!=null;
        
        if(isRealtime)
        {
            action.setRealtime(true);
            result &= DataAdapter.saveAction(action)!=null;
            action.setRealtime(false);
        }
        
        //save action log
        if(isImportant)
            action.setType(ActionType.important);
        else
            action.setType(ActionType.unimportant);
        
        result &= DataAdapter.saveAction(action)!=null;
        
        if(isRealtime)
        {
            action.setRealtime(true);
            result &= DataAdapter.saveAction(action)!=null;
        }
        
        if(result)
            return id;
        else
            return null;
    }
    
    public static String setReportSeen(String node, String id, boolean isSeen, long timestamp)
    {
        Report[] reports=loadReports(node, id);
       
        if(reports.length>0)
        {
            byte[] rowKey=reports[0].getRowKey();
            setReportSeen(node, rowKey, true, isSeen, timestamp);
            return id;
        }
        else 
            return null;
    }
    
    public static byte[] setReportSeen(String node, byte[] rowKey, boolean isRealtime, boolean isSeen, long timestamp)
    {
        Action action=new Action(rowKey);
        action.setTimestamp(timestamp);
        action.setFamilyspace(node);
        
        //save current action
        if(isSeen)
            action.setType(ActionType.currentSeen);
        else
            action.setType(ActionType.currentUnseen);
        
        byte[] id = DataAdapter.saveAction(action);
        boolean result=id!=null;
        
        if(isRealtime)
        {
            action.setRealtime(true);
            result &= DataAdapter.saveAction(action)!=null;
            action.setRealtime(false);
        }
        
        //save action log
        if(isSeen)
            action.setType(ActionType.seen);
        else
            action.setType(ActionType.unseen);
        
        result &= DataAdapter.saveAction(action)!=null;
        
        if(isRealtime)
        {
            action.setRealtime(true);
            result &= DataAdapter.saveAction(action)!=null;
        }

        if(result)
            return id;
        else
            return null;
    }
    
    public static boolean setReportsSeen(String node, long timestamp)
    {
        boolean result=true;
        
        Report[] unseenReports=loadReports(node, null, false, null, null, true, false, false, false, 0, 0, 0, 0, 0, 0, 0, 0, false, null, 0);
        for(int i=0; i<unseenReports.length; i++)
            result &= setReportSeen(node, unseenReports[i].getRowKey(), unseenReports[i].isRealtime(), true, timestamp)!=null;
        return result;
    }
    
    public static boolean deleteComment(String node, boolean isRealtime, byte[] rowKey, String commentId)
    {
        byte[] key=null;
        
        try
        {
            long timestamp=Long.valueOf(commentId);
            key=Bytes.toBytes(timestamp);
        }
        catch(Exception ex)
        {
            System.out.println("Not valid id format");
            System.out.println(ex);
        }
        
        if(key!=null)
        {
            boolean result;
            Comment comment=(Comment)(new Comment(new byte[0])).fromKeyValue(key, null);
            comment.setRowKey(rowKey);
            comment.setFamilyspace(node);
            
            result = DataAdapter.deleteComment(comment);
            
            if(isRealtime)
            {
                comment.setRealtime(true);
                result &= DataAdapter.deleteComment(comment);
            }
            
            return result;
        }
        
        return false;  
    }
    
    public static User findUser(byte[] rowKey)
    {
        User user=DataAdapter.findUser(rowKey);
        
        if(user!=null)
        {
            Sim[] sim=DataAdapter.loadUserSim(rowKey);
            Device[] devices=DataAdapter.loadUserDevices(rowKey);
            Location[] locations=DataAdapter.loadUserLocations(rowKey);
            
            user.setSims(sim);
            user.setDevices(devices);
            user.setLocations(locations);
        }
        
        return user;
    }
    
    public static Statistic findStatistic(String name, String es)
    {
        return DataAdapter.findStatistic(name, es);
    }
    
    public static Report findReport(byte[] rowKey, String node)
    {
        return DataAdapter.findReport(rowKey, DataAdapter.getFilterReportByNode(node));
    }
    
    public static Command findCommand(byte[] rowKey, String node)
    {
        return DataAdapter.findCommand(rowKey, DataAdapter.getFilterCommandByNode(node));
    }
    
    public static User findUser(String name)
    {
        User user=DataAdapter.findUser(name);
        
        if(user!=null)
        {
            Sim[] sim=DataAdapter.loadUserSim(name);
            Device[] devices=DataAdapter.loadUserDevices(name);
            
            user.setSims(sim);
            user.setDevices(devices);
        }
        
        return user;
    }
    
    public static CoverageCell findCell(String cgi)
    {
        return DataAdapter.findCoverageCell(Bytes.toBytes(cgi));
    }
    
    public static long countReports(String node, String users, boolean hasCommand, boolean useSeenFilter, boolean isSeen, boolean useImportantFilter, boolean isImportant, long minTimestamp, long maxTimestamp, double startLongitude, double startLatitude, double endLongitude, double endLatitude, boolean hasGps, boolean hasCell, byte[] startRow, int offset)
    {
        long count = DataAdapter.countReports(startRow, null, false, DataAdapter.getFilterReportByNode(node), DataAdapter.getFilterReportByUsers(users), DataAdapter.getFilterReportByCommand(hasCommand, null), DataAdapter.getFilterReportBySeen(node, useSeenFilter, isSeen), DataAdapter.getFilterReportByImportant(node, useImportantFilter, isImportant), DataAdapter.getFilterReportByDate(minTimestamp, maxTimestamp), DataAdapter.getFilterReportByCoordinate(startLongitude, startLatitude, endLongitude, endLatitude, false), DataAdapter.getFilterByCell(hasCell), DataAdapter.getFilterByGps(hasGps) , DataAdapter.getFilterReportByNotEmptyText(), DataAdapter.getFilterPage(offset));
        long realtimeCount = DataAdapter.countReports(startRow, null, true, DataAdapter.getFilterReportByNode(node), DataAdapter.getFilterReportByUsers(users), DataAdapter.getFilterReportByCommand(hasCommand, null), DataAdapter.getFilterReportBySeen(node, useSeenFilter, isSeen), DataAdapter.getFilterReportByImportant(node, useImportantFilter, isImportant), DataAdapter.getFilterReportByDate(minTimestamp, maxTimestamp), DataAdapter.getFilterReportByCoordinate(startLongitude, startLatitude, endLongitude, endLatitude, false), DataAdapter.getFilterByCell(hasCell), DataAdapter.getFilterByGps(hasGps) , DataAdapter.getFilterReportByNotEmptyText(), DataAdapter.getFilterPage(offset));
        
        return count+realtimeCount;        
    }
    
    public static boolean truncateRealtimeReports()
    {
       return DataAdapter.truncateRealtimeReport();
    }
    
    public static boolean truncateRealtimeNavigation()
    {
       return DataAdapter.truncateRealtimeNavigation();
    }
    
    public static boolean truncateRealtimeUser()
    {
       return DataAdapter.truncateRealtimeUser();
    }
    
    public static void setZookeeperAddress(String zookeeperAddress)
    {
        DataAdapter.setZookeeperAddress(zookeeperAddress);
    }

    public static String getStem(String text)
    {
        try {   
                String reportTokens = "";
                
                ArabicAnalyzer analyzer = new ArabicAnalyzer();
                TokenStream tokenStream = analyzer.tokenStream(null, text);
                CharTermAttribute charTerm = tokenStream.addAttribute(CharTermAttribute.class);
                tokenStream.reset();
                
                while (tokenStream.incrementToken()) 
                        reportTokens+=charTerm.toString()+" ";
                
                tokenStream.end();
                tokenStream.close();
                analyzer.close();
                
                if(reportTokens.endsWith(" "))
                      reportTokens.substring(0, reportTokens.length()-1);
                
                return reportTokens;
        } 
        catch (IOException e) 
        {
                e.printStackTrace();
                return text;
        }
    }
    
    //private static methods region
    /*
    private static Report[] mergeArray(Report[] array1, Report[] array2)
    {
        if(array1==null || array1.length==0)
            return array2;
        else if(array2==null || array2.length==0)
            return array1;
        
        Report[] reports=new Report[array1.length+array2.length];     
        
        for(int i=0;i<array1.length;i++)
            reports[i]=array1[i];
        
        for(int i=0;i<array2.length;i++)
            reports[array1.length+i]=array2[i];
 
        return reports;
    }
   
    private static Location[] mergeArray(Location[] array1, Location[] array2)
    {
        if(array1==null || array1.length==0)
            return array2;
        else if(array2==null || array2.length==0)
            return array1;  
        
        Location[] locations=new Location[array1.length+array2.length];     
        
        for(int i=0;i<array1.length;i++)
            locations[i]=array1[i];
        
        for(int i=0;i<array2.length;i++)
            locations[array1.length+i]=array2[i];

        return locations; 
    }
    
    private static CellLocation[] mergeArray(CellLocation[] array1, CellLocation[] array2)
    {
        if(array1==null || array1.length==0)
            return array2;
        else if(array2==null || array2.length==0)
            return array1;  
        
        CellLocation[] locations=new CellLocation[array1.length+array2.length];     
        
        for(int i=0;i<array1.length;i++)
            locations[i]=array1[i];
        
        for(int i=0;i<array2.length;i++)
            locations[array1.length+i]=array2[i];

        return locations; 
    }*/
    
    private static <T> T[] mergeArray(T[] firstArray, T[] secondArray)
    {   
        if(firstArray==null || firstArray.length==0)
            return secondArray;
        else if(secondArray==null || secondArray.length==0)
            return firstArray;
        else
        {
            T[] result = Arrays.copyOf(firstArray, firstArray.length + secondArray.length);
            System.arraycopy(secondArray, 0, result, firstArray.length, secondArray.length);
            return result;
        }   
    }
}

