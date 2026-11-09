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

public partial class chooseShopToEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lstShops.SelectedItem == null)
        {
            lstShops.Items.Clear();

            Database.command.CommandText = "SELECT name FROM shops;";
            Database.connection.Open();

            Database.dataReader = Database.command.ExecuteReader();
            while (Database.dataReader.Read())
                lstShops.Items.Add(Database.dataReader[0].ToString());

            Database.connection.Close();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageGoods.aspx");
    }
    protected void btnChoose_Click(object sender, EventArgs e)
    {
        if (lstShops.SelectedItem != null)
            Response.Redirect("manageUpdateShopGoods.aspx?name=" + lstShops.SelectedValue);
        else
            lbResult.Text = "يجب أختيار أسم متجر من القائمة.";
    }
}
