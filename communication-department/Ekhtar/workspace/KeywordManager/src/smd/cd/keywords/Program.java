package smd.cd.keywords;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.cli.Option;
import org.apache.commons.cli.OptionBuilder;
import org.apache.commons.cli.OptionGroup;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.HelpFormatter;

import org.apache.hadoop.conf.Configuration;

import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import smd.cd.stemmer.Stemmer;

import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

public class Program
{
    @SuppressWarnings("static-access")
    public static void main(String[] args)
    {
        //CLI options parser
        Option tableOption=OptionBuilder.hasArgs().isRequired().withArgName("table_name").withDescription("The table name in HBase database.").withLongOpt("table").create("t");
        Option stemOption=OptionBuilder.hasArg(false).withDescription("save the word in stem form").withLongOpt("stemming").create();
        Option saveOption=OptionBuilder.hasArg().withArgName("text_file_path").withDescription("Save the values in text file into HBase.").withLongOpt("save").create();
        Option getOption=OptionBuilder.hasArg().withArgName("group_name").withDescription("Get the words that belong to the group from HBase.").withLongOpt("get").create();
        Option listOption=OptionBuilder.hasArg(false).withDescription("List of all keyword groups name.").withLongOpt("list").create(); 
        
        OptionGroup optionGroup=new OptionGroup();
        optionGroup.setRequired(true);
        optionGroup.addOption(saveOption);
        optionGroup.addOption(getOption);
        optionGroup.addOption(listOption);

        Options options=new Options();
        options.addOption(tableOption);
        options.addOption(stemOption);
        options.addOptionGroup(optionGroup);

        CommandLineParser clp=new BasicParser();

        //HBASE table name
        try
        {
            CommandLine cl=clp.parse(options, args);

            //connect to HTable
            TableName tableName=TableName.valueOf(cl.getOptionValue(tableOption.getLongOpt()));
            Connection connection=ConnectionFactory.createConnection();
            Table keywordTable=connection.getTable(tableName);

            if(cl.hasOption(saveOption.getLongOpt()))
            {
                //save CSV file to HBASE

                //read all lines of input file
                FileSystem fs=FileSystem.get(new Configuration());
                FSDataInputStream dis=fs.open(new Path(cl.getOptionValue(saveOption.getLongOpt())));
                BufferedReader br=new BufferedReader(new InputStreamReader(dis));
                List<String> lines=new ArrayList<String>();
                String fileName=(new Path(cl.getOptionValue(saveOption.getLongOpt()))).getName();
                String line;
                while((line=br.readLine())!=null)
                    lines.add(line);

                dis.close();

                
                if(lines.size()>=1)
                {
                    System.out.println("lines count:"+lines.size());
                    Stemmer stemmer=new Stemmer();
                    Put put=new Put(Bytes.toBytes(fileName));
                    put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("n"), Bytes.toBytes(fileName));
                    put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("a"), Bytes.toBytes("true"));
                    String word;
                    
                    //read lines and save  them into database
                    for(int i=0;i<lines.size();i++)
                    {
                        if(cl.hasOption(stemOption.getLongOpt()))
                        {
                            stemmer.setCurrent(lines.get(i));
                            stemmer.stem();
                            word=stemmer.getCurrent();
                        }
                        else
                            word=lines.get(i);
                            
                        put.addColumn(Bytes.toBytes("w"), Bytes.toBytes(word), Bytes.toBytes("1"));
                        System.out.println(String.format("line (%s): %s = (%s)",i,lines.get(i),word));
                    }
                        
                    keywordTable.put(put);
                    keywordTable.close(); 
                }
                else
                {
                    System.out.println("no keyword file rows was founded, exiting the job.");
                }
            }
            else if(cl.hasOption(getOption.getLongOpt()))
            {
                //get words of a specific group
                    try
                    { 
                        Get get= new Get(Bytes.toBytes(cl.getOptionValue(getOption.getLongOpt())));
                        
                        Result result=keywordTable.get(get);
                        
                        for(Cell cell:result.rawCells())
                            System.out.println(String.format("%s (%s)", Bytes.toString(cell.getQualifier()),Bytes.toString(cell.getValue())));
                    }
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
               
            }
            else if(cl.hasOption(listOption.getLongOpt()))
            {
                Scan scan=new Scan();

                ResultScanner rs=keywordTable.getScanner(scan);
                for(Result r:rs)
                    System.out.println(Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("n"))));
            }
        }
        catch(ParseException ex)
        {

            System.out.println(ex.getMessage());
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("mobile-cell-manager.jar", options);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

    }
}
