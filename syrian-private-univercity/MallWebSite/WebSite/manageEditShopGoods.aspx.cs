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

public partial class manageEditShopGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillList();
    }

    private void fillList()
    {
        if (lstShops.SelectedItem == null)
        {
            lstShops.Items.Clear();
            Database.command.CommandText = "SELECT name FROM shops";
            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lstShops.Items.Add(Convert.ToString(Database.dataReader[0]));

            Database.connection.Close();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txName.Text = txDetiails.Text = txPrice.Text = lbResult.Text = "";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txName.Text != "" && lstShops.SelectedItem != null)
        {
            Int32 shopId = Convert.ToInt32(Database.ExcuteScalar("SELECT id FROM shops WHERE name=N'" + Convert.ToString(lstShops.SelectedItem) + "';"));
            Database.ExcuteNotQuery("INSERT INTO shop_goods (shopId,name,details,price) VALUES (" + shopId.ToString() + ",N'" + txName.Text + "',N'" + txDetiails.Text + "'," + txPrice.Text + ");");
            btnClear_Click(sender, e);
            lbResult.Text = "تمت إضافة المادة بنجاج";
        }
        else
            lbResult.Text = "يرجى إدخال الأسم وأختيار المتجر الهدف";

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageGoods.aspx");
    }
}
