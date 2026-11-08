package smd.eors.dataaccess.common;

import java.util.Comparator;
import smd.eors.dataAccess.entity.slave.Location;

public class dateComparator implements Comparator<Location>
{

    @Override
    public int compare(Location location1, Location location2)
    {
        // inverse sort of reports by importance
        if(location1.getDate()!=null && location2.getDate()!=null)
        {
            if(location1.getDate().getTime()<location2.getDate().getTime())
                return 1;
            else
                if(location1.getDate().getTime()==location2.getDate().getTime())
                    return 0;
                else
                    return -1;
        }
        else
            return -1;
    }
}
