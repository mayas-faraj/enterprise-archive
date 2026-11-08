package smd.eors.datagenerator;

import java.util.Date;
import java.util.Random;

import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.hadoop.hbase.util.Bytes;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataaccess.DataAccess;
import smd.eors.dataaccess.common.CellCoordinate;
import smd.eors.dataaccess.common.Coordinate;

public class Program
{
    public static void main(String[] args)
    {
        System.out.println("Class Path embed: "+ System.getProperty("java.class.path"));
        logger=LoggerFactory.getLogger("DataGeneratorLogger");
        
        logger.trace("log trace");
        logger.debug("log debug");
        logger.info("log info");
        logger.warn("log warn");
        logger.error("log error");
        //logger.fatal("log fatal");

        args="--operation save-navigation -s 100 -i 50 -p 94155****".split(" ");
        Option operationOption=new Option("o", "operation", true, "the operation type, which has one of these values: save-navigation");
        Option dataSizeOption=new Option("s", "size", true, "the amount of records should be added.");
        Option publisherPatternOption=new Option("p", "pattern", true, "publisher pattern, user continuous series of * for variable part, example: 93300****");
        Option publisherStartIndexOption=new Option("i", "index", true, "start index of publisher pattern.");

        operationOption.setRequired(true);
        dataSizeOption.setRequired(true);

        Options options=new Options();
        options.addOption(operationOption);
        options.addOption(dataSizeOption);
        options.addOption(publisherPatternOption);
        options.addOption(publisherStartIndexOption);

        CommandLineParser clp=new BasicParser();

        try
        {
            CommandLine cl=clp.parse(options, args);

            int dataSize=Integer.parseInt(cl.getOptionValue(dataSizeOption.getOpt()));
            int publisherStartIndex;
            String publisherPattern;

            if(cl.hasOption(publisherPatternOption.getOpt()))
                publisherPattern=cl.getOptionValue(publisherPatternOption.getOpt());
            else
                publisherPattern="933******";
            
            if(cl.hasOption(publisherStartIndexOption.getOpt()))
                publisherStartIndex=Integer.parseInt(cl.getOptionValue(publisherStartIndexOption.getOpt()));
            else
                publisherStartIndex=0;
            
            switch(cl.getOptionValue(operationOption.getOpt()))
            {
            case "save-navigation":
                saveNavigations(publisherStartIndex, dataSize, publisherPattern);
                break;
            default:
                System.out.println(cl.getOptionValue(operationOption.getOpt()) + " is an unsupported operation!");
                break;
            }
        }
        catch (ParseException e)
        {
            logger.error("error on throw,", e);
            e.printStackTrace();
        } 
    }
    
    private static void saveNavigations(int publisherStartIndex, int dataSize, String publisherPattern)
    {
        logger.warn("loggin for warn");
        String publisher=null;
        for(int i=publisherStartIndex; i<publisherStartIndex+dataSize; i++)
        {
            publisher=generatePublisher(i, publisherPattern);

            if(publisher!=null)
            {
                Random rnd=new Random();
                double timeShift=rnd.nextDouble();
                double longitudeShift=rnd.nextDouble();
                double latitudeShift=rnd.nextDouble();
                
                long timestamp=(long)(((new Date()).getTime()) - (timeShift * MAX_TIMESTAMP_DIFFERENCE));
                double longitude=MIN_LONGITUDE + (longitudeShift * (MAX_LONGITUDE - MIN_LONGITUDE));
                double latitude=MIN_LATITUDE + (latitudeShift * (MAX_LATITUDE - MIN_LATITUDE));
                
                Coordinate coordinate;
                
                if(timeShift>0)
                {
                    coordinate=new Coordinate(longitude, latitude, (float)timeShift*100);
                }
                else
                {
                    coordinate=new CellCoordinate(longitude, latitude, "41701999"+String.valueOf(timeShift).substring(2,7), "", "2G", (float)timeShift*20, (float)timeShift*30);
                }
                  
                Location location=new Location(Bytes.toBytes(publisher));
                location.setCoordinate(coordinate);
                location.setDate(new Date(timestamp));
                location.setRealtime(true);
                location.setCoordinate(new Coordinate(longitude, latitude, 100));
                
                logger.debug(String.format("publisher: %s, longitude: %s, latitude: %s, date: %s.", publisher, longitude, latitude, (new Date(timestamp).toString())));
                //DataAccess.saveLocation(location);
                
            }
        }
    }
    
    private static String generatePublisher(int index, String pattern)
    {
        int rangeStart=-1;
        int rangeEnd=-1;
        
        for(int i=0; i<pattern.length(); i++)
            if(pattern.charAt(i)=='*')
            {
                if(rangeStart==-1)
                    rangeStart=i;
                rangeEnd=i;
            }
        
        int length=1+rangeEnd-rangeStart;
        
        if(rangeStart>=0 && rangeEnd>=0)
            return String.format(pattern.replace(pattern.substring(rangeStart, rangeEnd+1), "%0"+String.valueOf(length)+"d"), index);
        else
            return null;
        
    }
    
    private static Logger logger;
    
    private static final long MAX_TIMESTAMP_DIFFERENCE=1000*60*60*24*15;
    private static final double MAX_LONGITUDE=41;
    private static final double MAX_LATITUDE=36.5;
    private static final double MIN_LONGITUDE=36.5;
    private static final double MIN_LATITUDE=32.6;
    


}
