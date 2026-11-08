package smd.eors.jaxws;

import javax.xml.ws.Endpoint;
import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

public class ServerPublisher
{

    public static void main(String[] args)
    {

        ServerImplement srv=new ServerImplement();
        String[] ss=srv.getRealtimeReportsByOffset("00");
        print(ss);

        //args="--domain 192.168.1.127 --port 7778 --log /logs/hbase_file.txt".split(" ");

        Option domainOption=new Option("d", "domain", true, "the ip address or domain name which web service should published to.");
        Option portOption=new Option("p","port",true,"the port of the web service");
        Option logOption=new Option("l","log",true,"the path of the log file.");
        
        domainOption.setRequired(true);
        portOption.setRequired(true);
        
        Options options=new Options();
        options.addOption(domainOption);
        options.addOption(portOption);
        options.addOption(logOption);
        
        CommandLineParser clp=new BasicParser();
        
        try
        {
            CommandLine cl=clp.parse(options, args);
              
            if(cl.hasOption(logOption.getLongOpt()))
            {
                ServerImplement.logStream=new LogStream(cl.getOptionValue(logOption.getOpt()));
                HbaseInterface.logStream=new LogStream(cl.getOptionValue(logOption.getOpt()));
                System.out.println("Log file path: "+cl.getOptionValue(logOption.getOpt()));
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
    
    public static void print(String[] ss)
    {
        for(String s:ss)
            System.out.println(s);
        System.out.println("count: "+ss.length);
    }
}
