
package smd.eors.mediaprocessor;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;


public class Program
{
    public static void main(String[] args) throws KeyManagementException, NoSuchAlgorithmException, FileNotFoundException, IllegalArgumentException, IOException, URISyntaxException
    { 
        System.out.print(MediaManager.write("Mayas", new byte[] {1,2,5,8}).toString());
        /*
        try
        {
            byte[] content=MediaManager.read(new MediaManager.FileAddress(args[0], Long.valueOf(args[1])));
            java.nio.file.Files.write(Paths.get("/storage/tmp/"+args[0].substring(args[0].lastIndexOf('/'))), content, java.nio.file.StandardOpenOption.CREATE_NEW);
        } 
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

        try
        {
            if(args.length>=3)
                if(args[0].equals("--read"))
                {
                    byte[] result=null;
                    //String result=getArrayString(MediaAccess.Read(args[1], Long.valueOf(args[2])));
                    for(int i=2;i<args.length;i++)
                    {
                        result=MediaAccess.Read(args[1], Long.valueOf(args[i]));
                        System.out.println(String.format("Reading: %s with length: %s at %s.", args[i], result.length, (new Date()).getTime()));
                    }
                }
                else if(args[0].equals("--write"))
                {
                    byte[][] content=new byte[args.length-2][];
                    
                    System.out.println("Reading...");
                    
                    for(int i=2;i<args.length;i++)
                    {
                        content[i-2]=FileUtils.readFileToByteArray(new File(args[i]));
                        System.out.println(String.format("Reading: %s with length: %s.", args[i], content[i-2].length));
                    }
                    
                    for(int i=0;i<content.length;i++)
                    {
                        long position=MediaAccess.Write(args[1], args[i+2], content[i]);
                        System.out.println(String.format("Media: %s\nPosition: %s\nSize: %s\nTimestamp: %s\n===========", args[i+2], position, content[i].length, (new Date()).getTime()));
                    }
                         
                    //long position=MediaAccess.Write(args[1], args[2], content);
                    
                }
                else
                    System.out.println("Invalid access type, usage\nmedia-access [--read | --write] URL [pos [offset] | images...]");
            else
                System.out.println(String.format("Invalid argument length (%s), usage\nmedia-access [--read | --write] URL [pos | images...]", args.length));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        */
    }
    
    private static String getArrayString(byte[] array)
    {
        if(array==null)
            return "Null Array";
        else
        {
            String result="Array: ";

            for(int i=0;i<array.length;i++)
            {
                result+=String.valueOf(array[i]);

                if(i!=array.length-1)
                    result+=", ";
            }

            return result;
        }
    }
}
