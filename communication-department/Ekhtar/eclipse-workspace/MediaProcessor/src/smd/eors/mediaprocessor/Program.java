package smd.eors.mediaprocessor;

import java.io.IOException;

public class Program
{

    public static void main(String[] args)
    {
        try
        {
            MediaWriter.Write("/storage/hadoop/temp/med.seq", "Mayas", new byte[] {0,1,2,3});
        }
        catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
