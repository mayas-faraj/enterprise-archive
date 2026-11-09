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

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tblResult.CellPadding = tblResult.CellSpacing = 0;
        tblResult.BorderStyle = BorderStyle.None;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        createLine("المتجر", "المادة", "المواصفات", "السعر");
        Database.command.CommandText = @"SELECT shops.name AS shopName, shop_goods.name AS goodName, shop_goods.details, shop_goods.price
                                        FROM  shops INNER JOIN shop_goods ON shops.id = shop_goods.shopId 
                                        WHERE shop_goods.name like N'%" + txName.Text + "%' AND shop_goods.details like N'%" + txDetails.Text + "%'";
        Database.connection.Open();

        Database.dataReader = Database.command.ExecuteReader();

        while (Database.dataReader.Read())
            createLine(Convert.ToString(Database.dataReader[0]), Convert.ToString(Database.dataReader[1]), Convert.ToString(Database.dataReader[2]), Convert.ToString(Database.dataReader[3]));

        Database.connection.Close();
    }

    private void createLine(String col1, String col2, String col3, String col4)
    {
        TableRow tR = new TableRow();

        TableCell tC1 = new TableCell();
        tC1.Text = col1;
        TableCell tC2 = new TableCell();
        tC2.Text = col2;
        TableCell tC3 = new TableCell();
        tC3.Text = col3;
        TableCell tC4 = new TableCell();
        tC4.Text = col4;

        tC1.BorderStyle = BorderStyle.Solid;
        tC2.BorderStyle = BorderStyle.Solid;
        tC3.BorderStyle = BorderStyle.Solid;
        tC4.BorderStyle = BorderStyle.Solid;

        tR.Cells.Add(tC1);
        tR.Cells.Add(tC2);
        tR.Cells.Add(tC3);
        tR.Cells.Add(tC4);

        tblResult.Rows.Add(tR);
    }
}
