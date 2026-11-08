package smd.eors.cell;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.cli.Option;
import org.apache.commons.cli.OptionBuilder;
import org.apache.commons.cli.OptionGroup;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.BasicParser;
import org.apache.commons.cli.HelpFormatter;

import org.apache.hadoop.conf.Configuration;

import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;

public class Program
{
    @SuppressWarnings("static-access")
    public static void main(String[] args)
    {     
        //args="-t cell2 --save /storage/hadoop/mtn.csv --zookeeper 192.168.1.127".split(" ");
        
        //CLI options parser
        Option tableOption=OptionBuilder.hasArgs().isRequired().withArgName("table_name").withDescription("The table name in HBase database.").withLongOpt("table").create("t");
        Option zookeeperOption=OptionBuilder.hasArg().withArgName("zk ip").withDescription("The ip of the zookeeper server.").withLongOpt("zookeeper").create("z");
        Option saveOption=OptionBuilder.hasArg().withArgName("csv_file_path").withDescription("Save the values in csv file into HBase.").withLongOpt("save").create();
        Option getOption=OptionBuilder.hasArg().withArgName("cell_global_id").withDescription("Get the information of cell from HBase.").withLongOpt("get").create();
        Option listOption=OptionBuilder.hasArg(false).withDescription("List of all global cells id's.").withLongOpt("list").create(); 
        Option countOption=OptionBuilder.hasArg(false).withDescription("Get the count of rows in hbase").withLongOpt("count").create(); 
        Option shortOption=OptionBuilder.hasArg(false).withDescription("save the short value of global cells id.").withLongOpt("short-id").create(); 

        OptionGroup saveGroup=new OptionGroup();
        saveGroup.addOption(saveOption);
        saveGroup.addOption(shortOption);  
        
        OptionGroup optionGroup=new OptionGroup();
        optionGroup.setRequired(true);
        optionGroup.addOption(saveOption);
        optionGroup.addOption(getOption);
        optionGroup.addOption(listOption);
        optionGroup.addOption(countOption);
        
        Options options=new Options();
        options.addOption(tableOption);
        options.addOption(zookeeperOption);
        options.addOption(shortOption);
        options.addOptionGroup(optionGroup);
        
        CommandLineParser clp=new BasicParser();
        
        
        //HBASE table name
        try
        {
            CommandLine cl=clp.parse(options, args);
            
            //setting configuration
            Configuration configuration=new Configuration();
            if(cl.hasOption(zookeeperOption.getOpt()))
            {
                configuration.set("hbase.zookeeper.quorum", cl.getOptionValue(zookeeperOption.getOpt()));
                System.out.println("Setting zookeeper address:"+ cl.getOptionValue(zookeeperOption.getOpt()));
            }
     
            //connect to HTable
            TableName tableName=TableName.valueOf(cl.getOptionValue(tableOption.getLongOpt()));
            Connection connection=ConnectionFactory.createConnection(configuration);
            Table cellTable=connection.getTable(tableName);
            boolean shortGid=cl.hasOption(shortOption.getLongOpt());       
            
            if(cl.hasOption(saveOption.getLongOpt()))
            {
                //save CSV file to HBASE

                //read all lines of input file
                FileSystem fs=FileSystem.get(configuration);
                FSDataInputStream dis=fs.open(new Path(cl.getOptionValue(saveOption.getLongOpt())));
                BufferedReader br=new BufferedReader(new InputStreamReader(dis));
                List<String> lines=new ArrayList<String>();
                String line;
                while((line=br.readLine())!=null)
                    lines.add(line);

                dis.close();

                if(lines.size()>=1)
                {
                    //read the header
                    String fileHeader=lines.get(0);
                    String[] fileColumns=fileHeader.split(",");
                    String[] hbaseColumns=new String[fileColumns.length];
                    int cgiIndex=-1;
                    int lacIndex=-1;
                    int cidIndex=-1;
                    int company=-1;

                    //convert CSV column names to HBase columns
                    for(int i=0;i<fileColumns.length;i++)
                    {
                        switch (fileColumns[i])
                        {
                        case "CID":
                        case "CELL_ID":
                            hbaseColumns[i]="ci";
                            cidIndex=i;
                            break;
                        case "LAC":
                            hbaseColumns[i]="l";
                            lacIndex=i;
                            break;
                        case "Company":
                            hbaseColumns[i]="n";
                            company=i;
                            break;
                        case "CGI":
                            hbaseColumns[i]="cg";
                            cgiIndex=i;
                            break;
                        case "OMC_Name(Cell_Name)":
                        case "CELL_NAME":
                            hbaseColumns[i]="cn";
                            break;
                        case "SiteCode":
                        case "SITE_ID":
                            hbaseColumns[i]="sc";
                            break;
                        case "SiteName":
                        case "BSC":
                            hbaseColumns[i]="sn";
                            break;
                        case "LONGITUDE":
                        case "X":
                            hbaseColumns[i]="x";
                            break;
                        case "LATITUDE":
                        case "Y":
                            hbaseColumns[i]="y";
                            break;
                        case "AZIMUTH":
                            hbaseColumns[i]="a";
                            break;
                        case "Height":
                        case "HEIGHT":
                            hbaseColumns[i]="h";
                            break;
                        default:
                            System.out.println(fileColumns[i]+ " column has been ignored!");
                        }                      
                    }

                    if(cgiIndex==-1)
                    {
                        System.out.println("no cell id was founded, exiting the job.");
                        return;
                    }  

                    //read lines and save them into database
                    for(int i=1;i<lines.size();i++)
                    {
                        String[] cells=lines.get(i).split(",");
                        
                        //unified SYRIATEL CGI
                        if(company!=-1)
                        {
                            String lac=cells[cgiIndex].substring(5, 10);
                            String cid=cells[cgiIndex].substring(10);
                            
                            lac=StringUtils.stripStart(lac, "0");
                            cid=StringUtils.stripStart(cid, "0");
                            
                            if(lac=="" || lac==null)
                                lac="0";
                            
                            if(cid=="" || cid==null)
                                cid="0";
                            
                            cells[lacIndex]=lac;
                            cells[cidIndex]=cid;
                            
                            cells[cgiIndex]="417-01-"+lac+"-"+cid;
                        }
                        
                        //use short from of CGI if required
                        if(shortGid)
                            if(cells[cgiIndex].length()>7)
                                cells[cgiIndex]=cells[cgiIndex].substring(7);
                            else
                                System.out.println("Invalid gid value: "+cells[cgiIndex]);
                        
                        //define put object
                        Put put=new Put(Bytes.toBytes(cells[cgiIndex]),(new Date()).getTime());
                        
                        //put missing MNC code for MNT
                        if(company==-1)
                            put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("n"), Bytes.toBytes("02"));
                        
                        for(int j=0;j<hbaseColumns.length;j++)
                            if(hbaseColumns[j]!=null && hbaseColumns[j]!="")
                            {
                                byte[] value;
                                
                                switch(hbaseColumns[j])
                                {
                                case "l":
                                case "ci":
                                    value=Bytes.toBytes(tryParseInt(cells[j], -1));
                                    break;
                                case "a":
                                case "h":
                                    value=Bytes.toBytes(tryParseFloat(cells[j], -1f));
                                    break;
                                case "x":
                                case "y":
                                    value=Bytes.toBytes(tryParseDouble(cells[j], -1d));
                                    break;
                                default:
                                    value=Bytes.toBytes(cells[j]);
              
                                }
                                put.addColumn(Bytes.toBytes("i"), Bytes.toBytes(hbaseColumns[j]), value);
                            }

                        cellTable.put(put);
                    }

                    cellTable.close(); 
                }
                else
                {
                    System.out.println("no info rows was founded, exiting the job.");
                }

            }
            else if(cl.hasOption(getOption.getLongOpt()))
            {
                //get location of cell from HBase
                String gid=cl.getOptionValue(getOption.getLongOpt());

                //check input GID format
                try
                { 
                    Get get=new Get(Bytes.toBytes(gid));
                    Result result=cellTable.get(get);

                    byte[] valueX=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("x"));
                    byte[] valueY=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("y"));
                    byte[] valueAzimuth=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("a"));
                    byte[] valueHeight=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("h"));
                    byte[] valueCellName=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("cn"));
                    byte[] valueSiteCode=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("sc"));
                    byte[] valueSiteName=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("sn"));

                    printBinaryValue("X", valueX);
                    printBinaryValue("Y", valueY);
                    printBinaryValue("Azimuth", valueAzimuth);
                    printBinaryValue("Height", valueHeight);
                    printBinaryValue("CellName", valueCellName);
                    printBinaryValue("SiteCode", valueSiteCode);
                    printBinaryValue("SiteName", valueSiteName);
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
            }
            else if(cl.hasOption(listOption.getLongOpt()))
            {
                Scan scan=new Scan();
                
                ResultScanner rs=cellTable.getScanner(scan);
                for(Result r:rs)
                    System.out.println(Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("cg"))));
            }
            else if(cl.hasOption(countOption.getLongOpt()))
            {
                int count=0;
                Scan scan=new Scan();
                
                ResultScanner rs=cellTable.getScanner(scan);
                for(Result r:rs)
                    count++;
                
                System.out.println("Rows count is: "+count);
                
            }
        }
        catch(ParseException ex)
        {

            System.out.println(ex.getMessage());
            HelpFormatter helpFormatter=new HelpFormatter();
            helpFormatter.printHelp("mobile-cell-manager.jar", options);
        }
        catch(Exception ex)
        {
            System.out.println(err);
            ex.printStackTrace();
        }
        catch (Throwable e)
        {
            System.out.println(err);
            e.printStackTrace();
        }
    }
    
    private static void printBinaryValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toString(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
        
    }
    
    private static int tryParseInt(String value, int defaultValue)
    {
        try
        {
            return Integer.parseInt(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Value: %s, Exception: %s", String.valueOf(value), ex.getMessage()));
            return defaultValue;
        }
    }
    
    private static double tryParseDouble(String value, double defaultValue)
    {
        try
        {
            return Double.parseDouble(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Value: %s, Exception: %s", String.valueOf(value), ex.getMessage()));
            return defaultValue;
        }
    }
    
    private static float tryParseFloat(String value, float defaultValue)
    {
        try
        {
            return Float.parseFloat(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Value: %s, Exception: %s", String.valueOf(value), ex.getMessage()));
            return defaultValue;
        }
    }
    
    static String err="";
}
