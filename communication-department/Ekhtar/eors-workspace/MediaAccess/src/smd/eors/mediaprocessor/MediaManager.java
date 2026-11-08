package smd.eors.mediaprocessor;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class MediaManager
{
    //public constructions region
    static
    {
        MediaManager.configuration=new Configuration();
        
        //MediaManager.configuration.addResource(new Path("/storage/hadoop/etc/hadoop/hdfs-site.xml"));
        //MediaManager.configuration.addResource(new Path("/storage/hadoop/etc/hadoop/core-site.xml"));

        try
        {
            activeFile=getLeatestFile(); 
        }
        catch (Exception ex)
        {
            activeFile=null;
            ex.printStackTrace();
        }
    }
    
    //public functions region
    public static FileAddress write(String attachment, byte[] content) throws FileNotFoundException, IllegalArgumentException, IOException, URISyntaxException
    {
        //precondition: none
        if(activeFile!=null && content!=null)
        {
            long sequenceContentSize=getSequnceSize(attachment, content.length);
            String uri;
            System.out.println(String.format("max size: %s, sequence size: %s, current size: %s.", FILE_SIZE, sequenceContentSize, activeFile.position));
            if(sequenceContentSize+activeFile.position<FILE_SIZE)
                uri=activeFile.uri;
            else 
                uri=activeFile.uri=getNextFileName(activeFile.uri); 
            
            //critical operation
            long position=MediaAccess.Write(uri, attachment, content);
            return new MediaManager.FileAddress(uri, position);
        }
        else
            return null;
    }
    
    public static byte[] read(FileAddress fileAddress) throws IOException
    {
        return MediaAccess.Read(fileAddress.getUri(), fileAddress.getPosition());
    }
    
    public static Configuration getConfiguration()
    { 
        return MediaManager.configuration;
    }
    
    public static void setConfiguration(Configuration configuration)
    {
        MediaManager.configuration=configuration;
    }
    
    //private functions region
    private static FileAddress getLeatestFile() throws FileNotFoundException, IllegalArgumentException, IOException, URISyntaxException
    {
        //precondition: HDFS is running and there is /$MEDIA_PATH
        FileSystem fs = FileSystem.get(configuration);

        FileStatus[] fileStatus = fs.listStatus(new Path(MEDIA_PATH));
        FileAddress result=null;
        int largestFileNumber=0;
        
        for(FileStatus status : fileStatus)
        {
            String fileName=status.getPath().getName();
            if(fileName.startsWith(MEDIA_PREFIX))
            {
                String fileId=fileName.substring(MEDIA_PREFIX.length());
                
                try
                {
                    int fileNumber=Integer.valueOf(fileId);
                    if(fileNumber>largestFileNumber)
                    {
                        largestFileNumber=fileNumber;
                        
                        //critical operation
                        result= new FileAddress(String.format(MEDIA_NAME_FORMAT, MEDIA_PATH ,MEDIA_PREFIX, fileNumber), status.getLen());
                    } 
                }
                catch(Exception ex)
                {
                    System.out.println(ex);
                    return null;
                }
            }
        }
        
        if(result==null)
            result=new FileAddress(String.format(MEDIA_NAME_FORMAT, MEDIA_PATH ,MEDIA_PREFIX, 1) ,0);
        
        return result;
    }
    
    private static String getNextFileName(String uri)
    {
        //precondition: none
        Path path=new Path(uri);
        String name=path.getName();
        if(name.startsWith(MEDIA_PREFIX))
        {
            String fileId=name.substring(MEDIA_PREFIX.length());
            
            try
            {
                int fileNumber=Integer.valueOf(fileId);
                //critical operation
                return String.format(MEDIA_NAME_FORMAT, MEDIA_PATH, MEDIA_PREFIX, fileNumber+1);
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
        }
        
        return null;
    }
    
    private static long getSequnceSize(String key, int valueLength)
    {
        return SEQUENCE_RECORD_HEADER_SIZE + key.length() + valueLength; 
    }
    
    //private fields region
    private static Configuration configuration;
    private static FileAddress activeFile;
    
    //private constant region
    private static final long FILE_SIZE=5*1024*1024;
    
    //private static final long SEQUENCE_HEADER_SIZE=76;
    private static final long SEQUENCE_RECORD_HEADER_SIZE=36;
    
    private static final String MEDIA_PREFIX="media-";
    private static final String MEDIA_PATH="/media";
    private static final String MEDIA_NAME_FORMAT="%s/%s%07d";
    
    //public class region
    public static class FileAddress
    {
        //public constructors region
        public FileAddress(String uri, long position)
        {
            this.uri=uri;
            this.position=position;
        }
        
        //public method region
        public void setUri(String uri)
        {
            this.uri=uri;
        }
        
        public String getUri()
        {
            return this.uri;
        }
        
        public void setPostition(long position)
        {
            this.position=position;
        }
        
        public long getPosition()
        {
            return this.position;
        }
        
        public String toString()
        {
            return String.format("%s:%s", uri, position);
        }
        
        //private field region
        private String uri;
        private long position;
    }
}
