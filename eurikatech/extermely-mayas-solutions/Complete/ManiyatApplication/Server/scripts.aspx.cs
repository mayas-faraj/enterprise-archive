using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class scripts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String query = Request["query"];

            if (query != null && query != "")
            {
                System.Data.OleDb.OleDbConnection connection = new System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + MapPath("App_Data\\datastore.accdb") + "';");
                System.Data.OleDb.OleDbCommand command = new System.Data.OleDb.OleDbCommand(query, connection);

                ErrorLog.Write(MapPath("errLog.mp4"), connection.ConnectionString, new Exception());

                //try
                {
                    connection.Open();

                    if (query.Length >= 6 && query.Substring(0, 6).ToLower() == "select")
                    {
                        System.Data.OleDb.OleDbDataReader dr = command.ExecuteReader();

                        while (dr.Read())
                        {
                            for (Int32 i = 0; i < dr.FieldCount; i++)
                                Response.Write("[" + dr[i] + "]");

                            Response.Write("<br/>");
                        }
                    }
                    else
                        Response.Write(command.ExecuteNonQuery());

                    connection.Close();
                }
                //catch (Exception ex)
                {
                    //ErrorLog.Write(MapPath("errLg.mp4"), "4", ex);
                }
            }
            else
            {
                Response.Write("no query to resolve!");
            }
        }
    }
}