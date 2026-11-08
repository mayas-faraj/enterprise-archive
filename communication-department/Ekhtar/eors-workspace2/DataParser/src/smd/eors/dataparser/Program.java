package smd.eors.dataparser;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.codehaus.jettison.json.JSONObject;

import com.google.common.collect.Table.Cell;

import smd.eors.dataAccess.entity.master.CoverageCell;
import smd.eors.dataAccess.entity.master.ExtendedReport;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataaccess.DataAccess;
import smd.log.LogStream;

public class Program
{  
    public static void main(String[] args)
    {             
        args="--input /storage/hadoop/temp2 -z localhost --log /logs/parserxxx.log".split(" ");
        
        //define options
        Option inputOption=new Option("", "input", true, "The path of the input directory that contains input files.");
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option logOption=new Option("l","log",true,"The path of the output log file.");

        inputOption.setRequired(true);

        Options options=new Options();
        options.addOption(inputOption);
        options.addOption(zookeeperOption);
        options.addOption(logOption);

        CommandLineParser clp=new BasicParser();

        CommandLine cl;
        try
        {
            cl = clp.parse(options, args);

            //configure log stream
            if(cl.hasOption(logOption.getLongOpt()))
            {
                System.out.println("Setting log to path:"+cl.getOptionValue(logOption.getLongOpt()));
                logStream=new LogStream(cl.getOptionValue(logOption.getLongOpt()));
                DataAccess.setLogFilePath(cl.getOptionValue(logOption.getLongOpt()));
            }

            //configure  ZooKeeper
            if(cl.hasOption(zookeeperOption.getLongOpt()))
            {
                String zookeeperValue=cl.getOptionValue(zookeeperOption.getLongOpt());
                System.out.println("Setting zookeeper address:"+zookeeperValue);
                //LocalFileAccess.setZookeeper(zookeeperValue);
                System.out.println("Fs zookepper set");
                DataAccess.setZookeeperAddress(zookeeperValue);
                System.out.println("DataAccess zookepper set:"+zookeeperValue);
            }

            //process the files in the input directory
            String inputPath=cl.getOptionValue(inputOption.getLongOpt());

            writeLog("Getting the file list........");
            String[] files=LocalFileAccess.getFiles(inputPath);
            writeLog("(%s) files found in directory",files.length);

            if(files!=null)
            { 
                //for each file
                for(String file: files)
                {
                    writeLog("processing the file %s.",file);

                    //read all lines
                    String[] lines=LocalFileAccess.readLines(file);
                    writeLog("fetching the content of the file %s",file);

                    if(lines!=null)
                    {
                        String extension=LocalFileAccess.getFileExtension(file);


                        switch(extension)
                        {
                            case "report":
                            {
                                System.out.println("Report: "+String.valueOf(lines.length));
                                int nullCount=0;
                                int lostCount=0;
                                int zeroCount=0;
                                //process for each line
                                int phaseCount=lines.length/CHACHE_SIZE;
    
                                if(lines.length%CHACHE_SIZE!=0) phaseCount++;
    
                                //for each phase depending on line size
                                for(int phase=0;phase<phaseCount;phase++)
                                {
                                    //list of report each phase
                                    List<ExtendedReport> reportList=new ArrayList<ExtendedReport>(CHACHE_SIZE);
                                    int errorCount=0;
                                    //for each line in the phase
                                    for(int i=CHACHE_SIZE*phase;i<(CHACHE_SIZE*phase)+CHACHE_SIZE && i<lines.length;i++)
                                    {
                                        String line=lines[i];
 
                                        ExtendedReport report=new ExtendedReport();
                                        String cgi=null;
                                        String type=null;
                                        String os=null;
                                        String cid="",lac="";

                                        try
                                        {
                                            report.fromJsonString(line); 
                                            //JSONObject payloadObj = new JSONObject((new JSONObject(line)).getString("payload"));

                                            //cgi=payloadObj.getString("CellInfo");
                                            

                                            if(cgi!=null && !cgi.equals("null"))
                                            {
                                                //type=payloadObj.getJSONObject("Device").getString("Osversion");
                                                //os=payloadObj.getJSONObject("Device").getString("DeviceType");

   
                                                CoverageCell c1=CellProcessor.getCoverageCell("417-01-"+lac+"-"+cid);
                                                CoverageCell c2=CellProcessor.getCoverageCell("417-02-"+lac+"-"+cid);
                                                
                                                //CoverageCell c3=CellProcessor.getCoverageCell(cgi.replace("-01-", "-02-"));
                                                //System.out.println(String.valueOf(c.getLongitude())+','+String.valueOf(c.getLatitude()));
                                                //System.out.println(c1.getLongitude());
                                                if(c1==null && c2==null)
                                                {
                                                    //if(c2==null && c3==null)
                                                     System.out.println("Device:" + report.getDevice().getType() + " (Android "+report.getDevice().getOs()+") [Cgi: "+"417-01-"+lac+"-"+cid+"]."); 
                                                    //else
                                                    //    System.out.println(String.format("Device: %s (Android: %s), [Cgi: %s] [c2(%s, %s), c3(%s, %s)]", type, os, cgi, c2!=null?c2.getLongitude():"null",c2!=null?c2.getLatitude():"null", c3!=null?c3.getLongitude():"null",c3!=null?c3.getLatitude():"null"));
                                                    
                                                    lostCount++;
                                                }
                                                else if(c1.getLongitude()==0 || c1.getLatitude()==0)
                                                    zeroCount++;
                                            }
                                            else
                                                nullCount++;
                                        }
                                        catch(Exception ex)
                                        {
                                            //System.out.println("Error while parsing: "+line);
                                            errorCount++;
                                        }

                                        //report words processing
                                        /*
                                        if(report.getText()!=null && report.getText()!="")
                                        { 
                                            String[] words=WordProcessor.getKeywords(report.getText());
                                            report.setKeyword(WordProcessor.joinWords(words));
    
                                            //process text to calculate matching for every dictionary
                                            report.setClassifies(WordProcessor.getClassification(words));
    
                                            //calculate importance
                                            report.setImportance(WordProcessor.calculateImportance(report.getClassifies(), words.length));
                                        }
                                        
                                        reportList.add(report);
                                        */
                                    }
    
                                    //saving the list into HBase
                                    if(reportList!=null)
                                    {
                                        //boolean result=DataAccess.saveBatchReports(reportList.toArray(new ExtendedReport[0]));
                                        //System.out.println(String.format("Report batch added to hbase in phase (%s) with response (%s) and error parsing count (%s)", phase, result, errorCount));
                                    }
                                }  
                                
                                //truncate reports data
                                
                                System.out.println("null count "+ String.valueOf(nullCount));
                                System.out.println("lost count "+ String.valueOf(lostCount));
                                System.out.println("zero count "+ String.valueOf(zeroCount));
                                System.out.println("truncating real time report table...");
                                DataAccess.truncateRealtimeReports();
                            }
                            break;
                            case "nav":
                            {
                                User user=new User();
                                System.out.println("Nav: "+String.valueOf(lines.length));
                                
                                //process for each line
                                int phaseCount=lines.length/CHACHE_SIZE;
    
                                if(lines.length%CHACHE_SIZE!=0) phaseCount++;
    
                                //for each phase depending on line size
                                for(int phase=0;phase<phaseCount;phase++)
                                {
                                    //list of navigations each phase
                                    List<Location> locationList=new ArrayList<Location>(CHACHE_SIZE);
                                    int errorCount=0;
                                    //for each line in the phase
                                    for(int i=CHACHE_SIZE*phase;i<(CHACHE_SIZE*phase)+CHACHE_SIZE && i<lines.length;i++)
                                    {
                                        String line=lines[i];
                                        Navigation navigation=new Navigation();
                                        if(i==1599)
                                            System.out.print(String.valueOf(i)+'-');

                                        try
                                        {
                                            navigation.fromJsonString(line);
                                        }
                                        catch(Exception ex)
                                        {
                                            System.out.println("Error while parsing: "+line);
                                            navigation=null;
                                            errorCount++;
                                        } 
                                        
                                        user.setName(navigation.getUser());
                                        Location location=new Location(user.designRowKey());
                                        location.setCoordinate(navigation.getCoordinate());
                                        location.setDate(navigation.getDate());
                                        locationList.add(location);
                                    }
    
                                    //saving the list into HBase
                                    if(locationList!=null)
                                    {
                                        boolean result=DataAccess.saveBatchLocations(locationList.toArray(new Location[0]));
                                        System.out.println(String.format("cell navigation batch added to hbase in phase (%s) with response (%s) and error parsing count (%s)", phase, result, errorCount));
                                    }
                                }
                                 
                                //truncate navigation data
                                System.out.println("truncating real time navigation table...");
                                DataAccess.truncateRealtimeNavigation();
                            }
                            break;
                            default:
                            {
                                writeLog("Unsupported file type %s",file);
                                writeLog("continue");
                                continue;
                            }
                        }
                    }   
                }   
            }                    
        }
        catch (ParseException ex)
        {
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("hbase-parser", options);
            return;
        }
        catch (Exception ex)
        {
            writeLog(ex);
            ex.printStackTrace();
        }
    }

    //private static methods region
    private static void writeLog(String text, Object formatArgs)
    {
        if(text!=null)
            text=String.format(text, formatArgs);

        System.out.println(text);

        if(logStream!=null)
            logStream.writeLog(text);
    }

    private static void writeLog(String text)
    {
        writeLog(text, null);
    }

    private static void writeLog(Exception ex)
    {
        ex.printStackTrace();
        writeLog(ex.getMessage());
    }

    //private fields region
    private static LogStream logStream;

    //private static final fields region
    private static final int CHACHE_SIZE=400;

}