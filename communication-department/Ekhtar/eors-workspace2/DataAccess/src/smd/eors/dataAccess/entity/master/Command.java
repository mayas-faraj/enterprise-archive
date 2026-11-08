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
    public Command(String commandId, String admin, String node, String text, Date date)
    {
        this.commandId=commandId;
        this.node=node;
        this.text=text;
        this.admin=admin;
        this.date=date;
    }
    
    public Command(String commandId, String admin, String text)
    {
        this(commandId, admin, "", text, null);
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
        jsonObject.put(NODE, getNode());
        jsonObject.put(TEXT, getText());  
        jsonObject.put(ADMIN, getAdmin());
        jsonObject.put(DATE,DATE_FORMAT.format(getDate()));

        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();

        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(COMMAND_ID, getCommandId());
        jsonObject.put(NODE, getNode());
        jsonObject.put(TEXT, getText());
        jsonObject.put(ADMIN, getAdmin());
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
        //precondition: admin, node is not null
        byte[] key=new byte[Bytes.SIZEOF_INT +Bytes.SIZEOF_INT +Bytes.SIZEOF_INT +Bytes.SIZEOF_INT +Bytes.SIZEOF_LONG];
        int offset=0;
        
        String users="";
        long timestamp=0;
        
        if(getReaders()!=null)
            for(Event reader: getReaders())
                users+=reader.getName();
        
        if(getDate()!=null)
            timestamp=getDate().getTime();
        
        offset=Bytes.putInt(key, offset, getAdmin().hashCode());
        offset=Bytes.putInt(key, offset, getNode().hashCode());
        offset=Bytes.putInt(key, offset, users.hashCode());
        Bytes.putLong(key, offset, Long.MAX_VALUE-timestamp);
        
        return key;
    }
    
    public String getCommandId()
    {
        return commandId;
    }

    public void setCommandId(String commandId)
    {
        this.commandId = commandId;
    }
    
    public String getAdmin()
    {
        return admin;
    }

    public void setAdmin(String admin)
    {
        this.admin = admin;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public String getNode()
    {
        return node;
    }

    public void setNode(String node)
    {
        this.node = node;
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
        return node!=null && node!="";
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
    public static final String NODE = "Node";
    public static final String TEXT = "Message";
    public static final String DATE = "Date";
    public static final String READERS = "Readers";
    
    //private fields region
    private String commandId;
    private String admin;
    private String node;
    private String text;
    private Date date;
    private Event[] readers;
    
}
