package smd.eors.mediaprocessor;

import java.io.IOException;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class SimpleMediaAccess
{
    public static long Write(String uri, byte[] content) throws IOException
    {
        FileSystem fs = FileSystem.get(MediaManager.getConfiguration());
       
        Path path = new Path(uri);
        
        
        FSDataOutputStream out;
        
        if(fs.exists(path))
            out=fs.append(path);
        else
            out=fs.create(path);
        
        fs.setReplication(path, (short)1);
        
        long result=out.getPos();
        out.write(content);
        out.close();

        return result;
    }
    
    public static byte[] Read(String uri, long position, int offset) throws IOException
    {
        FileSystem fs = FileSystem.get(MediaManager.getConfiguration());
        byte[] result=new byte[offset];
        
        Path path = new Path(uri);
        FSDataInputStream input = fs.open(path);
        input.seek(position);
        input.read(result);
        input.close();
        
        return result;
    }
}
