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

public partial class shopGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String shopId = Request["shop"];

        if (shopId != null && shopId != "")
        {
            Database.command.CommandText = "SELECT name,major,address FROM shops WHERE id=" + shopId;
            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            if (Database.dataReader.Read())
            {
                lbShopName.Text = Convert.ToString(Database.dataReader[0]);
                lbDetails.Text = Convert.ToString(Database.dataReader[1]);
                lbAddress.Text = Convert.ToString(Database.dataReader[2]);

                if (System.IO.File.Exists(MapPath("images\\" + Convert.ToString(Database.dataReader[0]) + ".jpg")))
                    imgShop.ImageUrl = "images\\" + Convert.ToString(Database.dataReader[0]) + ".jpg";
                else
                    imgShop.Visible = false;
            }
            else
            {
                lbShopName.Text = "لم يتم العثور على صفحة المتجر المحدد";
                lbAddress.Visible = lbDetails.Visible = imgShop.Visible = false;
                return;
            }

            Database.dataReader.Close();

            Database.command.CommandText = "SELECT name,details,price FROM shop_goods WHERE shopid=" + shopId;
            Database.dataReader = Database.command.ExecuteReader();

            createLine("المادة", "التفاصيل", "السعر");

            while (Database.dataReader.Read())
                createLine(Convert.ToString(Database.dataReader[0]), Convert.ToString(Database.dataReader[1]), Convert.ToString(Database.dataReader[2]) + " ل.س.");

            Database.connection.Close();
        }
        else
        {
            lbShopName.Text = "رابط خاطئ";
            lbAddress.Visible = lbDetails.Visible = imgShop.Visible = false;
        }
    }

    private void createLine(String col1, String col2, String col3)
    {
        TableRow tR = new TableRow();

        TableCell tC1 = new TableCell();
        tC1.Text = col1;
        TableCell tC2 = new TableCell();
        tC2.Text = col2;
        TableCell tC3 = new TableCell();
        tC3.Text = col3;

        tR.Cells.Add(tC1);
        tR.Cells.Add(tC2);
        tR.Cells.Add(tC3);

        tblGoods.Rows.Add(tR);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("shops.aspx");
    }
}
