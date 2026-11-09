using System;

namespace Maniyat
{
    public static class CheckSystem
    {
        public static Boolean CheckValidity(IInformation item)
        {
            //precondition : none
            if (item != null && item.InformationControls != null)
                for (Int32 i = 0; i < item.InformationControls.Count; i++)
                    if (CheckSystem.CheckValidity(item.InformationControls[i]))
                        return true;

            return false;
            //return value : if item not empty and have at leart one valid informationControl ,return true , else return false
        }

        public static Boolean CheckValidity(InformationControl control)
        {
            //precondition : none
            if (control.Name != null && control.Name != "" && control.IsUsed)
                return true;
            else
                return false;
            //return value : true if control have name and type , else return false
        }

        public static Boolean CheckValidity(ControlRelation controlRelation)
        {
            //precondition : none
            if (controlRelation != null && CheckSystem.CheckValidity(controlRelation.Control))
                return true;
            else
                return false;
            //return value : true if controlRelation not null and have valid Control
        }

        public const String ERROR_CHECK_SYSTEM = "نظام التحقق - خطأ رقم ";
    }
}
