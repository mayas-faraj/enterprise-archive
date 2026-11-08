package smd.eors.dataaccess.entity;

public abstract class MasterEntity extends Entity
{
    //public methods region  
    public abstract byte[] designRowKey();
    
    public String getTablespace()
    {
        return this.tablespace;
    }
    
    //protected fields region
    protected String tablespace;
}
