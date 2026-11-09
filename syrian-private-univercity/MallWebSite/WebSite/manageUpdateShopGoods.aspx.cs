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

public partial class mangeUpdateShopGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillList(Request["name"]);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageGoods.aspx");
    }
    private void fillList(String shopName)
    {
        if (lstGoods.SelectedIndex == -1)
        {
            String id = Convert.ToString(Database.ExcuteScalar("SELECT id FROM shops WHERE name=N'" + shopName + "';"));

            if (id != "")
            {
                lstGoods.Items.Clear();
                Database.command.CommandText = "SELECT name FROM shop_goods WHERE shopid=" + id;
                Database.connection.Open();
                Database.dataReader = Database.command.ExecuteReader();
                while (Database.dataReader.Read())
                    lstGoods.Items.Add(Database.dataReader[0].ToString());
                Database.connection.Close();
            }
            else
                lbResult.Text = "لا يوجد أسم للمادة التي تم أختيارها";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txName.Text = txPrice.Text = txDetiails.Text = lbResult.Text = "";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (lstGoods.SelectedItem != null)
            {
                lbResult.Text = "";

                if (txPrice.Text != "")
                {
                    Database.ExcuteNotQuery("UPDATE shop_goods SET price=N'" + txPrice.Text + "' WHERE name=N'" + lstGoods.SelectedValue + "';");
                    lbResult.Text += "تم تعديل السعر إلى " + txPrice.Text + "<br/>";
                }

                if (txDetiails.Text != "")
                {
                    Database.ExcuteNotQuery("UPDATE shop_goods SET details=N'" + txDetiails.Text + "' WHERE name=N'" + lstGoods.SelectedValue + "';");
                    lbResult.Text += "تم تعديل التفاصيل إلى" + txDetiails.Text + "<br/>";
                }

                if (txName.Text != "")
                {
                    Database.ExcuteNotQuery("UPDATE shop_goods SET name=N'" + txName.Text + "' WHERE name=N'" + lstGoods.SelectedValue + "';");
                    lbResult.Text += "تم تعديل الأسم إلى " + txName.Text + "<br/>";

                    lstGoods.SelectedIndex = -1;
                    fillList(Request["name"]);
                }
            }
        }
        catch (Exception ex)
        {
            lbResult.Text += "حدث خطأ أثناء التعديل" + "<br/>" + ex.Message;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (lstGoods.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("DELETE FROM shop_goods WHERE name=N'" + lstGoods.SelectedValue + "';");
                lbResult.Text = "تم حذف المادة بنجاح";
                lstGoods.SelectedIndex = -1;
                fillList(Request["name"]);
            }
            catch (Exception ex)
            {
                lbResult.Text = "حدث خطأ أثناء القيام بعملية الحذف<br/>" + ex.Message;
            }
        }
    }
}
