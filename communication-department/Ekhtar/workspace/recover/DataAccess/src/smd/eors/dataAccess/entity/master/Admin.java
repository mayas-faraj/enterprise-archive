package smd.eors.dataAccess.entity.master;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;
import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Setting;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

public class Admin extends MasterEntity
{
    //public methods region
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonUser=new JSONObject();

        jsonUser.put(NAME, getName());
        jsonUser.put(FULL_NAME, getFullName());
        jsonUser.put(DISABLED, isDisabled());

        return jsonUser.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonAdmin=new JSONObject();

        jsonAdmin.put(NAME, getName());
        jsonAdmin.put(FULL_NAME, getFullName());
        jsonAdmin.put(DISABLED, isDisabled());
        jsonAdmin.put(LOGO, base64Encode(getLogo()));
        jsonAdmin.put(MAP_LOGO, base64Encode(getMapLogo()));

        /*
        JSONArray jsonSettings=new JSONArray();
        JSONArray jsonPrivileges=new JSONArray();

        if(getSettings()!=null)
            for(Setting setting: getSettings())
                if(setting!=null)
                    jsonSettings.put(setting.toShortJsonString().replace("\"", ""));

        if(getPrivileges()!=null)
            for(Setting privilege: getPrivileges())
                if(privilege!=null)
                    jsonPrivileges.put(privilege.toShortJsonString().replace("\"", ""));

        jsonAdmin.put(SETTINGS, jsonSettings.toString());
        jsonAdmin.put(PRIVILEGE, jsonPrivileges.toString());

         */
        return jsonAdmin.toString();
    }

    @Override
    public void fromJsonString(String jsonString)
    {
        // TODO Auto-generated method stub
    }

    @Override
    public byte[] designRowKey()
    {
        return Bytes.toBytes(name);
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getFullName()
    {
        return fullName;
    }

    public void setFullName(String fullName)
    {
        this.fullName = fullName;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public boolean isDisabled()
    {
        return disabled;
    }

    public void setDisabled(boolean disabled)
    {
        this.disabled = disabled;
    }

    public Setting[] getSettings()
    {
        return settings;
    }

    public void setSettings(Setting[] settings)
    {
        this.settings = settings;
        SlaveEntity.setMasterEntity(this, settings);
    }

    public byte[] getLogo()
    {
        return logo;
    }

    public void setLogo(byte[] logo)
    {
        this.logo = logo;
    }

    public byte[] getMapLogo()
    {
        return mapLogo;
    }

    public void setMapLogo(byte[] mapLogo)
    {
        this.mapLogo = mapLogo;
    }

    //public static final fields region
    public static final String NAME = "Name";
    public static final String FULL_NAME = "FullName";
    public static final String DISABLED = "IsDisabled";
    public static final String LOGO = "Logo";
    public static final String MAP_LOGO = "MapLogo";


    //private fields region
    private String name;
    private String fullName;
    private String password;
    private boolean disabled;
    private byte[] logo;
    private byte[] mapLogo;

    private Setting[] settings;
}
