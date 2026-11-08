package smd.eors.dataparser;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import khoja.ArabicStemmerKhoja;
import smd.eors.dataAccess.entity.master.Keyword;
import smd.eors.dataAccess.entity.slave.Classify;
import smd.eors.dataaccess.DataAccess;

public class WordProcessor
{
    //public methods region
    public static String[] getKeywords(String text)
    {
        //precondition: none
        if(text!=null && text!="")
        {
            String[] words=text.split(REGEX_WORD);
            
            //removing stop words
            if(stopword!=null)
            {  
                List<String> wordList=new ArrayList<String>(words.length);
                
                for(String word: words)
                    if(!stopword.contains(word))
                        wordList.add(word);
                
                words=wordList.toArray(new String[0]);
            }
            
            for(int i=0;i<words.length;i++)
                if(words[i]!=null)
                {
                    try
                    {
                        //critical operation
                        words[i]=stemmer.stem(words[i]);
                    }
                    catch(Exception ex0){}
                }
            
            
            return words; 
        }
        return null;
    }
    
    public static Classify[] getClassification(String[] words)
    {
        //precondition: none
        if(words!=null)
        {
            List<Classify> classifies=new ArrayList<Classify>();
             
            Classify tempClassify;
            
            for(Keyword keyword: keywords)
            {
                tempClassify=null;
                for(String word: words)
                {
                    //critical operation
                    Float matching=keyword.getWordWeight(word);
                    if(matching!=null)
                    {
                        if(tempClassify==null)
                            tempClassify=new Classify(null, keyword.getName(), 0);
                        
                        tempClassify.setMatching(tempClassify.getMatching()+matching);
                    }
                }
                
                if(tempClassify!=null)
                    classifies.add(tempClassify);
            }
            
            if(classifies.size()>0)
                return classifies.toArray(new Classify[0]); 
        }

        return null;
        //return: null if the input is null or if there is no matching with loaded classifies
        //        or return a classifies array
    }
    
    public static float calculateImportance(Classify[] classifies, int wordLength)
    {
        //precondition none
        if(classifies!=null && wordLength>0)
        {
            float importance=0;
            
            for(Classify classify:classifies)
                if(classify!=null)
                    importance+=classify.getMatching();
            
            if(wordLength<10)
                wordLength=10;
            
            return importance/wordLength;
        }
        else
            return 0;
    }
    
    public static String joinWords(String[] lines)
    {
        //precondition: none
        if(lines!=null)
        {
            StringBuilder sr=new StringBuilder();

            for(String line:lines)
            {
                sr.append(line);
                sr.append(SEPERATEOR_WORD);
            }
            
            return sr.toString();
        }
        else
            return null;
        
        //return: null if the input is null, else empty string is the lines is empty array
        //        else return the lines joind by seperator
    }
    
    //private methods region

    
    //private static fields region
    private static ArabicStemmerKhoja stemmer;
    private static Set<String> stopword;
    private static Keyword[] keywords;
    
    //private static final fields region
    private static final char SEPERATEOR_WORD=' ';
    private static final String STOP_WORD="stopwords";
    private static final String REGEX_WORD="\\P{L}+";
    
    //constructors region
    private WordProcessor() {}
    
    static
    {
        stemmer=new ArabicStemmerKhoja();
        
        //process keywords
        Keyword[] allKeywords=DataAccess.loadKeyword();
        List<Keyword> keywordsList=new ArrayList<Keyword>(allKeywords.length-1);

        for(Keyword kw:allKeywords)
            if(kw!=null)
                if(kw.getName().equals(STOP_WORD))
                    stopword=kw.getWordsMap().keySet();
                else
                    keywordsList.add(kw);

        keywords=keywordsList.toArray(new Keyword[0]); 
    }
}
