using System;
using System.Data;

namespace Maniyat
{
    public static class CheckSystem
    {
        public static Boolean CheckValidity(IDatabase item)
        {
            //precondition : none
            if (item != null && item.DataFields.DataTableName != null && item.DataFields.DataTableName != "")
                for (Int32 i = 0; i < item.DataFields.Count; i++)
                    if (CheckSystem.CheckValidity(item.DataFields[i], false))
                        return true;
            return false;
            //return value : true if item is not null and have table name and at least one datafield memeber , else , false
        }

        public static Boolean CheckValidity(DataField field, Boolean checkForCondition)
        {
            //precondition : none
            if (field != null && field.Name != null && field.Name != "")
            {
                if (checkForCondition)
                {
                    //return value : if item not null and have name , true , else return false
                    if (field.Type != SqlDbType.Text && field.Type != SqlDbType.NText)
                        return true;
                }
                else
                {
                    //return value : if item not null and have name , true , else return false
                    if (field.IsUsed)
                        return true;
                }
            }

            return false;
        }

        public static Boolean CheckValidity(DataCondition condition)
        {
            //preconditon : none
            if (condition != null && CheckSystem.CheckValidity(condition.Field, true))
                return true;
            else
                return false;
            //return value : if condition not null and datafield is valid return true , else return false
        }

        public static Boolean CheckValidity(DataCondition[] conditions)
        {
            //precondition : none
            if (conditions != null)
                for (Int32 i = 0; i < conditions.Length; i++)
                    if (CheckValidity(conditions[i]))
                        return true;

            return false;
            //return value : if conditions not null and have at least one valid condition then return true , else return false
        }

        public const String ERROR_CHECK_SYSTEM = "نظام التحقق - خطأ رقم ";
    }
}
