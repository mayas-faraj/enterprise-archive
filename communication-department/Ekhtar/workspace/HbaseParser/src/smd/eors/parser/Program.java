package smd.eors.parser;

import smd.eors.entity.HbaseEntity;
import smd.eors.entity.HbaseSchema;
import smd.eors.entity.Report;
import smd.eors.entity.CellGroup;

import smd.cd.stemmer.Stemmer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Table;


public class Program
{
    public static void main(String[] args)
    {
        
        //define options
        Option inputOption=new Option("", "input", true, "The path of the input directory that contains input files.");
        Option stopwordOption=new Option("s","stopwords",true,"The path of the stopwords file");
        Option keywordOption=new Option("k", "keywords", true, "The path of the directory that consists keywords files.");
        Option logOption=new Option("l","log",true,"The path of the output log file.");
        
        inputOption.setRequired(true);
        keywordOption.setOptionalArg(true);
        
        Options options=new Options();
        options.addOption(inputOption);
        options.addOption(stopwordOption);
        options.addOption(keywordOption);
        options.addOption(logOption);
        
        CommandLineParser clp=new BasicParser();
        
        CommandLine cl;
        try
        {
            cl = clp.parse(options, args);
        }
        catch (ParseException ex)
        {
            ex.printStackTrace();
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("hbase-parser", options);
            return;
        }
      
        try
        {
            //define log stream
            if(cl.hasOption(logOption.getLongOpt()))
                logStream=new LogStream(cl.getOptionValue(logOption.getLongOpt()));
            else
                logStream=new LogStream("/logs/hbase-parser.log");
            
            //initialize
            Configuration configuration=new Configuration();
            FileSystem fileSystem =null;
            
            try
            {
                fileSystem = FileSystem.get(configuration);
            }
            catch (IOException ex)
            {
                logStream.writeLog(ex);
                ex.printStackTrace();
            }
            
            Dictionary[] dictionaries=new Dictionary[0];
            HashSet<String> stopwords=new HashSet<String>();
            
            
             
            //load dictionaries
            if(cl.hasOption(keywordOption.getLongOpt()))
            {
                String[] paths=cl.getOptionValues(keywordOption.getLongOpt());
                
                if(paths!=null)
                {
                    dictionaries=new Dictionary[paths.length];
                    for(int i=0;i<dictionaries.length;i++)
                        if(fileSystem.exists(new Path(paths[i])))
                        {
                            dictionaries[i]=new Dictionary((new Path(paths[i])).getName(), getDictionaryWords(configuration,paths[i]));
                            logStream.writeLog("keywords has been read, %s words.",String.valueOf(dictionaries[i].getWords().size()));
                            
                        }
                        else
                            logStream.writeLog("invalid dictionary path: %s",paths[i]);
                }      
            }
            
            //get stop words
            if(cl.hasOption(stopwordOption.getLongOpt()))
            {
                String stopwordsPath=cl.getOptionValue(stopwordOption.getLongOpt());
                
                if(fileSystem.exists(new Path(stopwordsPath)))
                {
                    String[] words=readAllLines(configuration,stopwordsPath);   
                    logStream.writeLog("stopwords has been read, %s words.",String.valueOf(words.length));
                    
                    stopwords=new HashSet<String>(words.length);
                    
                    for(String word:words)
                        //critical operation
                        stopwords.add(word);
                }
                else
                    logStream.writeLog("invalid dictionary path: %s",stopwordsPath);
            }
            
            //process the files in the input directory
            String inputPath=cl.getOptionValue(inputOption.getLongOpt());
            Connection connection=ConnectionFactory.createConnection(configuration);
            Table reportTable=connection.getTable(TableName.valueOf(HbaseSchema.REPORT_TABLE));
            Table userTable=connection.getTable(TableName.valueOf(HbaseSchema.USER_TABLE));
            StringBuilder keywords=new StringBuilder();
            Stemmer stemmer=new Stemmer();
            long timestamp=(new Date()).getTime();
            
            if(fileSystem.exists(new Path(inputPath)))
            {
                HbaseEntity entity=null;
                
                //for each file
                for(FileStatus fs:fileSystem.listStatus(new Path(inputPath)))
                {
                    String filePath=fs.getPath().toString();
                    logStream.writeLog("Process the file: %s",filePath);
                    
                    //detect the type of file
                    int extentionIndex=filePath.lastIndexOf('.');
                    
                    if(extentionIndex>0)
                    { 
                        switch(filePath.substring(extentionIndex+1))
                        {
                        case "report":
                            entity=new Report();
                            break;
                        case "cell":
                            entity=new CellGroup();
                            break;
                        default:
                            logStream.writeLog("Unsupported file type %s",filePath);
                            logStream.writeLog("continue");
                            continue;
                        }
                    }
                    
                    //read all lines of the file
                    Path inputFilePath=new Path(filePath);
                    BufferedReader br=new BufferedReader(new InputStreamReader(fileSystem.open(inputFilePath)));
                    
                    try 
                    {
                        String line;
                        while ((line=br.readLine()) != null)
                        {
                            logStream.writeLog("parsing...");
                            entity.setValueFromJson(timestamp++ ,line); 
                            logStream.writeLog("parsed");
                            //special processing for entity type
                            if(entity instanceof Report)
                            {
                                Report report=(Report)entity;
                                
                                //calculate coordinate depending on global CGI  
                                String location=CellManager.getLocation(report.getCellInfo());
                                
                                if(location!=null && location!="" && location.indexOf(';')>0)
                                {
                                    report.setCellLongitude(Double.parseDouble(location.substring(0,location.indexOf(';'))));
                                    report.setCellLatitude(Double.parseDouble(location.substring(location.indexOf(';')+1)));
                                    
                                    logStream.writeLog("report location set.");
                                }
                                
                                //get the keywords to text
                                if(report.getText()!=null && report.getText()!="")
                                {
                                    String[] reportwords=report.getText().split("\\W+|w{0,2}");
                                    
                                    //remove stop words
                                    if(stopwords!=null)
                                        reportwords=removeStopWords(reportwords, stopwords);
                                    
                                    //get the stem for each report's word
                                    keywords.setLength(0);
                                    for(int i=0;i<reportwords.length;i++)
                                    {
                                        stemmer.setCurrent(reportwords[i]);
                                        if(stemmer.stem())
                                            reportwords[i]=stemmer.getCurrent();
                                        
                                        keywords.append(reportwords[i]);
                                        
                                        if(i!=reportwords.length-1)
                                            keywords.append(' ');
                                    }
                                    
                                    report.setKeyword(keywords.toString());
                                     
                                    //process text to calculate matching for every dictionary
                                    if(dictionaries!=null)
                                        for(Dictionary dic:dictionaries)
                                        {
                                            try
                                            {
                                                int matching=matchingText(reportwords, dic);
                        
                                                if(matching>0)
                                                    report.getCategories().put(dic.getName(), matching);
                                            }
                                            catch(Exception ex)
                                            {
                                                ex.printStackTrace();
                                            }
                                        }
                                    
                                    //calculate importance
                                    if(report.getKeyword()!=null && report.getKeyword()!=" ")
                                    {
                                        int sum=0;
                                        float importance;
                                        for(String key:report.getCategories().keySet())
                                            sum+=report.getCategories().get(key);
                                        
                                        
                                        importance=sum/report.getKeyword().split(" ").length;
                                        report.setImportance(importance);
                                    }
                                }
                                
                                reportTable.put(report.getPut());
                            }
                            else if(entity instanceof CellGroup)
                            {
                                logStream.writeLog("entity cell processing");
                                CellGroup cell=(CellGroup)entity;
                                
                                //calculate coordinate depending on global CGI  
                                String location=CellManager.getLocation(cell.getCells()[0].getCellInfo());
                                
                                if(location!=null && location!="" && location.indexOf(';')>0)
                                { 
                                    cell.getCells()[0].setLongitude(Double.parseDouble(location.substring(0,location.indexOf(';'))));
                                    cell.getCells()[0].setLatitude(Double.parseDouble(location.substring(location.indexOf(';')+1))); 
                                    logStream.writeLog("cell location set.");
                                } 
                                
                                userTable.put(cell.getPut());
                            }
                            
                            logStream.writeLog("addedentity");
                        }
                    }
                    catch(Exception ex)
                    {
                       logStream.writeLog(ex);
                    }
                    finally 
                    {
                        // you should close out the BufferedReader
                        br.close();
                    }   
                }
            }
            else
                logStream.writeLog("invalid input path: %s",inputPath);       
        }
        catch (Exception ex)
        {
            //logStream.writeLog(ex);
            ex.printStackTrace();
        }
    }
    
    private static int matchingText(String[] reportwords, Dictionary dic)
    {
        // TODO Auto-generated method stub
        return 0;
    }

    //private functions region
    private static String[] removeStopWords(String[] words, HashSet<String> stopWords)
    {
        //precondition: stopWords is not null
        List<String> result=new ArrayList<String>(words.length);
        
        for(int i=0;i<words.length;i++)
            if(!stopWords.contains(words[i]))
                //critical operation
                result.add(words[i]);
        
        return result.toArray(new String[0]);
    }
    
    private static HashMap<String,Integer> getDictionaryWords(Configuration configure,String path)
    {
        //precondition: none
        try
        {
            String[] words=readAllLines(configure, path);
     
            HashMap<String,Integer> dictionary=new HashMap<String,Integer>(words.length);
           
            for(String word:words)
            {
                word=word.trim().toLowerCase();
                
                if(word!="")
                {
                    int seperatorIndex=word.indexOf(';');
                    
                     //critical operation
                    if(seperatorIndex>=0)
                        dictionary.put(word.substring(0, seperatorIndex), tryParse(word.substring(seperatorIndex+1),1));
                    else
                        dictionary.put(word, 1);
                }  
            }
            
            return dictionary;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            logStream.writeLog(ex);
            return null;
        }
        //postcondition: none
    }
    
    private static String[] readAllLines(Configuration configure, String path)
    {
        try
        {
            FileSystem fs=FileSystem.get(configure);
            FSDataInputStream dis=fs.open(new Path(path));
            BufferedReader br=new BufferedReader(new InputStreamReader(dis));
            List<String> lines=new ArrayList<String>();
            String line;
            while((line=br.readLine())!=null)
                lines.add(line);
            
            dis.close();
            
            return lines.toArray(new String[0]);
        }
        catch(Exception ex)
        {
            logStream.writeLog(ex);
            return null;
        }
    }
    
    private static int tryParse(String value,int defaultValue)  
    {
        try
        {
            return Integer.parseInt(value);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            logStream.writeLog(ex);
            return defaultValue;
        }
    }

    //private fields region
    private static LogStream logStream;
}
