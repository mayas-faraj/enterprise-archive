package smd.eors.dataparser;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import java.util.List;

public class LocalFileAccess
{
    //public methods region
    public static String[] getFiles(String directory)
    {
        //precondition: none
        DirectoryStream<Path> stream=null;
        
        try
        {
            stream = Files.newDirectoryStream(Paths.get(directory));
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        List<String> files=new ArrayList<String>();
        
        if(stream!=null)
            for (Path entry : stream)
                files.add(entry.toString());
        
        return files.toArray(new String[0]);
    }
    
    public static String[] readLines(String fileName)
    {
        //precondition: filename exists
        Path path=Paths.get(fileName);
        
        try
        {
            return Files.readAllLines(path).toArray(new String[0]);
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }  
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
}
