
package smd.eors.dataAccess.entity.master;

import org.json.JSONObject;

import smd.eors.dataAccess.entity.slave.Device;
import smd.eors.dataAccess.entity.slave.Location;
import smd.eors.dataAccess.entity.slave.Present;
import smd.eors.dataAccess.entity.slave.Sim;
import smd.eors.dataaccess.entity.MasterEntity;
import smd.eors.dataaccess.entity.SlaveEntity;

import org.apache.hadoop.hbase.util.Bytes;
import org.json.JSONException;

public class User extends MasterEntity
{
    //public constructors region
    public User(String name, String fullName, String section, String address, String admin, boolean isMuted, boolean isDisabled)
    {
        this.name=name;
        this.fullName=fullName;
        this.section=section;
        this.address=address;
        this.admin=admin;
        this.muted=isMuted;
        this.disabled=isDisabled;
    }
    
    public User(String name, String fullName, String section, String address, String admin)
    {
        this(name, fullName, section, address, admin, false, false);
    }
    
    public User()
    {
        this("", "", "", "", "");
    }
    
    //public method regions
    @Override
    public String toShortJsonString() throws JSONException
    {
        JSONObject jsonUser=new JSONObject();

        jsonUser.put(NAME, getName());
        jsonUser.put(FULL_NAME, getFullName());
        jsonUser.put(SECTION, getSection());
        jsonUser.put(ADDRESS, getAddress());
        jsonUser.put(ADMIN, getAdmin());

        return jsonUser.toString();
    }

    @Override
    public String toJsonString() throws JSONException
    {
        JSONObject jsonUser=new JSONObject();

        jsonUser.put(NAME, getName());
        jsonUser.put(FULL_NAME, getFullName());
        jsonUser.put(SECTION, getSection());
        jsonUser.put(ADDRESS, getAddress());
        jsonUser.put(ADMIN, getAdmin());
        jsonUser.put(MUTED, isMuted());
        jsonUser.put(DISABLED, isDisabled());
        jsonUser.put(LOGO, base64Encode(getLogo()));
                
        return jsonUser.toString();
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
    
    public String getSection()
    {
        return section;
    }

    public void setSection(String section)
    {
        this.section = section;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }
    
    public String getAdmin()
    {
        return admin;
    }

    public void setAdmin(String admin)
    {
        this.admin = admin;
    }

    public byte[] getLogo()
    {
        return logo;
    }

    public void setLogo(byte[] logo)
    {
        this.logo = logo;
    }

    public boolean isMuted()
    {
        return muted;
    }

    public void setMuted(boolean muted)
    {
        this.muted = muted;
    }

    public boolean isDisabled()
    {
        return disabled;
    }

    public void setDisabled(boolean disabled)
    {
        this.disabled = disabled;
    }
    
    public Sim[] getSims()
    {
        return sims;
    }

    public void setSims(Sim[] sims)
    {
        this.sims = sims;
        SlaveEntity.setMasterEntity(this, sims);
    }

    public Device[] getDevices()
    {
        return devices;
    }

    public void setDevices(Device[] devices)
    {
        this.devices = devices;
        SlaveEntity.setMasterEntity(this, devices);
    }

    public Location[] getLocations()
    {
        return locations;
    }

    public void setLocations(Location[] locations)
    {
        this.locations = locations;
        SlaveEntity.setMasterEntity(this, locations);
    }

    public Present[] getPresents()
    {
        return presents;
    }

    public void setPresents(Present[] presents)
    {
        this.presents = presents;
        SlaveEntity.setMasterEntity(this, presents);
    }

    //public static final fields region
    public static final String NAME = "Name";
    public static final String FULL_NAME = "FullName";
    public static final String SECTION = "Section";
    public static final String ADDRESS = "Address";
    public static final String ADMIN = "Admin";
    public static final String LOGO = "Logo";
    public static final String MUTED = "IsMuted";
    public static final String DISABLED = "IsDisabled";
    
    //private fields region
    private String name;
    private String fullName;
    private String section;
    private String address;
    private String admin;
    private byte[] logo;
    private boolean muted;
    private boolean disabled;
    
    private Sim[] sims;
    private Device[] devices;
    private Location[] locations;
    private Present[] presents;
}
