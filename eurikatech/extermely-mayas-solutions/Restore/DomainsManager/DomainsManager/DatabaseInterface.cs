using System;

namespace DomainsManager
{
    public class DatabaseInterface
    {
        private static System.Data.SqlClient.SqlConnection connection;
        private static System.Data.SqlClient.SqlCommand command;
        private static System.Data.SqlClient.SqlDataReader dataReader;

        private const Char COMMA = ',';

        private const String USERS_COUNT = "SELECT count(id) FROM tUsers";
        private const String USERS_SELECT = "SELECT Id,UserName,UserPassword,IconPath,Settings FROM tUsers";
        private const String USERS_INSERT = "INSERT INTO tUsers (UserName,UserPassword,IconPath,Settings) VALUES ";
        private const String USERS_UPDATE = "UPDATE FROM tUsers SET ";
        private const String USERS_DELETE = "DELETE FROM tUsers WHERE id=";

        static DatabaseInterface()
        {
            System.IO.StreamReader readConn = new System.IO.StreamReader("connection.mni");
            connection = new System.Data.SqlClient.SqlConnection(readConn.ReadToEnd());
            command = new System.Data.SqlClient.SqlCommand("", connection);
        }

        public static System.Data.SqlClient.SqlConnection Connection
        {
            get
            {
                return connection;
            }
        }

        public static Int32 GetUserCount()
        {
            command.CommandText = USERS_COUNT;
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public static void GetUserInfo(out Int32 userId,out User UserInfo)
        {
            command.CommandText = USERS_SELECT;
            dataReader = command.ExecuteReader();
            userId = -1;
            UserInfo = null;

            while (dataReader.Read())
            {
                userId = Convert.ToInt32(dataReader[0]);
                UserInfo=new User(dataReader[1].ToString(),dataReader[2].ToString(),dataReader[3].ToString(),dataReader[4].ToString()); 
            }
            
        }

        public static void UpdateUserInfo(User userInfo)
        {
            command.CommandText = USERS_UPDATE + "UserName=" + userInfo.Name + ",UserPassword=" + userInfo.Password + ",IconPath=" + userInfo.IconPath + ",Settings=" + userInfo.Setting;
            command.ExecuteNonQuery();
        }

        public static void SaveUserInfo(User userInfo)
        {

            command.CommandText = USERS_INSERT + '(' + userInfo.Name + COMMA + userInfo.Password + COMMA + userInfo.IconPath + COMMA + userInfo.Setting + ')';
            command.ExecuteNonQuery();
        }

        public static void DeleteUserInfo(Int32 userId)
        {
            command.CommandText = USERS_DELETE + userId.ToString();
            command.ExecuteNonQuery();
        }


    }
}