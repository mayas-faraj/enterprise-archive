package smd.eors.datastripper;

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
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.mapreduce.Job;

import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.DataSchema;
import smd.eors.datastripper.DataStripper.MapStripper;
import smd.eors.datastripper.DataStripper.ReduceStripper;


public class Program
{
    //public functions region
    public static void main(String[] args)
    { 
        //args="--log --strip-command".split(" ");
        
        //define options
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option countReduceOption=new Option("n","count-reduce-tasks",true,"the count of reduce tasks.");
        Option differenceTimestampOption=new Option("t","difference-timestamp",true,"the maximum difference of timestmap between reports to delete (ms).");
        Option outputLogOption=new Option(null,"log",false,"log the changes of rows");
        Option noExecuteOption=new Option(null,"no-execute",false,"perform operation without change the data");
        
        Option stripReplicationOption=new Option("r","strip-replication",false,"perform removing duplication lines on data.");
        Option stripInvalidCommandOption=new Option("c","strip-command",false,"perform removing  invalid command links.");
        Option stripInvalidMediaOption=new Option("m","strip-media",false,"perform removing invalid media offset.");  
        
        Options options=new Options();
        options.addOption(zookeeperOption);
        options.addOption(countReduceOption);
        options.addOption(differenceTimestampOption);
        options.addOption(outputLogOption);
        options.addOption(noExecuteOption);
        options.addOption(stripReplicationOption);
        options.addOption(stripInvalidCommandOption);
        options.addOption(stripInvalidMediaOption);
        
        CommandLineParser clp=new BasicParser();
        CommandLine cl;
        
        try
        {
            cl = clp.parse(options, args);
            
            if(!(cl.hasOption(stripReplicationOption.getLongOpt()) ||
                 cl.hasOption(stripInvalidCommandOption.getLongOpt()) ||
                 cl.hasOption(stripInvalidMediaOption.getLongOpt())))
                throw new ParseException(String.format("at least one of these options is required, %s, %s, %s.", stripReplicationOption.getLongOpt(), stripInvalidCommandOption.getLongOpt(), stripInvalidMediaOption.getLongOpt()));

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
                    DataAccess.setZookeeperAddress(zookeeperAddress);
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
            if(cl.hasOption(differenceTimestampOption.getLongOpt()))
            {
                Program.differenceTimestamp=Integer.parseInt(cl.getOptionValue(differenceTimestampOption.getLongOpt()));
                System.out.println("difference timestamp set:"+differenceTimestamp);
            }
            else
                Program.differenceTimestamp=60*60*1000;
            
            Program.noExecute=cl.hasOption(noExecuteOption.getLongOpt());
            Program.outputLog=cl.hasOption(outputLogOption.getLongOpt());
            
            Program.stripReplication=cl.hasOption(stripReplicationOption.getLongOpt());
            Program.stripInvalidCommand=cl.hasOption(stripInvalidCommandOption.getLongOpt());
            Program.stripInvalidMedia=cl.hasOption(stripInvalidMediaOption.getLongOpt());  

            Job job;
            try
            {
                job = Job.getInstance(configuration, "StatisticsEngine");
                job.setJarByClass(DataStripper.class);

                Scan scan=new Scan();
                scan.setCaching(500);
                scan.setCacheBlocks(false);

                TableMapReduceUtil.initTableMapperJob(DataSchema.REPORT_TABLE, scan, MapStripper.class, ImmutableBytesWritable.class, ImmutableBytesWritable.class, job);
                TableMapReduceUtil.initTableReducerJob(DataSchema.REPORT_TABLE, ReduceStripper.class , job);
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
            ex.printStackTrace();
            
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("data-stripper", options);
            return;
        }
    }
    
    //public fields region
    public static long differenceTimestamp;
    public static boolean outputLog;
    public static boolean noExecute;
    
    public static boolean stripReplication;
    public static boolean stripInvalidCommand;
    public static boolean stripInvalidMedia;
}
