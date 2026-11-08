package smd.eors.dataaccess;

import java.util.List;

import org.apache.hadoop.hbase.filter.BinaryComparator;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.util.Bytes;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.Command2;
import smd.eors.dataAccess.entity.master.CoverageCell;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.Statistic;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Login;
import smd.eors.dataAccess.entity.master.Navigation;

import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataAccess.entity.slave.Comment;
import smd.eors.dataAccess.entity.slave.Device;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataAccess.entity.slave.Action;
import smd.eors.dataAccess.entity.slave.CellLocation;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataAccess.entity.slave.Sim;
import smd.eors.dataAccess.entity.slave.Info;
import smd.eors.dataAccess.entity.slave.Word;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public final class DataAdapter
{
    //constructors region
    private DataAdapter()
    {
    }

    static
    {
        dataImplement=new DataImplement();
    }

    //private fields region
    private static DataImplement dataImplement;

    //public methods region
    public static void setZookeeperAddress(String zookeeperAddress)
    {
        dataImplement=new DataImplement(zookeeperAddress);
    }

    public static User[] loadUsers(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        
        List<MasterEntity> result = dataImplement.load(new User(), startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new User[0]);
        else
            return null;
    }

    public static Sim[] loadUserSim(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Sim(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Sim[0]);
        else
            return null;
    }

    public static Sim[] loadUserSim(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadUserSim(entityType.designRowKey(), filters);
    }

    public static Device[] loadUserDevices(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Device(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Device[0]);
        else
            return null;
    }

    public static Device[] loadUserDevices(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadUserDevices(entityType.designRowKey(), filters);
    }

    public static Location[] loadUserLocations(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Location(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Location[0]);
        else
            return null;
    }

    public static Location[] loadUserLocations(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadUserLocations(entityType.designRowKey(), filters);
    }
    
    public static CellLocation[] loadUserCellLocations(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new CellLocation(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new CellLocation[0]);
        else
            return null;
    }  

    public static CellLocation[] loadUserCellLocations(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadUserCellLocations(entityType.designRowKey(), filters);
    }
    
    public static Location[] loadRealtimeUserLocations(byte[] rowKey, Filter ...filters)
    {
        Location location=new Location(rowKey);
        location.setRealtime(true);
        
        List<SlaveEntity> result = dataImplement.load(location, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Location[0]);
        else
            return null;
    }

    public static Location[] loadRealtimeUserLocations(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadRealtimeUserLocations(entityType.designRowKey(), filters);
    }
    
    public static CellLocation[] loadRealtimeUserCellLocations(byte[] rowKey, Filter ...filters)
    {
        CellLocation location=new CellLocation(rowKey);
        location.setRealtime(true);
        
        List<SlaveEntity> result = dataImplement.load(location, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new CellLocation[0]);
        else
            return null;
    }

    public static CellLocation[] loadRealtimeUserCellLocations(String userName, Filter ...filters)
    {
        User entityType=new User();
        entityType.setName(userName);

        return loadRealtimeUserCellLocations(entityType.designRowKey(), filters);
    }


    public static Location loadUserLastLocation(byte[] rowKey)
    {  
        return (Location)dataImplement.loadLast(new Location(rowKey));
    }

    public static Location loadUserLastLocation(String userName)
    {
        User user=new User();
        user.setName(userName);

        return loadUserLastLocation(user.designRowKey());
    }
    
    public static CellLocation loadUserLastCellLocation(byte[] rowKey)
    {  
        return (CellLocation)dataImplement.loadLast(new CellLocation(rowKey));
    }

    public static CellLocation loadUserLastCellLocation(String userName)
    {
        User user=new User();
        user.setName(userName);

        return loadUserLastCellLocation(user.designRowKey());
    }
    
    public static Login[] loadLogins(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        List<MasterEntity> result = dataImplement.load(new Login(), startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Login[0]);
        else
            return  null;
    }

    public static CoverageCell[] loadCoverageCells(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        List<MasterEntity> result = dataImplement.load(new CoverageCell(), startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new CoverageCell[0]);
        else
            return null;
    }

    public static Command[] loadCommands(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        List<MasterEntity> result = dataImplement.load(new Command(), startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Command[0]);
        else
            return null; 
    }
    
    //TODO remove
    public static Command2[] loadCommands2()
    {
        List<MasterEntity> result = dataImplement.load(new Command2(), null, null, null);
        
        if(result!=null)
            return result.toArray(new Command2[0]);
        else
            return null; 
    }

    public static Event[] loadCommandReaders(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Event(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Event[0]);
        else
            return null;
    }

    public static Report[] loadReports(byte[] startRow, byte[] stopRow, boolean isRealtime, String nodeTablespace, Filter ...filters)
    {
        Report report=new Report();
        report.setRealtime(isRealtime);
        report.setActionFamilyspace(nodeTablespace);
        report.setCommentFamilyspace(nodeTablespace);

        List<MasterEntity> result = dataImplement.load(report, startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Report[0]);
        else
            return null;
    }

    public static Classify[] loadReportClassifies(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Classify(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Classify[0]);
        else
            return null;
    }
    
    public static Keyword[] loadKeywords(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        List<MasterEntity> result = dataImplement.load(new Keyword(), startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Keyword[0]);
        else
            return null;
    }

    public static Word[] loadKeywordWords(byte[] rowKey, Filter ...filters)
    {
        List<SlaveEntity> result = dataImplement.load(new Word(rowKey), getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Word[0]);
        else
            return null;
    }

    public static Word[] loadKeywordWords(String name, Filter ...filters)
    {
        Keyword keyword=new Keyword();
        keyword.setName(name);

        return loadKeywordWords(keyword.designRowKey(), filters);
    }
    
    public static Navigation[] loadNavigations(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        Navigation navigation=new Navigation();
        navigation.setRealtime(false);
        
        List<MasterEntity> result = dataImplement.load(navigation, startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Navigation[0]);
        else
            return null;
    }
    
    public static Navigation[] loadRealtimeNavigations(byte[] startRow, byte[] stopRow, Filter ...filters)
    {
        Navigation navigation=new Navigation();
        navigation.setRealtime(true);

        List<MasterEntity> result = dataImplement.load(navigation, startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Navigation[0]);
        else
            return null;
    }
    
    public static Login[] loadLogin(byte[] startRow, byte[] stopRow, boolean isRealtime, Filter ...filters)
    {
        Login login=new Login();
        login.setRealtime(isRealtime);

        List<MasterEntity> result = dataImplement.load(login, startRow, stopRow, getFilter(filters));
        
        if(result!=null)
            return result.toArray(new Login[0]);
        else
            return null;  
    }

    public static User findUser(byte[] rowKey)
    {
        User user=new User();
        user.setRowKey(rowKey);

        return (User)dataImplement.find(user);
    }
    
    public static User findUser(String name)
    {
        User user=new User();
        user.setName(name);
        user.setRowKey(user.designRowKey());

        return (User)dataImplement.find(user);
    }
    
    public static Statistic findStatistic(String name, String es)
    {
        Statistic statistic=new Statistic(name, es);  
        statistic.setRowKey(statistic.designRowKey());
        return (Statistic)dataImplement.find(statistic);
    }

    public static Report findReport(byte[] rowKey, Filter ...filters)
    {
        Report report=new Report();
        report.setRowKey(rowKey);

        Report result=(Report)dataImplement.find(report, getFilter(filters));
        
        if(result==null)
        {
            report.setRealtime(true);
            result=(Report)dataImplement.find(report, getFilter(filters));
        }
        
        return result;
    }
    
    public static Command findCommand(byte[] rowKey, Filter ...filters)
    {
        Command command=new Command();
        command.setRowKey(rowKey);

        return (Command)dataImplement.find(command, getFilter(filters));
    }
    
    public static CoverageCell findCoverageCell(byte[] rowKey)
    {
        CoverageCell cell=new CoverageCell();
        cell.setRowKey(rowKey);

        return (CoverageCell)dataImplement.find(cell);
    }
    
    public static long countReports(byte[] startRow, byte[] stopRow, boolean isRealtime, Filter... filters)
    {
        Report report=new Report();
        report.setRealtime(isRealtime);
        
        return dataImplement.count(report, startRow, stopRow, getFilter(filters));
    }

    public static byte[] saveCommand(Command command)
    {
        return dataImplement.save(command);
    }
    
    public static byte[] saveStatistic(Statistic statistic)
    {
        return dataImplement.save(statistic);
    }
    
    public static byte[] saveLogin(Login login)
    {
        return dataImplement.save(login);
    }

    public static byte[] saveCoverageCell(CoverageCell coverageCell)
    {
        return dataImplement.save(coverageCell);
    }

    public static byte[] saveKeyword(Keyword keyword)
    {
        return dataImplement.save(keyword);
    }

    public static byte[] saveNavigation(Navigation navigation)
    {
        return dataImplement.save(navigation);
    }

    public static byte[] saveReport(Report report)
    {
        return dataImplement.save(report);
    }
    
    public static byte[] saveAction(Action action)
    {
        return dataImplement.save(action);
    }
    
    public static byte[] saveComment(Comment comment)
    {
        return dataImplement.save(comment);
    }

    public static byte[] saveUser(User user)
    {
        return dataImplement.save(user);
    }

    public static byte[] saveClassify(Classify classify)
    {
        return dataImplement.save(classify);
    }

    public static byte[] saveDevice(Device device)
    {
        return dataImplement.save(device);
    }

    public static byte[] saveCommandRead(Event event)
    {
        return dataImplement.save(event);
    }
    
    public static byte[] saveInfo(Info info)
    {
        return dataImplement.save(info);
    }
    
    public static byte[] saveCellLocation(CellLocation cellLocation)
    {
        return dataImplement.save(cellLocation);
    }

    public static byte[] saveLocation(Location location)
    {
        return dataImplement.save(location);
    }

    public static byte[] saveSim(Sim sim)
    {
        return dataImplement.save(sim);
    }

    public static byte[] saveWord(Word word)
    {
        return dataImplement.save(word);
    }
    
    public static boolean saveBatchCommands(Command[] commands)
    {
        return dataImplement.saveBatch(commands);
    }

    public static boolean saveBatchCoverageCells(CoverageCell[] coverageCells)
    {
        return dataImplement.saveBatch(coverageCells);
    }

    public static boolean saveBatchKeywords(Keyword[] keywords)
    {
        return dataImplement.saveBatch(keywords);
    }

    public static boolean saveBatchNavigations(Navigation[] navigations)
    {
        return dataImplement.saveBatch(navigations);
    }

    public static boolean saveBatchReports(Report[] reports)
    {
        return dataImplement.saveBatch(reports);
    }

    public static boolean saveBatchUsers(User[] users)
    {
        return dataImplement.saveBatch(users);
    }

    public static boolean saveBatchClassifies(Classify[] classifies)
    {
        return dataImplement.saveBatch(classifies);
    }

    public static boolean saveBatchDevices(Device[] devices)
    {
        return dataImplement.saveBatch(devices);
    }
    
    public static boolean saveBatchLogins(Login[] logins)
    {
        return dataImplement.saveBatch(logins);
    }

    public static boolean saveBatchEvents(Event[] events)
    {
        return dataImplement.saveBatch(events);
    }
    
    public static boolean saveBatchCellLocations(CellLocation[] cellLocations)
    {
        return dataImplement.saveBatch(cellLocations);
    }

    public static boolean saveBatchLocations(Location[] locations)
    {
        return dataImplement.saveBatch(locations);
    }

    public static boolean saveBatchSim(Sim[] sim)
    {
        return dataImplement.saveBatch(sim);
    }

    public static boolean saveBatchWords(Word[] words)
    {
        return dataImplement.saveBatch(words);
    }
    
    public static boolean deleteComment(Comment comment)
    {
        return dataImplement.delete(comment);
    }
    
    public static boolean truncateCommand()
    {
        return dataImplement.truncate(new Command());
    }
    
    public static boolean truncateCoverageCell()
    {
        return dataImplement.truncate(new CoverageCell());
    }
    
    public static boolean truncateReport()
    {
        return dataImplement.truncate(new Report());
    }
    
    public static boolean truncateRealtimeReport()
    {
        Report entity=new Report();
        entity.setRealtime(true);
        
        return dataImplement.truncate(entity);
    }
    
    public static boolean truncateKeyword()
    {
        return dataImplement.truncate(new Keyword());
    }
    
    public static boolean truncateNavigation()
    {
        return dataImplement.truncate(new Navigation());
    }
    
    public static boolean truncateRealtimeNavigation()
    {
        Navigation navigation=new Navigation();
        navigation.setRealtime(true);
        return dataImplement.truncate(navigation);
    }

    public static boolean truncateUser()
    {
        return dataImplement.truncate(new User());
    }
    
    public static boolean truncateLogin()
    {
        return dataImplement.truncate(new Login());
    }
    
    public static boolean truncateRealtimeUser()
    {
        User user=new User();
        user.setRealtime(true);
        return dataImplement.truncate(user);
    }

    public static Filter getFilterReportByUsers(String users)
    {
        if(users!=null)
            if(users.indexOf(FILTER_VALUE_SEPERATOR)>=0)
            {
                FilterList filters=new FilterList(Operator.MUST_PASS_ONE);
                String[] userArray=users.split(FILTER_VALUE_SEPERATOR);
                Report object=new Report();
                
                for(String user: userArray)
                    filters.addFilter(dataImplement.getUserFilter(object, user));
                
                return filters;
            }
            else
                return dataImplement.getUserFilter(new Report(), users);
        else
            return null;
    }

    public static Filter getFilterNavigationByUser(String userName)
    {
        return dataImplement.getUserFilter(new Navigation(), userName);
    }

    public static Filter getFilterKeywordByGroupName(String name)
    {
        return dataImplement.getUserFilter(new Keyword(), name);
    }
    
    public static Filter getFilterLoginByPublisher(String publisher)
    {
        return dataImplement.getUserFilter(new Login(), publisher);
    }

    public static Filter getFilterUserByNode(String node)
    {
        return dataImplement.getNodeFilter(new User(), node);
    }
    
    public static Filter getFilterReportBySeen(String node, boolean useFilter, boolean isSeen)
    {
        return dataImplement.getSeenFilter(useFilter, node, isSeen);
    }
    
    public static Filter getFilterReportByImportant(String node, boolean useFilter, boolean isImportant)
    {
        return dataImplement.getImportantFilter(useFilter, node, isImportant);
    }

    public static Filter getFilterCommandByNode(String node)
    {
        return dataImplement.getNodeFilter(new Command(), node);
    }
    
    public static Filter getFilterByGps(boolean useFilter)
    {
        return dataImplement.getGpsFilter(useFilter);
    }
    
    public static Filter getFilterByCell(boolean useFilter)
    {
        return dataImplement.getCellFilter(useFilter);
    }

    public static Filter getFilterReportByNode(String node)
    {
        return dataImplement.getNodeFilter(new Report(), node);
    }
    
    public static Filter getFilterLoginByNode(String node)
    {
        return dataImplement.getNodeFilter(new Login(), node);
    }

    public static Filter getFilterCommandByText(String text)
    {
        return dataImplement.getTextFilter(new Command(), text);
    }
    
    public static Filter getFilterCommandByDate(long minTimestamp, long maxTimestamp)
    {
        return dataImplement.getDateFilter(new Command(), minTimestamp, maxTimestamp);
    }
    
    public static Filter getFilterReportByNotEmptyText()
    {
        return dataImplement.getNotEmptyTextFilter(new Report());
    }
    
    public static Filter getFilterReportById(String id)
    {
        return dataImplement.getIdFilter(id);
    }

    public static Filter getFilterReportByText(String text)
    {
        if(text!=null)
            if(text.indexOf(FILTER_VALUE_SEPERATOR)>=0)
            {
                FilterList filters=new FilterList(Operator.MUST_PASS_ONE);
                String[] textArray=text.split(FILTER_VALUE_SEPERATOR);
                Report object=new Report();
                
                for(String t: textArray)
                    filters.addFilter(dataImplement.getKeywordFilter(object, t));
                
                return filters;
            }
            else
                return dataImplement.getTextFilter(new Report(), text);
        else
            return null;
    }
    
    public static Filter getFilterReportByKeywords(String keywords)
    {
        if(keywords!=null)
        {
            keywords=keywords.replace(" ", FILTER_VALUE_SEPERATOR);
            if(keywords.indexOf(FILTER_VALUE_SEPERATOR)>=0)
            {
                FilterList filters=new FilterList(Operator.MUST_PASS_ONE);
                String[] keywordArray=keywords.split(FILTER_VALUE_SEPERATOR);
                Report object=new Report();
                
                for(String keyword: keywordArray)
                    filters.addFilter(dataImplement.getKeywordFilter(object, keyword));
                
                return filters;
            }
            else
                return dataImplement.getKeywordFilter(new Report(), keywords);
        }
        else
            return null;
    }

    public static Filter getFilterReportByCommand(boolean hasCommand, String commandId)
    {
        return dataImplement.getCommandIdFilter(hasCommand, commandId);
    }

    public static Filter getFilterReportByImportance(float lowestImportance)
    {
        return dataImplement.getImportanceFilter(lowestImportance);
    }

    public static Filter getFilterReportByImportanceRange(float lowestImportance, float maxImportance)
    {
        return dataImplement.getImportanceRangeFilter(lowestImportance, maxImportance);
    }
    
    public static Filter getFilterReportByClassifications(String classifications)
    {
        if(classifications!=null)
            if(classifications.indexOf(FILTER_VALUE_SEPERATOR)>=0)
            {
                FilterList filters=new FilterList();
                String[] classificationArray=classifications.split(FILTER_VALUE_SEPERATOR);
                
                for(String classification: classificationArray)
                    filters.addFilter(dataImplement.getClassifiesFilter(classification));
                
                return filters;
            }
            else
                return dataImplement.getClassifiesFilter(classifications);
        else
            return null;
    }

    public static Filter getFilterReportByCoordinate(double startLongitude, double startLatitude, double endLongitude, double endLatitude, boolean includeEmptyLocation)
    {
        return dataImplement.getCoordinateFilter(new Report(), startLongitude, startLatitude, endLongitude, endLatitude, includeEmptyLocation);
    }

    public static Filter getFilterNavigationByCoordinate(double startLongitude, double startLatitude, double endLongitude, double endLatitude)
    {
        return dataImplement.getCoordinateFilter(new Navigation(), startLongitude, startLatitude, endLongitude, endLatitude);
    }

    public static Filter getFilterReportByDate(long minTimestamp, long maxTimestamp)
    {
        return dataImplement.getDateFilter(new Report(), minTimestamp, maxTimestamp);
    }

    public static Filter getFilterNavigationByDate(long minTimestamp, long maxTimestamp)
    {
        return dataImplement.getDateFilter(new Navigation(), minTimestamp, maxTimestamp);
    }
    
    public static Filter getFilterPage(long offset)
    {
        if(offset!=0)
            return new PageFilter(offset);
        else
            return null;
    }
    
    public static Filter getFilterQualifier(String name)
    { 
        //precondition: none
        if(name!=null)
        {
            return new QualifierFilter(CompareOp.EQUAL, new BinaryComparator(Bytes.toBytes(name)));
        }
        else
            return null;
    }

    //private static methods region
    private static Filter getFilter(Filter[] filters)
    {
        if(filters!=null && filters.length>0)
            if(filters.length==1)
                if(filters[0]!=null)
                    return filters[0];
                else
                    return null;
            else
            {
                FilterList filterList=new FilterList(Operator.MUST_PASS_ALL);
                for(Filter filter: filters)
                    if(filter!=null)
                        filterList.addFilter(filter);

                if(filterList.getFilters().size()>0)
                    return filterList;
                else
                    return null;
            }
        else
            return null;
    }
    
    //private constant region
    private static final String FILTER_VALUE_SEPERATOR=";";
}
