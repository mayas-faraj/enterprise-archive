using System;
using System.Data.SqlClient;


public static class Database
{
    public static string ConnectionString
    {
        get
        {
            return connectionString;
        }
        set
        {
            connectionString = value;
            Connection = new SqlConnection(connectionString);
            Command = new SqlCommand("", Connection);
        }
    }

    public static SqlConnection Connection
    {
        get;
        set;
    }

    public static SqlDataReader DataReader
    {
        get;
        set;
    }

    public static SqlCommand Command
    {
        get;
        set;
    }

    public static void ExecuteNonQuery(String queryString)
    {
        Command.CommandText = queryString;
        Connection.Open();
        Command.ExecuteNonQuery();
        Connection.Close();
    }

    public static object ExecuteScalar(String queryString)
    {
        Command.CommandText = queryString;
        Connection.Open();
        object result = Command.ExecuteScalar();
        Connection.Close();

        return result;
    }

    private static string connectionString;

    
}