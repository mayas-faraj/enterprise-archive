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

public partial class manageEditShop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillDep();
        fillSub();
    }
    protected void btnDelDep_Click(object sender, EventArgs e)
    {
        if (lstMain.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("DELETE FROM departments WHERE name=N'" + Convert.ToString(lstMain.SelectedItem) + "'");
                lbDep.Text = "تمت عملية الحذف بنجاج";
                lstMain.SelectedIndex = -1;
                fillDep();
            }
            catch (Exception ex)
            {
                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
                lbDep.Text = ex.Message;
            }
        }
        else
            lbDep.Text = "يجب أختيار أسم من القائمة";
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

    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (lsSub.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("DELETE FROM sub_departments WHERE name=N'" + Convert.ToString(lsSub.SelectedItem) + "'");
                Label1.Text = "تمت عملية الحذف بنجاج";
                lsSub.SelectedIndex = -1;
                fillSub();
            }
            catch (Exception ex)
            {
                if (Database.connection.State != ConnectionState.Closed)
                    Database.connection.Close();
                Label1.Text = ex.Message;
            }
        }
        else
            Label1.Text = "يجب أختيار أسم من القائمة";
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("manageShops.aspx");
    }
}
