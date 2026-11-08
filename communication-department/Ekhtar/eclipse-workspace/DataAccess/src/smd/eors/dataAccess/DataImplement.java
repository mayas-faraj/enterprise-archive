package smd.eors.dataaccess;

import java.util.Date;

import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.SubstringComparator;
import org.apache.hadoop.hbase.util.Bytes;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.Command2;
import smd.eors.dataAccess.entity.master.CoverageCell;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.Statistic;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.master.Login;
import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataAccess.entity.slave.Comment;
import smd.eors.dataAccess.entity.slave.Device;
import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataAccess.entity.slave.Sim;
import smd.eors.dataAccess.entity.slave.Info;
import smd.eors.dataAccess.entity.slave.Word;
import smd.eors.dataAccess.entity.slave.Action;
import smd.eors.dataAccess.entity.slave.CellLocation;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;
import smd.eors.dataaccess.entity.*;

public class DataImplement extends DataCore
{
    //public constructors region
    public DataImplement(String zookeeperAddress)
    {
        super(zookeeperAddress);
    }
    
    public DataImplement()
    {
        this("");
    }
    
    //public methods region  
    @Override 
    public Put getPut(Entity entity)
    { 
        //precondition: none  
        if(entity!=null)
        {
            Put put = new Put(entity.getRowKey());
            
            if(entity instanceof User)
            {
                putValue(put, DataSchema.USER_INFO, DataSchema.USER_INFO_NAME, ((User) entity).getName());
                putValue(put, DataSchema.USER_INFO, DataSchema.USER_INFO_NODE, ((User) entity).getNode());
                putValue(put, DataSchema.USER_INFO, DataSchema.USER_INFO_MUTED, ((User) entity).isMuted());
                putValue(put, DataSchema.USER_INFO, DataSchema.USER_INFO_DISABLED, ((User) entity).isDisabled());
            }
            else if(entity instanceof Command)
            {
                putValue(put, DataSchema.COMMAND_INFO, DataSchema.COMMAND_INFO_ES, ((Command) entity).getEs());
                putValue(put, DataSchema.COMMAND_INFO, DataSchema.COMMAND_INFO_TEXT, ((Command) entity).getText());
                putValue(put, DataSchema.COMMAND_INFO, DataSchema.COMMAND_INFO_SETS, ((Command) entity).getSets());
                putValue(put, DataSchema.COMMAND_INFO, DataSchema.COMMAND_INFO_TIMESTAMP, ((Command) entity).getTimestamp());
            }
            else if(entity instanceof Login)
            {
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_PUBLISHER, ((Login) entity).getPublisher());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_MACADDRESS, ((Login) entity).getMac());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_IMEI, ((Login) entity).getImei());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_OSVERSION, ((Login) entity).getOs());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_DEVICETYPE, ((Login) entity).getType());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_IMSI, ((Login) entity).getImsi());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_SIMSERIALNUMBER, ((Login) entity).getSsn());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_PROVIDER, ((Login) entity).getProvider());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_EMAVERSION, ((Login) entity).getVersion());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_TIMESTAMP, ((Login) entity).getTimestamp());
                putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_RECEIVEDTIMESTAMP, ((Login) entity).getReceivedTimestamp());
                
                if(((Login) entity).getGpsCoordinate()!=null)
                {
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_LONGITUDE, ((Login) entity).getGpsCoordinate().getLongitude());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_LATITUDE, ((Login) entity).getGpsCoordinate().getLatitude());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_ACCURACY, ((Login) entity).getGpsCoordinate().getAccuracy());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_GPSDATE, ((Login) entity).getGpsTimestamp());
                }
                
                if(((Login) entity).getCellCoordinate()!=null)
                {
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_CELLLONGITUDE, ((Login) entity).getCellCoordinate().getLongitude());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_CELLLATITUDE, ((Login) entity).getCellCoordinate().getLatitude());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_AZIMUTH, ((Login) entity).getCellCoordinate().getAzimuth());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_HEIGHT, ((Login) entity).getCellCoordinate().getHeight());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_CGI, ((Login) entity).getCellCoordinate().getCgi());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_SITENAME, ((Login) entity).getCellCoordinate().getSiteName());
                    putValue(put, DataSchema.LOGIN_INFO , DataSchema.LOGIN_INFO_GENERATION, ((Login) entity).getCellCoordinate().getGeneration());
                }
            }
            else if(entity instanceof Report)
            {
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_ID, ((Report) entity).getId());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_PUBLISHER, ((Report) entity).getUserName());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_ES, ((Report) entity).getUserNode());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_TEXT, ((Report) entity).getText());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_TIMESTAMP, ((Report) entity).getTimestamp());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_RECEIVEDTIMESTAMP, ((Report) entity).getReceivedTimestamp());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_COMMANDID, ((Report) entity).getCommandId());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_KEYWORDS, ((Report) entity).getKeyword());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_PROVIDER, ((Report) entity).getProvider());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_RELEVANCE, ((Report) entity).getImportance());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_IP, ((Report) entity).getIp());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_ATTACHMENTS, ((Report) entity).getAttachments());
                putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_ATTACHMENTFILES, ((Report) entity).getAttachmentFiles()); 
                
                if(((Report)entity).getGpsCoordinate()!=null)
                {
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_LONGITUDE, ((Report) entity).getGpsCoordinate().getLongitude());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_LATITUDE, ((Report) entity).getGpsCoordinate().getLatitude());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_ACCURACY, ((Report) entity).getGpsCoordinate().getAccuracy());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_GPSTIME, ((Report) entity).getGpsTimestamp());
                }
                
                if(((Report)entity).getCellCoordinate()!=null)
                {
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CGI, ((Report) entity).getCellCoordinate().getCgi());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CELLLONGITUDE, ((Report) entity).getCellCoordinate().getLongitude());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CELLLATITUDE, ((Report) entity).getCellCoordinate().getLatitude());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CELLAZIMUTH, ((Report) entity).getCellCoordinate().getAzimuth());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CELLHEIGHT, ((Report) entity).getCellCoordinate().getHeight());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_CELLSITENAME, ((Report) entity).getCellCoordinate().getSiteName());
                    putValue(put, DataSchema.REPORT_INFO, DataSchema.REPORT_INFO_GENERATION, ((Report) entity).getCellCoordinate().getGeneration());
                }
            }
            else if(entity instanceof Navigation)
            {
                putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_USER, ((Navigation) entity).getUser());
                putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_DATE, ((Navigation) entity).getDate());
                
                if(((Navigation) entity).getCoordinate()!=null)
                {
                    putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_LONGITUDE, ((Navigation) entity).getCoordinate().getLongitude());
                    putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_LATITUDE, ((Navigation) entity).getCoordinate().getLatitude());
                    putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_ACCURACY, ((Navigation) entity).getCoordinate().getAccuracy());

                    if(((Navigation) entity).getCoordinate() instanceof CellCoordinate)
                    {
                        putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_CGI, ((CellCoordinate)((Navigation) entity).getCoordinate()).getCgi());
                        putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_AZIMUTH, ((CellCoordinate)((Navigation) entity).getCoordinate()).getAzimuth());
                        putValue(put, DataSchema.NAVIGATION_INFO, DataSchema.NAVIGATION_INFO_HEIGHT, ((CellCoordinate)((Navigation) entity).getCoordinate()).getHeight());
                    }
                }     
            }
            else if(entity instanceof CoverageCell)
            {
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_CID, ((CoverageCell) entity).getCid());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_LAC, ((CoverageCell) entity).getLac());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_MNC, ((CoverageCell) entity).getMnc());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_CGI, ((CoverageCell) entity).getCellGlobalId());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_CELL_NAME, ((CoverageCell) entity).getCellName());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_SITE_CODE, ((CoverageCell) entity).getSiteCode());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_SITE_NAME, ((CoverageCell) entity).getSiteName());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_AZIMUTH, ((CoverageCell) entity).getAzimuth());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_X, ((CoverageCell) entity).getLongitude());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_Y, ((CoverageCell) entity).getLatitude());
                putValue(put, DataSchema.CELLULAR_INFO, DataSchema.CELLULAR_INFO_HEIGHT, ((CoverageCell) entity).getHeight());
            }
            else if(entity instanceof Keyword)
            {
                putValue(put, DataSchema.KEYWORD_INFO, DataSchema.KEYWORD_INFO_GROUPNAME, ((Keyword) entity).getName());
                putValue(put, DataSchema.KEYWORD_INFO, DataSchema.KEYWORD_INFO_ACTIVE, ((Keyword) entity).isActive());
            }
            /*else if(entity instanceof Statics)
            {
                putValue(put, DataSchema.STATICS_INFO, DataSchema.KEYWORD_INFO_GROUPNAME, ((Keyword) entity).getName());
                putValue(put, DataSchema.STATICS_INFO , DataSchema.KEYWORD_INFO_ACTIVE, ((Keyword) entity).isActive());
            }*/
            else if(entity instanceof Action)
            {
                String familyspace=null;
                
                if(((Action)entity).getFamilyspace()==null || ((Action)entity).getFamilyspace().equals(""))
                    familyspace=DataSchema.REPORT_EHQ;
                putValue(put, getFamily(DataSchema.REPORT_ACTION, familyspace), ((Action) entity).toKey(), ((Action) entity).toValue());
            }
            else if(entity instanceof Comment)
            {
                String familyspace=null;
                
                if(((Comment)entity).getFamilyspace()==null || ((Comment)entity).getFamilyspace().equals(""))
                    familyspace=DataSchema.REPORT_EHQ;

                putValue(put, getFamily(DataSchema.REPORT_COMMENT, familyspace), ((Comment) entity).toKey(), ((Comment) entity).toValue());
            }
            else if(entity instanceof Sim)
            {
                putValue(put, DataSchema.USER_SIM, ((Sim) entity).toKey(), ((Sim) entity).toValue());
            }
            else if(entity instanceof Device)
            {
                putValue(put, DataSchema.USER_DEVICE, ((Device) entity).toKey(), ((Device) entity).toValue());
            }
            else if(entity instanceof CellLocation)
            {
                putValue(put, DataSchema.USER_CELLLOCATION, ((CellLocation) entity).toKey(), ((CellLocation) entity).toValue());
            }
            else if(entity instanceof Location)
            {
                putValue(put, DataSchema.USER_LOCATION, ((Location) entity).toKey(), ((Location) entity).toValue());
            }
            else if(entity instanceof Event)
            {
                putValue(put, DataSchema.COMMAND_READER, ((Event) entity).toKey(), ((Event) entity).toValue());
            }
            else if(entity instanceof Classify)
            {
                putValue(put, DataSchema.REPORT_CATEGORY, ((Classify) entity).toKey(), ((Classify) entity).toValue());
            }
            else if(entity instanceof Word)
            {
                putValue(put, DataSchema.KEYWORD_WORD, ((Word) entity).toKey(), ((Word) entity).toValue());
            }
            
            return put;
        }
        
        return null;
        //return: null if the entity is null, else return associated put object
    }

    @Override
    public Get getGet(Entity entity)
    {
        //precondition: none
        if(entity!=null)
        {
            Get get=new Get(entity.getRowKey());
            
            if(entity instanceof User)
            {
                get.addFamily(Bytes.toBytes(DataSchema.USER_INFO));
            }
            else if(entity instanceof Command)
            {
                get.addFamily(Bytes.toBytes(DataSchema.COMMAND_INFO));
                get.addFamily(Bytes.toBytes(DataSchema.COMMAND_READER));
            }
            else if(entity instanceof Login)
            {
                get.addFamily(Bytes.toBytes(DataSchema.LOGIN_INFO));
            }
            else if(entity instanceof Report)
            {
                get.addFamily(Bytes.toBytes(DataSchema.REPORT_INFO));
                
                get.addFamily(Bytes.toBytes(getFamily(DataSchema.REPORT_ACTION, ((Report)entity).getActionFamilyspace())));
                get.addFamily(Bytes.toBytes(getFamily(DataSchema.REPORT_COMMENT, ((Report)entity).getCommentFamilyspace())));
            }
            else if(entity instanceof Navigation)
            {
                get.addFamily(Bytes.toBytes(DataSchema.NAVIGATION_INFO));
            }
            else if(entity instanceof CoverageCell)
            {
                get.addFamily(Bytes.toBytes(DataSchema.CELLULAR_INFO));
            }
            else if(entity instanceof Keyword)
            {
                get.addFamily(Bytes.toBytes(DataSchema.KEYWORD_INFO));
            }
            else if(entity instanceof Statistic)
            {
                get.addFamily(Bytes.toBytes(DataSchema.STATISTICS_INFO));
            }
            else if(entity instanceof Sim)
            {
                get.addFamily(Bytes.toBytes(DataSchema.USER_SIM));
            }
            else if(entity instanceof Action)
            {
                get.addFamily(Bytes.toBytes(DataSchema.REPORT_ACTION));
            }
            else if(entity instanceof Comment)
            {
                get.addFamily(Bytes.toBytes(DataSchema.REPORT_COMMENT));
            }
            else if(entity instanceof Device)
            {
                get.addFamily(Bytes.toBytes(DataSchema.USER_DEVICE));
            }
            else if(entity instanceof CellLocation)
            {
                get.addFamily(Bytes.toBytes(DataSchema.USER_CELLLOCATION));
            }
            else if(entity instanceof Location)
            {
                get.addFamily(Bytes.toBytes(DataSchema.USER_LOCATION));
            }
            else if(entity instanceof Event)
            {
                get.addFamily(Bytes.toBytes(DataSchema.COMMAND_READER));
            }
            else if(entity instanceof Classify)
            {
                get.addFamily(Bytes.toBytes(DataSchema.REPORT_CATEGORY));
            }
            else if(entity instanceof Word)
            {
                get.addFamily(Bytes.toBytes(DataSchema.KEYWORD_WORD));
            }
            
            return get;
        }
        
        return null;
        //return: null if the entity is null, else return associated get object
    }

    @Override
    public Delete getDelete(Entity entity)
    {
        //precondition: none
        if(entity!=null)
        {
            Delete delete=new Delete(entity.getRowKey());

            if(entity instanceof User)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.USER_INFO));
            }
            else if(entity instanceof Command)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.COMMAND_INFO));
            }
            else if(entity instanceof Login)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.LOGIN_INFO));
            }
            else if(entity instanceof Report)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.REPORT_INFO));
            }
            else if(entity instanceof Navigation)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.NAVIGATION_INFO));
            }
            else if(entity instanceof CoverageCell)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.CELLULAR_INFO));
            }
            else if(entity instanceof Keyword)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.KEYWORD_INFO));
            }
            else if(entity instanceof Statistic)
            {
                delete.addFamily(Bytes.toBytes(DataSchema.STATISTICS_INFO));
            }
            else if(entity instanceof Action)
            {
                String familyspace=null;
                
                if(((Action)entity).getFamilyspace()==null || ((Action)entity).getFamilyspace().equals(""))
                    familyspace=DataSchema.REPORT_EHQ;

                delete.addColumn(Bytes.toBytes(getFamily(DataSchema.REPORT_ACTION, familyspace)), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Comment)
            {
                String familyspace=null;
                
                if(((Comment)entity).getFamilyspace()==null || ((Comment)entity).getFamilyspace().equals(""))
                    familyspace=DataSchema.REPORT_EHQ;

                delete.addColumn(Bytes.toBytes(getFamily(DataSchema.REPORT_COMMENT, familyspace)), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Sim)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.USER_SIM), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Device)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.USER_DEVICE), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof CellLocation)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.USER_CELLLOCATION), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Location)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.USER_LOCATION), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Event)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.COMMAND_READER), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Classify)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.REPORT_CATEGORY), ((SlaveEntity)entity).toKey());
            }
            else if(entity instanceof Word)
            {
                delete.addColumn(Bytes.toBytes(DataSchema.KEYWORD_WORD), ((SlaveEntity)entity).toKey());
            }
            
            return delete;
        }
        
        return null;
        //return: null if the entity is null, else return associated delete object
    }

    @Override
    public MasterEntity getResult(MasterEntity entityType, Result result)
    {
        //precondition: none  
        MasterEntity entity=null;
        
        if(entityType!=null && result!=null)
        { 
            if(entityType instanceof User)
            {
                User user=new User();
                
                user.setName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.USER_INFO), Bytes.toBytes(DataSchema.USER_INFO_NAME)), ""));
                user.setNode(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.USER_INFO), Bytes.toBytes(DataSchema.USER_INFO_NODE)), ""));
                user.setMuted(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.USER_INFO), Bytes.toBytes(DataSchema.USER_INFO_MUTED)), false));
                user.setDisabled(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.USER_INFO), Bytes.toBytes(DataSchema.USER_INFO_DISABLED)), false));
                
                entity=user;
            }
            else if(entityType instanceof Command)
            {
                Command command=new Command();
                               
                command.setEs(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_ES)), ""));
                command.setText(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_TEXT)), ""));
                command.setSets(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_SETS)), ""));
                command.setTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_TIMESTAMP)), 0l));
                
                Event event=new Event(null);
                command.setReaders(load(event, result, Bytes.toBytes(DataSchema.COMMAND_READER), null).toArray(new Event[0]));
                                
                entity=command;
            }
            //TODO remove
            else if(entityType instanceof Command2)
            {
                Command2 command=new Command2();
                               
                command.setEs(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_ES)), ""));
                command.setText(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_TEXT)), ""));
                command.setAdmin(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes("admin")), ""));
                command.setTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.COMMAND_INFO), Bytes.toBytes(DataSchema.COMMAND_INFO_TIMESTAMP)), 0l));
                
                Event event=new Event(null);
                command.setReaders(load(event, result, Bytes.toBytes(DataSchema.COMMAND_READER), null).toArray(new Event[0]));
                                
                entity=command;
            }
            else if(entityType instanceof Login)
            {
                Login login=new Login("");
                
                login.setPublisher(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_PUBLISHER)), ""));
                login.setMac(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_MACADDRESS)), ""));
                login.setImei(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_IMEI)), ""));
                login.setOs(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_OSVERSION)), ""));
                login.setType(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_DEVICETYPE)), ""));
                login.setImsi(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_IMSI)), ""));
                login.setSsn(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_SIMSERIALNUMBER)), ""));
                login.setProvider(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_PROVIDER)), ""));
                login.setVersion(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_EMAVERSION)), ""));
                
                login.setGpsCoordinate(new Coordinate());
                
                login.getGpsCoordinate().setLongitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_LONGITUDE)), 0d));
                login.getGpsCoordinate().setLatitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_LATITUDE)), 0d));
                login.getGpsCoordinate().setAccuracy(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_ACCURACY)), 0f));
                
                login.setGpsTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_GPSDATE)), 0l));
                
                login.setCellCoordinate(new CellCoordinate());
                
                login.getCellCoordinate().setLongitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_CELLLONGITUDE)), 0d));
                login.getCellCoordinate().setLatitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_CELLLATITUDE)), 0d));
                login.getCellCoordinate().setAzimuth(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_AZIMUTH)), 0f));
                login.getCellCoordinate().setHeight(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_HEIGHT)), 0f));
                login.getCellCoordinate().setSiteName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_SITENAME)), ""));
                login.getCellCoordinate().setGeneration(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_GENERATION)), ""));
                login.getCellCoordinate().setCgi(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_CGI)), ""));
                
                login.setTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_TIMESTAMP)), 0l));
                login.setReceivedTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.LOGIN_INFO), Bytes.toBytes(DataSchema.LOGIN_INFO_RECEIVEDTIMESTAMP)), 0l));
                
                entity=login;
            }
            else if(entityType instanceof Report)
            {
                Report reportType=(Report)entityType;
                Report report=new Report();

                //remove empty text
                report.setText(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TEXT)), ""));

                if(report.getText()!=null && !report.getText().equals(""))
                { 
                    report.setId(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ID)), 0l));
                    report.setUserName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_PUBLISHER)), ""));
                    report.setUserNode(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ES)), ""));
                    report.setTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_TIMESTAMP)), 0l));
                    report.setReceivedTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_RECEIVEDTIMESTAMP)), 0l));
                    report.setCommandId(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_COMMANDID)), ""));
                    report.setKeyword(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_KEYWORDS)), ""));
                    report.setProvider(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_PROVIDER)), ""));
                    report.setImportance(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_RELEVANCE)), 0f));
                    report.setIp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_IP)), ""));
                    report.setAttachments(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTS)), ""));
                    report.setAttachmentFiles(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ATTACHMENTFILES)), ""));
                    
                    double longitude, latitude;
                    
                    if((longitude=valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_LONGITUDE)), 0d))!=0 &&
                    (latitude=valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_LATITUDE)), 0d))!=0)
                    {
                        report.setGpsCoordinate(new Coordinate());
                        report.getGpsCoordinate().setLongitude(longitude);
                        report.getGpsCoordinate().setLatitude(latitude);
                        report.getGpsCoordinate().setAccuracy(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_ACCURACY)), 0f));
                        report.setGpsTimestamp(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_GPSTIME)), 0l));
                    }
                    
                    String cgi;
                    if(!(cgi=valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CGI)), "")).equals(""))
                    {
                        report.setCellCoordinate(new CellCoordinate());
                        report.getCellCoordinate().setCgi(cgi);
                        report.getCellCoordinate().setLongitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLLONGITUDE)), 0d));
                        report.getCellCoordinate().setLatitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLLATITUDE)), 0d));
                        report.getCellCoordinate().setAzimuth(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLAZIMUTH)), 0f));
                        report.getCellCoordinate().setHeight(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLHEIGHT)), 0f));
                        report.getCellCoordinate().setSiteName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_CELLSITENAME)), ""));
                        report.getCellCoordinate().setGeneration(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.REPORT_INFO), Bytes.toBytes(DataSchema.REPORT_INFO_GENERATION)), ""));
                    }
                    
                    Action action=new Action((Report)null);
                    if(reportType.getActionFamilyspace()==null || reportType.getActionFamilyspace().equals(""))
                        action.setFamilyspace(DataSchema.REPORT_EHQ);
                    report.setActions(load(action, result, Bytes.toBytes(DataSchema.REPORT_ACTION), action.getFamilyspace()==null || action.getFamilyspace().equals("")?null:Bytes.toBytes(action.getFamilyspace())).toArray(new Action[0]));
                    
                    Comment comment=new Comment((Report)null);
                    if(reportType.getCommentFamilyspace()==null || reportType.getCommentFamilyspace().equals(""))
                        comment.setFamilyspace(DataSchema.REPORT_EHQ);
                    report.setComments(load(comment, result, Bytes.toBytes(DataSchema.REPORT_COMMENT), comment.getFamilyspace()==null || comment.getFamilyspace()==""?null:Bytes.toBytes(comment.getFamilyspace())).toArray(new Comment[0]));
                   
                    entity=report;
                }
                else
                    entity=null;
            }
            else if(entityType instanceof Navigation)
            {
                Navigation navigation=new Navigation();

                navigation.setUser(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_USER)), ""));
                navigation.setDate(new Date(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_DATE)), 0l)));

                String cgi=valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_CGI)), "");

                if(!cgi.equals(""))
                {
                    navigation.setCoordinate(new CellCoordinate());
                    
                    ((CellCoordinate)navigation.getCoordinate()).setCgi(cgi);
                    ((CellCoordinate)navigation.getCoordinate()).setAzimuth(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_AZIMUTH)), 0f));
                    ((CellCoordinate)navigation.getCoordinate()).setHeight(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_HEIGHT)), 0f));   
                }
                
                navigation.getCoordinate().setLongitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_LONGITUDE)), 0d));
                navigation.getCoordinate().setLatitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_LATITUDE)), 0d));
                navigation.getCoordinate().setAccuracy(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.NAVIGATION_INFO), Bytes.toBytes(DataSchema.NAVIGATION_INFO_ACCURACY)), 0f));
                     
                entity=navigation;    
            }
            else if(entityType instanceof CoverageCell)
            {
                CoverageCell coverageCell=new CoverageCell();
                
                coverageCell.setCid(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_CID)), 0));
                coverageCell.setLac(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_LAC)), 0));
                coverageCell.setMnc(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_MNC)), 0));
                coverageCell.setCellGlobalId(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_CGI)), ""));
                coverageCell.setCellName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_CELL_NAME)), ""));
                coverageCell.setSiteCode(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_SITE_CODE)), ""));
                coverageCell.setSiteName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_SITE_NAME)), ""));
                coverageCell.setAzimuth(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_AZIMUTH)), 0f));
                coverageCell.setLongitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_X)), 0d));
                coverageCell.setLatitude(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_Y)), 0d));
                coverageCell.setHeight(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.CELLULAR_INFO), Bytes.toBytes(DataSchema.CELLULAR_INFO_HEIGHT)), 0f));
                
                entity=coverageCell; 
            }
            else if(entityType instanceof Keyword)
            {
                Keyword keyword=new Keyword();

                keyword.setName(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.KEYWORD_INFO), Bytes.toBytes(DataSchema.KEYWORD_INFO_GROUPNAME)), ""));
                keyword.setActive(valueOfBytes(result.getValue(Bytes.toBytes(DataSchema.KEYWORD_INFO), Bytes.toBytes(DataSchema.KEYWORD_INFO_ACTIVE)), true));

                entity=keyword;
            } 
            else if(entityType instanceof Statistic)
            {
                Statistic statistic=new Statistic();
                Info info=new Info((Statistic)null);
                statistic.setInfo(load(info, result, Bytes.toBytes(DataSchema.STATISTICS_INFO), null).toArray(new Info[0]));
                
                entity=statistic;
            }
            
            if(entity!=null)
            {
                //setting the row key
                entity.setRowKey(result.getRow());
                entity.setRealtime(entityType.isRealtime());
                
                //setting time stamp
                if(result.rawCells()!=null && result.rawCells().length>0)
                    entity.setCellTimpstamp(result.rawCells()[0].getTimestamp());    
            }
        }
        
        return entity;
        //return: null if entity type or result are null or unsupported entity type, else return the entity filled with result data
    }

    @Override
    public HTableDescriptor getDescriptor(MasterEntity entity)
    {
        //precondition: none
        HTableDescriptor descriptor=new HTableDescriptor(getTableName(entity));
         
        if(entity!=null)
        {
            if(entity instanceof User)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.USER_INFO));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.USER_SIM));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.USER_DEVICE));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.USER_CELLLOCATION));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.USER_LOCATION));
            }
            else if(entity instanceof Command)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.COMMAND_INFO));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.COMMAND_READER));
            }
            else if(entity instanceof Report)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_INFO));;
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_CATEGORY));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_ACTION));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_ACTION+DataSchema.REPORT_EHQ));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_COMMENT));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.REPORT_COMMENT+DataSchema.REPORT_EHQ));
            }
            else if(entity instanceof Navigation)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.NAVIGATION_INFO));
            }
            else if(entity instanceof Login)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.LOGIN_INFO));
            }
            else if(entity instanceof CoverageCell)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.CELLULAR_INFO));
            }
            else if(entity instanceof Keyword)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.KEYWORD_INFO));
                descriptor.addFamily(new HColumnDescriptor(DataSchema.KEYWORD_WORD));
            }
            else if(entity instanceof Statistic)
            {
                descriptor.addFamily(new HColumnDescriptor(DataSchema.STATISTICS_INFO));
            }
            
            return descriptor;
        }
        else
            return null;

        //return: if entity is null, return null,
        //        else if entity is not supported, return an empty families of descriptor
        //        else return the entity descriptor
    }

    @Override
    public String getTable(Entity entity)
    {
        //precondition: none
        String tableName = null;

        if(entity!=null)
        {
            //getting table name from schema
            if(entity instanceof MasterEntity)
            {
                if(entity instanceof User)
                {
                    tableName = DataSchema.USER_TABLE;
                }
                else if(entity instanceof Command)
                {
                    tableName = DataSchema.COMMAND_TABLE;
                }
                //TODO remove
                else if(entity instanceof Command2)
                {
                    tableName = "command";
                }
                else if(entity instanceof Report)
                {
                    tableName = DataSchema.REPORT_TABLE;
                }
                else if(entity instanceof Navigation)
                {
                    tableName = DataSchema.NAVIGATION_TABLE;
                }
                else if(entity instanceof CoverageCell)
                {
                    tableName = DataSchema.CELLULAR_TABLE;
                }
                else if(entity instanceof Login)
                {
                    tableName = DataSchema.LOGIN_TABLE;
                }
                else if(entity instanceof Keyword)
                {
                    tableName = DataSchema.KEYWORD_TABLE;
                }
                else if(entity instanceof Statistic)
                {
                    tableName = DataSchema.STATISTICS_TABLE;
                }

                if(((MasterEntity)entity).getTablespace()!=null && !((MasterEntity)entity).getTablespace().equals("") && tableName!=null)
                    tableName+=((MasterEntity)entity).getTablespace();
            }
            else if(entity instanceof SlaveEntity)
            {
                tableName = getTable(getMasterEntity((SlaveEntity)entity));
            }
            
            //check table real time status
            if(entity.isRealtime() && tableName!=null)
                tableName=DataSchema.REAL_TIME_PREFIX+tableName;
        }

        return tableName;
        //return: null if the entity is null, empty is the entity is unsupported,
        //        else return the associated table name with the entity
    }

    @Override
    public byte[] getFamily(byte[] family, byte[] familyspace)
    {
        if(familyspace==null)
            return family;
        else
            return Bytes.add(family, familyspace);
    }
    
    public String getFamily(String family, String familyspace)
    {
        if(familyspace==null || familyspace.equals(""))
            return family;
        else
            return family+familyspace;
    }
    
    
    @Override
    public MasterEntity getMasterEntity(SlaveEntity entityType)
    {
        //precondition: none
        if(entityType!=null)
        {
            //getting table name from schema
            if(entityType instanceof Sim ||
                    entityType instanceof Device ||
                    entityType instanceof CellLocation ||
                    entityType instanceof Location)
            {
                return new User();
            }
            else if(entityType instanceof Action ||
                    entityType instanceof Comment ||
                    entityType instanceof Classify)
            {
                return new Report();
            }
            else if(entityType instanceof Event)
            {
                return new Command();
            }
            else if(entityType instanceof Word)
            {
                return new Keyword();
            }
            else if(entityType instanceof Info)
            {
                return new Statistic();
            }
        }
        
        return null;
        //return: null if the entityType is null or unsupported entity type,
        //        else return the owner master entity
    }
    
    public Filter getUserFilter(MasterEntity entityType, String name)
    {
        if(entityType!=null && name!=null && name.trim().length()!=0)
        {
            String family;
            String qualifier;

            if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier=DataSchema.REPORT_INFO_PUBLISHER;
            }
            else if(entityType instanceof Navigation)
            {
                family = DataSchema.NAVIGATION_INFO;
                qualifier=DataSchema.NAVIGATION_INFO_USER;
            }
            else if(entityType instanceof Keyword)
            {
                family = DataSchema.KEYWORD_INFO;
                qualifier=DataSchema.KEYWORD_INFO_GROUPNAME;
            }
            else if(entityType instanceof Login)
            { 
                family = DataSchema.LOGIN_INFO;
                qualifier=DataSchema.LOGIN_INFO_PUBLISHER;
            }
            else
                return null;

            
            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, Bytes.toBytes(name));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }

    public Filter getNodeFilter(MasterEntity entityType, String node)
    {
        if(entityType!=null && node!=null && node.trim().length()!=0)
        {
            String family;
            String qualifier;

            if(entityType instanceof User)
            {
                family = DataSchema.USER_INFO;
                qualifier=DataSchema.USER_INFO_NODE;
            }
            else if(entityType instanceof Command)
            {
                family = DataSchema.COMMAND_INFO;
                qualifier=DataSchema.COMMAND_INFO_ES;
            }
            else if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier=DataSchema.REPORT_INFO_ES;
            }
            else if(entityType instanceof Login)
            {
                family = DataSchema.LOGIN_INFO;
                qualifier=DataSchema.LOGIN_INFO_ES;
            }
            else
                return null;

            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, Bytes.toBytes(node));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }
    
    public Filter getNotEmptyTextFilter(MasterEntity entityType)
    {
        if(entityType!=null)
        {
            String family;
            String qualifier;

            if(entityType instanceof Command)
            {
                family = DataSchema.COMMAND_INFO;
                qualifier=DataSchema.COMMAND_INFO_TEXT;
            }
            else if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier = DataSchema.REPORT_INFO_TEXT;
            }
            else
                return null;

            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.NOT_EQUAL, Bytes.toBytes(""));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }
    
    public Filter getIdFilter(String id)
    {
        if(id!=null && id!="")
        {
            String family = DataSchema.REPORT_INFO;
            String qualifier=DataSchema.REPORT_INFO_ID;
            
            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, Bytes.toBytes(id));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }

    public Filter getTextFilter(MasterEntity entityType, String text)
    {
        if(entityType!=null && text!=null)
        {
            String family;
            String qualifier;

            if(entityType instanceof Command)
            {
                family = DataSchema.COMMAND_INFO;
                qualifier=DataSchema.COMMAND_INFO_TEXT;
            }
            else if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier = DataSchema.REPORT_INFO_TEXT;
            }
            else
                return null;

            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, new SubstringComparator(text));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }
    
    public Filter getKeywordFilter(MasterEntity entityType, String keyword)
    {
        if(entityType!=null && keyword!=null)
        {
            String family;
            String qualifier;

            if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier = DataSchema.REPORT_INFO_KEYWORDS;
            }
            else
                return null;

            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, new SubstringComparator(keyword));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }
    
    public Filter getCellFilter(boolean useFilter)
    {
        if(useFilter)
        {

            String family = DataSchema.REPORT_INFO;
            String qualifierX = DataSchema.REPORT_INFO_CELLLONGITUDE;
            String qualifierY = DataSchema.REPORT_INFO_CELLLATITUDE;
            
            SingleColumnValueFilter filterX = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierX), CompareOp.NOT_EQUAL, Bytes.toBytes(0));            
            SingleColumnValueFilter filterY = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierY), CompareOp.NOT_EQUAL, Bytes.toBytes(0));

            filterX.setFilterIfMissing(true);
            filterY.setFilterIfMissing(true);
            
            FilterList filters=new FilterList(Operator.MUST_PASS_ALL);
            filters.addFilter(filterX);
            filters.addFilter(filterY);
            
            return filters;
        }
        else
            return null;
    }
    
    public Filter getGpsFilter(boolean useFilter)
    {
        if(useFilter)
        {

            String family = DataSchema.REPORT_INFO;
            String qualifierX = DataSchema.REPORT_INFO_LONGITUDE;
            String qualifierY = DataSchema.REPORT_INFO_LATITUDE;
            
            SingleColumnValueFilter filterX = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierX), CompareOp.NOT_EQUAL, Bytes.toBytes(0));            
            SingleColumnValueFilter filterY = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierY), CompareOp.NOT_EQUAL, Bytes.toBytes(0));

            filterX.setFilterIfMissing(true);
            filterY.setFilterIfMissing(true);
            
            FilterList filters=new FilterList(Operator.MUST_PASS_ALL);
            filters.addFilter(filterX);
            filters.addFilter(filterY);
            
            return filters;
        }
        else
            return null;
    }
    
    public Filter getCommandIdFilter(boolean hasCommand, String commandId)
    {
        //precondition: none
        String family;
        String qualifier;
        String value;
        CompareOp operator;

        if(hasCommand)
        {
            if(commandId==null || commandId.length()==0)
            {
                operator=CompareOp.NOT_EQUAL;
                value="-1";
            }
            else
            {
                operator=CompareOp.EQUAL;
                value=commandId;
            }
        }
        else
        {
            if(commandId!=null && commandId.length()>0)
            {
                value="-1";
                operator=CompareOp.EQUAL;
            }
            else
                return null;
        }

        family = DataSchema.REPORT_INFO;
        qualifier=DataSchema.REPORT_INFO_COMMANDID;

        SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), operator, Bytes.toBytes(value));
        filter.setFilterIfMissing(hasCommand);
        
        SingleColumnValueFilter notEmptyFilter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.NOT_EQUAL, new byte[0]);
        
        FilterList filters=new FilterList(Operator.MUST_PASS_ALL, filter, notEmptyFilter);
        return filters;

        //post condition:
        //hasCommand    commandId       result
        //false         null            null
        //false         any else null   reports has no replay
        //true          null            reports has replay
        //true          any else null   reports has commadId
    }
    
    public Filter getImportanceFilter(float lowestImportance)
    {
        if(lowestImportance!=0)
        {
            String family = DataSchema.REPORT_INFO;
            String qualifier=DataSchema.REPORT_INFO_RELEVANCE;

            SingleColumnValueFilter filter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.GREATER_OR_EQUAL, Bytes.toBytes(lowestImportance));
            filter.setFilterIfMissing(true);
            return filter;
        }
        else
            return null;
    }
    
    public Filter getImportanceRangeFilter(float lowestImportance, float maxImportance)
    {
        if(lowestImportance!=0 || maxImportance!=0)
        {

            String family = DataSchema.REPORT_INFO;
            String qualifier=DataSchema.REPORT_INFO_RELEVANCE;

            SingleColumnValueFilter minFilter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.GREATER, Bytes.toBytes(lowestImportance));
            SingleColumnValueFilter maxFilter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.LESS_OR_EQUAL, Bytes.toBytes(maxImportance));
            
            minFilter.setFilterIfMissing(true);
            maxFilter.setFilterIfMissing(true);
            
            FilterList filters=new FilterList(Operator.MUST_PASS_ALL);
            filters.addFilter(minFilter);
            filters.addFilter(maxFilter);
            
            return filters;
        }
        else
            return null;
    }

    public Filter getClassifiesFilter(String classify)
    { 
        //precondition: none
        if(classify!=null && classify.length()>0)
        {
            String family = DataSchema.REPORT_CATEGORY;

            SingleColumnValueFilter importanceFilter=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(classify), CompareOp.NOT_EQUAL, Bytes.toBytes(""));
            importanceFilter.setFilterIfMissing(true);
            return importanceFilter;            
        }
        
        return null;
    }
    
    public Filter getSeenFilter(boolean useFilter, String actionFamilyspace, boolean isSeen)
    { 
        //precondition: none
        if(useFilter)
        {
            String family;
            family = DataSchema.REPORT_ACTION;
                
            if(actionFamilyspace==null || actionFamilyspace.equals(""))
                family=getFamily(family, DataSchema.REPORT_EHQ);

            String qualifier= DataSchema.REPORT_ACTION_CURRENTSEEN;

            SingleColumnValueFilter seenFilter=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, Bytes.toBytes(isSeen));

            if(isSeen)
                seenFilter.setFilterIfMissing(true);

            return seenFilter;
        }
        
        return null;
    }
    
    public Filter getImportantFilter(boolean useFilter, String actionFamilyspace, boolean isImportant)
    { 
        //precondition: none
        if(useFilter)
        {
            String family= DataSchema.REPORT_ACTION;

            if(actionFamilyspace==null || actionFamilyspace.equals(""))
                family=getFamily(family, DataSchema.REPORT_EHQ);

            String qualifier= DataSchema.REPORT_ACTION_CURRENTIMPORTANT;

            SingleColumnValueFilter importantFilter=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.EQUAL, Bytes.toBytes(isImportant));

            if(isImportant)
                importantFilter.setFilterIfMissing(true);

            return importantFilter;              
        }

        return null;
    }
    
    public Filter getCoordinateFilter(MasterEntity entityType, double startLongitude, double startLatitude, double endLongitude, double endLatitude, boolean includeEmptyLocation)
    {
        //precondition: none
        if(entityType!=null && (startLatitude!=0 || startLatitude!=0 || endLongitude!=0 || endLatitude!=0))
        {
            //define column qualifier
            String family;
            String qualifierLongitude;
            String qualifierLatitude;
            String qualifierCellLongitude;
            String qualifierCellLatitude;

            if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;

                qualifierLongitude=DataSchema.REPORT_INFO_LONGITUDE;
                qualifierLatitude=DataSchema.REPORT_INFO_LATITUDE;
                qualifierCellLongitude=DataSchema.REPORT_INFO_CELLLONGITUDE;
                qualifierCellLatitude=DataSchema.REPORT_INFO_CELLLATITUDE;
            }
            else if(entityType instanceof Navigation)
            {
                family = DataSchema.NAVIGATION_INFO;

                qualifierLongitude=DataSchema.NAVIGATION_INFO_LONGITUDE;
                qualifierLatitude=DataSchema.NAVIGATION_INFO_LATITUDE;
                qualifierCellLongitude="";
                qualifierCellLatitude="";
            }
            else
                return null;
            
            
            //apply filters
            FilterList filters=new FilterList(Operator.MUST_PASS_ONE);
            boolean gpsOnly=qualifierCellLongitude.equals("") || qualifierCellLatitude.equals("");
            
            //setup GPS coordinate filter
            SingleColumnValueFilter startLogitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierLongitude),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLongitude));
            SingleColumnValueFilter endLongitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierLongitude),CompareOp.LESS,Bytes.toBytes(endLongitude));
            SingleColumnValueFilter startLatitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierLatitude),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLatitude));
            SingleColumnValueFilter endLatitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierLatitude),CompareOp.LESS,Bytes.toBytes(endLatitude));

            startLogitudeFilter.setFilterIfMissing(true);
            endLongitudeFilter.setFilterIfMissing(true);
            startLatitudeFilter.setFilterIfMissing(true);
            endLatitudeFilter.setFilterIfMissing(true); 

            FilterList gpsFilters=new FilterList(Operator.MUST_PASS_ALL);
            gpsFilters.addFilter(startLogitudeFilter);
            gpsFilters.addFilter(endLongitudeFilter);
            gpsFilters.addFilter(startLatitudeFilter);
            gpsFilters.addFilter(endLatitudeFilter);
            
            filters.addFilter(gpsFilters);
            
            if(!gpsOnly)
            {
                SingleColumnValueFilter startCellLogitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierCellLongitude),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLongitude));
                SingleColumnValueFilter endCellLongitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierCellLongitude),CompareOp.LESS,Bytes.toBytes(endLongitude));
                SingleColumnValueFilter startCellLatitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierCellLatitude),CompareOp.GREATER_OR_EQUAL,Bytes.toBytes(startLatitude));
                SingleColumnValueFilter endCellLatitudeFilter=new SingleColumnValueFilter(Bytes.toBytes(family),Bytes.toBytes(qualifierCellLatitude),CompareOp.LESS,Bytes.toBytes(endLatitude));

                startCellLogitudeFilter.setFilterIfMissing(true);
                endCellLongitudeFilter.setFilterIfMissing(true);
                startCellLatitudeFilter.setFilterIfMissing(true);
                endCellLatitudeFilter.setFilterIfMissing(true);    

                FilterList cellFilters=new FilterList(Operator.MUST_PASS_ALL);
                cellFilters.addFilter(startCellLogitudeFilter);
                cellFilters.addFilter(endCellLongitudeFilter);
                cellFilters.addFilter(startCellLatitudeFilter);
                cellFilters.addFilter(endCellLatitudeFilter);
                
                filters.addFilter(cellFilters);
            }
            
            if(includeEmptyLocation)
            {
                //define GPS empty filter
                SingleColumnValueFilter longitudeEmpty=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierLongitude), CompareOp.EQUAL, Bytes.toBytes(0));
                SingleColumnValueFilter latitudeEmpty=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierLatitude), CompareOp.EQUAL, Bytes.toBytes(0));
                
                FilterList gpsEmpty=new FilterList(Operator.MUST_PASS_ONE);
                gpsEmpty.addFilter(longitudeEmpty);
                gpsEmpty.addFilter(latitudeEmpty);
                
                //define cell empty filter
                SingleColumnValueFilter cellLongitudeEmpty=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierCellLongitude), CompareOp.EQUAL, Bytes.toBytes(0));
                SingleColumnValueFilter cellLatitudeEmpty=new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifierCellLatitude), CompareOp.EQUAL, Bytes.toBytes(0));
                
                FilterList cellEmpty=new FilterList(Operator.MUST_PASS_ONE);
                cellEmpty.addFilter(cellLongitudeEmpty);
                cellEmpty.addFilter(cellLatitudeEmpty);
                
                //define cell empty and GPS empty
                FilterList gpsAndCellEmpty=new FilterList(Operator.MUST_PASS_ALL);
                gpsAndCellEmpty.addFilter(gpsEmpty);
                gpsAndCellEmpty.addFilter(cellEmpty);

                filters.addFilter(gpsAndCellEmpty);
                
                if(gpsOnly)
                {
                    filters.addFilter(gpsEmpty);  
                }
            }
            
            return filters;
        }
        else
            return null;
        //return: GpsFilter OR (CellFilter AND (NOT GpsOnly)) OR (Include AND ((GpsEmpty AND CellEmpty) OR (GpsEmpty AND GpsOnly))) 
    }

    public Filter getCoordinateFilter(MasterEntity entityType, double startLongitude, double startLatitude, double endLongitude, double endLatitude)
    {
        return getCoordinateFilter(entityType, startLongitude, startLatitude, endLongitude, endLatitude, false);
    }
    
    public Filter getDateFilter(MasterEntity entityType, long minTimestamp, long maxTimestamp)
    {
        //precondition: none
        if(entityType!=null && (minTimestamp !=0 || maxTimestamp!=0))
        {
            String family;
            String qualifier;

            if(entityType instanceof Report)
            {
                family = DataSchema.REPORT_INFO;
                qualifier=DataSchema.REPORT_INFO_TIMESTAMP;
            }
            else if(entityType instanceof Navigation)
            {
                family = DataSchema.NAVIGATION_INFO;
                qualifier=DataSchema.NAVIGATION_INFO_DATE;
            }
            else if(entityType instanceof Command)
            {
                family = DataSchema.COMMAND_INFO;
                qualifier=DataSchema.COMMAND_INFO_TIMESTAMP;
            }
            else
                return null;

            SingleColumnValueFilter minFilter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.GREATER, Bytes.toBytes(minTimestamp));
            minFilter.setFilterIfMissing(true);
            
            if(maxTimestamp!=0)
            {
                SingleColumnValueFilter maxFilter = new SingleColumnValueFilter(Bytes.toBytes(family), Bytes.toBytes(qualifier), CompareOp.LESS_OR_EQUAL, Bytes.toBytes(maxTimestamp));
                maxFilter.setFilterIfMissing(true);       
                
                FilterList filters=new FilterList(Operator.MUST_PASS_ALL);
                filters.addFilter(minFilter);
                filters.addFilter(maxFilter);   
                
                return filters;
            }
            else
                return minFilter;
        }
        else
            return null;
        //return: minTimstamp   maxTimestanp        result
        //        0             0                   null
        //        0             x                   from 0 to maxTimstamp
        //        x             0                   from 0+ to infinity
        //        x             x                   from minimum to maximux time stamp
        
    } 
    
    //private function region 
    /*
    private Date extractDate(Result result, String columnFamily, String columnQualifier)
    {
        Cell cell=result.getColumnLatestCell(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier));

        if(cell!=null)
            return new Date(cell.getTimestamp());
        else
            return null;
    }
    */
    
    private void putValue(Put put, String columnFamily, String columnQualifier, String value, String defaultValue)
    {
        //precondition: put is not null
        if(value!=null || defaultValue!=null)
        {
            if(value==null)
                value=defaultValue;
            
            put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
        }
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, String value)
    {
        putValue(put, columnFamily, columnQualifier, value, null);
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, int value)
    {
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, long value)
    {
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, Date value)
    {
        if(value!=null)
            putValue(put, columnFamily, columnQualifier, value.getTime());
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, float value)
    {
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, double value)
    {
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
    }
    
    private void putValue(Put put, String columnFamily, String columnQualifier, boolean value)
    {
        put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), Bytes.toBytes(value));
    }
    
    /*
    private void putValue(Put put, String columnFamily, String columnQualifier, byte[] value)
    {
        if(value!=null)
            put.addColumn(Bytes.toBytes(columnFamily), Bytes.toBytes(columnQualifier), value);
    }
    */
    
    private void putValue(Put put, String columnFamily, byte[] columnQualifier, byte[] value)
    {
        if(columnQualifier!=null && value!=null)
            put.addColumn(Bytes.toBytes(columnFamily), columnQualifier, value);
    }
    
    private String valueOfBytes(byte[] value, String defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toString(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }

        return defaultValue;
    }

    private double valueOfBytes(byte[] value, double defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toDouble(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }

        return defaultValue;
    }

    private float valueOfBytes(byte[] value, float defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toFloat(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", (value==null)?"<NULL>":value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }

        return defaultValue;
    }

    private int valueOfBytes(byte[] value, int defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toInt(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", (value==null)?"<NULL>":value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }

        return defaultValue;
    }
     
    private long valueOfBytes(byte[] value, long defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toLong(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", (value==null)?"<NULL>":value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }
        
        return defaultValue;
    }
    
    private boolean valueOfBytes(byte[] value, boolean defaultValue)
    {
        if(value!=null)
        {
            try
            {
                return Bytes.toBoolean(value);
            }
            catch(Exception ex)
            {
                logger.info(String.format("param: value=%s", (value==null)?"<NULL>":value.toString()));
                logger.info(String.format("param: defaultValue=%s", String.valueOf(defaultValue)));
                logger.error(ex);
            }
        }

        return defaultValue;
    }
}
