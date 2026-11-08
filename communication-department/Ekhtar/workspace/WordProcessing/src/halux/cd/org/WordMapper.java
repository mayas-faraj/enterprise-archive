package halux.cd.org;

import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Mapper;

import org.apache.hadoop.hbase.io.ImmutableBytesWritable;

import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;


public class WordMapper extends Mapper<LongWritable,Text,ImmutableBytesWritable,Put>
{
    @Override
    protected void setup(
            Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
    {
        //precondition: none
        
        //get dictionaries
        Configuration configuration=context.getConfiguration();
        int dictionaryCount=Integer.parseInt(configuration.get("dic_count"));
        
        dictionaries=new Dictionary[dictionaryCount];
        
        for(int i=0;i<dictionaryCount;i++)
        {
            String dicPath=configuration.get("dic"+String.valueOf(i+1));
            HashMap<String,Integer> words=getDictionaryWords(dicPath);
            dictionaries[i]=new Dictionary(Paths.get(dicPath).getFileName().toString(), words);
        }
        
        //get stop words
        String stopWordsPath=configuration.get("stopword");
        
        if(stopWordsPath!=null || stopWordsPath!="")
            stopWords=getStopWords(stopWordsPath);
        
    }
    
    @Override
    protected void map(LongWritable key, Text value,
            Mapper<LongWritable, Text, ImmutableBytesWritable, Put>.Context context)
    {
        //precondition: none
        if(value==null || value.toString()=="") return;
        
        String line=value.toString();
        
        //extract report id and report text from a line
        String[] fields=line.split("\\|\\|");
        
        if(fields.length<3) return;
        
        String id=fields[1];
        String text=fields[2];

        //word processing 
        for(Dictionary dic:this.dictionaries)
        {
            int matching=processText(text, dic);
            
            if(matching>0)
            {
                Put put=new Put(Bytes.toBytes(id));
                put.addColumn(Bytes.toBytes("category"), Bytes.toBytes(dic.getName()), Bytes.toBytes(String.valueOf(matching)));
                System.out.println(matching);
                //write output result
                try
                {
                    if(matching>0)
                    {
                        System.out.println(Bytes.toString(hbaseTableName.get()));
                        context.write(hbaseTableName, put);
                    }
                    
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
            }
        }
    }
    
    private int processText(String text, Dictionary dictionary)
    {
        //precondition: file at dictionaryPath is exist.        
        int matching=0;
        
        //split text
        String[] words=text.split("\\s+");
        
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
        
        return (String[])result.toArray();
    }
    
    private HashMap<String,Integer> getDictionaryWords(String path)
    {
        //precondition: none
        try
        {
            List<String> words=Files.readAllLines(Paths.get(path),Charset.forName("UTF-8"));
     
            HashMap<String,Integer> dictionary=new HashMap<String,Integer>(words.size());
           
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
            return null;
        }
        //postcondition: none
    }
    
    private HashSet<String> getStopWords(String path)
    {
        //precondition: none
        try
        {
            List<String> words=Files.readAllLines(Paths.get(path),Charset.forName("UTF-8"));
     
            HashSet<String> stopWords=new HashSet<String>(words.size());
            
            for(String word:words)
                //critical operation
                stopWords.add(word);
            
            return stopWords;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
        //postcondition: none
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
            return defaultValue;
        }
    }
    
    private Dictionary[] dictionaries;
    private HashSet<String> stopWords;
    private ImmutableBytesWritable hbaseTableName=new ImmutableBytesWritable(Bytes.toBytes("report"));
    
    private class Dictionary
    {
        public Dictionary(String name,HashMap<String,Integer> words)
        {
            setName(name);
            setWords(words);
        }
        
        public String getName()
        {
            return name;
        }
        
        public HashMap<String,Integer> getWords()
        {
            return words;
        }
        
        public void setName(String name)
        {
            this.name=name;
        }
        
        public void setWords(HashMap<String,Integer> words)
        {
            this.words=words;
        }
        
        private String name;
        private HashMap<String,Integer> words;
    }
}
