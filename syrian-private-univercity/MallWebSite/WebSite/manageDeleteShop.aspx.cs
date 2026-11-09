using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class manageDeleteShop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillList();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops2.aspx");
    }
    private void fillList()
    {
        if (lsShops.SelectedIndex == -1)
        {
            lsShops.Items.Clear();
            Database.command.CommandText = "SELECT name FROM shops;";
            Database.connection.Open();
            
            Database.dataReader = Database.command.ExecuteReader();
            while (Database.dataReader.Read())
                lsShops.Items.Add(Database.dataReader[0].ToString());

            Database.connection.Close();
        }
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (lsShops.SelectedIndex != -1)
        {
            try
            {
                Database.ExcuteNotQuery("DELETE FROM shops WHERE name=N'" + lsShops.SelectedValue + "'");
                lbResult.Text = "تمت عملية الحذف بنجاح";

                lsShops.SelectedIndex = -1;
                fillList();
            }
            catch (Exception ex)
            {
                lbResult.Text = ex.Message;

                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
            }

        }
        else
            lbResult.Text = "يجب تحديد أسم متجر للحذف.";
    }
}
