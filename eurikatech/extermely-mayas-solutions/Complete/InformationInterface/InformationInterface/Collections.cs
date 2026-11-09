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
    }

    public class IInformationCollection : System.Collections.CollectionBase
    {
        public IInformationCollection(MultiInformations parent)
        {
            this.parent = parent;
        }

        public void Add(IInformation item)
        {
            if (parent != null)
                parent.DrawSetItem(item);

            this.List.Add(item);
        }

        public void AddRange(IInformation[] items)
        {
            for (Int32 i = 0; i < this.Count; i++)
                Add(items[i]);
        }

        public void Remove(IInformation item)
        {
            if (parent != null)
                parent.DrawRemoveItem(item);

            this.List.Remove(item);
        }

        public new void RemoveAt(Int32 index)
        {
            if (parent != null)
                parent.DrawRemoveItem(this[index]);

            this.List.RemoveAt(index);
        }

        public new void Clear()
        {
            Int32 count = this.Count;
            for (Int32 i = count - 1; i >= 0; i--)
                RemoveAt(i);
                
        }

        public IInformation this[Int32 index]
        {
            get
            {
                return (IInformation)this.List[index];
            }
            set
            {
                this.List[index] = value;
            }
        }

        private MultiInformations parent;
    }
}
