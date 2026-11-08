package smd.eors.parser;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class LogStream
{
    public LogStream(String filePath)
    {
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
    
    public void writeLog(Exception ex)
    {
        writeLog( ex.getMessage());
    }
    
    public void writeLog(String text, Object... formatVariants) 
    {
        writeLog(String.format(text, formatVariants));
    }
    
    private String filePath;
}
