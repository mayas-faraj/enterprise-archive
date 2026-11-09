using System;

namespace Maniyat
{
    public class InformationControlCollection : System.Collections.Specialized.NameObjectCollectionBase
    {
        public void Add(String key, InformationControl control)
        {
            this.BaseAdd(key, control);
        }

        public void Remove(String key)
        {
            this.BaseRemove(key);
        }

        public void RemoveAt(Int32 index)
        {
            this.BaseRemoveAt(index);
        }

        public void Clear()
        {
            this.BaseClear();
        }

        public InformationControl this[Int32 index]
        {
            get
            {
                return (InformationControl)this.BaseGet(index);
            }
            set
            {
                this.BaseSet(index, value);
            }
        }

        public InformationControl this[String key]
        {
            get
            {
                return (InformationControl)this.BaseGet(key);
            }
            set
            {
                this.BaseSet(key, value);
            }
        }

        public static Boolean CheckValidity(IInformation item)
        {
            //precondition : none
            if (item != null && item.InformationControls != null)
                for (Int32 i = 0; i < item.InformationControls.Count; i++)
                    if (InformationControl.CheckValidity(item.InformationControls[i]))
                        return true;

            return false;
            //return value : if item not empty and have at leart one valid informationControl ,return true , else return false
        }
    }
}
