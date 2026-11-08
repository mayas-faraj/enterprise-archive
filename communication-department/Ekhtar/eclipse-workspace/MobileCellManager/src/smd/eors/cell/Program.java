package smd.eors.cell;

import java.util.Date;
import java.util.List;
import java.nio.charset.Charset;

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
        //args="-t cellular -c 01 --save /storage/hadoop/temp/syriatel.csv --zookeeper edp-node1.sy".split(" ");

        //args="-t cellular -c 01 --get 417-01-9041-9291".split(" ");
        //args="-t cellular -c 01 --change".split(" ");
        args="mobile-cell-manager.jar --list -t cellular -z edp-node1.sy".split(" ");
        
        //CLI options parser
        Option tableOption=OptionBuilder.hasArgs().isRequired().withArgName("table_name").withDescription("The table name in HBase database.").withLongOpt("table").create("t");
        Option companyOption=OptionBuilder.hasArgs().withArgName("company_code").withDescription("Compnay code, 01 for Syriatel, 02 for MTN.").withLongOpt("company").create("c");
        Option zookeeperOption=OptionBuilder.hasArg().withArgName("zk_ip").withDescription("The ip of the zookeeper server.").withLongOpt("zookeeper").create("z");
        Option saveOption=OptionBuilder.hasArg().withArgName("csv_file_path").withDescription("Save the values in csv file into HBase.").withLongOpt("save").create();
        Option getOption=OptionBuilder.hasArg().withArgName("cell_global_id").withDescription("Get the information of cell from HBase.").withLongOpt("get").create();
        Option changeCgiOption=OptionBuilder.hasArg(false).withDescription("Change the format of CGI field into (MCC:3)(MNC:2)(LAC:5)(CID:5)").withLongOpt("change").create();
        Option listOption=OptionBuilder.hasArg(false).withDescription("List of all global cells id's.").withLongOpt("list").create(); 
        Option countOption=OptionBuilder.hasArg(false).withDescription("Get the count of rows in hbase").withLongOpt("count").create(); 
        Option shortOption=OptionBuilder.hasArg(false).withDescription("save the short value of global cells id.").withLongOpt("short-id").create(); 
        
        OptionGroup optionGroup=new OptionGroup();
        optionGroup.setRequired(true);
        optionGroup.addOption(saveOption);
        optionGroup.addOption(getOption);
        optionGroup.addOption(listOption);
        optionGroup.addOption(countOption);
        optionGroup.addOption(changeCgiOption);
        
        Options options=new Options();
        options.addOption(tableOption);
        options.addOption(companyOption);
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
            String company=cl.getOptionValue (companyOption.getLongOpt());
            boolean shortGid=cl.hasOption(shortOption.getLongOpt());
            
            if(cl.hasOption(saveOption.getLongOpt()))
            {
                //save CSV file to HBASE

                if(!company.equals("01") && !company.equals("02"))
                {
                    System.out.println(company + " is an invalid company code!");
                    return;
                }
                //read all lines of input file
                System.out.println("Parsing file: "+cl.getOptionValue(saveOption.getLongOpt()));
                List<String> lines=java.nio.file.Files.readAllLines(java.nio.file.Paths.get(cl.getOptionValue(saveOption.getLongOpt())), Charset.forName("windows-1256"));

                if(lines.size()>=1)
                {
                    System.out.println("Lines count: "+ lines.size());
                    
                    //read the header
                    String fileHeader=lines.get(0);
                    String[] fileColumns=fileHeader.split(",");
                    String[] hbaseColumns=new String[fileColumns.length];
                    int cgiIndex=-1;
                    int lacIndex=-1;
                    int cidIndex=-1;
                    int heightIndex=-1;

                    //convert CSV column names to HBase columns
                    for(int i=0;i<fileColumns.length;i++)
                    {
                        switch (fileColumns[i].toLowerCase())
                        {
                        case "cid":
                        case "cell_id":
                        case "cell":
                            hbaseColumns[i]="ci";
                            cidIndex=i;
                            break;
                        case "lac":
                            hbaseColumns[i]="l";
                            lacIndex=i;
                            break;
                        case "cgi":
                            hbaseColumns[i]="cg";
                            cgiIndex=i;
                            break;
                        case "omc_name(cell_name)":
                        case "cell_name":
                        case "cellname":
                        case "cell name":
                            hbaseColumns[i]="cn";
                            break;
                        case "sitename":
                        case "site_name":
                        case "sitename(nodeb/bts name)":
                        case "site_id":
                        case "site name":
                            hbaseColumns[i]="sc";
                            break;
                        //case "area":
                        case "subarea_name":
                        case "bsc":
                        case "address":
                        case "site address":
                            hbaseColumns[i]="sn";
                            break;
                        case "longitude":
                        case "x":
                        case "longitude x":
                             hbaseColumns[i]="x";
                            break;
                        case "latitude":
                        case "y":
                        case "latitude y":
                            hbaseColumns[i]="y";
                            break;
                        case "azimuth":
                            hbaseColumns[i]="a";
                            break;
                        case "height":
                        case "from land":
                            hbaseColumns[i]="h";
                            heightIndex=i;
                            break;
                        case "generation":
                            hbaseColumns[i]="g";
                            heightIndex=i;
                            break;
                        default:
                            System.out.println(fileColumns[i]+ " column has been ignored!");
                        }                      
                    }

                    if(cgiIndex==-1 && lacIndex==-1 && cidIndex==-1)
                    {
                        System.out.println("no cgi, lac or cid were founded, exiting the job now!");
                        return;
                    }

                    //read lines and save them into database
                    for(int i=1;i<lines.size();i++)
                    {
                        StringBuilder sb=new StringBuilder(lines.get(i).length());
                        
                        for(char c:lines.get(i).toCharArray())
                        {  
                            if(Character.isLetterOrDigit(c) || c==',' || c==' ' || c=='(' && c!=')' || c==':' || c=='_'
                                    || c=='-' || c=='_' && c=='%' || c=='/' || c=='.' || c=='(' || c==')' || c=='%'
                                    || c=='\'' || c=='&' )
                                sb.append(c);              
                        }
                        
                        String[] cells=sb.toString().split(",");
                        
                        //CGI with dashes
                        if(cells[cgiIndex].indexOf('-')>=0)
                        {
                            String cgi=cells[cgiIndex];
                            int dashIndex=cgi.indexOf('-');
                            String mcc=cgi.substring(0,dashIndex);
                            String mnc=cgi.substring(dashIndex+1, dashIndex=cgi.indexOf('-', dashIndex+1));
                            String lac=cgi.substring(dashIndex+1, dashIndex=cgi.indexOf('-', dashIndex+1));
                            String cid=cgi.substring(dashIndex+1, cgi.length());
                            
                            cells[cgiIndex]=String.format("%03d", Integer.valueOf(mcc))+String.format("%02d", Integer.valueOf(mnc))+String.format("%05d", Integer.valueOf(lac))+String.format("%05d", Integer.valueOf(cid));
                        }
                        
                        //undefined CGI
                        if(cgiIndex==-1)
                        {
                            cells[cgiIndex]=String.format("417%s%05d%05d", company, cells[lacIndex], cells[cidIndex]);
                        }
  
                        //unified LAC, CID
                        if(cidIndex==-1 || lacIndex==-1)
                        {
                            String lac=cells[cgiIndex].substring(5, 10);
                            String cid=cells[cgiIndex].substring(10);
                            
                            lac=StringUtils.stripStart(lac, "0");
                            cid=StringUtils.stripStart(cid, "0");
                            
                            if(lac=="" || lac==null)
                                lac="0";
                            
                            if(cid=="" || cid==null)
                                cid="0";
                            
                            //cells[lacIndex]=lac;
                            //cells[cidIndex]=cid;
                            
                            //cells[cgiIndex]=String.format("417-%s-%s-%s",company, lac, cid);
                        }
                        
                        
                        //use short from of CGI if required
                        if(shortGid)
                            if(cells[cgiIndex].length()>7)
                                cells[cgiIndex]=cells[cgiIndex].substring(7);
                            else
                                System.out.println("Invalid gid value: "+cells[cgiIndex]);
                        
                        //define put object
                        Put put=new Put(Bytes.toBytes(cells[cgiIndex]),(new Date()).getTime());
                        
                        if(cidIndex==-1 || lacIndex==-1)
                        {
                            String cgi=cells[cgiIndex].substring(5);
                            String lac=cgi.substring(0, 5);
                            String cid=cgi.substring(5);
                            
                            lac=StringUtils.stripStart(lac, "0");
                            cid=StringUtils.stripStart(cid, "0");
                            put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("ci"), Bytes.toBytes(tryParseInt(cid, -2,"ci")));
                            put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("l"), Bytes.toBytes(tryParseInt(lac, -2,"l")));
                        }
                        
                        if(heightIndex==-1)
                        {
                            put.addColumn(Bytes.toBytes("i"), Bytes.toBytes("h"), Bytes.toBytes(-2f));
                        }
                        
                        //System.out.println(lines.get(i));
                        for(int j=0;j<hbaseColumns.length;j++) 
                        { 
                            if(hbaseColumns[j]!=null && hbaseColumns[j]!="")
                            {
                                byte[] value;
                                
                                //System.out.println(String.format("index:%s, [%s] = %s.", j, hbaseColumns[j], cells[j]));
   
                                try
                                {
                                    switch(hbaseColumns[j])
                                    {
                                    case "l":
                                    case "ci":
                                        value=Bytes.toBytes(tryParseInt(cells[j], -1, String.format("Column: %s, j: %s, cells: %s", hbaseColumns[j], j, toString(cells))));
                                        break;
                                    case "a":
                                    case "h":
                                        value=Bytes.toBytes(tryParseFloat(cells[j], -1f, String.format("Column: %s, j: %s, cells: %s", hbaseColumns[j], j, toString(cells))));
                                        break;
                                    case "x":
                                    case "y":
                                        value=Bytes.toBytes(tryParseDouble(cells[j], -1d, String.format("Column: %s, j: %s, cells: %s", hbaseColumns[j], j, toString(cells))));
                                        break;
                                    default:
                                        value=Bytes.toBytes(cells[j]);
                  
                                    }
                                    
                                    if(value!=null)
                                        put.addColumn(Bytes.toBytes("i"), Bytes.toBytes(hbaseColumns[j]), value);
                                }
                                catch(Exception ex)
                                {
                                    System.out.println(String.format("Exception on line (%d) column (%d) with column: %s", i, j, hbaseColumns[j]));
                                }
                            }
                        }
                       
                        cellTable.put(put);
                    }

                    cellTable.close();
                    System.out.println("Job has been completed...");
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
                    byte[] valueCid=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("ci"));
                    byte[] valueLac=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("l"));
                    byte[] valueCellName=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("cn"));
                    byte[] valueSiteCode=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("sc"));
                    byte[] valueSiteName=result.getValue(Bytes.toBytes("i"), Bytes.toBytes("sn"));

                    printDoubleValue("X", valueX);
                    printDoubleValue("Y", valueY);
                    printFloatValue("Azimuth", valueAzimuth);
                    printFloatValue("Height", valueHeight);
                    printIntValue("Cid", valueCid);
                    printIntValue("Lac", valueLac);
                    printStringValue("CellName", valueCellName);
                    printStringValue("SiteCode", valueSiteCode);
                    printStringValue("SiteName", valueSiteName);
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
                {
                    //height = r.getValue(Bytes.toBytes("i"), Bytes.toBytes("h"));
                    
                    System.out.println(String.format("CGI: %s, X: %f, Y: %f, A: %f, H: %f, ci: %o, l: %o", 
                            Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("cg"))),
                            Bytes.toDouble(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("x"))),
                            Bytes.toDouble(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("y"))),
                            Bytes.toFloat(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("a"))),
                            Bytes.toFloat(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("h"))),
                            Bytes.toInt(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("ci"))),
                            Bytes.toInt(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("l")))));
                    
                    //System.out.println(Bytes.toDouble(r.getValue(Bytes.t oBytes("i"), Bytes.toBytes("x"))));
                    //System.out.println(Bytes.toInt(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("l"))));
                    //System.out.println(Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("cn"))));
                    //System.out.println(Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("sc"))));
                    //System.out.println(Bytes.toString(r.getValue(Bytes.toBytes("i"), Bytes.toBytes("sn"))));
                   
                }
            }
            else if(cl.hasOption(countOption.getLongOpt()))
            {
                int count=0;
                Scan scan=new Scan();
                
                ResultScanner rs=cellTable.getScanner(scan);
                for(@SuppressWarnings("unused") Result r:rs)
                    count++;
                
                System.out.println("Rows count is: "+count);
                
            }
            else if(cl.hasOption(changeCgiOption.getLongOpt()))
            {
                Scan scan=new Scan();
                scan.addColumn(Bytes.toBytes("i"), Bytes.toBytes("cg")); 
                
                ResultScanner rs= cellTable.getScanner(scan);
                String value=null;
                byte[] key=null;
                String[] token=null;
                Put put=null;
                
                byte[] family=Bytes.toBytes("i");
                byte[] qualifier=Bytes.toBytes("cg");
                
                for(Result r:rs)
                {
                    key=r.getRow();
                    value=Bytes.toString(r.getValue(family, qualifier));
                    
                    //process value
                    token=value.split("-");
                    if(token.length!=4)
                        System.out.println("Invalid cgi format: " + value);
                    else if(token[0].length()!=3 || token[1].length()!=2 || token[2].length()>5 || token[3].length()>5)
                        System.out.println("Invalid cgi length: " + value);
                    else
                    {
                        
                        token[2]=StringUtils.leftPad(token[2], 5, '0');
                        token[3]=StringUtils.leftPad(token[3], 5, '0');
                        
                        value=token[0]+token[1]+token[2]+token[3];
                        
                        put=new Put(key);
                        put.addColumn(family, qualifier, Bytes.toBytes(value));
                        
                        cellTable.put(put);
                    } 
                }
            }
        }
        catch(ParseException ex)
        {

            System.out. println(ex.getMessage());
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
    
    private static void printStringValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toString(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
        
    }
    
    private static void printDoubleValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toDouble(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
    }
    
    /*
    private static void printLongValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toLong(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
        
    }
    */
    
    private static void printIntValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toInt(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
        
    }
    
    private static void printFloatValue(String key,byte[] value)
    {
        if(value!=null)
            System.out.println(String.format("%s = %s", key,Bytes.toFloat(value)));
        else
            System.out.println(String.format("There is no %s result in the database",key));
        
    }
    
    private static int tryParseInt(String value, int defaultValue, String info)
    {
        try
        {
            return Integer.parseInt(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Int value: %s, Exception: %s, Info: %s", String.valueOf(value), ex.getMessage(), info));
            //System.out.println(info);
            return defaultValue;
        }
    }
    
    private static double tryParseDouble(String value, double defaultValue, String info)
    {
        try
        {
            return Double.parseDouble(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Double value: %s, Exception: %s, Info: %s", String.valueOf(value), ex.getMessage(), info));
            return defaultValue;
        }
    }
    
    private static float tryParseFloat(String value, float defaultValue, String info)
    {
        try
        {
            return Float.parseFloat(value);
        }
        catch(Exception ex)
        {
            System.err.println(String.format("Float value: %s, Exception: %s, Info: %s", String.valueOf(value), ex.getMessage(), info));
            //System.out.println(info);
            return defaultValue;
        }
    }
    
    private static String toString(String[] arr)
    {
        String result="";
        
        for(int i=0;i<arr.length;i++)
            result+='('+arr[i]+')'+' ';
        
        return result;
    }
    
    static String err="";
}
