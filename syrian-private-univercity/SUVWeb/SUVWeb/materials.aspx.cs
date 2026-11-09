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
    public partial class materials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Database.ExecuteScalar("SELECT id FROM students WHERE username=N'" + Request["name"].ToString() + "';").ToString();
            String programId = Database.ExecuteScalar("SELECT programId FROM students WHERE username=N'" + Request["name"].ToString() + "';").ToString();

            Database.Command.CommandText = "SELECT distinct id,courseName,price FROM courses INNER JOIN RegisteredStudents ON id=courseId WHERE studentId=" + id;

            Database.Connection.Open();
            Database.DataReader = Database.Command.ExecuteReader();
            Boolean isRead = false;

            while (Database.DataReader.Read())
            {
                isRead = true;

                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = Database.DataReader[1].ToString();
                row.Cells.Add(cell1);

                TableCell cell2 = new TableCell();
                cell2.Text = Database.DataReader[2].ToString();
                row.Cells.Add(cell2);

                TableCell cell3 = new TableCell();
                Button btn = new Button();
                btn.Text = "Del";
                btn.ID = "u" + Database.DataReader[0].ToString();
                btn.Click += new EventHandler(btn_Click);
                cell3.Controls.Add(btn);
                row.Cells.Add(cell3);

                tblUser.Rows.Add(row);
            }

            Database.Connection.Close();

            if (!isRead)
            {
                TableRow row = new TableRow();
                TableCell cell = new TableCell();
                cell.ColumnSpan = 3;
                cell.Text = "There is no Courses registered";
                row.Cells.Add(cell);

                tblUser.Rows.Add(row);
            }

            Database.Command.CommandText = "SELECT id,courseName,code,price,maxStudent FROM courses WHERE isOpen=1 AND programId=" + programId;

            Database.Connection.Open();
            Database.DataReader = Database.Command.ExecuteReader();


            while (Database.DataReader.Read())
            {
                String temp;

                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = Database.DataReader[2].ToString();
                row.Cells.Add(cell1);

                TableCell cell2 = new TableCell();
                cell2.Text = Database.DataReader[1].ToString();
                row.Cells.Add(cell2);

                TableCell cell3 = new TableCell();
                cell3.Text = Database.DataReader[4].ToString();
                row.Cells.Add(cell3);

                TableCell cell4 = new TableCell();
                cell4.Text = "0";
                row.Cells.Add(cell4);

                TableCell cell5 = new TableCell();
                cell5.Text = Database.DataReader[3].ToString();
                row.Cells.Add(cell5);
                
                TableCell cell6 = new TableCell();
                Button btn = new Button();
                btn.Text = "Register Now!";
                btn.ID = "c" + Database.DataReader[0].ToString();
                btn.Click +=new EventHandler(btn2_Click);
                cell6.Controls.Add(btn);
                row.Cells.Add(cell6);

                tblCourses.Rows.Add(row);
            }

            Database.Connection.Close();

        }

        void btn_Click(object sender, EventArgs e)
        {
            String id = ((Button)sender).ID.Substring(1);
            String stid = Database.ExecuteScalar("SELECT id FROM students WHERE username=N'" + Request["name"].ToString() + "';").ToString();
            Database.ExecuteNonQuery("DELETE FROM registeredStudents WHERE studentId=" + stid + " AND courseId=" + id);
            Response.Redirect("materials.aspx?name=" + Request["name"]);
        }

        void btn2_Click(object sender, EventArgs e)
        {
            String id = ((Button)sender).ID.Substring(1);
            String stid = Database.ExecuteScalar("SELECT id FROM students WHERE username=N'" + Request["name"].ToString() + "';").ToString();

            Database.ExecuteNonQuery("INSERT INTO registeredStudents (studentId,courseId) VALUES (" + stid + "," + id + ")");
            Response.Redirect("materials.aspx?name=" + Request["name"]);
        }
    }
}
