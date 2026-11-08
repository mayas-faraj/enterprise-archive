package halux.cd.org;

import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;

import java.nio.file.DirectoryStream;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;

import org.apache.hadoop.fs.Path;

import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

import halux.cd.org.stemmer.Stemmer;

import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2;
import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.client.Put;
 
public class Program extends Configured implements Tool
{
    public static void main(String[] args)
    {       
        try
        {
            //int response=ToolRunner.run(new Configuration(),new Program(), args);
            
            //System.out.println("respones:"+String.valueOf(response));
            Stemmer stemmer=new Stemmer();
            
            String s="معسكرات العدو ممتلكة بالذخائر والسلاح";
            for(String w:s.split("\\s+"))
            {
              stemmer.setCurrent(w);
              stemmer.stem();
              System.out.println(stemmer.getCurrent());
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    @Override
    public int run(String[] args)
    {
        //preconzsdition: none
        args=new String[] {"/storage/hadoop/tmp/keywords"};
        if(args.length==0) return 1;
        
        Configuration configuration=getConf(); 
        
        try
        {
            String dictionaryPath=args[0];
            String bulkInputPath="/storage/hadoop/tmp/bulk";
            String bulkOutputPath="/storage/hadoop/tmp/output217";
            
            //save directories name in configuration
            if(Files.isDirectory(Paths.get(dictionaryPath), LinkOption.NOFOLLOW_LINKS))
            {
                DirectoryStream<java.nio.file.Path> directoryStream=Files.newDirectoryStream(Paths.get(dictionaryPath));
                int directoryCount=0;
                
                for(java.nio.file.Path path:directoryStream)
                {
                    directoryCount++;
                    configuration.set("dic"+String.valueOf(directoryCount), path.toString());                 
                }
                
                configuration.set("stopwords", "/storage/hadoop/tmp/stopwords.txt");
                
                //no directories
                if(directoryCount==0) return 2;
                
                configuration.set("dic_count", String.valueOf(directoryCount));
            }
            else
            {
                configuration.set("dic_count", "1");
                configuration.set("dic1", dictionaryPath);
            }
            
            //Database entity declaration
            Connection connect=ConnectionFactory.createConnection(configuration);
            Table reportTable=connect.getTable(TableName.valueOf("report"));
            
            //job declaration
            Job job=Job.getInstance(configuration);
            
            job.setJobName("Word Processing Job");
            job.setJarByClass(Program.class);
            job.setMapperClass(WordMapper.class);
            job.setMapOutputKeyClass(ImmutableBytesWritable.class);
            job.setMapOutputValueClass(Put.class);
            
            FileInputFormat.setInputPaths(job, new Path(bulkInputPath));
            FileOutputFormat.setOutputPath(job, new Path(bulkOutputPath));
            
            HFileOutputFormat2.configureIncrementalLoad(job, reportTable, connect.getRegionLocator(reportTable.getName()));            
            
            if(job.waitForCompletion(true))
            {
                BulkLoader.doBulkLoad(configuration, bulkOutputPath, "report");
                return 0;
            }
            else
                return 3;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();     
            return -1;
        }

        //return:0; all OK
        //return:1; no input directory
        //return:2; empty directory path
        //return:3; something wrong
        //return:-1; exception
        
    }
}
  