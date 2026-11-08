package smd.eors.jaxws;
 
import javax.xml.ws.Endpoint;
import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.json.JSONObject;

import smd.eors.dataaccess.DataAccess;
import smd.eors.mediaprocessor.MediaManager;


public class ServerPublisher
{
    public static void main(String[] args)
    {    
        //ServerImplement sv=new ServerImplement();
        //sv.setReportSeen(reportId, "1", "1", (new Date()).getTime()
        //System.out.println(sv.findStatistic("reportDistribution", "ehq"));
        //System.out.println(sv.findCommand("es-hard", "7ffffe96463d39130001882e"));
        //print(sv.loadReportsById("es-hard", "es-hard*1544613126248"));
        //System.out.println(sv.findReport("es-hard", "7ffffe9646613b482ef704d6"));
        //System.out.println(sv.loadReportsById("es-hard", "es-hard*1544383870018")[0]);
        //System.out.println(sv.setCommandRead("7ffffe9646613b482ef704d6", "", "10000"));
        // System.out.println(sv.setReportSeen("", "7ffffe9646613b482ef704d6", "1", "0", "1000"));
        //System.out.println(sv.saveReportComment("", "7ffffe962196e3730a98b21c", "1", "====ehq2===", "1000"));
        //print(sv.loadReportsByArgs("", "", "0", "", "", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "", "100"));
        //print(sv.loadLogin(null, "933924361", "", "0"));
        //print(sv.loadReportsCommand("","930000002;930000001;","7ffffe987cfad71ca5bd92aa","ع","0","0"));
        //System.out.println(sv.setCommandRead("0001882e00000000cc387d0b7ffffea1f3a3aebf00000000", "user2", "1544881111001"));
        //print(sv.loadCommands("", "", "0", "0", "", "5"));


        //args="--domain localhost --port 7778 --log /logs/hbase_file.txt --z localhost --test".split(" ");
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
                MediaManager.setZookeeperAddress(cl.getOptionValue(zookeeperOption.getOpt()));
                System.out.println("Quorum peer Address: "+cl.getOptionValue(zookeeperOption.getOpt()));
            }
            else
                DataAccess.setZookeeperAddress(""); 
            
            if(cl.hasOption(testOption.getLongOpt()))
            {
                ServerImplement serv=new ServerImplement(); 
                String[] ls=serv.loadReportsByArgs("", "", "0", "", "", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0","0", "0", "50");
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
        {
            System.out.println(s);
        }
        System.out.println("count: "+ss.length);
    }
    
    public static void printText(String[] ss)
    {
        if(ss==null)
        {
            System.out.println("NULL values");
            return;
        }
         
        for(String s:ss)
        {
            JSONObject json=new JSONObject(s);
            System.out.println(json.getString("text"));
            
            if(json.has("reportAction"))
                System.out.println(json.getJSONArray("reportAction"));
        }
        System.out.println("count: "+ss.length);
    }
}
                                      