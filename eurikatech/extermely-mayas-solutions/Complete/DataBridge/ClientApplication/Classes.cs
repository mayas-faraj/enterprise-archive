using System;
using System.Data;

namespace ClientApplication
{
    public class Person : Maniyat.IDatabase
    {
        public Person()
        {
            Id = -1;
            Name = "no name";
            Age = 18;
            IsMarried = false;
            BirthDate = System.DateTime.Now;

            CreateCollections();
        }

        public Person(Maniyat.DataFieldCollection dataFields)
        {
            this.DataFields = dataFields;

            Id = -1;
            Name = "no name";
            Age = 18;
            IsMarried = false;
            BirthDate = System.DateTime.Now;
        }

        public Int32 Id
        {
            get;
            set;
        }

        public String Name
        {
            get;
            set;
        }

        public Single Age
        {
            get;
            set;
        }

        public Boolean IsMarried
        {
            get;
            set;
        }

        public DateTime BirthDate
        {
            get;
            set;
        }

        public Maniyat.IDatabase[] Images
        {
            get;
            set;
        }

        public virtual Maniyat.IDatabase[] CreateNObjects(Int32 count)
        {
            Maniyat.IDatabase[] objects = new Maniyat.IDatabase[count];

            CreateCollections();

            for (Int32 i = 0; i < count; i++)
                objects[i] = new Person(this.DataFields);

            return objects;
        }

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }

        public virtual void CreateCollections()
        {
            DataFields = new Maniyat.DataFieldCollection("tblPersons");
            DataFields.Add("Id", new Maniyat.DataField("pId", SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("Name", new Maniyat.DataField("pName", SqlDbType.NChar, 100, this.GetType().GetProperty("Name")));
            DataFields.Add("Age", new Maniyat.DataField("pAge", SqlDbType.TinyInt, this.GetType().GetProperty("Age")));
            DataFields.Add("IsMarried", new Maniyat.DataField("pMarried", SqlDbType.Bit, this.GetType().GetProperty("IsMarried")));
            DataFields.Add("BirthDate", new Maniyat.DataField("pBirth", SqlDbType.DateTime, this.GetType().GetProperty("BirthDate")));
        }
    }

    public class Image : Maniyat.IDatabase
    {
        public Image()
        {
            Location = new System.Drawing.Point();
            CreateCollections();
        }

        public Image(Maniyat.DataFieldCollection dataFields)
        {
            this.DataFields = dataFields;
            Location = new System.Drawing.Point(0, 0);
        }

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }

        public String Path
        {
            get;
            set;
        }

        public Int32 Width
        {
            get;
            set;
        }

        public Int32 Height
        {
            get;
            set;
        }

        public System.Drawing.Point Location
        {
            get
            {
                return new System.Drawing.Point(x, y);
            }
            set
            {
                x = value.X;
                y = value.Y;
            }
        }

        public Maniyat.IDatabase[] CreateNObjects(Int32 count)
        {
            Maniyat.IDatabase[] results = new Image[count];

            for (Int32 i = 0; i < results.Length; i++)
                results[i] = new Image(this.DataFields);

            return results;
        }

        public virtual void CreateCollections()
        {
            DataFields = new Maniyat.DataFieldCollection("tblImages");
            DataFields.Add("Path", new Maniyat.DataField("iPath", SqlDbType.NVarChar, 240, this.GetType().GetProperty("Path")));
            DataFields.Add("Width", new Maniyat.DataField("iWidth", SqlDbType.Float, GetType().GetProperty("Width")));
            DataFields.Add("Height", new Maniyat.DataField("iHeight", SqlDbType.Float, GetType().GetProperty("Height")));
            DataFields.Add("x", new Maniyat.DataField("iLeft", SqlDbType.Float, GetType().GetProperty("x")));
            DataFields.Add("y", new Maniyat.DataField("iTop", SqlDbType.Float, GetType().GetProperty("y")));
        }

        private Int32 x;
        private Int32 y;
    }

    public class Employ : Person
    {
        public Employ()
        {
            JobTitle = "not applied";
            Salary = 10000;

            CreateCollections();
        }

        public Employ(Maniyat.DataFieldCollection dataFields)
        {
            this.DataFields = dataFields;

            JobTitle = "not applied";
            Salary = 10000;
        }

        public String JobTitle
        {
            set;
            get;
        }

        public Double Salary
        {
            set;
            get;
        }

        public override string ToString()
        {
            return base.ToString();
        }

        public override Maniyat.IDatabase[] CreateNObjects(Int32 count)
        {
            Maniyat.IDatabase[] res = new Employ[count];

            CreateCollections();

            for (Int32 i = 0; i < count; i++)
                res[i] = new Employ();

            return res;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            DataFields.Add("Salary", new Maniyat.DataField("eSalary", SqlDbType.Real, this.GetType().GetProperty("Salary")));
            DataFields.Add("JobTitle", new Maniyat.DataField("eJob", SqlDbType.NVarChar, 200, this.GetType().GetProperty("JobTitle")));
        }
    } 
}
