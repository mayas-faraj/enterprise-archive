package smd.eors.mediaprocessor;

import java.io.IOException;

import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.SequenceFile;
import org.apache.hadoop.io.SequenceFile.Metadata;
import org.apache.hadoop.io.SequenceFile.Reader;
import org.apache.hadoop.io.SequenceFile.Writer;

public class MediaAccess
{
    public static long Write(String uri, String name, byte[] content) throws IOException
    {
        FileSystem fs = FileSystem.get(MediaManager.getConfiguration());
        Path path = new Path(uri);
        Text key = new Text(name);
        BytesWritable value = new BytesWritable(content);
        SequenceFile.Writer writer = null;
        long position=-1;

        try 
        {
            writer = SequenceFile.createWriter(MediaManager.getConfiguration(), Writer.file(path), 
                    Writer.keyClass(key.getClass()),
                    Writer.valueClass(value.getClass()), 
         
                    Writer.bufferSize(fs.getConf().getInt("io.file.buffer.size",4096)), 
                    Writer.replication((short)1),
                    Writer.blockSize(1073741824),
                    Writer.compression(SequenceFile.CompressionType.NONE),
                    Writer.progressable(null) ,
                    Writer.metadata(new Metadata()),
                    Writer.appendIfExists(true));

            position=writer.getLength();
            writer.append(key, value);       
        }
        finally 
        {
            IOUtils.closeStream(writer);
        }   
        
        return position;
    }

    public static byte[] Read(String uri, long position) throws IOException
    {
        Path path = new Path(uri);
        SequenceFile.Reader reader = null;
        byte[] result=null;

        try 
        {           
            reader = new SequenceFile.Reader(MediaManager.getConfiguration(), Reader.file(path), Reader.bufferSize(4096), Reader.start(0));
            Text key = new Text();
            BytesWritable value = new BytesWritable();
            
            reader.seek(position);
            reader.next(key, value);
            result=value.copyBytes();
        } 
        finally 
        {
            IOUtils.closeStream(reader);          
        } 
        
        return result;
    }
}
