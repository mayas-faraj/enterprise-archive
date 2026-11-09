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
    public partial class store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["info"] == "" || Request["info"] == null)
                lTitle.Text = "المتجر غير موجود, يرجى التأكد من الأسم";
            else
            {
                string id = Request["info"];
                if (Global.ConnectionString == "")
                    Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

                lTitle.Text = Global.RunScalarCommand("select name from stores where id=" + id);
                lDesc.Text = Global.RunScalarCommand("select common from stores where id=" + id);

                if (System.IO.File.Exists(MapPath("images\\" + lTitle.Text + ".jpg")))
                    img.ImageUrl = ("images\\" + lTitle.Text + ".jpg");
                else
                    img.Visible = false;

                Global.FillTable(tItems, "select name,details,price from items where storeId=" + id);
            }
        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("browse.aspx");
        }
    }
}
