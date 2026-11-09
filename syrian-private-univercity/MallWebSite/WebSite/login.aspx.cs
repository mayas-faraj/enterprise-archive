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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Object result = Database.ExcuteScalar("SELECT id FROM users WHERE name=N'" + txName.Text + "' AND password=N'" + txPassword.Text + "';");

        if (result != null)
            Response.Redirect("management.aspx");
        else
        {
            txPassword.Text = txName.Text = "";
            lbResult.Text = "أسم المستخدم و/أو كلمة المرور خاطئة";
        }
    }
}
