package halux.cd.org;

import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;

import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.SequenceFileOutputFormat;

import org.apache.hadoop.io.Text;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.SequenceFile.CompressionType;


public class MR2
{
    public static void main(String[] args)
    {
        try
        {
            Job job=Job.getInstance(new Configuration());
            
            job.setJarByClass(MR2.class);
            job.setMapperClass(Map.class);
            job.setInputFormatClass(TextInputFormat.class);
            job.setOutputFormatClass(SequenceFileOutputFormat.class);
            job.setMapOutputKeyClass(Text.class);
            job.setMapOutputValueClass(UserWritable.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(UserWritable.class);
            job.setJobName("MR2 for user");
            
            FileInputFormat.setInputPaths(job, "/storage/hadoop/tmp/output10.txt");
            SequenceFileOutputFormat.setOutputPath(job, new Path("/storage/hadoop/tmp/output03"));
            SequenceFileOutputFormat.setOutputCompressionType(job, CompressionType.NONE);
            SequenceFileOutputFormat.setCompressOutput(job, false);
            //SequenceFileOutputFormat.setOutputCompressorClass(job, DefaultCodec.class);
            
            if(job.waitForCompletion(true))
                System.out.println("job successfull");
            else
                System.out.println("undone!");
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
    }
    
    private static class Map extends Mapper<LongWritable,Text,Text,UserWritable>
    {
        @Override
        protected void map(LongWritable key, Text value,
                Mapper<LongWritable, Text, Text, UserWritable>.Context context)
                throws IOException, InterruptedException
        {
            // TODO Auto-generated method stub
            String valueString=value.toString();
            String[] values=valueString.split("\\|\\|");
            
            UserWritable user=new UserWritable();
            user.setLoginName(values[0]);
            user.setLoginFullName(values[1]);
            user.setLoginPassword(values[2]);
            user.setAgentAddress(values[3]);
            
            context.write(new Text(values[0]), user); 
        }         
    }
}
