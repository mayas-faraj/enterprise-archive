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

public partial class manageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbResultAdd.Text = lbResultDelete.Text = "";

        loadLst(); 
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txName.Text = txPassword.Text = "";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txName.Text != "" && txPassword.Text != "")
        {
            try
            {
                Database.ExcuteNotQuery("INSERT INTO users (name,password) VALUES (N'" + txName.Text + "',N'" + txPassword.Text + "');");
                
                lbResultAdd.Text = "تمت عملية الأضافة بنجاح";
                loadLst();

            }
            catch (Exception ex)
            {
                lbResultAdd.Text = "حدث خطأ أثناء عملية الأضافة<br/>" + ex.Message;
            }

            txName.Text = txPassword.Text = "";
        }
        else
            lbResultAdd.Text = "يجب تحديد أسم للمستخدم وكلمة مرور لتتم عملية الأضافة.";
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("management.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (lsUsers.SelectedItem != null)
        {
            try
            {
                Database.ExcuteNotQuery("DELETE FROM users WHERE name=N'" + lsUsers.SelectedValue + "'");
                lbResultDelete.Text = "تمت عملية الحذف بنجاح";
            }
            catch (Exception ex)
            {
                lbResultDelete.Text = "حدث خطأ أثناء عملية الحذف<br/>" + ex.Message;
            }
        }
        else
            lbResultDelete.Text = "يجب تحديد المستخدم حتى يتم حذفه.";
    }

    private void loadLst()
    {
        

        if (lsUsers.SelectedItem == null)
        {
            lsUsers.Items.Clear();
            Database.connection.Open();

            Database.command.CommandText = "SELECT name FROM users";
            Database.dataReader = Database.command.ExecuteReader();

            while (Database.dataReader.Read())
                lsUsers.Items.Add(Database.dataReader[0].ToString());

            Database.connection.Close();

            lsUsers.SelectedIndex = -1;
        }
    }
}
