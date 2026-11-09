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
    public partial class adminStores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

            if (stores.SelectedItem == null)
                Global.FillList(stores, "select name from stores");

            if (parentTypes.SelectedItem == null)
                Global.FillList(parentTypes, "select name from types");
        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void bDelete_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < stores.Items.Count; i++)
                    if (stores.Items[i].Selected)
                        Global.RunCommand("delete from stores where name='" + stores.Items[i].Value + "'");

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت عملية الحذف بنجاح";
            }
            catch (Exception ex)
            {
                lResult.ForeColor = System.Drawing.Color.Red;
                lResult.Text = "حدث خطأ أثناء الحذف" + "<br/>" + ex.Message;
            }

            stores.SelectedIndex = -1;
            Page_Load(null, null);
        }

        protected void bAdd_Click(object sender, EventArgs e)
        {
            try
            {
                String id = Global.RunScalarCommand("select id from types where name='" + parentTypes.SelectedValue + "';");
                Global.RunCommand("insert into stores (name,common,typeId) values ('" + tName.Text + "','" + tDetails.Text + "'," + id + ");");

                if (uploader.HasFile)
                    if (uploader.PostedFile.ContentType == "image/pjpeg")
                        uploader.SaveAs(MapPath("images\\" + tName.Text + ".jpg"));

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت الإضافة بنجاح";
                tName.Text = tDetails.Text = "";
                stores.SelectedIndex = -1;
                parentTypes.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                lResult.ForeColor = System.Drawing.Color.Red;
                lResult.Text = "حدث خطأ أثناء الأضافة" + "<br/>" + ex.Message;
            }

            Page_Load(null, null);
        }
    }
}
