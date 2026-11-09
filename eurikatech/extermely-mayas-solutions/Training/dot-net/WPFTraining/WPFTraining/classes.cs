namespace test
{
    public class baseClass
    {
    }

    public class derivedClass : baseClass, inter3
    {
        
    }

    public interface inter1
    {
    }

    internal interface inter2
    {
    }

    internal interface inter3 : inter1, inter2
    {
    }

    internal struct strct :inter1 
    {
    }
    
}