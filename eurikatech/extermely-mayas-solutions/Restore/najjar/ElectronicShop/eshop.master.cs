using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class eshop : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(MapPath("marquee.dat"), FileMode.OpenOrCreate, FileAccess.Read);
        StreamReader sr = new StreamReader(fs,System.Text.Encoding.Default);
        lbMarquee.Text = sr.ReadToEnd();
        sr.Close();
        fs.Close(); 
    }
}