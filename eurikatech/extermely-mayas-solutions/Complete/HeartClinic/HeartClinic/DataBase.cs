using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace HeartClinic
{
    class DataBase
    {
        private SqlConnection connection = new SqlConnection();
        private SqlCommand command;
        private Control controlResult;
        private Int32 result;

        private const String ctAdd = " „ ≈÷«›… «·”Ã· ≈·Ï ﬁ«⁄œ… «·»Ì«‰«  , ⁄œœ «·”Ã·«  «·„ √À—… : ";

        public Int64 OperationId;

        public DataBase(String connectionString)
        {
            FileStream fs = new FileStream("Files\\Constant.dat", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            String text = sr.ReadToEnd();
            connection.ConnectionString = text;
            command = connection.CreateCommand();
        }

        public void OpenConnection()
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();
        }

        public void CloseConnection()
        {
            if (connection.State != ConnectionState.Closed)
                connection.Close();
        }

        public SqlConnection Connection
        {
            set
            {
                CloseConnection();
                connection = value;
            }

            get
            {
                return connection;
            }
        }

        public Control ControlResult
        {
            set
            {
                controlResult = value;
            }

            get
            {
                return controlResult;
            }
        }

        private void WriteResult(Int32 resultNumber)
        {
            if (controlResult != null)
                controlResult.Text = ctAdd + resultNumber.ToString();
        }

        private void Save(DoctorItem doctor)
        {
            //get rank id from ranks table
            command.CommandText = "SELECT id FROM ranks WHERE name='" + doctor.Name + "'";
            Int16 id = Convert.ToInt16(command.ExecuteScalar());

            //save doctor in doctors table
            command.CommandText = "INSERT INTO doctors (rankId,name) VALUES (" + id + ",'" + doctor.Name + "')";
            result = command.ExecuteNonQuery();
            WriteResult(result);
        }

        private void Save(RankItem rank)
        {
            //save rank in ranks table
            command.CommandText = "INSERT INTO ranks (name,percent,tax) VALUES ('" + rank.Name + "'," + rank.Percent + "," + rank.Tax + ")";
            result = command.ExecuteNonQuery();

            WriteResult(result);
        }

        private void Save(MedicitItem medicit)
        {
            //save rank in ranks table
            command.CommandText = "INSERT INTO medicits (name,cost) VALUES ('" + medicit.Name + "'," + medicit.Cost + ")";
            result = command.ExecuteNonQuery();
            WriteResult(result);
        }

        private void Save(CheckItem check)
        {
            //save rank in ranks table
            command.CommandText = "INSERT INTO medicits (name,cost) VALUES ('" + check.Name + "'," + check.Cost + ")";
            result = command.ExecuteNonQuery();
            WriteResult(result);
        }


        
    }
}
