package smd.eors.parser;

import java.util.HashMap;

public class Dictionary
{
    public Dictionary(String name,HashMap<String,Integer> words)
    {
        setName(name);
        setWords(words);
    }
    
    public String getName()
    {
        return name;
    }
    
    public HashMap<String,Integer> getWords()
    {
        return words;
    }
    
    public void setName(String name)
    {
        this.name=name;
    }
    
    public void setWords(HashMap<String,Integer> words)
    {
        this.words=words;
    }
    
    private String name;
    private HashMap<String,Integer> words;        
}
