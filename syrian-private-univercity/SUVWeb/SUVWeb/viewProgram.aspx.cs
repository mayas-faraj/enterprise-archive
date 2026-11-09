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
    public partial class viewProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.Command.CommandText = "SELECT name,description,id FROM programs";
            Database.Connection.Open();
            Database.DataReader = Database.Command.ExecuteReader();

            while (Database.DataReader.Read())
            {
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = Database.DataReader[0].ToString();
                row.Cells.Add(cell1);

                TableCell cell2 = new TableCell();
                cell2.Text = Database.DataReader[1].ToString();
                row.Cells.Add(cell2);

                TableCell cell3 = new TableCell();
                cell3.Text = "<a href='addCourse.aspx?name=" + Request["name"] + "&id="+Database.DataReader[2].ToString()+"'>Add</a>";
                row.Cells.Add(cell3);

                TableCell cell4 = new TableCell();
                cell4.Text = "View";
                row.Cells.Add(cell4);

                tblCourses.Rows.Add(row);
            }

            Database.Connection.Close();
        }

        protected void btnAddProgram_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProgram.aspx?name" + Request["name"]);
        }

        protected void btnRegistered_Click(object sender, EventArgs e)
        {
            Response.Redirect("registerStudents.aspx?name=" + Request["name"]);
        }
    }
}
