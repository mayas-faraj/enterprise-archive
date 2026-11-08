package smd.eors.dataparser;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.OptionGroup;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.hadoop.hbase.filter.Filter;

import smd.eors.dataAccess.entity.master.Command;
import smd.eors.dataAccess.entity.master.Command2;
import smd.eors.dataAccess.entity.master.Navigation;
import smd.eors.dataAccess.entity.master.Report;
import smd.eors.dataAccess.entity.master.User;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.DataAdapter;
import smd.eors.mediaprocessor.MediaDownloader;
import smd.eors.mediaprocessor.MediaManager;
import smd.log.LogStream;

public class Program
{  
    public static void main(String[] args)
    {             
        //args="--file-source --input /storage/eors/tmp --zookeeper localhost --log /logs/parserxxx.log".split(" ");
        //args="--table-source --log /logs/parserxxx.log".split(" ");

        //define options
        Option fileSourceOption=new Option("","file-source", false,"Set the file as data input.");
        Option tableSourceOption=new Option("","table-source", false,"Set the hbase realtime table as data input.");
        Option filePathSourceOption=new Option("", "input", true, "The path of the input directory that contains input files.");
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option truncateOption=new Option("","truncate", false, "Truncate the table after parsing.");
        Option upgradeCommnad=new Option("","upgrade-command", false, "Upgrade command table to V19."); 
        Option logOption=new Option("l","log",true,"The path of the output log file.");
 
        OptionGroup sourceOptions=new OptionGroup();
        
        sourceOptions.addOption(fileSourceOption);
        sourceOptions.addOption(tableSourceOption);
        sourceOptions.addOption(upgradeCommnad);
        sourceOptions.setRequired(true);
        
        Options options=new Options();
        options.addOptionGroup(sourceOptions);
        options.addOption(filePathSourceOption);
        options.addOption(zookeeperOption);
        options.addOption(truncateOption);
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
                String zookeeperAddress=cl.getOptionValue(zookeeperOption.getLongOpt());
                MediaManager.setZookeeperAddress(zookeeperAddress);
                DataAccess.setZookeeperAddress(zookeeperAddress);
                System.out.println("DataAccess and MediaManager zookepper set:"+zookeeperAddress);
            }
            
            if(cl.hasOption(upgradeCommnad.getLongOpt()))
            {
                Command2[] commands2=DataAdapter.loadCommands2();
                
                for(int i=0; i<commands2.length;i++)
                {
                    System.out.println(commands2[i].toShortJsonString());
                    
                    Command command=new Command(commands2[i].getAdmin(), commands2[i].getText(), commands2[i].getEs(), commands2[i].getTimestamp());
                    command.setReaders(commands2[i].getReaders());
                    DataAccess.saveCommand(command);
                }
            }
            
            if(cl.hasOption(fileSourceOption.getLongOpt()))
            {
                //process the files in the input directory
                String inputPath=cl.getOptionValue(filePathSourceOption.getLongOpt());

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
                                            
                                            //report microsend timestamp fix
                                            processTime(report);

                                            //report words processing
                                            processWords(report);
                                            
                                            //media processing
                                            processMedia(report);
      
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
                                    if(cl.hasOption(truncateOption.getLongOpt()))
                                    {
                                        System.out.println("truncating real time report table...");
                                        DataAccess.truncateRealtimeReports();
                                    }
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
                                    if(cl.hasOption(truncateOption.getLongOpt()))
                                    {
                                        System.out.println("truncating real time navigation table...");
                                        DataAccess.truncateRealtimeNavigation();
                                    }
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
            else if(cl.hasOption(tableSourceOption.getLongOpt()))
            {
                Report[] inputReports=DataAdapter.loadReports(null, null, false, "", (Filter)null);
                
                //try
                //{
                long ts, rts;
                long differ=1000*60;

                for(int i=0;i<inputReports.length;i++)
                {
                    ts=inputReports[i].getTimestamp();
                    rts=inputReports[i].getReceivedTimestamp();

                    if(rts==0 || (Math.abs(ts-rts)>differ))
                    {
                        inputReports[i].setReceivedTimestamp(ts);
                        DataAdapter.saveReport(inputReports[i]);
                    }
                }
                /*
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
                }
                */
 
            
                /*
                Login[] logins=DataAdapter.loadLogin(null, null, true, (Filter[])null);
                System.out.println(String.format("%s reports to process.", logins.length));
                
                for(int i=0; i<logins.length; i++)
                {
                    
                    logins[i].setRealtime(false);
                    logins[i].setRowKey(logins[i].designRowKey());

                    System.out.println(logins[i].toJsonString());
                }
                
                for(int i=0; i<logins.length; i++)
                {
                    DataAdapter.saveLogin(logins[i]);
                }
                */
                 /*
                //processing reports
                System.out.println("Reading reports...");
                Report[] reports=DataAdapter.loadReports(null, null, true, null, (Filter[])null);
                System.out.println(String.format("%s reports to process.", reports.length));
                
                for(int i=0; i<reports.length; i++)
                {
                    
                    reports[i].setRealtime(false);
                    
                    //report words processing
                    processWords(reports[i]);
                    
                    //media processing
                    processMedia(reports[i]);
                    
                    System.out.println(reports[i].toJsonString());
                }
                
                System.out.println("Saving the reports");
                
                for(int i=0; i<reports.length; i++)
                {
                    DataAdapter.saveReport(reports[i]);
                }
                
                if(cl.hasOption(truncateOption.getLongOpt()))
                {
                    System.out.println("truncating real time report table...");
                    DataAccess.truncateRealtimeReports();
                }
                */
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
    private static void processWords(Report report)
    {
        if(report.getText()!=null && !report.getText().equals(""))
        { 
            String[] words=WordProcessor.getKeywords(report.getText());
            report.setKeyword(WordProcessor.joinWords(words));

            //process text to calculate matching for every dictionary
            report.setClassifies(WordProcessor.getClassification(words));

            //calculate importance
            report.setImportance(WordProcessor.calculateImportance(report.getClassifies(), words.length));
        }
    }
    
    private static void processTime(Report report)
    {
        if((String.valueOf(report.getReceivedTimestamp())).length()==16)
            report.setReceivedTimestamp(report.getReceivedTimestamp()/1000);
    }
    
    private static void processMedia(Report report)
    {
        if(report.getAttachments()!=null && !report.getAttachments().equals("")) 
        {
            String attachmentFiles="";
            for(String attachment: report.getAttachments().split(";"))
                if(!attachment.equals(""))
                {
                    byte[] content=null;
                    
                   
                    try
                    {
                        content=MediaDownloader.getContent(attachment);
                        MediaManager.FileAddress fileAddress = MediaManager.write(attachment, content);
                        attachmentFiles+=fileAddress.toString()+";";
                    }
                    catch (KeyManagementException | NoSuchAlgorithmException
                            | IOException e)
                    {
                        System.out.println("Error while writing or downloading content");
                        e.printStackTrace();
                    }
                    catch (IllegalArgumentException e)
                    {
                        System.out.println("Error while writing or downloading content");
                        e.printStackTrace();
                    }
                    catch (URISyntaxException e)
                    {
                        System.out.println("Error while writing content");
                        e.printStackTrace();
                    }
                }
            
            report.setAttachmentFiles(attachmentFiles);             
        }
    }
    
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