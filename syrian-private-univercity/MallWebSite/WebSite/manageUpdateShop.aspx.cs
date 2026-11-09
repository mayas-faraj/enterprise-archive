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

public partial class manageUpdateShop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillDep();
        fillSub();
    }
    protected void btnDelDep_Click(object sender, EventArgs e)
    {
        if (txNameDep.Text != "" && lstMain.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("UPDATE departments SET name=N'" + txNameDep.Text + "' WHERE name=N'" + lstMain.SelectedValue + "';");
                lbDep.Text = "تم تعديل الأسم بنجاح";
                lstMain.SelectedIndex = -1;
                fillDep();
            }
            catch (Exception ex)
            {
                lbDep.Text = ex.Message;
                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
            }
        }
        else
            lbDep.Text = "يجب تحديد القسم المراد تعديله ووضع أسم له";
    }
    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (txNameSub.Text != "" && lsSub.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("UPDATE sub_departments SET name=N'" + txNameSub.Text + "' WHERE name=N'" + lsSub.SelectedValue + "';");
                lbDep.Text = "تم تعديل الأسم بنجاح";
                lsSub.SelectedIndex = -1;
                fillSub();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
            }
        }
        else
            Label1.Text = "يجب تحديد القسم الجزئي المراد تعديله ووضع أسم له";
    }

    private void fillDep()
    {
        if (lstMain.SelectedItem == null)
        {
            lstMain.Items.Clear();

            Database.command.CommandText = "SELECT name FROM departments";
            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lstMain.Items.Add(Convert.ToString(Database.dataReader[0]));

            Database.connection.Close();
        }
    }

    private void fillSub()
    {
        if (lsSub.SelectedItem == null)
        {
            lsSub.Items.Clear();

            Database.command.CommandText = "SELECT name FROM sub_departments";
            Database.connection.Open();
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lsSub.Items.Add(Convert.ToString(Database.dataReader[0]));

            Database.connection.Close();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops.aspx");
    }
}
