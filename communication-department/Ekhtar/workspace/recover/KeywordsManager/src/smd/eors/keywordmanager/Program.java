package smd.eors.keywordmanager;

import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

import khoja.ArabicStemmerKhoja;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.slave.Word;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Program
{

    public static void main(String[] args)
    {
        //args="--path /storage/hadoop/Documents/keywords/final --print -l /logs/keyword_manager.log".split(" ");
        
        Option pathOption=new Option("p", "path", true, "the directory path that contains keyword files.");
        Option zookeeperOption=new Option("z","zookeeper",true,"the ip address of zookeeper.");
        Option logOption=new Option("l","log",true,"the path of the log file.");
        Option printOption=new Option("","print",false,"display output to the console.");

        pathOption.setRequired(true);

        Options options=new Options();
        options.addOption(pathOption);
        options.addOption(zookeeperOption);
        options.addOption(logOption);
        options.addOption(printOption);

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

            khoja.ArabicStemmerKhoja arabicStemmer=new ArabicStemmerKhoja();
            List<String> files=new ArrayList<String>();

            DirectoryStream<Path> stream = Files.newDirectoryStream(Paths.get(cl.getOptionValue(pathOption.getOpt())));

            for (Path entry : stream)
                files.add(entry.toString());

            //for each file
            for(String fileName:files)
            {
                Keyword keyword=new Keyword(Paths.get(fileName).getFileName().toString());

                Path path=Paths.get(fileName);

                List<String> lines=Files.readAllLines(path);  
                List<Word> words=new ArrayList<Word>();

                //for each line
                for(String line:lines)
                {

                    String name;
                    float weight=0;

                    if(line!=null && !line.trim().equals(""))
                    {
                        //separate key \t weight
                        if(line.indexOf('\t')>0)
                        {
                            name=line.substring(0,line.indexOf('\t'));
                            weight=Float.parseFloat(line.substring(line.indexOf('\t')+1));
                        }
                        else
                        {
                            name=line;
                            weight=0.1f;
                        }

                        //stemming word
                        try
                        {
                            name=arabicStemmer.stem(name);
                        }
                        catch(Exception ex)
                        {
                            System.err.println("Error stemming word "+name);
                        }
                        
                        words.add(new Word(keyword, name, weight));
                    }
                }
                
                keyword.setActive(true);
                keyword.setWords(words.toArray(new Word[0]));
                keyword.setRowKey(new byte[0]);

                if(cl.hasOption(printOption.getLongOpt()))
                {
                    System.out.println(keyword.toJsonString());
                    System.out.println(SlaveEntity.toJsonStringArray(keyword.getWords()));
                }
                
                //critical operation
                DataAccess.saveKeyword(keyword);
                
                if(cl.hasOption(printOption.getLongOpt()))
                {
                    System.out.println(keyword.getName()+" added to hbase.\n");       
                }
            }
            
            //display saved result
            if(cl.hasOption(printOption.getLongOpt()))
            {
                Keyword[] keywords=DataAccess.loadKeyword();
                
                for(Keyword kw:keywords)
                {
                    System.out.println(kw.toJsonString());
                    System.out.println(SlaveEntity.toJsonStringArray(kw.getWords()));
                }
            }
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
}
