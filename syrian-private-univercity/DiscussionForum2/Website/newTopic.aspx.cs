using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void postTopic(Object sender,EventArgs e)
    {
        System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=" + MapPath("App_Data\\Discussion.mdf") + ";Integrated Security=True;Connect Timeout=30;user instance=true;");
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("", connect);
        Object old = null;

        connect.Open();

        cmd.CommandText = "select name from topics where name='" + txName.Text + "'";
        old = cmd.ExecuteScalar();

        if (old == null)
        {
            cmd.CommandText = "insert into topics (name) values ('" + txName.Text + "')";
            cmd.ExecuteNonQuery();
            Response.Redirect("default.aspx");
        }
        else
        {
            rfvUnique.Visible = true;
            rfvUnique.IsValid = false;
        }

        connect.Close();
    }
}