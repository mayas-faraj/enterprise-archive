class Config
{
    public string Path 
    {
        get
        {
            return path;
        }

        set
        {
            path=value;
        }
    }

    public string Key
    {
        get 
        {
            return key;
        }
        set
        {
            key=value;
        }
    }

    public string Value
    {
        get
        {
            return value;
        }
        set
        {
            this.value=value;
        }
    }
    private string path;
    private string key;
    private string value;
}