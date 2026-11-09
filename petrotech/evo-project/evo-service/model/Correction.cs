class Correction
{
    public string Type
    {
        get
        {
            return type;
        }
        set
        {
            type=value;
        }
    }
    public string Shape
    {
        get
        {
            return shape;
        }
        set
        {
            shape=value;
        }
    }

    public float Height
    {
        get
        {
            return height;
        }
        set
        {
            height=value;
        }
    }

    public float Depth
    {
        get
        {
            return depth;
        }
        set
        {
            depth=value;
        }
    }

    public float Length
    {
        get
        {
            return length;
        }
        set
        {
            length=value;
        }
    }

    public int MaxPointsCount
    {
        get
        {
            return maxPointsCount;
        }
        set
        {
            maxPointsCount=value;
        }
    }

    public string Data
    {
        get
        {
            return data;
        }
        set
        {
            data=value;
        }
    }

    private string type;
    private string shape;
    private float height;
    private float depth;
    private float length;
    private int maxPointsCount;
    private string data;
}