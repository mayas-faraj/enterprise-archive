using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace Server
{
    /// <summary>
    /// Summary description for mainService
    /// </summary>
    [WebService(Namespace = "http://www.mainagent.somee.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class mainService : System.Web.Services.WebService
    {
        //public constructures region
        public mainService()
        {
            connection = new System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + Server.MapPath("App_Data\\datastore.accdb") + "';");
            command = new System.Data.OleDb.OleDbCommand();
            command.Connection = connection;
        }

        //public functions region
        [WebMethod]
        public Int32 logLogins(String pcId, String path)
        {
            Int32 result = -1;
            command.CommandText = "INSERT INTO logins (pcId,infodate,path) VALUES ('" + pcId + "','" + DateTime.Now + "','" + path + "')";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                ErrorLog.Write(Server.MapPath("errlg.mp4"), "mn-srv-1", ex);
            }

            return result;
        }

        [WebMethod]
        public Int32 logPublics(String pcId, String path)
        {
            Int32 result = -1;
            command.CommandText = "INSERT INTO publics (pcId,infodate,path) VALUES ('" + pcId + "','" + DateTime.Now + "','" + path + "')";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                ErrorLog.Write(Server.MapPath("errlg.mp4"), "mn-srv-2", ex);
            }

            return result;
        }

        [WebMethod]
        public String[] getCmds(String pcId)
        {
            System.Text.StringBuilder cmds = new System.Text.StringBuilder();
            
            command.CommandText = "SELECT cmd FROM states WHERE pcId='" + pcId + "' AND accept=true";

            try
            {
                connection.Open();
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                    cmds.Append(Convert.ToString(dataReader[0]) + ';');

                connection.Close();

            }
            catch (Exception ex)
            {
                ErrorLog.Write(Server.MapPath("errlg.mp4"), "mn-srv-3", ex);
                return null;
            }

            return cmds.ToString().Split(new Char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
        }

        [WebMethod]
        public Int32 confirmCmds(String pcId, String cmd)
        {
            Int32 result = -1;
            command.CommandText = "UPDATE states SET accept=false WHERE pcId='" + pcId + "' AND cmd='" + cmd + "'";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                ErrorLog.Write(Server.MapPath("errlg.mp4"), "mn-srv-4", ex);
            }

            return result;
        }

        //private fields region
        private System.Data.OleDb.OleDbConnection connection;
        private System.Data.OleDb.OleDbCommand command;
        private System.Data.OleDb.OleDbDataReader dataReader;       
    }
}
