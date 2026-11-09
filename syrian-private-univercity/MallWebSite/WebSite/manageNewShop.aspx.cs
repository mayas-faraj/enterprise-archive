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

public partial class manageNewShop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillList();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txAddress.Text = txMajor.Text = txName.Text = "";
    }

    private void fillList()
    {
        if (lstSub.SelectedItem == null)
        {
            Database.command.CommandText = "SELECT name FROM sub_departments";
            lstSub.Items.Clear();

            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lstSub.Items.Add(Convert.ToString(Database.dataReader[0]));

            Database.connection.Close();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txName.Text != "" && lstSub.SelectedItem != null)
        {
            Int32 subDep = Convert.ToInt32(Database.ExcuteScalar("SELECT id FROM sub_departments WHERE name=N'" + Convert.ToString(lstSub.SelectedItem) + "'"));
            Database.ExcuteNotQuery("INSERT INTO shops (sub_departmentId,name,major,address) VALUES (" + subDep + ",N'" + txName.Text + "',N'" + txMajor.Text + "',N'" + txAddress.Text + "');");

            if (fuImage.HasFile)
                if (fuImage.PostedFile.ContentType == "image/pjpeg")
                    fuImage.SaveAs(MapPath("images\\" + txName.Text + ".jpg"));

            result.Text = "تم إضافة المتجر بنجاح";

            btnClear_Click(sender, e);
        }
        else
            result.Text = "يجب إدخال أسم وتحديد القسم الجزئي للمتجر";

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops2.aspx");
    }
}
