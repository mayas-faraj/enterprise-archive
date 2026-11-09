using System;
using System.IO;
using Maniyat;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Maniyat.Database.Constructure(MapPath("App_Data\\eshopdata.mdf"));

        FileStream fs = new FileStream(MapPath("marquee.dat"), FileMode.OpenOrCreate, FileAccess.Read);
        StreamReader sr = new StreamReader(fs);
        lblMarquee.Text = sr.ReadToEnd();
        sr.Close();
        fs.Close();    
    }
}