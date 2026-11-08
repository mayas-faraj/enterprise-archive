package smd.eors.dataprovider;
import org.apache.log4j.Logger;

public class Utility
{
    //constructors region
    static
    {
        logger=Logger.getLogger("dataprovider");
    }

    //public methods region
    public static String getJsonArray(String[] jsonArray)
    {
        String result="[";
        for(int i=0; i<jsonArray.length; i++)
        {
            if(i!=0)
                result += ", ";
            result += jsonArray[i];
        }

        return result + "]";
    }
    
    //public fields region
    public static Logger logger;
    public static final String TRUE="1";

}

