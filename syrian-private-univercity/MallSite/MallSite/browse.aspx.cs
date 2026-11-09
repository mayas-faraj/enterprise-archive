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
    public partial class browse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

            Global.FillTableWithLink(tMain, "select id,name from stores", "store.aspx");
        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}
