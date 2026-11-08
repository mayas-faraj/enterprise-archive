package smd.eors.dataAccess.entity.master;

import java.util.Date;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Event;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Command extends MasterEntity
{
    //public constructors region
    public Command(String commandId, String text, String admin, String users, Date date)
    {
        this.commandId=commandId;
        this.admin=admin;
        this.text=text;
        this.users=users;
        this.date=date;
    }
    
    public Command(String commandId, String text, String admin)
    {
        this(commandId, text, admin, "", null);
    }
    
    public Command()
    {
        this("", "", "", "", null);
    }

    //public methods region
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(TEXT, getText());  
        jsonObject.put(USERS, getUsers());
        jsonObject.put(DATE,DATE_FORMAT.format(getDate()));

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(COMMAND_ID, getCommandId());
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(TEXT, getText());
        jsonObject.put(USERS, getUsers());
        jsonObject.put(DATE,DATE_FORMAT.format(getDate()));

        /*
        JSONArray jsonReaders=new JSONArray();

        if(readers!=null)
            for(Event read: getReaders())
                jsonReaders.put(read.toJsonString().replace("\"", ""));
        
        jsonObject.put(READERS, jsonReaders);
        */
        
        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    @Override
    public byte[] designRowKey()
    {
        return Bytes.toBytes(commandId);
    }
    
    public String getCommandId()
    {
        return commandId;
    }

    public void setCommandId(String commandId)
    {
        this.commandId = commandId;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public String getAdmin()
    {
        return admin;
    }

    public void setAdmin(String admin)
    {
        this.admin = admin;
    }

    public String getUsers()
    {
        return users;
    }

    public void setUsers(String users)
    {
        this.users = users;
    }
    
    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }
    
    public boolean isBroadcast()
    {
        return users==null || users=="";
    }

    public Event[] getReaders()
    {
        return readers;
    }

    public void setReaders(Event[] readers)
    {
        this.readers = readers;
        SlaveEntity.setMasterEntity(this, readers);
    }

    //public static final fields region
    public static final String COMMAND_ID = "CommandId";
    public static final String ADMIN = "Admin";
    public static final String TEXT = "Message";
    public static final String USERS = "Users";
    public static final String DATE = "Date";
    public static final String READERS = "Readers";
    
    //private fields region
    private String commandId;
    private String admin;
    private String text;
    private String users;
    private Date date;
    private Event[] readers;
    
}
