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

public partial class departments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbResult.Text = "";
        lbResultSub.Text = "";
        fillList();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txDepName.Text = "";
    }
    protected void btnClearSub_Click(object sender, EventArgs e)
    {
        txSubDepName.Text = "";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txDepName.Text != "")
        {
            Database.ExcuteNotQuery("INSERT INTO departments (name) VALUES (N'" + txDepName.Text + "')");
            lbResult.Text = "تم إضافة القسم بنجاح";
            txDepName.Text = "";
            fillList();
        }
        else
            lbResult.Text = "يرجى إدخال أسم القسم";           
    }

    private void fillList()
    {
        if (lstDep.SelectedItem == null)
        {
            Database.command.CommandText = "SELECT name FROM departments";
            lstDep.Items.Clear();

            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lstDep.Items.Add(Convert.ToString(Database.dataReader[0]));

            Database.connection.Close();
        }
    }

    protected void btnAddSub_Click(object sender, EventArgs e)
    {
        if (txSubDepName.Text != "" && lstDep.SelectedItem != null)
        {
            Int32 dep = Convert.ToInt32(Database.ExcuteScalar("SELECT id FROM departments WHERE name=N'" + lstDep.SelectedItem + "';"));
            Database.ExcuteNotQuery("INSERT INTO sub_departments (departmentId,name) VALUES (" + dep + ",N'" + txSubDepName.Text + "')");
            lbResultSub.Text = "تم إضافة القسم بنجاح";
            txSubDepName.Text = "";
        }
        else
            lbResultSub.Text = "يرجى إدخال أسم القسم الفرعي والقسم الرئيسي";
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops.aspx");
    }
}
