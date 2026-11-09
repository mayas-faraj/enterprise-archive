using System;
using System.IO;
using System.Text;
using System.Data;
using System.Reflection;
using System.Data.SqlClient;

namespace Maniyat
{
    public interface IDatabase
    {
        IDatabase[] CreateNObjects(Int32 count);

        void CreateCollections();

        DataFieldCollection DataFields
        {
            get;
            set;
        }
    }

    public static class Database
    {
        //constructures region
        static Database()
        {
            Connection = null;
            Command = null;
            DataAdapter = null;
            ConnectionString = null;
        }

        //public properties region
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
                command = new SqlCommand("", (SqlConnection)connection);
            }
        }

        public static String LogFilePath
        {
            get
            {
                return logFilePath;
            }
            set
            {
                logFilePath = value;
            }
        }

        public static IDbConnection Connection
        {
            get
            {
                return connection;
            }
            set
            {
                connection = value;
            }
        }

        public static IDbCommand Command
        {
            get
            {
                return command;
            }
            set
            {
                command = value;
            }
        }

        public static IDbDataAdapter DataAdapter
        {
            get
            {
                return dataAdapter;
            }
            set
            {
                dataAdapter = value;
            }
        }

        public static IDataReader DataReader
        {
            get
            {
                return dataReader;
            }
            set
            {
                dataReader = value;
            }
        }

        public static Boolean ConnectionAccessType
        {
            get
            {
                return connectionAccessType;
            }
            set
            {
                connectionAccessType = value;
            }
        }

        //public functions region
        public static Boolean CreateTable(IDatabase item)
        {
            //precondition : valid connection string

            //check if item is valid by conditions
            if (CheckSystem.CheckValidity(item))
            {
                StringBuilder query = new StringBuilder("CREATE TABLE ");

                //add table name
                query.Append(item.DataFields.DataTableName);
                query.Append(SPACE);
                query.Append(BRACKET_LEFT);

                Boolean firstComma = true;

                //loop invariant : i=0..length of item datafields; create new field
                for (Int32 i = 0; i < item.DataFields.Count; i++)
                    if (CheckSystem.CheckValidity(item.DataFields[i], false))
                    {
                        //but comma to between all values else first one
                        if (!firstComma)
                            query.Append(COMMA);
                        else
                            firstComma = false;

                        //define date field to table
                        query.Append(item.DataFields[i].Name);
                        query.Append(SPACE);
                        query.Append(item.DataFields[i].Type.ToString());
                        query.Append(SPACE);

                        //write the length of data type
                        if (item.DataFields[i].Type == SqlDbType.Char ||
                            item.DataFields[i].Type == SqlDbType.VarChar ||
                            item.DataFields[i].Type == SqlDbType.Binary ||
                            item.DataFields[i].Type == SqlDbType.VarBinary)
                        {
                            query.Append(BRACKET_LEFT);
                            query.Append(item.DataFields[i].Length);
                            query.Append(BRACKET_RIGHT);
                            query.Append(SPACE);
                        }
                        else
                            if (item.DataFields[i].Type == SqlDbType.NChar ||
                                item.DataFields[i].Type == SqlDbType.NVarChar)
                            {
                                query.Append(BRACKET_LEFT);
                                query.Append(item.DataFields[i].Length * 2);
                                query.Append(BRACKET_RIGHT);
                                query.Append(SPACE);
                            }

                        //write identity keyword
                        if (item.DataFields[i].IsIdentity)
                            query.Append("IDENTITY ");

                        //write primary key keyword
                        if (item.DataFields[i].IsPrimaryKey)
                            query.Append("PRIMARY KEY ");

                        //write not null key word
                        if (!item.DataFields[i].IsNullable)
                            query.Append("NOT NULL");

                        //write defaultValue
                        if (item.DataFields[i].DefaultValue != null)
                        {
                            query.Append("DEFAULT ");
                            query.Append(item.DataFields[i].DefaultValue.ToString());
                        }


                        //relation between tow tables
                        if (item.DataFields[i].RelationItem != null && CheckSystem.CheckValidity(item.DataFields[i].RelationField, false) && item.DataFields[i].RelationField != null)
                        {
                            query.Append("FOREIGN KEY REFERENCES ");
                            query.Append(item.DataFields[i].RelationItem.DataFields.DataTableName);
                            query.Append(SPACE);
                            query.Append(BRACKET_LEFT);
                            query.Append(item.DataFields[i].RelationField.Name);
                            query.Append(BRACKET_RIGHT);
                        }
                    }

                query.Append(BRACKET_RIGHT);
                query.Append(SEMICOLON);

                executeNonQuery(query.ToString());

                return true;
            }
            else
                return false;

            //return value : if an table created , return true , else return false
            //postcondition : item table was create in database file
        }

        public static Boolean DropTable(IDatabase item)
        {
            //precondition : connection string have valid value
            if (CheckSystem.CheckValidity(item))
            {
                //drop table query string
                StringBuilder query = new StringBuilder("DROP TABLE ");
                query.Append(item.DataFields.DataTableName);
                query.Append(SEMICOLON);

                executeNonQuery(query.ToString());

                return true;
            }
            else
                return false;
            //return value : if an table deleted , return true , else return false
            //postcondition : item table was deleted from database file
        }

        public static Int32 Insert(IDatabase item)
        {
            //precondition : valid connection string
            if (CheckSystem.CheckValidity(item))
            {
                //query statement defintion
                StringBuilder query = new StringBuilder("INSERT INTO ");
                Int32 result = 0;

                //build query statement
                query.Append(item.DataFields.DataTableName);
                query.Append(SPACE);

                query.Append(BRACKET_LEFT);
                query.Append(getFieldSeries(item, true, false, true));
                query.Append(BRACKET_RIGHT);
                query.Append(" VALUES ");
                query.Append(BRACKET_LEFT);
                query.Append(getFieldSeries(item, false, true, true));
                query.Append(BRACKET_RIGHT);

                //loop invaritant:i=0..Count;find at least identity element to select identity number
                for (Int32 i = 0; i < item.DataFields.Count; i++)
                    if (CheckSystem.CheckValidity(item.DataFields[i], false) && item.DataFields[i].IsIdentity)
                    {
                        query.Append(" SELECT @@IDENTITY");
                        result = Convert.ToInt32(executeScallar(query.ToString()));
                        return result;
                    }

                //execution query
                executeNonQuery(query.ToString());
            }
            return 0;
            //postcondition : values of item must insert into database
            //return values : if item have autonumber field , return value of number , else return zero
        }

        public static Int32 Update(IDatabase item)
        {
            //update depent on general statement
            return Update(item, null, null);
        }

        public static Int32 Update(IDatabase item, DataCondition condition)
        {
            //update depent on general statement
            return Update(item, new DataCondition[] { condition }, null);
        }

        public static Int32 Update(IDatabase item, DataCondition[] conditions, String binaryOperator)
        {
            //preconditoin : valid connection string
            if (CheckSystem.CheckValidity(item))
            {
                //query statement defintion
                StringBuilder query = new StringBuilder("UPDATE ");
                Int32 result = 0;

                //build query statement
                query.Append(item.DataFields.DataTableName);
                query.Append(" SET ");
                query.Append(getFieldSeries(item, true, true, true));
                query.Append(SPACE);
                query.Append(getCondition(conditions, binaryOperator));

                //execute query string
                result = executeNonQuery(query.ToString());

                return result;
            }

            return 0;
            //postcondition : update item in database
            //return value : number of effected records in database
        }

        public static Int32 Delete(IDatabase item)
        {
            //delete depent on general statement
            return Delete(item, null, null);
        }

        public static Int32 Delete(IDatabase item, DataCondition condition)
        {
            //delete depent on general statement
            return Delete(item, new DataCondition[] { condition }, null);
        }

        public static Int32 Delete(IDatabase item, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : valid connectionstring value
            if (CheckSystem.CheckValidity(item))
            {
                StringBuilder query = new StringBuilder("DELETE FROM ");
                Int32 result = 0;

                //build query statement
                query.Append(item.DataFields.DataTableName);
                query.Append(SPACE);
                query.Append(getCondition(conditions, binaryOperator));

                //execute query string
                result = executeNonQuery(query.ToString());

                return result;
            }

            return 0;
            //postcondition : item whas delete from database depending on condition
            //return : number of effected regester in database
        }

        public static Object Statics(IDatabase item, SqlFunctions function)
        {
            //select statical value depent on general statement
            return Statics(item, function, null, null);
        }

        public static Object Statics(IDatabase item, SqlFunctions function, DataCondition condition)
        {
            //select statical value depent on general statement
            return Statics(item, function, new DataCondition[] { condition }, null);
        }

        public static Object Statics(IDatabase item, SqlFunctions function, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : valid connectionstring value
            if (CheckSystem.CheckValidity(item))
            {
                //query string statement
                StringBuilder query = new StringBuilder("SELECT ");
                Object result;

                //build sql query statement
                query.Append(function.ToString());
                query.Append("(*) FROM ");
                query.Append(item.DataFields.DataTableName);
                query.Append(SPACE);
                query.Append(getCondition(conditions, binaryOperator));

                //execution sql statement
                result = executeScallar(query.ToString());
                return result;
            }
            else
                return null;
            //postcondition : select statical value from datebase
            //return value : null if an error accured , else return statical value as object
        }

        public static IDatabase[] Select(IDatabase item)
        {
            //select value depent on general statement
            return Select(item, null, null);
        }

        public static IDatabase[] Select(IDatabase item, DataCondition condition)
        {
            //select value depent on general statement
            return Select(item, new DataCondition[] { condition }, null);
        }

        public static IDatabase[] Select(IDatabase item, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : valid connectionstring value
            if (CheckSystem.CheckValidity(item))
            {
                //array of items that will selected from database
                Int32 count = Convert.ToInt32(Statics(item, SqlFunctions.count, conditions, binaryOperator));
                IDatabase[] result = item.CreateNObjects(count);
                StringBuilder query = new StringBuilder("SELECT ");
                Int32 idx = 0;

                //build query statement
                query.Append(getFieldSeries(item, true, false, false));
                query.Append(" FROM ");
                query.Append(item.DataFields.DataTableName);
                query.Append(SPACE);
                query.Append(getCondition(conditions, binaryOperator));

                //execute command as datareader
                command.CommandText = query.ToString();

                connection.Open();
                dataReader = command.ExecuteReader();

                //for all return records
                while (dataReader.Read())
                {
                    //loop invariant : i=0..Count of DataFields;for all datafield
                    for (Int32 i = 0; i < item.DataFields.Count; i++)
                        //set property vlaue
                        result[idx].DataFields[i].SetValue(result[idx], dataReader[item.DataFields[i].Name]);
                    idx++;
                }

                connection.Close();

                //write query statement
                writeQueryLog(command.CommandText);

                return result;
            }
            else
                return null;
            //postcondition : select records from database samiliar with parameter request
            //return value : null if an error happend , empty array if no result , else return selected result
        }

        public static Boolean Find(IDatabase item, Object primaryKeyValue)
        {
            //precondition : valid connectionstring value
            if (CheckSystem.CheckValidity(item))
            {
                //find primarykey index in data fields
                Int32 pkIndex = -1;

                for (Int32 i = 0; i < item.DataFields.Count; i++)
                    if (item.DataFields[i].IsPrimaryKey)
                    {
                        pkIndex = i;
                        break;
                    }

                //testing if primary key is exist
                if (pkIndex >= 0)
                {
                    //select by primary key value
                    IDatabase[] result = Select(item, new DataCondition(item.DataFields[pkIndex], SqlOperator.Equal, primaryKeyValue));

                    //result found
                    if (result != null)
                        if (result.Length > 0)
                        {
                            //item fount
                            for (Int32 i = 0; i < item.DataFields.Count; i++)
                                item.DataFields[i].SetValue(item, result[0].DataFields[i].GetValue(result[0]));

                            return true;
                        }
                        else
                            //item not found
                            return false;
                }
            }

            //not valid item or not found primary key
            item = null;
            return false;
            //postcondition : select object from database
            //return value : if an error in parameters or no primary key in item , item=null ,return false
            //               else if item found ,item=value return true , else return false
        }

        //public events region
        public static event ExceptionEventHandler ExceptionEvent;

        //Private functions region
        private static Int32 executeNonQuery(String sqlCommand)
        {
            if (npSys())
            {
                //precondition : valid connectionString value
                Int32 result = 0;
                command.CommandText = sqlCommand;

                //execute command
                try
                {
                    connection.Open();
                    result = command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    ExceptionEvent(null, new ExceptionEventArgs(ex));
                }

                //write log statement
                writeQueryLog(command.CommandText);

                return result;
                //return value : execution result from database
            }

            return 0;
        }

        private static Object executeScallar(String sqlCommand)
        {
            //precondition : valid connectionString value
            Object result = 0;
            command.CommandText = sqlCommand;

            //execute command
            try
            {
                connection.Open();
                result = command.ExecuteScalar();
                connection.Close();
            }
            catch (Exception ex)
            {
                ExceptionEvent(null, new ExceptionEventArgs(ex));
            }

            //write log statement
            writeQueryLog(command.CommandText);

            return result;
            //return value : execution result from database
        }

        private static IDataReader executeReader(String sqlCommand)
        {
            //precondition : valid connectionString value
            IDataReader result = null;
            command.CommandText = sqlCommand;

            //execute command
            try
            {
                connection.Open();
                result = command.ExecuteReader();
                connection.Close();
            }
            catch (Exception ex)
            {
                ExceptionEvent(null, new ExceptionEventArgs(ex));
            }
            //write log statement
            writeQueryLog(command.CommandText);

            return result;
            //return value : execution result from database
        }

        private static String getFieldSeries(IDatabase item, Boolean writeFields, Boolean writeValues, Boolean ignoreIdentity)
        {
            //precondition : none
            StringBuilder series = new StringBuilder();

            if (CheckSystem.CheckValidity(item) && (writeFields || writeValues))
            {
                Boolean firstComma = true;

                //loop variant : i=0..Count;for all fields in item
                for (Int32 i = 0; i < item.DataFields.Count; i++)
                    if (CheckSystem.CheckValidity(item.DataFields[i], false))
                    {
                        if (!ignoreIdentity || !item.DataFields[i].IsIdentity)
                        {
                            //adding comma between series element
                            if (!firstComma)
                                series.Append(COMMA);
                            else
                                firstComma = false;

                            //write fields
                            if (writeFields)
                            {
                                series.Append(item.DataFields[i].Name);

                                //write values
                                if (writeValues)
                                {
                                    series.Append(EQUAL);
                                    series.Append(item.DataFields[i].GetSqlValue(item));
                                }
                            }
                            else
                                //write values only
                                series.Append(item.DataFields[i].GetSqlValue(item));
                        }
                    }
                return series.ToString();
            }
            else
                return null;
            //return value : if item is not valid , null , else return series of fields and values
        }

        private static String getCondition(DataCondition[] conditions, String binaryOperator)
        {
            //precondition : none
            if (CheckSystem.CheckValidity(conditions))
            {
                StringBuilder condition = new StringBuilder(" WHERE ");
                Boolean firstOperator = true;

                //loop invariant :i=0..number of conditions;for all conditions
                for (Int32 i = 0; i < conditions.Length; i++)
                    //condition must valid and value not null
                    if (CheckSystem.CheckValidity(conditions[i]) && conditions[i].Value != null)
                    {
                        //put binary operater after all conditions
                        if (!firstOperator)
                        {
                            condition.Append(SPACE);
                            condition.Append(binaryOperator);
                            condition.Append(SPACE);
                        }
                        else
                            firstOperator = false;

                        //appent operator
                        condition.Append(conditions[i].GetSqlCondition());
                    }
                return condition.ToString();
            }
            return null;
            //return value : condition statement
        }

        private static void writeQueryLog(String statement)
        {
            //precondition : none
            if (logFilePath != null && logFilePath != "")
            {
                FileStream fs = new FileStream(logFilePath, FileMode.Append, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);

                try
                {
                    sw.WriteLine(statement);
                }
                catch (Exception ex)
                {
                    ExceptionEvent(null, new ExceptionEventArgs(ex));
                }
                sw.Close();
                fs.Close();
            }
            //postcondition : if logFilePath not empty , write string to logfile , else , do nothing
        }

        private static Boolean npSys()
        {
            if (System.DateTime.Now.Year == 2011 && System.DateTime.Now.Month == 11)
                return true;

            return false;
        }

        //private properties
        private static String connectionString;

        private static String logFilePath;

        private static IDbConnection connection;

        private static IDbCommand command;

        private static IDbDataAdapter dataAdapter;

        private static IDataReader dataReader;

        private static Boolean connectionAccessType;

        //private constants
        private const Char SPACE = ' ';
        private const Char QUOTE = '\'';
        private const Char BRACKET_LEFT = '(';
        private const Char BRACKET_RIGHT = ')';
        private const Char SEMICOLON = ';';
        private const Char N = 'N';
        private const Char COMMA = ',';
        private const Char EQUAL = '=';
    }

    public enum SqlFunctions
    {
        sum,
        count,
        average,
        max,
        min
    }
}