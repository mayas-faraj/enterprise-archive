using System;
using System.Data;
using System.Reflection;

namespace Maniyat
{
    public class DataField
    {
        //public construtures region
        public DataField(PropertyInfo property)
        {
            name = null;
            type = 0;
            length = 0;
            isPrimaryKey = isIdentity = isUsed = false;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            length = 0;
            isPrimaryKey = isIdentity = false;
            isUsed = true;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, Int32 length, PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            this.length = length;
            isPrimaryKey = isIdentity = false;
            isUsed = true;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, Int32 length,Object defaultValue, PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            this.length = length;
            isPrimaryKey = isIdentity = false;
            this.defaultValue = defaultValue;
            isUsed = true;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity, PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            this.length = 0;
            this.isPrimaryKey = isPrimaryKey;
            this.isIdentity = isIdentity;
            isUsed = true;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed, PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            this.length = length;
            this.isPrimaryKey = isPrimaryKey;
            this.isIdentity = isIdentity;
            this.isUsed = isUsed;
            isNullable = true;
            this.property = property;
        }

        public DataField(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed,IDatabase relationItem,DataField relationField,  PropertyInfo property)
        {
            this.name = name;
            this.type = type;
            this.length = length;
            this.isPrimaryKey = isPrimaryKey;
            this.isIdentity = isIdentity;
            this.isUsed = isUsed;
            this.isNullable = true;
            this.RelationField = relationField;
            this.RelationItem = relationItem;
            this.property = property;
        }

        //public properties region
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

        public Boolean IsNullable
        {
            get
            {
                return isNullable;
            }
            set
            {
                isNullable = value;
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

        public Object DefaultValue
        {
            get
            {
                return defaultValue;
            }
            set
            {
                defaultValue = value;
            }
        }

        public DataField RelationField
        {
            get
            {
                return relationField;
            }
            set
            {
                relationField = value;
            }
        }

        public IDatabase RelationItem
        {
            get
            {
                return relationItem;
            }
            set
            {
                relationItem = value;
            }
        }

        //public events region
        public event ExceptionEventHandler exceptionEvent;

        //public functions region
        public Object GetValue(IDatabase item)
        {
            if (property == null)
                return null;
            else
                return property.GetValue(item, null);
        }

        public String GetSqlValue(IDatabase item)
        {
            //preconditoin : none
            return DataField.GetSqlValue(this, this.GetValue(item));
            //return value : parameter in standard sql language variable form
        }

        public static String GetSqlValue(DataField field, Object value)
        {
            //preconditoin : none
            String sqlValue;

            if (value == null)
                return "\'NULL\'";
            else
            {
                switch (field.Type)
                {
                    case SqlDbType.Date:
                    case SqlDbType.DateTime:
                    case SqlDbType.DateTime2:
                        sqlValue = "CONVERT(DATETIME," + QUOTE + value.ToString() + QUOTE + ",103)";
                        break;
                    case SqlDbType.Char:
                    case SqlDbType.VarChar:
                    case SqlDbType.Binary:
                    case SqlDbType.VarBinary:
                        if (value.ToString().Length > field.Length)
                            sqlValue = QUOTE + value.ToString().Substring(0, field.Length) + QUOTE;
                        else
                            sqlValue = QUOTE + value.ToString() + QUOTE;
                        break;
                    case SqlDbType.Text:
                        sqlValue = QUOTE + value.ToString() + QUOTE;
                        break;
                    case SqlDbType.NChar:
                    case SqlDbType.NVarChar:
                        if (value.ToString().Length > field.Length)
                            sqlValue = N.ToString() + QUOTE + value.ToString().Substring(0, field.Length) + QUOTE;
                        else
                            sqlValue = N.ToString() + QUOTE + value.ToString() + QUOTE;
                        break;
                    case SqlDbType.NText:
                        sqlValue = N.ToString() + QUOTE + value.ToString() + QUOTE;
                        break;
                    case SqlDbType.Bit:
                        if (value == "1")
                            sqlValue = "\'True\'";
                        else
                            sqlValue = "\'False\'";
                        break;
                    default:
                        sqlValue = value.ToString();
                        break;
                }
            }
            //return value : parameter in standard sql language variable form
            return sqlValue;
        }

        public void SetValue(IDatabase item, Object value)
        {
            if (property == null)
                exceptionEvent(this, new ExceptionEventArgs(new Exception(CheckSystem.ERROR_CHECK_SYSTEM + "002")));
            else
            {
                if (!(property.PropertyType.IsValueType && (value == null || value == DBNull.Value)))
                    property.SetValue(item, value, null);
            }
        }

        //private fields region
        private String name;
        private SqlDbType type;
        private Int32 length;
        private Boolean isPrimaryKey;
        private Boolean isIdentity;
        private Boolean isNullable;
        private Boolean isUsed;
        private Object defaultValue;
        private DataField relationField;
        private IDatabase relationItem;
        private PropertyInfo property
        {
            get;
            set;
        }

        //private constants region
        private const Char QUOTE = '\'';
        private const Char N = 'N';
    }
}
