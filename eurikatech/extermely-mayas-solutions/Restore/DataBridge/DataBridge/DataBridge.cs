using System;
using System.Text;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace Maniyat
{
    public interface IDataBase
    {
        DataItem[] DataFields
        {
            get;
            set;
        }

        String DataTable
        {
            get;
            set;
        }

        IDataBase[] DbCreate(Int32 n);

        void DbRead();

        void DbWrite();
    }

    public class DataItem
    {
        private String name;
        private Int32 length;
        private Object value;
        private SqlDbType type;
        private Boolean isUsed;
        private Boolean isPrimaryKey;
        private Boolean isIdentity;
        private IDataBase referenceTable;
        private DataItem referenceField;

        public DataItem()
        {
            name = null;
            value = null;
            length = -1;
            type = SqlDbType.Bit;
            isUsed = true;
            isPrimaryKey = false;
            isIdentity = false;
        }

        public DataItem(String dataName, SqlDbType dataType, Int32 dataLength)
        {
            name = dataName;
            length = dataLength;
            type = dataType;
            isUsed = true;
            isPrimaryKey = false;
            isIdentity = false;
        }

        public DataItem(String dataName, SqlDbType dataType, Int32 dataLength, Boolean isPrimaryKey, Boolean isIdentity)
        {
            name = dataName;
            length = dataLength;
            type = dataType;
            isUsed = true;
            this.isPrimaryKey = isPrimaryKey;
            this.isIdentity = isIdentity;
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32 Length
        {
            get
            {
                return length;
            }
            set
            {
                length = value;
            }
        }

        public Object Value
        {
            get
            {
                return value;
            }
            set
            {
                this.value = value;
            }
        }

        public SqlDbType Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }

        public Boolean IsUsed
        {
            get
            {
                return isUsed;
            }
            set
            {
                isUsed = value;
            }
        }

        public Boolean IsPrimaryKey
        {
            get
            {
                return isPrimaryKey;
            }
            set
            {
                isPrimaryKey = value;
            }
        }

        public Boolean IsIdentity
        {
            get
            {
                return isIdentity;
            }
            set
            {
                isIdentity = value;
            }
        }

        public IDataBase ReferenceTable
        {
            get
            {
                return referenceTable;
            }
            set
            {
                referenceTable = value;
            }
        }

        public DataItem ReferenceField
        {
            get
            {
                return referenceField;
            }
            set
            {
                referenceField = value;
            }
        }
    }

    public class DataCondition
    {
        private DataItem item;
        private String operat;
        private Object value;

        public DataCondition()
        {
            item = null;
            operat = null;
            value = null;
        }

        public DataCondition(DataItem conditionItem, String conditionOperator, Object conditionValue)
        {
            item = conditionItem;
            operat = conditionOperator;
            value = conditionValue;
        }

        public DataItem Item
        {
            get
            {
                return item;
            }
            set
            {
                item = value;
            }
        }

        public String Operator
        {
            get
            {
                return operat;
            }
            set
            {
                operat = value;
            }
        }

        public Object Value
        {
            get
            {
                return value;
            }
            set
            {
                this.value = value;
            }
        }
    }

    public static class DataBase
    {
        private static IDbConnection connection;
        private static IDbCommand command;
        private static IDataReader dataReader;
        private static IDataAdapter dataAdapter;

        private const Char COMMA = ',';
        private const Char SPACE = ' ';
        private const Char QUOTE = '\'';
        private const Char BRACKET_L = '(';
        private const Char BRACKET_R = ')';
        private const Char EQUALS = '=';
        private const Char N = 'N';

        private static void writeQueryLogs(String query)
        {
            FileStream fs = new FileStream("queryLog.log", FileMode.Append);
            StreamWriter sr = new StreamWriter(fs);

            sr.WriteLine(query);
            sr.Close();
            fs.Close();
        }

        private static String connectionString;

        private static String getStandardParameter(SqlDbType type, Int32 length, Object value)
        {
            //preconditoin : none
            String param;

            if (value == null)
                return "\'NULL\'";
            else
            {
                switch (type)
                {
                    case SqlDbType.Char:
                    case SqlDbType.VarChar:
                    case SqlDbType.Text:
                    case SqlDbType.Date:
                    case SqlDbType.DateTime:
                    case SqlDbType.DateTime2:
                    case SqlDbType.Binary:
                    case SqlDbType.VarBinary:
                        if (value.ToString().Length > length)
                            value = value.ToString().Substring(0, length);

                        param = QUOTE + value.ToString() + QUOTE;
                        break;
                    case SqlDbType.NChar:
                    case SqlDbType.NVarChar:
                    case SqlDbType.NText:
                        length = Convert.ToInt32(length / 2);

                        if (value.ToString().Length > length)
                            value = value.ToString().Substring(0, length);

                        param = N.ToString() + QUOTE + value.ToString() + QUOTE.ToString();
                        break;
                    case SqlDbType.Bit:
                        if (Convert.ToBoolean(value))
                            param = "\'True\'";
                        else
                            param = "\'False\'";
                        break;
                    default:
                        param = value.ToString();
                        break;
                }
            }
            //return value : parameter in standard sql language variable form
            return param;
        }

        private static String getStandardCondition(DataCondition condition)
        {
            //precondition : none

            StringBuilder cond = new StringBuilder();

            if (condition != null)
                if (condition.Item != null)
                    if (condition.Item.Name != null || condition.Item.Name != "")
                    //conditoin have name or item not null or empty
                    {
                        //concate condition
                        cond.Append(condition.Item.Name);
                        cond.Append(SPACE);
                        cond.Append(condition.Operator);
                        cond.Append(SPACE);
                        cond.Append(getStandardParameter(condition.Item.Type, condition.Item.Length, condition.Value));

                        return cond.ToString();
                    }

            return null;
            //return value : if condition not null and have name ,return sql condition statement , else return null
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
            //return value : count of effected regester in database
        }

        private static String select(IDataBase item, Boolean isSelectCount)
        {
            //precondition : none


            //query string
            StringBuilder query = new StringBuilder("SELECT");
            Boolean firstComma = true;

            query.Append(SPACE);

            if (isSelectCount)
            {
                query.Append("COUNT");
                query.Append(BRACKET_L);
                query.Append('*');
                query.Append(BRACKET_R);
            }
            else
            {
                //loop invariant : for all i=0..dataFields.Length-1 fill database fields name
                for (Int32 i = 0; i < item.DataFields.Length; i++)
                    if (item.DataFields[i] != null)
                        if (item.DataFields[i].IsUsed && item.DataFields[i].Name != null && item.DataFields[i].Name != "")
                        {
                            //but comma to between all values else first one
                            if (!firstComma)
                                query.Append(COMMA);

                            firstComma = false;
                            //dataFields not null , name not null or empty
                            query.Append(item.DataFields[i].Name);
                        }
            }

            query.Append(SPACE);
            query.Append("FROM");
            query.Append(SPACE);
            query.Append(item.DataTable);

            //return value : return query string
            return query.ToString();

            //postconditoin: sql statement
        }

        private static String insert(IDataBase item, Boolean returnIdentity)
        {
            //precondition : none


            //query string
            StringBuilder query = new StringBuilder("INSERT INTO");
            Boolean firstComma = true;

            query.Append(SPACE);
            query.Append(item.DataTable);
            query.Append(SPACE);

            query.Append(BRACKET_L);

            //loop invariant : for all i=0..dataFields.Length-1 fill database fields name
            for (Int32 i = 0; i < item.DataFields.Length; i++)
                if (item.DataFields[i] != null)
                    if (item.DataFields[i].IsUsed && !item.DataFields[i].IsIdentity && item.DataFields[i].Name != null && item.DataFields[i].Name != "")
                    {
                        //but comma to between all values else first one
                        if (!firstComma)
                            query.Append(COMMA);

                        firstComma = false;
                        //dataFields not null , name not null or empty
                        query.Append(item.DataFields[i].Name);
                    }

            query.Append(BRACKET_R);
            query.Append(SPACE);
            query.Append("VALUES");
            query.Append(SPACE);
            query.Append(BRACKET_L);

            firstComma = true;

            //loop invariant : for all i=0..dataFields.Length-1 fill database fields values
            for (Int32 i = 0; i < item.DataFields.Length; i++)
                if (item.DataFields[i] != null)
                    if (item.DataFields[i].IsUsed && !item.DataFields[i].IsIdentity && item.DataFields[i].Name != null && item.DataFields[i].Name != "")
                    {
                        //but comma to between all values else first one
                        if (!firstComma)
                            query.Append(COMMA);

                        firstComma = false;
                        //dataFields not null , name not null or empty
                        query.Append(getStandardParameter(item.DataFields[i].Type, item.DataFields[i].Length, item.DataFields[i].Value));
                    }

            query.Append(BRACKET_R);

            if (returnIdentity)
            {
                query.Append(SPACE);
                query.Append("@@SELECT IDENTITY");
            }
            //return value : return query string
            return query.ToString();

            //postconditoin: sql statement
        }

        private static String update(IDataBase item)
        {
            //precondition : none

            //query string
            StringBuilder query = new StringBuilder("UPDATE");
            Boolean firstComma = true;

            query.Append(SPACE);
            query.Append(item.DataTable);
            query.Append(SPACE);
            query.Append("SET");
            query.Append(SPACE);

            //loop invariant : for all i=0..dataFields.Length-1 fill database fields name and values
            for (Int32 i = 0; i < item.DataFields.Length; i++)
                if (item.DataFields[i] != null)
                    if (item.DataFields[i].IsUsed && item.DataFields[i].Name != null && item.DataFields[i].Name != "")
                    {
                        //but comma to between all values else first one
                        if (!firstComma)
                            query.Append(COMMA);

                        firstComma = false;
                        //dataFields not null , name not null or empty
                        query.Append(item.DataFields[i].Name);
                        query.Append(EQUALS);
                        query.Append(getStandardParameter(item.DataFields[i].Type, item.DataFields[i].Length, item.DataFields[i].Value));
                    }

            //return value : return query string
            return query.ToString();

            //postconditoin: sql statement
        }

        static DataBase()
        {
            connection = null;
            command = null;
            dataAdapter = null;
            dataReader = null;
            connectionString = null;
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
                command = new SqlCommand("", (SqlConnection)connection);
            }
        }

        public static Boolean CreateTable(IDataBase item)
        {
            //preconditoin : an open database connection exist
            if (item == null || item.DataTable == null || item.DataTable == "" || item.DataFields == null || item.DataFields.Length == 0)
                //table not added
                return false;
            else
            {
                //create table query string
                StringBuilder query = new StringBuilder("CREATE TABLE ");

                query.Append(item.DataTable);
                query.Append(BRACKET_L);

                Boolean firstComma = true;

                //loop invariant : i=0..length of item datafields; create new field
                for (Int32 i = 0; i < item.DataFields.Length; i++)
                    if (item.DataFields[i].IsUsed)
                    {
                        //but comma to between all values else first one
                        if (!firstComma)
                            query.Append(COMMA);

                        firstComma = false;

                        //define date field to table
                        query.Append(item.DataFields[i].Name);
                        query.Append(SPACE);
                        query.Append(item.DataFields[i].Type.ToString());
                        query.Append(SPACE);

                        //write the length of data type
                        if (item.DataFields[i].Type == SqlDbType.Char ||
                            item.DataFields[i].Type == SqlDbType.NChar ||
                            item.DataFields[i].Type == SqlDbType.VarChar ||
                            item.DataFields[i].Type == SqlDbType.NVarChar ||
                            item.DataFields[i].Type == SqlDbType.Binary ||
                            item.DataFields[i].Type == SqlDbType.VarBinary)
                        {
                            query.Append(BRACKET_L);
                            query.Append(item.DataFields[i].Length);
                            query.Append(BRACKET_R);
                            query.Append(SPACE);
                        }

                        //write identity keyword
                        if (item.DataFields[i].IsIdentity)
                            query.Append("IDENTITY ");

                        //write primary key keyword
                        if (item.DataFields[i].IsPrimaryKey)
                            query.Append("PRIMARY KEY ");

                        if (item.DataFields[i].ReferenceTable != null)
                        {
                            query.Append("FOREIGN KEY REFERENCES ");
                            query.Append(item.DataFields[i].ReferenceTable.DataTable);
                            query.Append(BRACKET_L);
                            query.Append(item.DataFields[i].ReferenceField.Name);
                            query.Append(BRACKET_R);
                        }
                    }


                query.Append(BRACKET_R);

                executeNonQuery(query.ToString());

                return true;
            }
            //return value : if an table created , return true , else return false
            //postcondition : item table was create in database file
        }

        public static Boolean DropTable(IDataBase item)
        {
            //preconditoin : an open database connection exist
            if (item == null || item.DataTable == null || item.DataTable == "")
                //table not removed
                return false;
            else
            {
                //drop table query string
                StringBuilder query = new StringBuilder("DROP TABLE ");
                query.Append(item.DataTable);

                executeNonQuery(query.ToString());

                return true;
            }
            //return value : if an table deleted , return true , else return false
            //postcondition : item table was deleted from database file
        }

        public static void Find(ref IDataBase item, Object primaryKeyValue)
        {
            //precondition : item must have primary key value

            //index of primary key
            Int32 idx = -1;

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    //item not null , item datatable not null or empty
                    for (Int32 i = 0; i < item.DataFields.Length; i++)
                        if (item.DataFields[i].IsPrimaryKey)
                            idx = i;

                    if (idx == -1)
                    {
                        item = null;
                    }
                    else
                    {
                        //select statement
                        //build condition query string
                        StringBuilder conQuery = new StringBuilder();
                        DataCondition condition = new DataCondition(item.DataFields[idx], "=", primaryKeyValue);

                        //concate condition
                        conQuery.Append(SPACE);
                        conQuery.Append("WHERE");
                        conQuery.Append(SPACE);
                        conQuery.Append(getStandardCondition(condition));

                        //item not null , item datatable not null or empty



                        //execute command
                        command.CommandText = select(item, false) + conQuery.ToString();
                        writeQueryLogs(command.CommandText);

                        connection.Open();
                        dataReader = command.ExecuteReader();

                        //for all records that selected in SQL statement
                        if (dataReader.Read())
                            for (Int32 i = 0; i < item.DataFields.Length; i++)
                                item.DataFields[i].Value = dataReader[i];
                        else
                            for (Int32 i = 0; i < item.DataFields.Length; i++)
                                item.DataFields[i].Value = null;

                        connection.Close();
                    }
                }
            //postconditon : select an item with primary key value is primarykeyValue parameter

        }

        public static Int32 Insert(IDataBase item, Boolean returnIdentity)
        {
            //precondition : none

            //update item properties
            item.DbRead();

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    //item not null , item datatable not null or empty
                    return executeNonQuery(insert(item, returnIdentity));
                }

            return 0;
            //return value : count of effected regester on database
        }

        public static Int32 Update(IDataBase item)
        {
            //precondition : none

            //update item properties
            item.DbRead();

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    //item not null , item datatable not null or empty
                    return executeNonQuery(update(item));
                }

            return 0;
            //postconditoin: update regesters on database
        }

        public static Int32 Update(IDataBase item, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : none

            //update item properties
            item.DbRead();

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    StringBuilder query = new StringBuilder(update(item));

                    //concate condition
                    if (conditions != null && conditions.Length > 0)
                    {
                        query.Append(SPACE);
                        query.Append("WHERE");
                        query.Append(SPACE);

                        for (Int32 i = 0; i < conditions.Length; i++)
                        {
                            query.Append(getStandardCondition(conditions[i]));

                            if (i < conditions.Length - 1)
                            {
                                query.Append(SPACE);
                                query.Append(binaryOperator);
                                query.Append(SPACE);
                            }
                        }
                    }

                    //item not null , item datatable not null or empty
                    return executeNonQuery(query.ToString());
                }

            return 0;

            //postconditoin : update regester on database depinding on selected conditions
        }

        public static Int32 Update(IDataBase item, DataCondition condition)
        {
            //precondition : none

            //update item properties
            item.DbRead();

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    StringBuilder query = new StringBuilder(update(item));

                    //concate condition
                    query.Append(SPACE);
                    query.Append("WHERE");
                    query.Append(SPACE);
                    query.Append(getStandardCondition(condition));


                    //item not null , item datatable not null or empty
                    return executeNonQuery(query.ToString());
                }

            return 0;

            //postconditoin : update regester on database depinding on selected condition
        }

        public static Int32 Delete(IDataBase item, DataCondition condition)
        {
            //precondition : none

            if (item != null)
                if (item.DataTable != null && item.DataTable != "")
                {
                    //item not null , item datatable not null or empty

                    //query string
                    StringBuilder query = new StringBuilder("DELETE FROM");
                    query.Append(SPACE);
                    query.Append(item.DataTable);

                    if (condition != null)
                    {
                        query.Append(SPACE);
                        query.Append("WHERE");
                        query.Append(SPACE);
                        query.Append(getStandardCondition(condition));
                    }

                    return executeNonQuery(query.ToString());
                }

            return 0;
            //return value : count of effected regester in database
        }

        public static Int32 Delete(IDataBase item, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : none

            if (item != null)
                if (item.DataTable != null && item.DataTable != "")
                {
                    //item not null , item datatable not null or empty

                    //query string
                    StringBuilder query = new StringBuilder("DELETE FROM");

                    query.Append(SPACE);
                    query.Append(item.DataTable);

                    //concate condition
                    if (conditions != null && conditions.Length > 0)
                    {

                        query.Append(SPACE);
                        query.Append("WHERE");
                        query.Append(SPACE);

                        for (Int32 i = 0; i < conditions.Length; i++)
                        {
                            query.Append(getStandardCondition(conditions[i]));

                            if (i < conditions.Length - 1)
                            {
                                query.Append(SPACE);
                                query.Append(binaryOperator);
                                query.Append(SPACE);
                            }
                        }
                    }

                    return executeNonQuery(query.ToString());
                }

            return 0;
            //postconditoin : sql Satement
        }

        public static IDataBase[] Select(IDataBase item)
        {
            //precondition : none
            IDataBase[] items = null;
            Int32 count;

            if (item != null)
                if (item.DataTable != null && item.DataTable != "" && item.DataFields != null && item.DataFields.Length > 0)
                {
                    //item not null , item datatable not null or empty
                    Object result = executeScallar(select(item, true));

                    if (result != null && Int32.TryParse(result.ToString(), out count))
                    {
                        items = item.DbCreate(count);

                        Int32 idx = 0;

                        //execute command
                        command.CommandText = select(item, false);
                        writeQueryLogs(command.CommandText);

                        connection.Open();
                        dataReader = command.ExecuteReader();

                        //for all records that selected in SQL statement
                        while (dataReader.Read())
                        {
                            //for all fields in items , put values
                            for (Int32 i = 0; i < items[idx].DataFields.Length; i++)
                                items[idx].DataFields[i].Value = dataReader[i];

                            items[idx++].DbWrite();
                        }

                        connection.Close();
                    }
                }

            return items;

            //postconditoin: write values from database to item parameter
        }

        public static IDataBase[] Select(IDataBase item, DataCondition condition)
        {
            //precondition : none
            IDataBase[] items = null;
            Int32 count;

            if (items != null)
                if (items[0].DataTable != null && items[0].DataTable != "" && items[0].DataFields != null && items[0].DataFields.Length > 0)
                {
                    //build condition query string
                    StringBuilder conQuery = new StringBuilder();

                    //concate condition
                    conQuery.Append(SPACE);
                    conQuery.Append("WHERE");
                    conQuery.Append(SPACE);
                    conQuery.Append(getStandardCondition(condition));

                    //item not null , item datatable not null or empty
                    Object result = executeScallar(select(items[0], true) + conQuery.ToString());

                    if (result != null && Int32.TryParse(result.ToString(), out count))
                    {
                        items = item.DbCreate(count);
                        Int32 idx = 0;

                        //execute command
                        command.CommandText = select(items[0], false) + conQuery.ToString();
                        writeQueryLogs(command.CommandText);

                        connection.Open();
                        dataReader = command.ExecuteReader();

                        //for all records that selected in SQL statement
                        while (dataReader.Read())
                        {
                            //for all fields in items , put values
                            for (Int32 i = 0; i < items[idx].DataFields.Length; i++)
                                items[idx].DataFields[i].Value = dataReader[i];

                            items[idx++].DbWrite();
                        }

                        connection.Close();
                    }
                }

            return items;

            //postconditoin: write values from database to item parameter
        }

        public static IDataBase[] Select(IDataBase item, DataCondition[] conditions, String binaryOperator)
        {
            //precondition : none
            IDataBase[] items = null;
            Int32 count;

            if (items != null)
                if (items[0].DataTable != null && items[0].DataTable != "" && items[0].DataFields != null && items[0].DataFields.Length > 0)
                {
                    //build condition query string
                    StringBuilder conQuery = new StringBuilder();

                    //concate condition
                    if (conditions != null && conditions.Length > 0)
                    {
                        conQuery.Append(SPACE);
                        conQuery.Append("WHERE");
                        conQuery.Append(SPACE);

                        for (Int32 i = 0; i < conditions.Length; i++)
                        {
                            conQuery.Append(getStandardCondition(conditions[i]));

                            if (i < conditions.Length - 1)
                            {
                                conQuery.Append(SPACE);
                                conQuery.Append(binaryOperator);
                                conQuery.Append(SPACE);
                            }
                        }
                    }

                    //item not null , item datatable not null or empty
                    Object result = executeScallar(select(items[0], true) + conQuery.ToString());

                    if (result != null && Int32.TryParse(result.ToString(), out count))
                    {
                        items = item.DbCreate(count);
                        Int32 idx = 0;

                        //execute command
                        command.CommandText = select(items[0], false) + conQuery.ToString();
                        writeQueryLogs(command.CommandText);

                        connection.Open();
                        dataReader = command.ExecuteReader();

                        //for all records that selected in SQL statement
                        while (dataReader.Read())
                        {
                            //for all fields in items , put values
                            for (Int32 i = 0; i < items[idx].DataFields.Length; i++)
                                items[idx].DataFields[i].Value = dataReader[i];

                            items[idx++].DbWrite();
                        }

                        connection.Close();
                    }
                }

            return items;

            //postconditoin: write values from database to item parameter
        }

        public static void WriteValues(IDataBase item)
        {
            System.Reflection.PropertyInfo[] properties = item.GetType().GetProperties();

            for (Int32 i = 0; i < properties.Length; i++)
                if (properties[i].PropertyType == typeof(Int16) || properties[i].PropertyType == typeof(Int32) || properties[i].PropertyType == typeof(Int64))
                    properties[i].SetValue(item, 115, null);
                else
                    if (properties[i].PropertyType == typeof(String))
                        properties[i].SetValue(item, "Mayas Faraj", null);
                    else
                        if (properties[i].PropertyType == typeof(Boolean))
                            properties[i].SetValue(item, true, null);
        }

        public static String GetValues(IDataBase item)
        {
            System.Reflection.PropertyInfo[] properties = item.GetType().GetProperties();
            String result = "";

            for (Int32 i = 0; i < properties.Length; i++)
                result += '(' + properties[i].Name.ToString() + ')' + Convert.ToString(properties[i].GetValue(item, null)) + Environment.NewLine;

            return result;
        }
    }
}