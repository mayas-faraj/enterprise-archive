using System;
using System.Text;

namespace Maniyat
{
    class DataCondition
    {
        public DataField DataField
        {
            get;
            set;
        }

        public String Operator
        {
            get;
            set;
        }

        public Object Value
        {
            get;
            set;
        }

        public String GetSqlCondition()
        {
            //precondition : none

            StringBuilder cond = new StringBuilder();


            if (DataField.CheckValidity(DataField))
            //DataField is valid
            {
                //concate condition
                cond.Append(DataField.Name);
                cond.Append(SPACE);
                cond.Append(Operator);
                cond.Append(SPACE);
                cond.Append(DataField.GetSqlValue());

                return cond.ToString();
            }

            return null;
            //return value : if have name ,return sql condition statement , else return null
        }

        public static Boolean CheckValidity(DataCondition condition)
        {
            //preconditon : none
            if (condition != null && DataField.CheckValidity(condition.DataField))
                return true;
            else
                return false;
            //return value : if condition not null and datafield is valid return true , else return false
        }

        private const Char SPACE = ' ';
    }
}
