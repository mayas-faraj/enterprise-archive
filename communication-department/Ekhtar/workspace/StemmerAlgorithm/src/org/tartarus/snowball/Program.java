package org.tartarus.snowball;

public class Program
{
    public static void main(String[] args)
    {
        SnowballStemmer stemmer=new org.tartarus.snowball.ext.arabicStemmer();
        
        stemmer.setCurrent("وتجذيعها");
        System.out.println("Stem:"+stemmer.stem());
        System.out.println(stemmer.getCurrent());
    }
}
