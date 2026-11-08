package smd.eors.dataAccess.entity.master;
 
import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Info;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Statistic extends MasterEntity
{
    //public constructions region
    public Statistic(String name, String es)
    {
        this.es=es;
        this.name=name;
        this.info=new Info[0];
    }
    
    public Statistic()
    {
        this("", "");
    }

    //public methods region
    @Override
    public byte[] designRowKey()
    {
        String es;
        
        if(getEs()!=null && getEs()!="")
            es=getEs()+"-";
        else
            es="";
        
        return Bytes.toBytes(es+getName());
    }

    @Override
    public String toShortJsonString() throws JSONException
    {
        if(getInfo()!=null && getInfo().length>0)
            return SlaveEntity.toShortJsonArray(getInfo()).toString();
        else
            return "";
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonObject=new JSONObject();
        
        jsonObject.put(ROW_KEY, getHexRowKey());
        jsonObject.put(NAME, getName());
        jsonObject.put(ES, getEs());
        
        if(getInfo()!=null && getInfo().length>0)
            jsonObject.put(STATICALS, new JSONArray(SlaveEntity.toShortJsonArray(getInfo())));

        return jsonObject.toString();
    }
    
    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getEs()
    {
        return es;
    }

    public void setEs(String es)
    {
        this.es = es;
    }
   
    public Info[] getInfo()
    {
        return info;
    }

    public void setInfo(Info[] info)
    {
        this.info = info;
        SlaveEntity.setMasterEntity(this, info);
    }
    
    //public static final fields region
    public static final String NAME = "name";
    public static final String ES = "es";
    public static final String STATICALS = "statistics";

    //private fields region
    private String name;
    private String es;
    private Info[] info; 
}
