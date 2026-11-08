package smd.log; 

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Date;

public class LogStream
{
    //public constructors region
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
    
    //public methods region
    public void writeLog(String text)
    {
        if(filePath!=null && filePath!="")
        {
            String output=String.format("======%s======\n%s\n",(new Date()).toString(),text);
            
            try
            {
                Files.write(Paths.get(filePath), output.getBytes(), StandardOpenOption.APPEND);
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
    
    public void writeLog(Exception ex, Parameter... parameters)
    {
        String stackTrace=ex.getMessage();
        
        for(Parameter parameter:parameters)
            stackTrace+="\n"+parameter.toString();
        
        for(StackTraceElement e:ex.getStackTrace())
            stackTrace+=String.format("\nat %s.%s(%s)", e.getClassName(),e.getMethodName(),e.getLineNumber());
        
        writeLog(stackTrace);
    }
    
    public void writeLog(String text, Object... formatArgs) 
    {
        writeLog(String.format(text, formatArgs));
    }
    
    //private fields region
    private String filePath;
}