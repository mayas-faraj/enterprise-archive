package smd.eors.dataparser;

import java.util.HashMap;

import smd.eors.dataAccess.entity.master.CoverageCell;
import smd.eors.dataaccess.DataAccess;

public class CellProcessor
{
    //public static methods region
    public static CoverageCell getCoverageCell(String cgi)
    {
        return coverageCellMap.get(cgi);
    }

    //private static fields region
    private static HashMap<String, CoverageCell> coverageCellMap;

    //constructors region
    static
    {
        //fill coverage cell map
        coverageCellMap=new HashMap<String, CoverageCell>();
        CoverageCell[] cells=DataAccess.loadCoverageCells();

        for(CoverageCell cell:cells)
            if(cell!=null)
                coverageCellMap.put(cell.getCellGlobalId(), cell);
    }

    private CellProcessor() {}
}
