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
    public partial class types : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

            if (Request["info"] != "" && Request["info"] != null)
                Global.FillTableWithLink(tTypes, "select id,name from types where typeId=" + Request["info"].ToString(), "types.aspx");
            else
                Global.FillTableWithLink(tTypes, "select id,name from types where typeId=-1", "types.aspx");
        }
    }
}
