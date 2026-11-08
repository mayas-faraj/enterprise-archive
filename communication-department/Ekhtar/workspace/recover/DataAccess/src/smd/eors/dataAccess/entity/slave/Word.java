package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Word extends SlaveEntity
{ 
    public Word(MasterEntity masterEntity, String word, float weight)
    {
        super(masterEntity);
        this.word=word;
        this.weight=weight;
    }
    
    public Word(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    public String toShortJsonString()
    {
        JSONObject jsonObject=new JSONObject();

        try
        {
            jsonObject.put(WORD, getWord());
            jsonObject.put(WEIGHT, getWeight());
        }
        catch(JSONException ex)     {}

        return jsonObject.toString();
    }

    public String toJsonString()
    {
        JSONObject jsonObject=new JSONObject();

        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(WORD, getWord());
            jsonObject.put(WEIGHT, getWeight());
        }
        catch(JSONException ex)     {}
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] toKey()
    {
        if(getWord()!=null)
            return Bytes.toBytes(getWord());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        return Bytes.toBytes(getWeight());
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Word word=new Word(this.getRowKey());
        
        if(key!=null)
            word.setWord(Bytes.toString(key));
        
        if(value!=null)
            word.setWeight(Bytes.toFloat(value));
        
        return word;
    }

    public String getWord()
    {
        return word;
    }

    public void setWord(String word)
    {
        this.word = word;
    }

    public float getWeight()
    {
        return weight;
    }

    public void setWeight(float weight)
    {
        this.weight = weight;
    }
    
    //public static final fields region
    public static final String WORD = "Word";
    public static final String WEIGHT = "Weight";

    //private fields region
    private String word;
    private float weight; 
}
