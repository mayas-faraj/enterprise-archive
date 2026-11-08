package smd.log;

public class Parameter
{
    //public constructors region
    public Parameter(String name,String value)
    {
        this.setName(name);
        this.setValue(value);
    }
    
    //public methods region
    @Override
    public String toString()
    {
        return String.format("[%s] = [%s]", getName(),getValue());
    }
    
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
    {
        this.value = value;
    }

    //private fields region
    private String name;
    private String value;
}