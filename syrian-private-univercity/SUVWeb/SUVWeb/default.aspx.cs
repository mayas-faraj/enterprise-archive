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
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=E:\References\HomeWorks\SUVWeb\SUVWeb\App_Data\datafile.mdf;Integrated Security=True;User Instance=True";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            switch (lstAuth.SelectedValue)
            {
                case "ISIS Staff":
                    {
                        Object result = Database.ExecuteScalar("SELECT id FROM admins WHERE name=N'" + txName.Text + "' AND password=N'" + txPassword.Text + "'");

                        if (result != null)
                            Response.Redirect("addProgram.aspx?name=" + txName.Text);
                        else
                            lbError.Text = "Enter Valid name or password for staff";
                        break;
                    }
                case "ISIS Student":
                    {
                        Object result = Database.ExecuteScalar("SELECT id FROM students WHERE userName=N'" + txName.Text + "' AND password=N'" + txPassword.Text + "'");

                        if (result != null)
                            Response.Redirect("materials.aspx?name=" + txName.Text);
                        else
                            lbError.Text = "Enter Valid name or password for student";
                        break;
                    }
                default:
                    {
                        lbError.Text = "Choose auth. Type";
                        break;
                    }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }
    }
}
