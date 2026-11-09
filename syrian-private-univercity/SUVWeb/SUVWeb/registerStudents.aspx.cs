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
    public partial class addMaterials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbName.Text = Request["name"];

            Database.Command.CommandText = @"SELECT DISTINCT students.userName, programs.name, courses.courseName, courses.code FROM         registeredStudents INNER JOIN
                      students ON registeredStudents.studentId = students.id INNER JOIN
                      courses ON registeredStudents.courseId = courses.id INNER JOIN
                      programs ON students.programId = programs.id";

            Database.Connection.Open();
            Database.DataReader = Database.Command.ExecuteReader();

            while (Database.DataReader.Read())
            {
                TableRow row = new TableRow();

                TableCell user = new TableCell();
                user.Text = (String)Database.DataReader[0];
                row.Cells.Add(user);

                TableCell program = new TableCell();
                program.Text = (String)Database.DataReader[1];
                row.Cells.Add(program);

                TableCell course = new TableCell();
                course.Text = (String)Database.DataReader[2];
                row.Cells.Add(course);

                TableCell code = new TableCell();
                code.Text = (String)Database.DataReader[3];
                row.Cells.Add(code);

                tblStudents.Rows.Add(row);
            }

            Database.Connection.Close();
        }

        protected void btnPrograms_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProgram.aspx?name=" + Request["name"]);
        }

        protected void btnAddProgram_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProgram.aspx?name=" + Request["name"]);
        }

        protected void btnViewPrograms_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProgram.aspx?name=" + Request["name"]);
        }
    }
}
