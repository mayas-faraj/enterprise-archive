using System;
using System.Text;

namespace Maniyat
{
    public class DataCondition
    {
        private DataField field;
        private SqlOperator sqlOperator;
        private Object value;

        public DataCondition()
        {
            field = null;
            value = null;
        }

        public DataCondition(DataField conditionField, SqlOperator conditionOperator, Object conditionValue)
        {
            field = conditionField;
            sqlOperator = conditionOperator;
            value = conditionValue;
        }

        public DataField Field
        {
            get
            {
                return field;
            }
            set
            {
                field = value;
            }
        }

        public SqlOperator Operator
        {
            get
            {
                return sqlOperator;
            }
            set
            {
                sqlOperator = value;
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

        public String GetSqlCondition()
        {
            //precondition : none
            StringBuilder cond = new StringBuilder();

            if (CheckSystem.CheckValidity(field, true))
            //DataField is valid
            {
                //concate condition
                cond.Append(field.Name);
                cond.Append(SPACE);

                switch (sqlOperator)
                {
                    case SqlOperator.CreatorThan:
                        cond.Append('>');
                        break;
                    case SqlOperator.CreatorThanOrEqual:
                        cond.Append(">=");
                        break;
                    case SqlOperator.Equal:
                        cond.Append('=');
                        break;
                    case SqlOperator.LessThan:
                        cond.Append('<');
                        break;
                    case SqlOperator.LessThanOrEqual:
                        cond.Append("<=");
                        break;
                    case SqlOperator.Like:
                        cond.Append(" like ");
                        break;
                    case SqlOperator.NotEqual:
                        cond.Append("<>");
                        break;
                    default:
                        cond.Append(SPACE);
                        break;
                }

                cond.Append(SPACE);
                cond.Append(DataField.GetSqlValue(field, value));

                return cond.ToString();
            }

            return null;
            //return value : if have name ,return sql condition statement , else return null
        }

        private const Char SPACE = ' ';
    }

    public enum SqlOperator
    {
        Equal,
        NotEqual,
        CreatorThan,
        CreatorThanOrEqual,
        LessThan,
        LessThanOrEqual,
        Like
    }
}
