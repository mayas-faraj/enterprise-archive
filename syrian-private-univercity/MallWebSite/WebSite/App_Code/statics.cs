using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for statics
/// </summary>
public static class Database
{
    static Database()
    {
    }

    public static String ConnectionString
    {
        get
        {
            return connectionString;
        }

        set
        {
            connectionString = value;
            connection = new System.Data.SqlClient.SqlConnection(connectionString);
            command = new System.Data.SqlClient.SqlCommand("", connection);
        }
    }

    public static System.Data.SqlClient.SqlConnection connection
    {
        get;
        set;
    }

    public static System.Data.SqlClient.SqlCommand command
    {
        get;
        set;
    }

    public static System.Data.SqlClient.SqlDataReader dataReader
    {
        get;
        set;
    }

    public static Int32 ExcuteNotQuery(String queryText)
    {
        command.CommandText = queryText;
        connection.Open();
        Int32 result = command.ExecuteNonQuery();
        connection.Close();

        return result;
    }

    public static Object ExcuteScalar(String queryText)
    {
        command.CommandText = queryText;
        connection.Open();
        Object result = command.ExecuteScalar();
        connection.Close();

        return result;
    }

    private static String connectionString;
}
