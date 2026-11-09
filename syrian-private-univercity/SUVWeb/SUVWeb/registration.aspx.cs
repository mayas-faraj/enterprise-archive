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

namespace SUVWeb
{
    public partial class regestraition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.Command.CommandText = "SELECT name FROM programs";
            Database.Connection.Open();
            Database.DataReader = Database.Command.ExecuteReader();

            while (Database.DataReader.Read())
                lstPrograms.Items.Add(Database.DataReader[0].ToString());

            Database.Connection.Close();

            lstPrograms.SelectedIndex = 0;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txPass.Text != txPass2.Text)
            {
                lbError.Text = "Must Match the tow password!";
                return;
            }

            if (txFullName.Text == "" || txUserName.Text == "" || txEmail.Text == "")
            {
                lbError.Text = "Name and Email mustn't empty string!";
                return;
            }

            String id = Database.ExecuteScalar("SELECT id FROM programs WHERE name=N'" + lstPrograms.Text + "'").ToString();
            Database.ExecuteNonQuery("INSERT INTO students (userName,fullName,password,email,programId) VALUES (N'" + txUserName.Text + "',N'" + txFullName.Text + "',N'" + txPass.Text + "','" + txEmail.Text + "'," + id + ")");

            Response.Redirect("default.aspx");
        }
    }
}
