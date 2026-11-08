package smd.eors.dataAccess.entity.slave;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataaccess.DataSchema;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Action extends smd.eors.dataaccess.entity.SlaveEntity
{
    //public constructors region
    public Action(MasterEntity masterEntity, ActionType type, long timestamp)
    {
        super(masterEntity);
        this.type=type;
        this.timestamp=timestamp;
    }
    
    public Action(MasterEntity masterEntity)
    {
        this(masterEntity, null, 0);
    }
    
    public Action(byte[] rowKey)
    {
        super(rowKey);
    }

    //public methods region
    @Override
    public byte[] toKey()
    {
        switch(type)
        {
        case currentImportant:
            return Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTIMPORTANT);
        case currentUnimportant:
            return Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTIMPORTANT);
        case currentSeen:
            return Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTSEEN);
        case currentUnseen:
            return Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTSEEN);
        default:
            return Bytes.toBytes(timestamp);

        } 
    }

    @Override
    public byte[] toValue()
    {
        switch(type)
        {
        case currentImportant:
            return Bytes.toBytes(true);
        case currentUnimportant:
            return Bytes.toBytes(false);
        case currentSeen:
            return Bytes.toBytes(true);
        case currentUnseen:
            return Bytes.toBytes(false);
        default:
            if(type!=null)
                return Bytes.toBytes(type.toString());
            else
                return null;
        } 
    }

    @Override
    public SlaveEntity fromKeyValue(byte[] key, byte[] value)
    {
        Action action=new Action(this.getRowKey());
        
        if(Bytes.equals(key, Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTIMPORTANT)))
        {
            if(Bytes.toBoolean(value))
                action.setType(ActionType.currentImportant);
            else
                action.setType(ActionType.currentUnimportant);
        }
        else if(Bytes.equals(key, Bytes.toBytes(DataSchema.REPORT_ACTION_CURRENTSEEN)))
        {
            if(Bytes.toBoolean(value))
                action.setType(ActionType.currentSeen);
            else
                action.setType(ActionType.currentUnseen);
        }
        else
        {
            action.setTimestamp(Bytes.toLong(key));
            
            try
            {
                action.setType(ActionType.valueOf(Bytes.toString(value)));
            }
            catch(Exception ex)
            {
                action.setType(ActionType.unknown);
                System.out.println(ex);
            }
        }
        
        return action;
    }

    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(TYPE, getType());
            jsonObject.put(TIMESTAMP, getTimestamp());
        }
        catch(JSONException ex)     
        {} 
        
        return jsonObject.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        try
        {
            jsonObject.put(ROW_KEY, getHexRowKey());
            jsonObject.put(TYPE, getType());
            jsonObject.put(TIMESTAMP, getTimestamp());
        }
        catch(JSONException ex)     
        {} 
        
        return jsonObject.toString();
    }

    @Override
    public void fromJsonString(String jsonString) throws JSONException
    {
    }
    
    public ActionType getType()
    {
        return this.type;
    }
    
    public void setType(ActionType type)
    {
        this.type=type;
    }

    public long getTimestamp()
    {
        return this.timestamp;
    }
    
    public void setTimestamp(long timestamp)
    {
        this.timestamp=timestamp;
    }
    
    public void setFamilyspace(String familyspace)
    {
        this.familyspace=familyspace;
    }
    
    //private constant fields region
    private final String TYPE="type";
    private final String TIMESTAMP="timestamp";

    //private fields region
    private ActionType type;
    private long timestamp;
    
    //public types region
    public enum ActionType
    {
        currentSeen,
        currentImportant,
        currentUnseen,
        currentUnimportant,
        seen,
        unseen,
        important,
        unimportant,
        export,
        unknown
    }
}
 