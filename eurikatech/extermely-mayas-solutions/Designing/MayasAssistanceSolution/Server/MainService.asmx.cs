using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace Server
{
    /// <summary>
    /// Summary description for MainService
    /// </summary>
    [WebService(Namespace = "http://www.mainagent.somee.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]

    public class MainService : System.Web.Services.WebService
    {
        //public constructures region
        public MainService()
        {
            connection = new System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("App_Data\\DataTasks.accdb") + ";JET OLEDB:Database Password=6.67384E-11m3/kgs2");
            command = new System.Data.OleDb.OleDbCommand();
            command.Connection = connection;
        }

        //public functions region

        /// <summary>
        /// Set public action for specific tone
        /// </summary>
        /// <param name="tone">the tone regestered</param>
        /// <returns>if the operation success, return 1, else return 0</returns>
        [WebMethod]
        public Int32 SetPublic(String tone)
        {
            Int32 result = -1;
            command.CommandText = "INSERT INTO publics (tone,dt) VALUES ('" + tone + "','" + DateTime.Now.ToString(Consts.FORMAT_DATETIME) + "')";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "1", ex);
            }

            return result;
        }

        /// <summary>
        /// Set login action for specific tone
        /// </summary>
        /// <param name="tone">the tone regestered</param>
        /// <param name="path">the path of sender</param>
        /// <param name="description">more info from sender</param>
        /// <returns>if the operation success, return 1, else return 0</returns>
        [WebMethod]
        public Int32 SetLogin(String tone, String path, String description)
        {
            Int32 result = -1;
            command.CommandText = "INSERT INTO logins (tone,dt,path,description) VALUES ('" + tone + "','" + DateTime.Now.ToString(Consts.FORMAT_DATETIME) + "','" + path + "','" + description + "')";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "2", ex);
            }

            return result;
        }

        /// <summary>
        /// get the tasks for specific tone
        /// </summary>
        /// <param name="tone">the regestered tone</param>
        /// <returns>the tasks as string array, if the result is null, an error happened</returns>
        [WebMethod]
        public String[] GetTasks(String tone)
        {
            System.Collections.Specialized.StringCollection strings = new System.Collections.Specialized.StringCollection();
            command.CommandText = "SELECT task FROM tasks WHERE tone='" + tone + "'";
            String[] result;

            try
            {
                connection.Open();
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                    strings.Add(Convert.ToString(dataReader[0]));

                connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "3", ex);
                return null;
            }

            result = new String[strings.Count];
            strings.CopyTo(result, 0);
            return result;        
        }

        /// <summary>
        /// set accept task to true
        /// </summary>
        /// <param name="tone">the regestered tone</param>
        /// <param name="task">the specific task</param>
        /// <returns>if return -1, an error happened, else retrun the number of effected tasks</returns>
        [WebMethod]
        public Int32 SetTaskAccept(String tone, String task,Boolean accept)
        {
            Int32 result = -1;
            String acc = accept ? "True" : "False";
            command.CommandText = "UPDATE tasks SET accept=" + acc + ",dt='" + DateTime.Now.ToString(Consts.FORMAT_DATETIME) + "' WHERE tone='" + tone + "' AND task='" + task + "'";

            try
            {
                connection.Open();
                result = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                if (connection.State == System.Data.ConnectionState.Open)
                    connection.Close();

                Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "4", ex);
            }

            return result;
        }

        /// <summary>
        /// admin set new task
        /// </summary>
        /// <param name="code">authentication code</param>
        /// <param name="tone">destination tone</param>
        /// <param name="task">the specific task</param>
        /// <returns>if it returned 1, the operation success, -1 if an error happened, -2 for authentication error</returns>
        [WebMethod]
        public Int32 AdminSetTask(String code, String tone, String task)
        {
            Int32 result = -1;

            if (code.GetHashCode() == Consts.HASH_CODE)
            {
                command.CommandText = "INSERT INTO tasks (tone,task,accept,dt) VALUES ('" + tone + "','" + task + "',True,'" + DateTime.Now.ToString(Consts.FORMAT_DATETIME) + "')";

                try
                {
                    connection.Open();
                    result = command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    if (connection.State == System.Data.ConnectionState.Open)
                        connection.Close();

                    Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "5", ex);
                }
            }
            else
            {
                Log.LogWrite(Server.MapPath(Consts.FILE_NAME_LOG), Consts.UNAUTHENTICATION + " code:" + code);
                result = -2;
            }

            return result;
        }

        /// <summary>
        /// run scripts
        /// </summary>
        /// <param name="code">authentication code</param>
        /// <param name="query">the script query</param>
        /// <returns>return the query results as lines, if an error happened of unauthenticate access, return empty line</returns>
        [WebMethod]
        public String[] AdminScripts(String code, String query)
        {
            System.Collections.Specialized.StringCollection strings = new System.Collections.Specialized.StringCollection();
            String[] result;

            if (code.GetHashCode() == Consts.HASH_CODE)
            {
                if (query != "" && query != null)
                {
                    command.CommandText = query;

                    try
                    {
                        connection.Open();

                        if (query.Length >= 6 && query.Substring(0, 6).ToLower() == "select")
                        {
                            System.Data.OleDb.OleDbDataReader dr = command.ExecuteReader();

                            while (dr.Read())
                            {
                                String line = "";
                                for (Int32 i = 0; i < dr.FieldCount; i++)
                                    line += '[' + Convert.ToString(dr[i]) + ']';

                                strings.Add(line);
                            }
                        }
                        else
                        {
                            strings.Add(Convert.ToString(command.ExecuteNonQuery()));
                        }

                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        if (connection.State == System.Data.ConnectionState.Open)
                            connection.Close();

                        Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "7", ex);
                    }
                }
            }
            else
            {
                Log.LogWrite(Server.MapPath(Consts.FILE_NAME_LOG), Consts.UNAUTHENTICATION + " code:" + code);
            }

            result = new String[strings.Count];
            strings.CopyTo(result, 0);
            return result;
        }

        /// <summary>
        /// download specific task
        /// </summary>
        /// <param name="taskName">the task name</param>
        /// <returns>if an error happended, return null or uncomplete series of bytes, else return task as series of bytes</returns>
        [WebMethod]
        public Byte[] DownloadTask(String taskName)
        {
            String taskPath = Server.MapPath(taskName);
            Byte[] result = null;

            if (System.IO.File.Exists(taskPath))
            {
                try
                {
                    System.IO.FileStream fs = new System.IO.FileStream(taskPath, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                    result = new Byte[fs.Length];

                    fs.Read(result, 0, result.Length);
                    fs.Close();
                }
                catch (Exception ex)
                {
                    Log.ErrorWrite(Server.MapPath(Consts.FILE_NAME_ERROR), "6", ex);
                }
            }

            return result;
        }

        /// <summary>
        /// upload the file manager
        /// </summary>
        /// <param name="strings">the required info</param>
        [WebMethod]
        public void FileManager(String fileName, String[] lines)
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter(Server.MapPath(fileName), true);

            foreach (String line in lines)
                sw.WriteLine(line);

            sw.Close();
        }

        //private fields region
        private System.Data.OleDb.OleDbConnection connection;
        private System.Data.OleDb.OleDbCommand command;
        private System.Data.OleDb.OleDbDataReader dataReader;
    }
}
