package smd.eors.dataaccess.entity;


public abstract class SlaveEntity extends Entity
{
    //public constructors region
    public SlaveEntity(byte[] rowKey)
    {
        this.setRowKey(rowKey);
    }
    
    public SlaveEntity(MasterEntity masterEntity)
    {
        this.setMasterEntity(masterEntity);
    }

    //public methods region  
    public abstract byte[] toKey();
    
    public abstract byte[] toValue();
    
    public abstract SlaveEntity fromKeyValue(byte[] key, byte[] value);
     
    public MasterEntity getMasterEntity()
    {
        return masterEntity;
    }

    public void setMasterEntity(MasterEntity masterEntity)
    {
        this.masterEntity = masterEntity;
    }
    
    public static void setMasterEntity(MasterEntity masterEntity, SlaveEntity[] entities)
    {
        if(entities!=null)
            for(SlaveEntity entity: entities)
                if(entity!=null)
                    entity.setMasterEntity(masterEntity);
    }
    
    public static void setMasterEntity(MasterEntity masterEntity, SlaveEntity entity)
    {
        if(entity!=null)
            entity.setMasterEntity(masterEntity);
    }
    
    public String getFamilyspace()
    {
        return this.familyspace;
    }
    
    //protected fields region
    protected final static char KEY_VALUE_SEPERATOR=';';
    
    
    //protected fields region
    protected String familyspace;
    
    //private fields region
    private MasterEntity masterEntity;
    
    
}
