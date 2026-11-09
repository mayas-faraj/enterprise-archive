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
    public partial class adminItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.ConnectionString == "")
                Global.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\database.mdf") + ";Integrated Security=True;User Instance=True";

            if (stores.SelectedItem == null)
                Global.FillList(stores, "select name from stores");

            if (items.SelectedItem == null)
                Global.FillList(items, "select name from items");
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
                    if (items.Items[i].Selected)
                        Global.RunCommand("delete from items where name='" + items.Items[i].Value + "'");

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت عملية الحذف بنجاح";
            }
            catch (Exception ex)
            {
                lResult.ForeColor = System.Drawing.Color.Red;
                lResult.Text = "حدث خطأ أثناء الحذف" + "<br/>" + ex.Message;
            }

            items.SelectedIndex = -1;
            Page_Load(null, null);
        }

        protected void stores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = Global.RunScalarCommand("select id from stores where name='" + stores.SelectedValue + "';");
            Global.FillList(items, "select name from items where storeId=" + id);
        }

        protected void bAdd_Click(object sender, EventArgs e)
        {
            try
            {
                String id = Global.RunScalarCommand("select id from stores where name='" + stores.SelectedValue + "';");
                Global.RunCommand("insert into items (name,details,price,storeId) values ('" + tName.Text + "','" + tDetails.Text + "','" + tPrice.Text + "'," + id + ");");

                lResult.ForeColor = System.Drawing.Color.Green;
                lResult.Text = "تمت الإضافة بنجاح";  
                items.SelectedIndex = -1;

                tName.Text = tDetails.Text = tPrice.Text = "";
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
