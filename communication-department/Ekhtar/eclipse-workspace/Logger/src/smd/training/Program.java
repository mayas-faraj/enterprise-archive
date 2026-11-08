package smd.training;

import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.entity.Entity;

public class Program
{
    public static void main(String[] args)
    {
        logger=org.apache.logging.log4j.LogManager.getLogger(Program.class.getName().getClass());


        System.out.println("starting loggin app on cp: "+System.getProperty("java.class.path")
                );
        
        String rowKey="7ffffe93b4af23f30001882e";
        String timestamp = "1000000";
        String type="SMS";
        String reader="933092386";
      
        byte[] rowBytes=Entity.getBytesFromHex(rowKey);
        long ts=Long.parseLong(timestamp);
        String result=Entity.getHexFromBytes(DataAccess.setCommandRead(rowBytes, reader, type, ts));
        //String result="xxx";
        
        System.out.println("end of program with result: "+result+"!");
        
        
        
    }

    private static org.apache.logging.log4j.Logger logger;
}
