package smd.eors.dataAccess.entity.slave;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Replay extends SlaveEntity
{
    //public constructors region
    public Replay(MasterEntity masterEntity, String adminName, String text, Date date)
    {
        super(masterEntity);
        this.admin=adminName;
        this.text=text;
        this.date=date;
    }
    
    public Replay(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods regoin
    @Override
    public String toShortJsonString()
    {
        JSONObject jsonUser=new JSONObject();
        
        try
        {
            jsonUser.put(TEXT, getText());
            jsonUser.put(DATE, DATE_FORMAT.format(getDate()));
        }
        catch(JSONException ex)     {}
        
        return jsonUser.toString();
    }

    @Override
    public String toJsonString()
    {
        JSONObject jsonUser=new JSONObject();

        try
        {
            jsonUser.put(ADMIN, getAdmin());
            jsonUser.put(TEXT, getText());
            jsonUser.put(DATE, DATE_FORMAT.format(getDate()));
        }
        catch(JSONException ex)     {}

        return jsonUser.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }

    
    @Override
    public byte[] toKey()
    {
        if(getDate()!=null)
            return Bytes.toBytes(getDate().getTime());
        else
            return null;
    }

    @Override
    public byte[] toValue()
    {
        String value=getAdmin()+KEY_VALUE_SEPERATOR+getText();
        return Bytes.toBytes(value);
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Replay replay=new Replay(this.getRowKey());
        
        if(key!=null)
            replay.setDate(new Date(Bytes.toLong(value)));
        
        if(value!=null)
        {
            String stringValue=Bytes.toString(value);
            
            if(stringValue.indexOf(KEY_VALUE_SEPERATOR)>=0)
            {
                replay.setAdmin(stringValue.substring(0, KEY_VALUE_SEPERATOR));
                replay.setText(stringValue.substring(KEY_VALUE_SEPERATOR));
            }
            else
                replay.setText(stringValue);
        }
        
        return replay;
    }
    
    public boolean isAdmin()
    {
        return admin!="";
    }

    public String getAdmin()
    {
        return admin;
    }

    public void setAdmin(String admin)
    {
        this.admin = admin;
    }

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    //static final fields region
    private static final String ADMIN = "location";
    private static final String DATE = "Longitude";
    private static final String TEXT = "Latitude";

    //private fields region
    private String admin;
    private Date date;
    private String text;
}
