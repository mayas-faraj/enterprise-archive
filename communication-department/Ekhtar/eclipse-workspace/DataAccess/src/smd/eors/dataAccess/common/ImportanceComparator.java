package smd.eors.dataaccess.common;

import java.util.Comparator;
import smd.eors.dataAccess.entity.master.Report;

public class ImportanceComparator implements Comparator<Report>
{

    @Override
    public int compare(Report report1, Report report2)
    {
        // inverse sort of reports by importance
        if(report1.getImportance()<report2.getImportance())
            return 1;
        else
            if(report1.getImportance()==report2.getImportance())
                return 0;
            else
                return -1;
    }
}
