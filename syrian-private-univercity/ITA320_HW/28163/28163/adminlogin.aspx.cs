using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Web.Configuration;

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signadmin_Click(object sender, EventArgs e)
    {
        string connectionString;
        connectionString = connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("loginadmin", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter param;

        param = new SqlParameter("@username", SqlDbType.VarChar, 50);
        param.Value = usname.Text;
        cmd.Parameters.Add(param);

        param = new SqlParameter("@password", SqlDbType.VarChar, 50);
        param.Value = passwo.Text;
        cmd.Parameters.Add(param);

        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (!reader.Read()==false)
                warn.Text = "administrator login is uncorrecy";
            else
            {
                reader.Close();
                Response.Redirect("adminpage.aspx");
            }
        }
        catch (SqlException)
        {
            throw new ApplicationException("Data Error");
        }
        finally
        {
            con.Close();
        }
    }
}
