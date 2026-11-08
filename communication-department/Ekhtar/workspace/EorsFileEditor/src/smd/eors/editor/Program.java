package smd.eors.editor;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.io.IOException;
import java.nio.charset.Charset;

public class Program
{

    public static void main(String[] args)
    {
        args="/storage/hadoop/kafka".split(" ");
        
        // TODO Auto-generated method stub
        if(args.length==0)
        {
            System.out.println("required the path of eors report binary file.");
        }
          
        try
        {
            //read the lines of file
            Charset charset=Charset.forName("ISO-8859-1");
            
            List<String> lines=Files.readAllLines(Paths.get(args[0]),charset);
            Random rnd=new Random();
            
            //for each line
            for(int i=0;i<lines.size();i++)
            {
                //add the random location
                double longitude=36+rnd.nextDouble();
                double latitude=33+rnd.nextDouble();
                
                lines.set(i, lines.get(i).replace("\"Location\":\"\"", String.format("\"Location\":\"%s;%s;%s\"",longitude,latitude,(new Date()).toString())));
            }
            
            //write the line of a file
            Files.write(Paths.get(args[0]+".result"),  lines,charset, StandardOpenOption.CREATE);
            
            System.out.println("done...");
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        
    }

}
