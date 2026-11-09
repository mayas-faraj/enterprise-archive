using System;
using System.IO;
using Maniyat;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Maniyat.Database.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\eshopdata.mdf") + ";Integrated Security=True;User Instance=True";
        Maniyat.Database.LogFilePath = MapPath("log.txt");    
    }
}