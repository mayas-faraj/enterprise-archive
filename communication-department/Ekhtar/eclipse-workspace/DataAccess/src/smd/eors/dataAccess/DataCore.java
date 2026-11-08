package smd.eors.dataaccess;

import smd.eors.dataaccess.entity.Entity;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.NavigableMap;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.coprocessor.AggregationClient;
import org.apache.hadoop.hbase.client.coprocessor.LongColumnInterpreter;
import org.apache.hadoop.hbase.exceptions.DeserializationException;
import org.apache.hadoop.hbase.filter.ByteArrayComparable;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.QualifierFilter;
import org.apache.log4j.Logger;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;

public abstract class DataCore 
{
    //constructors region
    public DataCore(String zookeeperAddress)
    {      
        logger = Logger.getLogger("DataCore");
        Configuration configuration=HBaseConfiguration.create();
      
        //TODO check valid URLs
        configuration.addResource(new Path("/ecosystem/hadoop/etc/hadoop/hdfs-site.xml"));
        configuration.addResource(new Path("/ecosystem/hadoop/etc/hadoop/core-site.xml"));
        configuration.addResource(new Path("/ecosystem/hbase/conf/hbase-site.xml"));
        
        tables=new HashMap<String, Table>();
        
        if(zookeeperAddress!=null && zookeeperAddress!="")
        {
            configuration.set("hbase.zookeeper.quorum", zookeeperAddress);
            configuration.set("hbase.zookeeper.property.clientPort", "2181"); 
        }
        
        try
        {
            connection = ConnectionFactory.createConnection(configuration);
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
            logger.info(String.format("param: zookeeperAddress=%s", zookeeperAddress));
            logger.error(ex);
        } 
    }
    
    public DataCore()
    {
        this("");
    }
    
    //public method region 
    public TableName getTableName(Entity entity)
    {
        return TableName.valueOf(getTable(entity));
    }
    
    public boolean tableExists(Entity entity)
    {
        //precondition: administrator of connection is not null
        if(entity!=null)
        {
            try
            {
                return connection.getAdmin().tableExists(getTableName(entity));
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entity.toString()));
                logger.error(ex);
            }
        }
        
        return true;
        //return: true if table exists or an error occurred, false if the table is not exist
    }
    
    public boolean createTable(MasterEntity entity)
    {
        //precondition: administrator of connection is not null
        if(entity!=null)
        {
            try
            { 
                //critical operation
                connection.getAdmin().createTable(getDescriptor(entity));
                return true;
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entity.toString()));
                logger.error(ex);      
            }
        }
        
        return false;
        //return: true if table is created, false if an error was occurred
    } 
    
    public boolean checkTable(Entity entity)
    {
        //precondition: none
        if(entity!=null)
        {
            if(tables.get(getTable(entity))==null)
            {
                try
                {
                    //create table if not exists
                    if(!tableExists(entity))
                        if(entity instanceof MasterEntity)
                            createTable((MasterEntity)entity);
                        else
                            createTable(getMasterEntity((SlaveEntity)entity));

                    String name=getTable(entity);
                    Table table=connection.getTable(getTableName(entity));
                    
                    //critical operation 
                    tables.put(name, table);
                }
                catch (IOException ex)
                {
                    logger.info(String.format("param: entity=%s", entity.toString()));
                    logger.error(ex);
                    
                    return false;
                }
            }
        }

        return true;
        //return: true if the table exists, and put in list of tables, false if there are an error occurred
    }
    
    public byte[] save(Entity entity)
    {
        //precondition: none
        if(entity!=null && checkTable(entity))
        {
            Table table=tables.get(getTable(entity));

            //row key processing
            if(entity instanceof MasterEntity && entity.getRowKey()==null)
                entity.setRowKey(((MasterEntity)entity).designRowKey());
            else if(entity instanceof SlaveEntity)
            {
                SlaveEntity slave=(SlaveEntity)entity;
                
                if(slave.getRowKey()==null)
                    if(slave.getMasterEntity()!=null && slave.getMasterEntity().getRowKey()!=null)
                        slave.setRowKey(slave.getMasterEntity().getRowKey());
                    else
                    {
                        logger.info(String.format("param: entity=%s", entity.toString()));
                        logger.warn("Slave entity has a null master entity object or it is without row key.");
                        
                        return null;
                    }
            }

            Put put=getPut(entity);

            try
            {
                //critical operation
                table.put(put);
                return put.getRow();
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entity.toString()));
                logger.error(ex);
            }       
        }

        return null;
        //return: true if success, false if entity is null or error on putting entity occurred 
    } 
   
    public boolean saveBatch(Entity[] entities)
    {
        //precondition: the entities are on the same type
        if(entities!=null && entities.length>0 && entities[0]!=null && checkTable(entities[0]))
        {
            Table table=tables.get(getTable(entities[0]));
            List<Put> puts=new ArrayList<Put>(entities.length);
            
            for(Entity entity: entities)
            {
                if(entity instanceof MasterEntity)
                    entity.setRowKey(((MasterEntity)entity).designRowKey());
                else if(entity instanceof SlaveEntity)
                {
                    SlaveEntity slave=(SlaveEntity)entity;
                    
                    if(slave.getRowKey()==null)
                        if(slave.getMasterEntity()!=null && slave.getMasterEntity().getRowKey()!=null)
                            slave.setRowKey(slave.getMasterEntity().getRowKey());
                        else
                        {
                            logger.info(String.format("param: entity=%s", entity.toString()));
                            logger.warn("Slave entity has a null master entity object or it is without row key.");
                            return false;
                        }
                }
              
                puts.add(getPut(entity));
            }
            
            try
            {
                //critical operation
                table.batch(puts, null);

                return true;
            }
            catch (IOException | InterruptedException ex)
            {
                logger.info(String.format("param: entities.length=%s", String.valueOf(entities.length)));
                logger.info(String.format("param: entities[0]=%s", entities[0].toString()));
                logger.error(ex);
            }       
        }
        return false;    
        //return: true if success, false the inputs are invalid or error on putting entity occurred 
    }
    
    public MasterEntity find(MasterEntity entity, Filter filter)
    {
        //precondition: none
        if(entity!=null && checkTable(entity))
        {
            Table table=tables.get(getTable(entity));
            Get get=getGet(entity);
            
            if(filter!=null)
                get.setFilter(filter);
            
            try
            {   
                //critical operation
                Result result=table.get(get);
                
                if(result!=null && !result.isEmpty())  
                     return getResult(entity, result);
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entity.toString()));
                logger.error(ex);
            }     
        }
        
        return null;
        //return: entity object if the entity parameter row key exists, and the entity object will filled from HBase
        //        false if the entity row key is not exist, or an error has been occurred
    }
    
    public MasterEntity find(MasterEntity entity)
    {
        return find(entity, null);
    }
    
    public SlaveEntity find(SlaveEntity entity, byte[] keyQualifier)
    {
        //precondition: none
        if(entity!=null && checkTable(entity))
        {
            Table table=tables.get(getTable(entity));
            Get get=getGet(entity);

            try
            {
                get.setFilter(new QualifierFilter(CompareOp.EQUAL, ByteArrayComparable.parseFrom(keyQualifier)));
            }
            catch (DeserializationException ex)
            {
                logger.info(String.format("param: entity=%s", entity.toString()));
                logger.error(ex);
                return null;
            }

            //get the primary single family from get
            byte[] primaryFamily=null;

            for(byte[] family: get.familySet())
            {
                primaryFamily=family;
                break;
            }

            if(primaryFamily!=null)
            {
                try
                {
                    //critical operation
                    Result result=table.get(get);

                    if(result!=null && !result.isEmpty())
                    {
                        NavigableMap<byte[], byte[]> familyMap=result.getFamilyMap(primaryFamily);
                        
                        if(familyMap!=null)
                            for(byte[] key:familyMap.keySet())
                                if(key!=null)
                                    return entity.fromKeyValue(key, familyMap.get(key));  
                    }
                }
                catch (IOException ex)
                {
                    logger.info(String.format("param: entity=%s", entity!=null?entity.toString():"<NULL>"));
                    logger.error(ex);
                }
            }
        }

        return null;
        //return: entity object if the entity parameter row key exists, and the entity object will filled from HBase
        //        null if the entity row key is not exist, or an error has been occurred
    }
    
    public long count(MasterEntity entityType, byte[] startRow, byte[] stopRow, Filter filter)
    {
        //precondition: none
        if(entityType!=null && checkTable(entityType))
        {
            TableName tableName=TableName.valueOf(getTable(entityType));

            ///setup scan
            Scan scan=new Scan();

            if(startRow!=null)
                scan.withStartRow(startRow);

            if(stopRow!=null)
                scan.withStopRow(stopRow);
 
            //setup filters
            scan.setFilter(filter);

            //perform count
            Configuration configuration=connection.getConfiguration();
            AggregationClient aggregationClient=new AggregationClient(configuration);
            
            try
            {
                //critical operation
                long count = aggregationClient.rowCount(tableName, new LongColumnInterpreter(), scan);
                aggregationClient.close();
                
                return count;
            }
            catch (Throwable ex)
            {
                try
                {
                    aggregationClient.close();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
                
               return -2;
            }
        }
        
        return -1;
    }
    
    public List<MasterEntity> load(MasterEntity entityType, byte[] startRow, byte[] stopRow, Filter filter)
    {
        //precondition: none
        if(entityType!=null && checkTable(entityType))
        {
            Table table=tables.get(getTable(entityType));

            ///setup scan
            Scan scan=new Scan();

            if(startRow!=null)
                scan.withStartRow(startRow);

            if(stopRow!=null)
                scan.withStopRow(stopRow);
 
            //setup filters
            scan.setFilter(filter);

            //perform scan
            ResultScanner resultScanner;
            try
            {
                //critical operation
                resultScanner = table.getScanner(scan);
                
                if(resultScanner!=null)
                {
                    List<MasterEntity> entities=new ArrayList<MasterEntity>();

                    for(Result result: resultScanner)
                    {
                        MasterEntity entity=getResult(entityType, result);
                        
                        if(entity!=null)
                        {
                            //setting time stamp to entity
                            if(result.rawCells()!=null && result.rawCells().length>0)
                                entity.setCellTimpstamp(result.rawCells()[0].getTimestamp());
                            
                            entities.add(entity);
                        }
                    }

                    return entities;
                }
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entityType.toString()));
                logger.info(String.format("param: startRow=%s", startRow==null?"<NULL>":startRow.toString()));
                logger.info(String.format("param: stopRow=%s", stopRow==null?"<NULL>":stopRow.toString()));
                logger.error(ex);
            }
        }
        
        return null;
        //return: true if success, false if table not exists or error on getting entities
    }
      
    
    public List<MasterEntity> load(MasterEntity entityType)
    {
        return load(entityType, null, null, null);
    }
    
    public List<SlaveEntity> load(SlaveEntity entityType, Filter filter)
    {
        //precondition: none
        if(entityType!=null && checkTable(entityType))
        {
            Table table=tables.get(getTable(entityType));

            ///setup get
            Get get=getGet(entityType);
            
             
            //get the primary single family from get
            
            /*
            byte[] primaryFamily=null;

            for(byte[] family: get.familySet())
            {
                primaryFamily=family;
                break;
            }
            */

            //setup filters
            if(filter!=null)
                get.setFilter(filter);

            //perform get operation  
            Result result;

            try
            {
                //critical operation
                result = table.get(get);

                if(result!=null && !result.isEmpty())
                {
                    List<SlaveEntity> entities=new ArrayList<SlaveEntity>();
                    
                    List<Cell> cells=result.listCells();
                    
                    if(cells!=null)
                        for(Cell cell: cells)
                        {
                            SlaveEntity entity=entityType.fromKeyValue(CellUtil.cloneQualifier(cell), CellUtil.cloneValue(cell));
                            entity.setCellTimpstamp(cell.getTimestamp());
                            entities.add(entity);
                        }
                    
                    return entities;
                    /*
                        NavigableMap<byte[], byte[]> familyMap=result.getFamilyMap(primaryFamily);

                        if(familyMap!=null)
                            for(byte[] key:familyMap.keySet())
                                if(key!=null)
                                {
                                    SlaveEntity entity=entityType.fromKeyValue(key, familyMap.get(key));
                                    entities.add(entityType.fromKeyValue(key, familyMap.get(key)));
                                }
                        return entities;
                     */


                }
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entityType=%s", entityType.toString()));
                logger.error(ex);
            }

        }
        return null;
        //return: the list of entity that associated with the entity type row key, or null if an error was occurred 
    }
    
    public List<SlaveEntity> load(SlaveEntity entityType)
    {
        return load(entityType, null);
    }
    
    public List<SlaveEntity> load(SlaveEntity entityType, Result result, byte[] columnFamily, byte[] familyspace)
    {
        byte[] family=getFamily(columnFamily, familyspace);
        NavigableMap<byte[], byte[]> familyMap=result.getFamilyMap(family);
        List<SlaveEntity> entities=new ArrayList<SlaveEntity>();
        
        if(familyMap!=null)
            for(byte[] key:familyMap.keySet())
                if(key!=null)
                    entities.add(entityType.fromKeyValue(key, familyMap.get(key)));
        
        return entities;
    }
    
    public SlaveEntity loadLast(SlaveEntity entityType)
    {
        //precondition: none
        if(entityType!=null && checkTable(entityType))
        {
            Table table=tables.get(getTable(entityType));

            ///setup get
            Get get=getGet(entityType);
            
             
            //get the primary single family from get
            byte[] primaryFamily=null;

            for(byte[] family: get.familySet())
            {
                primaryFamily=family;
                break;
            }

            if(primaryFamily!=null)
            {
                //perform get operation  
                Result result;

                try
                {
                    //critical operation
                    result = table.get(get);

                    if(result!=null && !result.isEmpty())
                    {
                        NavigableMap<byte[], byte[]> familyMap=result.getFamilyMap(primaryFamily);
                        SlaveEntity entity=null;

                        if(familyMap!=null && familyMap.lastKey()!=null)    
                            entity=entityType.fromKeyValue(familyMap.lastKey(), familyMap.get(familyMap.lastKey()));

                        return entity;
                    }
                }
                catch (IOException ex)
                {
                    logger.info(String.format("param: entityType=%s", entityType.toString()));
                    logger.error(ex);
                }
            }
        }
        return null;
        //return: the last entity if success,or null if an error happened while getting entities
    }

    public boolean delete(Entity entity)
    {
        //precondition: entity table exists in HBase
        if(entity!=null && checkTable(entity))
        {
            Table table=tables.get(getTable(entity));
            Delete delete=getDelete(entity);
            
            try
            {
                //critical operation
                table.delete(delete);
                return true;
            }
            catch (IOException ex)
            {
                logger.info(String.format("param: entity=%s", entity!=null?entity.toString():"<NULL>"));
                logger.error(ex);
            }     
        }
        
        return false;
    }
    
    public boolean truncate(MasterEntity entity)
    {
        try
        {
            Admin admin=connection.getAdmin();
            TableName name=getTableName(entity);

            admin.disableTable(name);
            admin.truncateTable(name, true);   
            return true;
        }
        catch (IOException ex)
        {
            logger.info(String.format("param: entity=%s", entity!=null?entity.toString():"<NULL>"));
            logger.error(ex);
            return false;
        }
    }

    public boolean edit(Entity entity)
    {
        //precondition: entity table exists in HBase
        if(checkTable(entity))
        {
            delete(entity);
            save(entity);
            
            return true;
        }
        else
            return false;
        //return: true if success, false if table not exists or error on putting entity
    }
    
    //public abstract method region
    public abstract Put getPut(Entity entity);
    
    public abstract Get getGet(Entity entity);
    
    public abstract Delete getDelete(Entity entity);
    
    public abstract MasterEntity getResult(MasterEntity entityType, Result result);
    
    public abstract HTableDescriptor getDescriptor(MasterEntity entity);
    
    public abstract String getTable(Entity entity);
    
    public abstract byte[] getFamily(byte[] family, byte[] familyspace);
    
    public abstract MasterEntity getMasterEntity(SlaveEntity entityType);
 
    //private fields region
    private Connection connection;
    private HashMap<String, Table> tables;
    
    //protected fields region
    protected org.apache.log4j.Logger logger;
    
}
