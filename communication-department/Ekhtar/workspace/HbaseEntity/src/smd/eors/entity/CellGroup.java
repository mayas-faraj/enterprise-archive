package smd.eors.entity;

import java.text.ParseException;
import java.util.Date;
import java.util.NavigableMap;

import org.apache.hadoop.hbase.io.ImmutableBytesWritable;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CellGroup extends HbaseEntity
{  
    //public methods region
    @Override
    public void setValueFromJson(String jsonEntity)
    {
        setValueFromJson(Long.MIN_VALUE,jsonEntity);  
    }

    @Override
    public void setValueFromJson(long entityId, String jsonEntity)
    {
        this.setCells(new Cell[] {new Cell()});
        try
        {
            JSONObject payloadObj = new JSONObject((new JSONObject(jsonEntity)).getString(PAYLOAD)); 
            
            this.setUser(payloadObj.getString(USER));
            this.getCells()[0].setCellInfo(payloadObj.getString(CELL)); 
            
            //row key design  
            rowId=new byte[1+Bytes.SIZEOF_INT];
            
            //flag that the user is an agent, not administrator
            rowId[0]=0;
             
            byte[] userHash=Bytes.toBytes(getUser().hashCode());
            
            Bytes.putBytes(rowId, 1, userHash, 0, userHash.length);   
              
            //put at least if there are an error while parsing
            this.getCells()[0].setDate(DATE_FORMAT.parse(payloadObj.getString(DATE)));
        }
        catch (JSONException ex)
        {
            exceptionHandler(ex);
        }
        catch (ParseException ex)
        {
            exceptionHandler(ex);
        }
    }

    @Override
    public void setValueFromHbaseResult(Result result)
    {
      //extract report id
        this.setRowId(result.getRow());
 
        //getting values into report
        //this.setUser(getValue(result.getValue(Bytes.toBytes(HbaseSchema.USER_LOGIN), Bytes.toBytes(HbaseSchema.USER_LOGIN_NAME)),""));
        this.setUser(getValue(result.getValue(Bytes.toBytes("l"), Bytes.toBytes("n")),""));
        
        this.setCells(new Cell[result.rawCells().length]);
        
        String[] locationValues;

        NavigableMap<byte[], byte[]> familyMap=result.getFamilyMap(Bytes.toBytes(HbaseSchema.USER_CELL));
        int cellIndex=0;
        
        for(byte[] key : familyMap.keySet())
        {
            long longKey=Bytes.toLong(key);
            String value=getValue(familyMap.get(key), "");

            locationValues=value.split(";");

            if(locationValues.length>=3)
                this.getCells()[cellIndex]=new Cell(locationValues[2], new Date(longKey), 
                Double.parseDouble(locationValues[0]),Double.parseDouble(locationValues[1]));
            
            cellIndex++;
        }
    }
    
    @Override
    public String toJsonString()
    {
        JSONObject jsonObject=new JSONObject();
        JSONArray jsonArray=new JSONArray();
        
        try
        {
            jsonObject.put(USER, getUser());
            
            for(Cell cell:this.getCells())
            {
                jsonArray.put(cell.getDate());
                jsonArray.put(cell.getCellInfo());
                jsonArray.put(cell.getLongitude());
                jsonArray.put(cell.getLatitude());
                
                jsonObject.put(LOCATIONS, jsonArray);
            }
            return jsonObject.toString();
        }
        catch (JSONException ex)
        {
            exceptionHandler(ex);
            return "Error parsing cell json object, USER_ID: "+getUser();
        }
    }
    
 
    @Override
    public Put getPut()
    {
        //put the result
        Put put=new Put(getRowId());
        
        putValue(put,HbaseSchema.USER_LOGIN,HbaseSchema.USER_LOGIN_NAME,getUser());
        
        String value;   
        for(Cell cell:this.getCells())
        {
            value=String.valueOf(cell.getLongitude())+";"+String.valueOf(cell.getLatitude())+";"+cell.getCellInfo();  
            putValue(put,HbaseSchema.USER_CELL,String.valueOf(cell.getDate().getTime()),value);
        }
        
        return put;
    }

    public String getUser()
    {
        return user;
    }

    public void setUser(String user)
    {
        this.user = user;
    }

    public Cell[] getCells()
    {
        return cells;
    }

    public void setCells(Cell[] cells)
    {
        this.cells = cells;
    }

    //private static final fields region
    private static final String PAYLOAD = "payload";
    private static final String DATE = "Date";
    private static final String CELL="Cell";   
    private static final String USER = "Publisher";
    private static final String LOCATIONS = "location";
    
    //private fields region
    private String user;
    private Cell[] cells=new Cell[0];
    
    public class Cell
    {
        //public construction region
        public Cell(String cellInfo,Date date)
        {
            this.cellInfo=cellInfo;
            this.date=date;
        }
        
        public Cell(String cellInfo,Date date,double longitude,double latitude)
        {
            this(cellInfo,date);
        
            this.longitude=longitude;
            this.latitude=latitude;
        }
        
        public Cell() {}
        
        //public methods region
        public Date getDate()
        {
            return date;
        }
        
        public void setDate(Date date)
        {
            this.date = date;
        }

        public String getCellInfo()
        {
            return cellInfo;
        }

        public void setCellInfo(String cellInfo)
        {
            this.cellInfo = cellInfo;
        }

        public double getLatitude()
        {
            return latitude;
        }

        public void setLatitude(double latitude)
        {
            this.latitude = latitude;
        }

        public double getLongitude()
        {
            return longitude;
        }

        public void setLongitude(double longitude)
        {
            this.longitude = longitude;
        }

        //private fields region
        private Date date;
        private String cellInfo;
        private double longitude;
        private double latitude;
    }
}
