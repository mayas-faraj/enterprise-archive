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
    public partial class addCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request["id"]);

            string name = Database.ExecuteScalar("SELECT name FROM programs WHERE id=" + id).ToString();

            lstPrograms.Items.Add(name);
            lstPrograms.SelectedIndex = 0;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String id = Database.ExecuteScalar("INSERT INTO courses (programId,semester,code,courseName,numberOfSession,price,maxStudent,isOpen) VALUES (" + int.Parse(Request["id"]) + ",'" + lstSemesters.Text + "',N'" + txCode.Text + "',N'" + txCourseName.Text + "'," + int.Parse(txNumOfSessions.Text) + "," + float.Parse(txPrice.Text) + "," + int.Parse(txMaxStd.Text) + "," + (chkOpen.Checked ? "1" : "0") + ") SELECT @@IDENTITY;").ToString();
            Response.Redirect("viewprogram.aspx?name=" + Request["name"] + "&id=" + id);
        }

        protected void btnViewPrograms_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProgram.aspx?name=" + Request["name"]);
        }

        protected void btnAddProgram_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProgram.aspx?name=" + Request["name"]);
        }

        protected void btnRegistered_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerStudents.aspx?name=" + Request["name"]);
        }
    }
}
