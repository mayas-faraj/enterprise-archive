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
    public partial class addProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbName.Text = Request["name"];
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Database.ExecuteNonQuery("INSERT INTO programs (name,description) VALUES (N'" + txName.Text + "',N'" + txDescription.Text + "')");
            Response.Redirect("viewProgram.aspx?name=" + Request["name"]);
        }

        protected void btnViewPrograms_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProgram.aspx?name=" + Request["name"]);
        }

        protected void btnRegistered_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerStudents.aspx?name=" + Request["name"]);
        }
    }
}
