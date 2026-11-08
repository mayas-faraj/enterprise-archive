package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Classify extends SlaveEntity
{
    //public constructors region   
    public Classify(MasterEntity masterEntity, String name, float matching)
    {
        super(masterEntity);
        this.name=name;
        this.matching=matching;
    }
    
    public Classify(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonClassify=new JSONObject();
        
        try
        { 
            jsonClassify.put(NAME, getName());
            jsonClassify.put(MATCHING, getMatching());   
        }
        catch(JSONException ex)     {} 
        
        return jsonClassify.toString();
    }
    
    

    @Override
    public String toJsonString()
    {
        JSONObject jsonClassify=new JSONObject();
        
        try
        {
            jsonClassify.put(ROW_KEY, getRowKey());
            jsonClassify.put(NAME, getName());
            jsonClassify.put(MATCHING, getMatching());
        }
        catch(JSONException ex)     {} 
        
        return jsonClassify.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] toKey()
    {
        if(getName()!=null)
            return Bytes.toBytes(getName());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        return Bytes.toBytes(getMatching());
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Classify classify=new Classify(this.getRowKey());
        
        if(key!=null)
            classify.setName(Bytes.toString(key));
        
        if(value!=null)
            classify.setMatching(Bytes.toFloat(value));
        
        return classify;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public float getMatching()
    {
        return matching;
    }

    public void setMatching(float matching)
    {
        this.matching = matching;
    }

    //static final fields region
    private static final String NAME = "Name";
    private static final String MATCHING = "Matching";

    //private fields region
    private String name;
    private float matching;

}
