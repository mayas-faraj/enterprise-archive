package smd.eors.parser;

import smd.cd.stemmer.Stemmer;
import smd.eors.entity.HbaseEntity;
import smd.eors.entity.Cell;
import smd.eors.entity.Report;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.output.MultipleOutputs;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.client.Put; 


public class EorsMap extends Mapper<LongWritable,Text,ImmutableBytesWritable,Put>
{
    public EorsMap()
    {
        stemmer=new Stemmer();
        keywords=new StringBuilder();
        timestamp=(new Date()).getTime();
        
        entity=null;
    }
    
    @Override
    protected void setup(
            Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
            throws IOException, InterruptedException
    {
        Configuration configuration=context.getConfiguration();
        
        //multipleOutputs=new MultipleOutputs<ImmutableBytesWritable, Put>(context);
        
        //define the type of entity
        FileSplit fsFileSplit = (FileSplit) context.getInputSplit();
        String fileName = fsFileSplit.getPath().toString();
        logStream.writeLog("setup...");
        logStream.writeLog(fileName);
        
        int extentionIndex=fileName.lastIndexOf('.');
        
        if(extentionIndex>0)
        {
            logStream.writeLog(fileName.substring(extentionIndex+1));
            
            switch(fileName.substring(extentionIndex+1))
            {
            case "report":
                entity=new Report();
                break;
            case "cell":
                entity=new Cell();
                break;
            default:
                logStream.writeLog("Unsupported file type %s",fileName);
                break;
            }
        }
    
        //get dictionaries
        int dictionaryCount=tryParse(configuration.get("dic_count"),0);
         
        if(dictionaryCount>0)
        {
            dictionaries=new Dictionary[dictionaryCount];
             
            for(int i=0;i<dictionaryCount;i++)
            {     
                String dicPath=configuration.get("dic"+String.valueOf(i+1));
                dictionaries[i]=new Dictionary((new Path(dicPath)).getName(), getDictionaryWords(configuration,dicPath));
            }
        }
        
        //get stop words
        String stopWordsPath=configuration.get("stopwords");
          
        if(stopWordsPath!=null && stopWordsPath!="")
        {      
            String[] words=readAllLines(configuration,stopWordsPath);   
            Files.write(Paths.get("/logs/test.txt"),(String.valueOf(words.length)+" words.\n").getBytes(),StandardOpenOption.APPEND);
            
            stopWords=new HashSet<String>(words.length);
            
            for(String word:words)
                //critical operation
                stopWords.add(word);
        }
    }
    
    @Override
    protected void map(LongWritable key, Text value,
            Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
            throws IOException, InterruptedException
    {  
        if(value==null) 
            return;
        
        if(entity==null)
        {
            logStream.writeLog("Null entity with key: %s and value: %s",key.toString(),value.toString());
            return;
        }
        
        entity.setValueFromJson(timestamp++ ,value.toString()); 
        
        if(entity instanceof Report)
        {
            Report report=(Report)entity;
            
            //calculate coordinate depending on global CGI  
            String location=CellManager.getLocation(report.getCellInfo());
            
            if(location!=null && location!="" && location.indexOf(';')>0)
            {
                report.setCellLongitude(Double.parseDouble(location.substring(0,location.indexOf(';'))));
                report.setCellLatitude(Double.parseDouble(location.substring(location.indexOf(';')+1)));    
            }
            
            //get the keywords to text
            if(report.getText()!=null && report.getText()!="")
            {
                String[] reportWords=report.getText().split("\\W+|w{0,2}");
                
                //remove stop words
                if(stopWords!=null)
                    reportWords=removeStopWords(reportWords, stopWords);
                
                //get the stem for each report's word
                keywords.setLength(0);
                for(int i=0;i<reportWords.length;i++)
                {
                    stemmer.setCurrent(reportWords[i]);
                    if(stemmer.stem())
                        reportWords[i]=stemmer.getCurrent();
                    
                    keywords.append(reportWords[i]);
                    
                    if(i!=reportWords.length-1)
                        keywords.append(' ');
                }
                
                report.setKeyword(keywords.toString());
                 
                //process text to calculate matching for every dictionary
                /*
                if(dictionaries!=null)
                    for(Dictionary dic:this.dictionaries)
                    {
                        try
                        {
                            int matching=matchingText(reportWords, dic);
    
                            if(matching>0)
                                put.addColumn(Bytes.toBytes("c"), Bytes.toBytes(dic.getName()), Bytes.toBytes(String.valueOf(matching)));
                        }
                        catch(Exception ex)
                        {
                            ex.printStackTrace();
                        }
                    } 
                    */
            }
        }
        else if(entity instanceof Cell)
        {
            Cell cell=(Cell)entity;
            
            //calculate coordinate depending on global CGI  
            String location=CellManager.getLocation(cell.getCellInfo());
            
            if(location!=null && location!="" && location.indexOf(';')>0)
            { 
                cell.setLongitude(Double.parseDouble(location.substring(0,location.indexOf(';'))));
                cell.setLatitude(Double.parseDouble(location.substring(location.indexOf(';')+1)));    
            }      
        }
        
        Put put=entity.getPut();
        logStream.writeLog("entity: %s, table name: %s",entity.getClass().toString(),Bytes.toString(entity.getTableName().get()));
        context.write(entity.getTableName(), put);
        //multipleOutputs.write(Bytes.toString(entity.getTableName().get()),entity.getTableName(),put);
    }
   
    private int matchingText(String[] words, Dictionary dictionary)
    {
        //precondition: file at dictionaryPath is exist.        
        int matching=0;      
        
        //remove stop words
        if(stopWords!=null)
            words=removeStopWords(words, stopWords);
        
        //process text
        for(String word:words)
            //critical operation
            matching+=dictionary.getWords().getOrDefault(word, 0);
          
        return matching;
        //postcondition: none
    }
      
    private String[] removeStopWords(String[] words, HashSet<String> stopWords)
    {
        //precondition: stopWords is not null
        List<String> result=new ArrayList<String>(words.length);
        
        for(int i=0;i<words.length;i++)
            if(!stopWords.contains(words[i]))
                //critical operation
                result.add(words[i]);
        
        return result.toArray(new String[0]);
    }
    
 
    private HashMap<String,Integer> getDictionaryWords(Configuration configure,String path)
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
    
    private String[] readAllLines(Configuration configure, String path)
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
    
    private int tryParse(String value,int defaultValue)  
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
    private HbaseEntity entity;
    private Stemmer stemmer;
    private StringBuilder keywords;
    private long timestamp;
    private Dictionary[] dictionaries;
    private HashSet<String> stopWords;
    private LogStream logStream=new LogStream("/logs/log.txt");
    //private MultipleOutputs<ImmutableBytesWritable, Put> multipleOutputs;
}
