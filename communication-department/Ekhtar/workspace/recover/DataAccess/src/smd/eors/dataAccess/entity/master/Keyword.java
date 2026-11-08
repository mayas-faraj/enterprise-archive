package smd.eors.dataAccess.entity.master;

import java.util.HashMap;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Word;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Keyword extends MasterEntity
{
    //public constructions region
    public Keyword(String name)
    {
        this.name=name;
        
        if(this.name!="")
            this.active=true;
        
        this.words=new Word[0];
    }
    
    public Keyword()
    {
        this("");
    }

    //public methods region
    @Override
    public byte[] designRowKey()
    {
        return Bytes.toBytes(getName());
    }

    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(GROUP_NAME, getName());
        jsonObject.put(ACTIVE, isActive());

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(GROUP_NAME, getName());
        jsonObject.put(ACTIVE, isActive()); 

        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    public HashMap<String, Float> getWordsMap()
    {
        //precondition: none
        HashMap<String, Float> wordsMap=null; 
        
        if(getWords()!=null)
        {
            wordsMap=new HashMap<String, Float>();
            
            for(Word word:getWords())
                if(word!=null)
                    wordsMap.put(word.getWord(), word.getWeight());
        }
        
        return wordsMap;
    }
    
    public Float getWordWeight(String word)
    {
        //precondition: none
        if(wordsMap==null)
            wordsMap=this.getWordsMap();
        
        return wordsMap.get(word);
    }
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public boolean isActive()
    {
        return active;
    }

    public void setActive(boolean active)
    {
        this.active = active;
    }
   
    public Word[] getWords()
    {
        return words;
    }

    public void setWords(Word[] words)
    {
        this.words = words;
        
        SlaveEntity.setMasterEntity(this, words);
        
        if(wordsMap!=null)
            wordsMap=this.getWordsMap();
    }
    
    //public static final fields region
    public static final String GROUP_NAME = "Group";
    public static final String ACTIVE = "Active";
    public static final String WORDS = "words";

    //private fields region
    private String name;
    private boolean active;
    private Word[] words;
    private HashMap<String, Float> wordsMap;
}
