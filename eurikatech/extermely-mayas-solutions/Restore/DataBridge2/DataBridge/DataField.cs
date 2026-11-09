using System;
using System.Data;

namespace Maniyat
{
    public abstract class DataField
    {
        public DataField()
        {
            Name = null;
            Type = 0;
            Length = 0;
            IsPrimaryKey = IsIdentity = IsUsed = false;
            objValue = null;
        }

        public DataField(String name, SqlDbType type)
        {
            Name = name;
            Type = type;
            Length = 0;
            IsPrimaryKey = IsIdentity = false;
            IsUsed = true;
            objValue = null;
        }

        public DataField(String name, SqlDbType type, Int32 length)
        {
            Name = name;
            Type = type;
            Length = length;
            IsPrimaryKey = IsIdentity = false;
            IsUsed = true;
            objValue = null;
        }

        public DataField(String name, SqlDbType type,Boolean isPrimaryKey,Boolean isIdentity)
        {
            Name = name;
            Type = type;
            Length = 0;
            IsPrimaryKey = isPrimaryKey;
            IsIdentity = isIdentity;
            IsUsed = true;
            objValue = null;
        }

        public DataField(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
        {
            Name = name;
            Type = type;
            Length = length;
            IsPrimaryKey = isPrimaryKey;
            IsIdentity = isIdentity;
            IsUsed = isUsed;
            objValue = null;
        }

        public String Name
        {
            get;
            set;
        }

        public SqlDbType Type
        {
            get;
            set;
        }

        public Int32 Length
        {
            get;
            set;
        }

        public Boolean IsPrimaryKey
        {
            get;
            set;
        }

        public Boolean IsIdentity
        {
            get;
            set;
        }

        public Boolean Nullable
        {
            get;
            set;
        }

        public Boolean IsUsed
        {
            get;
            set;
        }

        public Object GetObjectValue()
        {
            return objValue;
        }

        public String GetSqlValue()
        {
            //preconditoin : none
            String param;

            if (objValue == null)
                return "\'NULL\'";
            else
            {
                switch (Type)
                {
                    case SqlDbType.Char:
                    case SqlDbType.VarChar:
                    case SqlDbType.Text:
                    case SqlDbType.Date:
                    case SqlDbType.DateTime:
                    case SqlDbType.DateTime2:
                    case SqlDbType.Binary:
                    case SqlDbType.VarBinary:
                        if (objValue.ToString().Length > Length)
                            objValue = objValue.ToString().Substring(0, Length);

                        param = QUOTE + objValue.ToString() + QUOTE;
                        break;
                    case SqlDbType.NChar:
                    case SqlDbType.NVarChar:
                    case SqlDbType.NText:
                        Int32 length = Convert.ToInt32(Length / 2);

                        if (objValue.ToString().Length > length)
                            objValue = objValue.ToString().Substring(0, length);

                        param = N.ToString() + QUOTE + objValue.ToString() + QUOTE.ToString();
                        break;
                    case SqlDbType.Bit:
                        if (Convert.ToBoolean(objValue))
                            param = "\'True\'";
                        else
                            param = "\'False\'";
                        break;
                    default:
                        param = objValue.ToString();
                        break;
                }
            }
            //return value : parameter in standard sql language variable form
            return param;
        }

        public static Boolean CheckValidity(DataField field)
        {
            //precondition : none
            if (field != null && field.Name != null && field.Name != "" && field.IsUsed)
                return true;
            else
                return false;

            //return value : if item not null and have name , true , else return false
        }

        protected Object objValue
        {
            get;
            set;
        }

        private const Char QUOTE = '\'';
        private const Char N = 'N';
    }

    public class DFBoolean : DataField
    {
        public DFBoolean(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFBoolean(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFBoolean(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFBoolean(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }


        public Boolean Value
        {
            get
            {
                return Convert.ToBoolean(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFInt16 : DataField
    {
        public DFInt16(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFInt16(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFInt16(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFInt16(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Int16 Value
        {
            get
            {
                return Convert.ToInt16(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFInt32 : DataField
    {
        public DFInt32(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFInt32(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFInt32(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFInt32(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Int32 Value
        {
            get
            {
                return Convert.ToInt32(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFInt64 : DataField
    {
        public DFInt64(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFInt64(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFInt64(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFInt64(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Int64 Value
        {
            get
            {
                return Convert.ToInt64(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFSingle : DataField
    {
        public DFSingle(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFSingle(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFSingle(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFSingle(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Single Value
        {
            get
            {
                return Convert.ToSingle(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFDouble : DataField
    {
        public DFDouble(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFDouble(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFDouble(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFDouble(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Double Value
        {
            get
            {
                return Convert.ToDouble(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFDecimal : DataField
    {
        public DFDecimal(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFDecimal(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFDecimal(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFDecimal(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Decimal Value
        {
            get
            {
                return Convert.ToDecimal(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFDateTime : DataField
    {
        public DFDateTime(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFDateTime(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFDateTime(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFDateTime(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public DateTime Value
        {
            get
            {
                return Convert.ToDateTime(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFString : DataField
    {
        public DFString(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFString(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFString(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFString(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public String Value
        {
            get
            {
                return Convert.ToString(objValue);
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFDataItem : DataField
    {
        public DFDataItem(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFDataItem(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFDataItem(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFDataItem(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public DataItem Value
        {
            get
            {
                return (DataItem)objValue;
            }

            set
            {
                objValue = Value;
            }
        }
    }

    public class DFObject : DataField
    {
        public DFObject(String name, SqlDbType type)
            : base(name, type)
        {
        }

        public DFObject(String name, SqlDbType type, Int32 length)
            : base(name, type, length)
        {
        }

        public DFObject(String name, SqlDbType type, Boolean isPrimaryKey, Boolean isIdentity)
            : base(name, type, isPrimaryKey, isIdentity)
        {
        }

        public DFObject(String name, SqlDbType type, Int32 length, Boolean isPrimaryKey, Boolean isIdentity, Boolean isUsed)
            : base(name, type, length, isPrimaryKey, isIdentity, isUsed)
        {
        }

        public Object Value
        {
            get
            {
                return objValue;
            }

            set
            {
                objValue = Value;
            }
        }
    }
}
