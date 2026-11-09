using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml.Linq;
using System.Web.UI.WebControls;

namespace MallSite
{
    public class Global : System.Web.HttpApplication
    {
        public static string ConnectionString
        {
            get
            {
                if (connection != null)
                    return connection.ConnectionString;
                else
                    return "";
            }
            set
            {
                connection = new SqlConnection(value);
                command = new SqlCommand("", connection);
            }
        }

        private static SqlConnection connection;
        private static SqlCommand command;
        private static SqlDataReader dataReader;

        public static void RunCommand(string sqlStatement)
        {
            command.CommandText = sqlStatement;
            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }

        public static string RunScalarCommand(string sqlStatement)
        {
            command.CommandText = sqlStatement;
            connection.Open();

            string result = Convert.ToString(command.ExecuteScalar());

            connection.Close();

            return result;
        }

        public static void FillTable(Table table, string sqlStatement)
        {
            table.Rows.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                TableRow tr = new TableRow();
                TableCell[] tcs = new TableCell[dataReader.FieldCount];

                for(int i=0;i<dataReader.FieldCount;i++)
                {
                    tcs[i] = new TableCell();
                    tcs[i].BorderStyle = BorderStyle.Solid;
                    tcs[i].BorderColor = System.Drawing.Color.Gold;

                    tcs[i].Text = Convert.ToString(dataReader[i]);
                    tr.Cells.Add(tcs[i]);
                }

                table.Rows.Add(tr);
            }

            connection.Close();
        }

        public static void FillTableWithLink(Table table, string sqlStatement,string link)
        {
            table.Rows.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                TableRow tr = new TableRow();
                TableCell tc = new TableCell();
                tc.BorderStyle = BorderStyle.Solid;
                tc.BorderColor = System.Drawing.Color.Gold;
                tc.Text = "<a href='" + link + "?info=" + Convert.ToString(dataReader[0]) + "'>" + Convert.ToString(dataReader[1]) + "</a>";
                tr.Cells.Add(tc);

                table.Rows.Add(tr);
            }

            connection.Close();
        }

        public static void FillList(ListBox list, string sqlStatement)
        {
            list.Items.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                list.Items.Add(Convert.ToString(dataReader[0]));
            }

            connection.Close();
        }

        public static void FillList(CheckBoxList list, string sqlStatement)
        {
            list.Items.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                list.Items.Add(Convert.ToString(dataReader[0]));
            }

            connection.Close();
        }

        public static void FillList(RadioButtonList list, string sqlStatement)
        {
            list.Items.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                list.Items.Add(Convert.ToString(dataReader[0]));
            }

            connection.Close();
        }

        public static void FillList(DropDownList list, string sqlStatement)
        {
            list.Items.Clear();

            command.CommandText = sqlStatement;
            connection.Open();

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                list.Items.Add(Convert.ToString(dataReader[0]));
            }

            connection.Close();
        }

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}