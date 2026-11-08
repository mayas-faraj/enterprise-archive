package smd.eors.dataparser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.ArrayList;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import java.util.List;

public class FileAccess
{
    //public methods region
    public static String[] getFiles(String directory)
    {
        //precondition: none
        if(fileSystem!=null && directory !=null)
        {
            List<String> files=new ArrayList<String>();
            
            try
            {
                if(fileSystem.exists(new Path(directory)))
                    //critical operation
                    for(FileStatus fs:fileSystem.listStatus(new Path(directory)))
                        files.add(fs.getPath().toString());
                else
                    return new String[0];
            }
            catch (IllegalArgumentException | IOException ex)
            {
                ex.printStackTrace();
            } 
            
            return files.toArray(new String[0]);
        }
        else
            return null;
        //return: null for invalid arguments value, empty array is the path not exists,
        //        else return the list of files
    }
    
    public static String[] readLines(String fileName)
    {
        //precondition: filename exists
        List<String> lines=null;

        if(fileName!=null && fileName!="")
        {
            Path inputFilePath=new Path(fileName);
            BufferedReader br=null;
            
            try
            {
                br=new BufferedReader(new InputStreamReader(fileSystem.open(inputFilePath)));
                lines=new ArrayList<String>();
                String line;

                //critical operation
                while((line=br.readLine())!=null)
                    lines.add(line);
            }
            catch (IOException ex)
            {
                // TODO Auto-generated catch block
                ex.printStackTrace();
            }
            finally
            {
                try
                {
                    if(br!=null)
                        br.close();
                }
                catch (IOException ex)
                {
                    ex.printStackTrace();
                }
            }


        }

        if(lines.size()>0)
            return lines.toArray(new String[0]);
        else
            return null;

    }
    
    public static String getFileExtension(String fileName)
    {
        //precondition: none
        if(fileName!=null && fileName!="")
        {
            int extentionIndex=fileName.lastIndexOf('.');
            
            if(extentionIndex>0)
                //critical operation
                return fileName.substring(extentionIndex+1);
            else
                return "";
        }
        else
            return null;
        
        //return: null if the input is null or empty,
        //        empty string is there are no extension
        //        else return the file extension
    }
    
    public static void setZookeeper(String zookeeperAddress)
    {
        Configuration configuration=new Configuration();
        configuration.set("hbase.zookeeper.quorum",zookeeperAddress);
        
        try
        {
            fileSystem=FileSystem.get(configuration);
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
    }
    
    //private fields region
    private static FileSystem fileSystem;

    
    //constructors region
    static
    {
        try
        {
            fileSystem = FileSystem.get(new Configuration());
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
    }
}
