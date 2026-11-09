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
    public partial class adminTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

            if (types.SelectedItem == null)
                Global.FillList(types, "select name from types");

            if (parentTypes.SelectedItem == null)
                Global.FillList(parentTypes, "select name from types");
        }

        protected void bBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin.aspx");
        }

        protected void bAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (parentTypes.SelectedValue == "")
                {
                    Global.RunCommand("insert into types (name,common) values ('" + tName.Text + "','" + tDetails.Text + "');");
                }
                else
                {
                    String id = Global.RunScalarCommand("select id from types where name='" + parentTypes.SelectedValue + "';");
                    Global.RunCommand("insert into types (name,common,typeId) values ('" + tName.Text + "','" + tDetails.Text + "'," + id + ");");
                }

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت الإضافة بنجاح";
                tName.Text = tDetails.Text = "";
                types.SelectedIndex = -1;
                parentTypes.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                lResult.ForeColor = System.Drawing.Color.Red;
                lResult.Text = "حدث خطأ أثناء الأضافة" + "<br/>" + ex.Message;
            }

            Page_Load(null, null);
        }

        protected void bDelete_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < types.Items.Count; i++)
                    if (types.Items[i].Selected)
                        Global.RunCommand("delete from types where name='" + types.Items[i].Value + "'");

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت عملية الحذف بنجاح";
            }
            catch (Exception ex)
            {
                lResult.ForeColor = System.Drawing.Color.Red;
                lResult.Text = "حدث خطأ أثناء الحذف" + "<br/>" + ex.Message;
            }

            types.SelectedIndex = -1;
            Page_Load(null, null);
        }
    }
}
