package smd.eors.statisticsengine;

import java.io.IOException;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Admin;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Scan;

import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;

import smd.eors.dataaccess.DataSchema;
import smd.eors.statisticsengine.StatisticsEngine.MapEngine;
import smd.eors.statisticsengine.StatisticsEngine.ReduceEngine;


public class Program
{

    public static void main(String[] args)
    { 
        //args="-n 4".split(" ");
        
        //define options
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option countReduceOption=new Option("n","count-reduce-tasks",true,"the count of reduce tasks.");
        Option truncateOption=new Option("","truncate",false,"truncate statistics table before add new values.");

        Options options=new Options();
        options.addOption(zookeeperOption);
        options.addOption(countReduceOption);
        options.addOption(truncateOption);

        CommandLineParser clp=new BasicParser();

        CommandLine cl;
        try
        {
            cl = clp.parse(options, args);

            Configuration configuration=HBaseConfiguration.create();
            
            configuration.addResource(new Path("/ecosystem/hadoop/etc/hadoop/hdfs-site.xml"));
            configuration.addResource(new Path("/ecosystem/hadoop/etc/hadoop/core-site.xml"));
            configuration.addResource(new Path("/ecosystem/hbase/conf/hbase-site.xml"));

            int numReduceTask=1;
            
            //configure ZooKeeper
            if(cl.hasOption(zookeeperOption.getLongOpt()))
            {
                String zookeeperAddress=cl.getOptionValue(zookeeperOption.getLongOpt());

                if(zookeeperAddress!=null && zookeeperAddress!="")
                {
                    configuration.set("hbase.zookeeper.quorum", zookeeperAddress);
                    configuration.set("hbase.zookeeper.property.clientPort", "2181"); 
                }

                System.out.println("Statistics engine zookepper set:"+zookeeperAddress);
            }
            
            //configure number task
            if(cl.hasOption(countReduceOption.getLongOpt()))
            {
                String countOption=cl.getOptionValue(countReduceOption.getLongOpt());
                
                numReduceTask=Integer.parseInt(countOption);
                System.out.println("Reducer count set:"+countOption);
            }
            
            //truncate statistics table
            if(cl.hasOption(truncateOption.getLongOpt()))
            {
                try
                {
                    Connection connection = ConnectionFactory.createConnection(configuration);
                    Admin admin=connection.getAdmin();
                    TableName name=TableName.valueOf(DataSchema.STATISTICS_TABLE);

                    admin.disableTable(name);
                    admin.truncateTable(name, true);   
                }
                catch (IOException ex)
                {
                    ex.printStackTrace();
                }
            }

            Job job;
            try
            {
                job = Job.getInstance(configuration, "StatisticsEngine");
                job.setJarByClass(StatisticsEngine.class);

                Scan scan=new Scan();
                scan.setCaching(500);
                scan.setCacheBlocks(false);

                TableMapReduceUtil.initTableMapperJob(DataSchema.REPORT_TABLE, scan, MapEngine.class, Text.class, IntWritable.class, job);
                TableMapReduceUtil.initTableReducerJob(DataSchema.STATISTICS_TABLE, ReduceEngine.class , job);
                job.setNumReduceTasks(numReduceTask);

                boolean result=job.waitForCompletion(true);

                if(!result)
                    System.out.println("Error with job!");
            }
            catch (IOException | ClassNotFoundException | InterruptedException e)
            {
                e.printStackTrace();
            }
        }
        catch (ParseException ex)
        {
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("hbase-parser", options);
            return;
        }
    }
}
