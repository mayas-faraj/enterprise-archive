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

import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataaccess.DataAccess;
import smd.eors.mediaprocessor.MediaDownloader;
import smd.eors.mediaprocessor.MediaManager;
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
                    String extension=LocalFileAccess.getFileExtension(file);
                    writeLog("processing the file %s.",file);

                    //read all lines
                    String[] lines=LocalFileAccess.readLines(file);
                    writeLog("fetching the content of the file %s",file);

                    if(lines!=null)
                    {
                        System.out.println("Record to process: "+String.valueOf(lines.length));  

                        switch(extension)
                        {
                            case "report":
                            {
                                System.out.println("Report: "+String.valueOf(lines.length));

                                //process for each line
                                int phaseCount=lines.length/CHACHE_SIZE;
    
                                if(lines.length%CHACHE_SIZE!=0) phaseCount++;
    
                                //for each phase depending on line size
                                for(int phase=0;phase<phaseCount;phase++)
                                {
                                    //list of report each phase
                                    List<Report> reportList=new ArrayList<Report>(CHACHE_SIZE);
                                    int errorCount=0;
                                    //for each line in the phase
                                    for(int i=CHACHE_SIZE*phase;i<(CHACHE_SIZE*phase)+CHACHE_SIZE && i<lines.length;i++)
                                    {
                                        String line=lines[i];
 
                                        Report report=new Report();

                                        try
                                        {
                                            report.fromJsonString(line); 
                                        }
                                        catch(Exception ex)
                                        {
                                            System.out.println("Error while parsing: "+line);
                                            ex.printStackTrace();
                                            errorCount++;
                                        }

                                        //report words processing
                                        if(report.getText()!=null && !report.getText().equals(""))
                                        { 
                                            String[] words=WordProcessor.getKeywords(report.getText());
                                            report.setKeyword(WordProcessor.joinWords(words));
    
                                            //process text to calculate matching for every dictionary
                                            report.setClassifies(WordProcessor.getClassification(words));
    
                                            //calculate importance
                                            report.setImportance(WordProcessor.calculateImportance(report.getClassifies(), words.length));
                                        }
                                        
                                        //media processing
                                        if(report.getAttachments()!=null && !report.getAttachments().equals("")) 
                                        {
                                            String attachmentFiles="";
                                            for(String attachment: report.getAttachments().split(";"))
                                                if(!attachment.equals(""))
                                                {
                                                    byte[] content=MediaDownloader.getContent(attachment);
                                                    MediaManager.FileAddress fileAddress = MediaManager.write(attachment, content);
                                                    attachmentFiles+=fileAddress.toString()+";";
                                                }
                                            
                                            report.setAttachmentFiles(attachmentFiles);             
                                        }
                                        
                                        reportList.add(report);
                                    }
    
                                    //saving the list into HBase
                                    if(reportList!=null)
                                    {
                                        boolean result=DataAccess.saveBatchReports(reportList.toArray(new Report[0]));
                                        System.out.println(String.format("Report batch added to hbase in phase (%s) with response (%s) and error parsing count (%s)", phase, result, errorCount));
                                    }
                                }  
                                
                                //truncate reports data
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