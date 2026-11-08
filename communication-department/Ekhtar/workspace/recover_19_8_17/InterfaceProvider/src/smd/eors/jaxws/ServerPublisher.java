package smd.eors.jaxws;

import java.sql.Date;

import javax.xml.ws.Endpoint;
import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.json.JSONException;

import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.CellLocation;
import smd.eors.dataaccess.DataAccess;

public class ServerPublisher
{
    public static void main(String[] args) throws JSONException
    { 
        //args="--domain 192.168.1.127 --port 7778 --log /logs/hbase_file.txt --z localhost --test".split(" ");
        Option domainOption=new Option("d", "domain", true, "the ip address or domain name which web service should published to.");
        Option portOption=new Option("p","port",true,"the port of the web service");
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option logOption=new Option("l","log",true,"the path of the log file.");
        Option testOption=new Option("","test",false,"test to display users.");
        
        domainOption.setRequired(true);
        portOption.setRequired(true);

        Options options=new Options();
        options.addOption(domainOption);
        options.addOption(portOption);
        options.addOption(zookeeperOption);
        options.addOption(logOption);
        options.addOption(testOption);
        
        CommandLineParser clp=new BasicParser();

        try
        {
            CommandLine cl=clp.parse(options, args); 
   
            if(cl.hasOption(logOption.getLongOpt()))
            {
                DataAccess.setLogFilePath(cl.getOptionValue(logOption.getOpt()));
                System.out.println("Log file path: "+cl.getOptionValue(logOption.getOpt()));
            }
            
            if(cl.hasOption(zookeeperOption.getLongOpt()))
            {
                DataAccess.setZookeeperAddress(cl.getOptionValue(zookeeperOption.getOpt()));
                System.out.println("Quorum peer Address: "+cl.getOptionValue(zookeeperOption.getOpt()));
            }
            
            if(cl.hasOption(testOption.getLongOpt()))
            {
                ServerImplement serv=new ServerImplement(); 
                String[] ls=serv.getReportsByArgs("", "", "", "", "", "0", "0", "0", "0", "0", 0);
                print(ls); 
            }
             
            String url=String.format("http://%s:%s/ws/server",cl.getOptionValue(domainOption.getLongOpt()),cl.getOptionValue(portOption.getLongOpt()));

            Endpoint.publish(url, new ServerImplement());
            System.out.println("Service published to url: "+url);
            System.out.println("operation completed successfully...");
        } 
        catch (ParseException ex)
        {
            System.out.println(ex.getMessage());
            HelpFormatter formatter=new HelpFormatter();
            formatter.printHelp("hbase-interface", options);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    public static void print(String[] ss, int count)
    {
        for(int i=0;i<count && i<ss.length;i++)
            System.out.println(ss[i]);
        System.out.println("count: "+ss.length);
    }
    
    public static void print(String[] ss)
    {
        if(ss==null)
        {
            System.out.println("NULL values");
            return;
        }
        
        for(String s:ss)
            System.out.println(s);
        System.out.println("count: "+ss.length);
    }
}
                                      