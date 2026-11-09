using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace MallSite
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";
        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void bSearch_Click(object sender, EventArgs e)
        {
            Global.FillTable(tResult, "select name,details,price from items where name like '%" + tName.Text + "%' and details like '%" + tDetails.Text + "%'");
        }
    }
}
