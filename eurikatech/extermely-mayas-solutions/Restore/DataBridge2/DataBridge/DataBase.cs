using System;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Maniyat
{
    public abstract class DataItem
    {
        public String DataTable
        {
            get;
            set;
        }

        public abstract DataItem[] CreateObjects(Int32 count);

        public Int32 FieldsCount()
        {
            if (DataFields == null && dataItems == null)
                FillDataArray();

            return DataFields.Length;
        }

        public Int32 ItemCount()
        {
            if (DataFields == null && dataItems == null)
                FillDataArray();

            return DataItems.Length;
        }

        public static Boolean CheckValidity(DataItem obj)
        {
            //precondition : none
            if (obj == null || obj.DataTable == null || obj.DataTable == "")
                return false;
            else
                return true;

            //return value : if obj not null and have data table name and data fields , return true , else return false
        }

        private void FillDataArray()
        {
            //precondition : DataField and DataItem properties must have new instance to count its

            //result
            Int32 fieldCount = 0, itemCount = 0;
            //properties of this object
            System.Reflection.PropertyInfo[] properties = this.GetType().GetProperties();

            //loop invariant : i=0..length of properites, 
            for (Int32 i = 0; i < properties.Length; i++)
            {
                //value of property
                Object value = properties[i].GetValue(this, null);

                if (value != null)
                    if (value.GetType().BaseType == typeof(DataField) && DataField.CheckValidity((DataField)value))
                        fieldCount++;
                    else
                        if (value.GetType().BaseType == typeof(DataItem) && DataItem.CheckValidity((DataItem)value))
                            itemCount++;
            }

            dataFields = new DataField[fieldCount];
            dataItems = new DataItem[itemCount];

            fieldCount = itemCount = 0;

            for (Int32 i = 0; i < properties.Length; i++)
            {
                //value of property
                Object value = properties[i].GetValue(this, null);

                if (value != null)
                    if (value.GetType().BaseType == typeof(DataField) && DataField.CheckValidity((DataField)value))
                        dataFields[fieldCount++] = (DataField)value;
                    else
                        if (value.GetType().BaseType == typeof(DataItem) && DataItem.CheckValidity((DataItem)value))
                            dataItems[itemCount++] = (DataItem)value;
            }
            //postcondition : count of properties in type inhertis from DataField
        }

        public DataField[] DataFields
        {
            get
            {
                return dataFields;
            }
        }

        public DataItem[] DataItems
        {
            get
            {
                return dataItems;
            }
        }

        private DataField[] dataFields;
        private DataItem[] dataItems;
    }

    public static class DataBase
    {
        static DataBase()
        {
            connectionString = "";
            connection = null;
            command = null;
            reader = null;
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
                connection = new SqlConnection(connectionString);
                command = new SqlCommand("", connection);
            }
        }

        public static Boolean CreateTable(DataItem obj)
        {
            //precondition : connection string have value
            if (DataItem.CheckValidity(obj))
            {
                StringBuilder query = new StringBuilder("CREATE TABLE ");

                query.Append(obj.DataTable);
                query.Append(SPACE);
                query.Append(BRACKET_L);

                Boolean firstComma = true;

                //loop invariant : i=0..length of item datafields; create new field
                for (Int32 i = 0; i < obj.DataFields.Length; i++)
                {
                    //but comma to between all values else first one
                    if (!firstComma)
                        query.Append(COMMA);

                    firstComma = false;

                    //define date field to table
                    query.Append(obj.DataFields[i].Name);
                    query.Append(SPACE);
                    query.Append(obj.DataFields[i].Type.ToString());
                    query.Append(SPACE);

                    //write the length of data type
                    if (obj.DataFields[i].Type == SqlDbType.Char ||
                        obj.DataFields[i].Type == SqlDbType.NChar ||
                        obj.DataFields[i].Type == SqlDbType.VarChar ||
                        obj.DataFields[i].Type == SqlDbType.NVarChar ||
                        obj.DataFields[i].Type == SqlDbType.Binary ||
                        obj.DataFields[i].Type == SqlDbType.VarBinary)
                    {
                        query.Append(BRACKET_L);
                        query.Append(obj.DataFields[i].Length);
                        query.Append(BRACKET_R);
                        query.Append(SPACE);
                    }

                    //write identity keyword
                    if (obj.DataFields[i].IsIdentity)
                        query.Append("IDENTITY ");

                    //write primary key keyword
                    if (obj.DataFields[i].IsPrimaryKey)
                        query.Append("PRIMARY KEY ");

                    //if (obj.DataFields[i].ReferenceTable != null)
                    //{
                    //    query.Append("FOREIGN KEY REFERENCES ");
                    //    query.Append(obj.DataFields[i].ReferenceTable.DataTable);
                    //    query.Append(BRACKET_L);
                    //    query.Append(obj.DataFields[i].ReferenceField.Name);
                    //    query.Append(BRACKET_R);
                    //}
                }

                query.Append(BRACKET_R);
                query.Append(SEMICOLON);

                executeNonQuery(query.ToString());

                return true;
            }
            else
                return false;

            //return value : if an table created , return true , else return false
            //postcondition : item table was create in database file
        }

        public static Boolean DropTable(DataItem obj)
        {
            //precondition : connection string have value
            if (!DataItem.CheckValidity(obj))
                //table not removed
                return false;
            else
            {
                //drop table query string
                StringBuilder query = new StringBuilder("DROP TABLE ");
                query.Append(obj.DataTable);
                query.Append(SEMICOLON);

                executeNonQuery(query.ToString());

                return true;
            }
            //return value : if an table deleted , return true , else return false
            //postcondition : item table was deleted from database file
        }

        private static void writeQueryLogs(String query)
        {
            FileStream fs = new FileStream("queryLog.log", FileMode.Append);
            StreamWriter sr = new StreamWriter(fs);

            sr.WriteLine(query);
            sr.Close();
            fs.Close();
        }

        private static Int32 executeNonQuery(String queryString)
        {
            //precondtion : none

            Int32 count = 0;

            command.CommandText = queryString;
            writeQueryLogs(queryString);

            //execute command
            connection.Open();
            count = command.ExecuteNonQuery();
            connection.Close();

            return count;
            //return value : count of effected regester in database
        }

        private static Object executeScallar(String queryString)
        {
            //precondtion : none
            Object result;

            command.CommandText = queryString;
            writeQueryLogs(queryString);

            //execute command
            connection.Open();
            result = command.ExecuteScalar();
            connection.Close();

            return result;
            //return value : selected value from database
        }

        private static String connectionString;
        private static SqlConnection connection;
        private static SqlCommand command;
        private static SqlDataReader reader;

        private const Char COMMA = ',';
        private const Char SPACE = ' ';
        private const Char BRACKET_L = '(';
        private const Char BRACKET_R = ')';
        private const Char EQUALS = '=';
        private const Char SEMICOLON = ';';
    }
}
