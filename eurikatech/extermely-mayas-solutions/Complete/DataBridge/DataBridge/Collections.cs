using System;

namespace Maniyat
{
    public class DataFieldCollection : System.Collections.Specialized.NameObjectCollectionBase
    {
        public DataFieldCollection(String tableName)
        {
            DataTableName = tableName;
        }

        public void Add(String key, DataField field)
        {
            this.BaseAdd(key, field);
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

        public DataField this[Int32 index]
        {
            get
            {
                return (DataField)this.BaseGet(index);
            }
            set
            {
                this.BaseSet(index, value);
            }
        }

        public DataField this[String key]
        {
            get
            {
                return (DataField)this.BaseGet(key);
            }
            set
            {
                this.BaseSet(key, value);
            }
        }

        public String DataTableName
        {
            get;
            set;
        } 
    }

    /*
    internal class DataItem
    {
        public DataItem(Object item, DataField fieldObject, String fieldName)
        {
            this.item = item;
            this.fieldObject = fieldObject;
            this.fieldName = fieldName;
        }

        public Object Item
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

        public String FieldName
        {
            get
            {
                return fieldName;
            }
            set
            {
                fieldName = value;
            }
        }

        public DataField FieldObject
        {
            get
            {
                return fieldObject;
            }
            set
            {
                fieldObject = value;
            }
        }

        private Object item;
        private String fieldName;
        private DataField fieldObject;
    }
    
    public class SingleItemCollection : System.Collections.Specialized.NameObjectCollectionBase
    {
        public void Add(String key, IDatabase item, String masterField, DataField slaveUniqueField)
        {
            this.BaseAdd(key, new DataItem(item, slaveUniqueField, masterField));
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

        public IDatabase GetItem(Int32 index)
        {
            return (IDatabase)((DataItem)BaseGet(index)).Item;
        }

        public String GetMasterField(Int32 index)
        {
            return (String)((DataItem)BaseGet(index)).Item;
        }

        public DataField GetSlaveUniqueField(Int32 index)
        {
            return (DataField)((DataItem)BaseGet(index)).Item;
        }

        public IDatabase GetItem(String key)
        {
            return (IDatabase)((DataItem)BaseGet(key)).Item;
        }

        public String GetMasterField(String key)
        {
            return (String)((DataItem)BaseGet(key)).Item;
        }

        public DataField GetSlaveUniqueField(String key)
        {
            return (DataField)((DataItem)BaseGet(key)).Item;
        }

        public static Boolean CheckSingleItemValidity(IDatabase item)
        {
            //precondition : none
            if (item != null)
                for (Int32 i = 0; i < item.SingleItems.Count; i++)
                    if (DataFieldCollection.CheckFieldsValidity(item.SingleItems.GetItem(i)) && item.SingleItems.GetMasterField(i) != null && item.SingleItems.GetMasterField(i) != "" && DataField.CheckValidity(item.SingleItems.GetSlaveUniqueField(i)))
                        return true;
            return false;
            //return value : true if item is not null and have table name and at least one valid memeber , else , false
        }
    }

    public class ArrayItemsCollection : System.Collections.Specialized.NameObjectCollectionBase
    {
        public void Add(String key, IDatabase[] items, DataField masterUniqueField, String slaveField)
        {
            this.BaseAdd(key, new DataItem(items, masterUniqueField, slaveField));
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

        public IDatabase[] GetItems(Int32 index)
        {
            return (IDatabase[])((DataItem)BaseGet(index)).Item;
        }

        public String GetSlaveField(Int32 index)
        {
            return (String)((DataItem)BaseGet(index)).Item;
        }

        public DataField GetMasterUniqueField(Int32 index)
        {
            return (DataField)((DataItem)BaseGet(index)).Item;
        }

        public IDatabase[] GetItems(String key)
        {
            return (IDatabase[])((DataItem)BaseGet(key)).Item;
        }

        public String GetSlaveField(String key)
        {
            return (String)((DataItem)BaseGet(key)).Item;
        }

        public DataField GetMasterUniqueField(String key)
        {
            return (DataField)((DataItem)BaseGet(key)).Item;
        }

        public static Boolean CheckSingleItemValidity(IDatabase item)
        {
            //precondition : none
            if (item != null)
                for (Int32 i = 0; i < item.ArrayItems.Count; i++)
                    if(item.ArrayItems.GetItems(i)!=null && item.ArrayItems.GetSlaveField(i) != null && item.ArrayItems.GetSlaveField(i) != "" && DataField.CheckValidity(item.ArrayItems.GetMasterUniqueField(i)))
                        return true;
            return false;
            //return value : true if item is not null and have table name and at least one valid memeber , else , false
        }
    }
     */
}
