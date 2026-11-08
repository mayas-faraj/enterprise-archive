package smd.eors.parser;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.mapreduce.LoadIncrementalHFiles;

public class Loader
{    
    public static void doBulkLoad(Configuration configuration, String pathToHFile, String tableName) 
    {
        try 
        {  
            Connection connection=ConnectionFactory.createConnection(configuration);
            Table table=connection.getTable(TableName.valueOf(tableName));
            
            configuration.set("mapreduce.child.java.opts", "-Xmx1g");
          
            HBaseConfiguration.addHbaseResources(configuration);        
            LoadIncrementalHFiles loadFfiles = new LoadIncrementalHFiles(configuration);
            
            loadFfiles.doBulkLoad(new Path(pathToHFile), connection.getAdmin(), table, connection.getRegionLocator(table.getName()));
            System.out.println("Bulk Load Completed..");                
        } 
        catch(Exception ex)
        {                       
            ex.printStackTrace();                        
        }               
    }   
}