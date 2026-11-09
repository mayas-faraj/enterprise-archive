using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Maniyat;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Maniyat.LocalDatabase.Constructure(MapPath("App_Data\\eshopdata.mdf"));

        //connection = new SqlConnection(connectionString);
        //command = new SqlCommand("", (SqlConnection)connection);

        Maniyat.Database.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\eshopdata.mdf") + ";Integrated Security=True;User Instance=True";
        Maniyat.Database.LogFilePath = MapPath("log.txt");
    }
}