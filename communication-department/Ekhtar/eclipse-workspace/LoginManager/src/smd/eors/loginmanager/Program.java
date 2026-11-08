package smd.eors.loginmanager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import smd.eors.dataAccess.entity.master.Login;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataaccess.DataAccess;

public class Program
{   
    public static void main(String[] args)
    {
        //define options
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option logOption=new Option("","log",false,"write processing output log.");

        Options options=new Options();
        options.addOption(zookeeperOption);
        options.addOption(logOption);

        CommandLineParser clp=new BasicParser();

        CommandLine cl;
        try
        {
            cl = clp.parse(options, args);

            //configure  ZooKeeper
            if(cl.hasOption(zookeeperOption.getLongOpt()))
            {
                String zookeeperValue=cl.getOptionValue(zookeeperOption.getLongOpt());
                DataAccess.setZookeeperAddress(zookeeperValue);
                System.out.println("DataAccess zookepper set:"+zookeeperValue);
            }
            
            boolean outputLog=false;
            
            if(cl.hasOption(logOption.getLongOpt()))
                outputLog=true;
            
            Report[] reports=DataAccess.loadReportsByArgs(null, null, null, 0, 0, 0, 0, 0, 0, null, 0);
            List<Login> logins=new ArrayList<Login>(reports.length);
            HashMap<String, Integer> userLogin=new HashMap<String, Integer>(reports.length);
            
            System.out.println(String.format("Output status: %s", outputLog));
            System.out.println(String.format("%s Reports to prossessed...", reports.length));
            
            for(int i=0; i<reports.length; i++) 
            {
                Report report=reports[i];
                int reportHash=getReportHash(report);

                if(reportHash>=0)
                {
                    if(outputLog)
                        System.out.println(String.format("-----(%s) %s has been processed", i, getReportString(report)));

                    if(userLogin.containsKey(report.getUserName()))
                    {
                        if(userLogin.get(report.getUserName())!=reportHash)
                        {
                            logins.add(getLogin(report));

                            if(outputLog)
                                System.out.println(String.format("---{x} %s more has been added...", getLogin(report).toJsonString()));
                            userLogin.replace(report.getUserName(), reportHash);
                        }
                    }
                    else
                    {
                        userLogin.put(report.getUserName(), reportHash);
                        logins.add(getLogin(report));

                        if(outputLog)
                            System.out.println(String.format("---{x} %s new has been founded...", getLogin(report).toJsonString()));     
                    }
                }
                else
                    if(outputLog)
                        System.out.println(String.format("(%s) has empty login info.", report.getUserName()));
            }
            
            
            System.out.println(String.format("%s logins to add...", logins.size()));
            DataAccess.saveBatchLogin(logins.toArray(new Login[0]));
        }
        catch (ParseException ex)
        {
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("hbase-parser", options);
            return;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    private static String getReportString(Report report)
    {
        return String.format("{Publisher: %s, Type: %s, Os: %s, Imei: %s, Imsi: %s, Ssn: %s, mac: %s}",report.getUserName(), report.deviceType, report.osVersion, report.imei, report.imsi, report.simSerialNumber, report.macAddress);
    }
    
    private static int getReportHash(Report report)
    {
        if(report.deviceType!="" || report.imei!="" || report.imsi !="" || report.macAddress!="" || report.simSerialNumber!="" || report.osVersion!="")
        {
            String signature=report.deviceType+report.imei+report.imsi+report.macAddress+report.simSerialNumber+report.osVersion;
            return signature.hashCode();
        }
        else
            return -1;  
    }
    
    private static Login getLogin(Report report)
    {
        Login login=new Login();
        
        login.setCellCoordinate(report.getCellCoordinate());
        login.setDate(report.getDate());
        login.setEs(report.getUserNode());
        login.setGpsCoordinate(report.getGpsCoordinate());
        login.setGpsDate(report.getGpsDate());
        login.setImei(report.imei);
        login.setImsi(report.imsi);
        login.setMac(report.macAddress);
        login.setOs(report.osVersion);
        login.setProvider("XMPP");
        login.setPublisher(report.getUserName());
        login.setSsn(report.simSerialNumber);
        login.setType(report.deviceType);
        
        int startBracket=report.osVersion.indexOf('(');
        int endBracket=report.osVersion.indexOf(')');
        
        if(report.osVersion!=null && startBracket>=0 && endBracket>=0)
        {
            String version=report.osVersion.substring(startBracket+1, endBracket);
            login.setVersion(version);
        }
        else
            login.setVersion("1.0.0.0");
        
        return login;
    }
}