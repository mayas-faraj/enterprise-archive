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

public partial class shops : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String department = "";
        String subDepartment = "";

        Database.command.CommandText = @"SELECT departments.name AS Department,sub_departments.name AS SubDepartment,
                      shops.id AS id,shops.name AS ShopName FROM sub_departments INNER JOIN
                      shops ON sub_departments.id = shops.sub_departmentId INNER JOIN
                      departments ON sub_departments.departmentId = departments.id";

        Database.connection.Open();

        Database.dataReader = Database.command.ExecuteReader();

        while (Database.dataReader.Read())
        {
            if (department != Convert.ToString(Database.dataReader[0]))
            {
                AddRow(Convert.ToString(Database.dataReader[0]), System.Drawing.Color.Orange);
                department = Convert.ToString(Database.dataReader[0]);
            }

            if (subDepartment != Convert.ToString(Database.dataReader[1]))
            {
                AddRow(Convert.ToString(Database.dataReader[1]), System.Drawing.Color.Lime);
                subDepartment = Convert.ToString(Database.dataReader[1]);
            }

            AddRow("<a href='shopGoods.aspx?shop=" + Convert.ToString(Database.dataReader[2]) + "'>" + Convert.ToString(Database.dataReader[3]) + "</a>", System.Drawing.Color.Yellow);
        }

        Database.connection.Close();
    }

    private void AddRow(String value, System.Drawing.Color color)
    {
        TableRow tR = new TableRow();
        TableCell tC = new TableCell();

        tC.BackColor = color;
        tC.Text = Convert.ToString(value);
        tR.Cells.Add(tC);
        tblMain.Rows.Add(tR);
    }
}
