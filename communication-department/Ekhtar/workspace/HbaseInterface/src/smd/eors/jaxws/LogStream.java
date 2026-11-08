package smd.eors.jaxws;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class LogStream
{
    //public methods region
    public LogStream(String filePath)
    {
        try
        {
            if(!Files.exists(Paths.get(filePath), LinkOption.NOFOLLOW_LINKS))
                Files.createFile(Paths.get(filePath));
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        this.filePath=filePath;
    }
    
    public void writeLog(String text)
    {
        if(filePath!=null)
        {
            try
            {
                Files.write(Paths.get(filePath), (text+" \n").getBytes(), StandardOpenOption.APPEND);
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    
    public void writeLog(Exception ex, String... parameters)
    {
        writeLog( ex.getMessage());
    }
    
    public void writeLog(String text, Object... formatVariants) 
    {
        writeLog(String.format(text, formatVariants));
    }
    
    //private fields region
    private String filePath;
}
