using System;

namespace Maniyat
{
    public class Folder : Maniyat.IDatabase
    {
        //public constructures region
        public Folder(Int32 folderId, String folderName, String folderComment, String logoPath, Int32 parentFolderId, DateTime addDate)
        {
            Id = folderId;
            Name = folderName;
            Comment = folderComment;
            Logo = logoPath;
            ParentId = parentFolderId;
            Date = addDate;
            IsHide = false;

            CreateCollections();
        }

        public Folder()
        {
            Id = -1;
            Name = Comment = Logo = null;
            ParentId = -1;
            Date = DateTime.Now;
            IsHide = false;

            CreateCollections();
        }

        public Folder(Int32 folderId)
        {
            Id = folderId;
            Name = Comment = Logo = null;
            ParentId = -1;
            Date = DateTime.Now;
            IsHide = false;

            CreateCollections();
        }

        public Folder(Maniyat.DataFieldCollection dataFields)
        {
            Id = -1;
            Name = Comment = Logo = null;
            ParentId = -1;
            Date = DateTime.Now;
            IsHide = false;

            this.DataFields = dataFields;
        }

        //public properties regoin
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

        public String Comment
        {
            get;
            set;
        }

        public String Logo
        {
            get;
            set;
        }

        public Int32 ParentId
        {
            get;
            set;
        }

        public DateTime Date
        {
            get;
            set;
        }

        public Boolean IsHide
        {
            get;
            set;
        }

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }

        //public functions region
        public override String ToString()
        {
            return '(' + Name + ')';
        }

        public void CreateCollections()
        {
            //datafields collection defintion
            DataFields = new Maniyat.DataFieldCollection("Folders");

            DataFields.Add("id", new Maniyat.DataField("id", System.Data.SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("name", new Maniyat.DataField("name", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("Name")));
            DataFields.Add("comment", new Maniyat.DataField("comment", System.Data.SqlDbType.NVarChar, 250, this.GetType().GetProperty("Comment")));
            DataFields.Add("logo", new Maniyat.DataField("logo", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Logo")));
            DataFields.Add("parentId", new Maniyat.DataField("parentId", System.Data.SqlDbType.Int, 0, false, false, true, this, this.DataFields["id"], this.GetType().GetProperty("ParentId")));
            DataFields.Add("date", new Maniyat.DataField("addDate", System.Data.SqlDbType.DateTime, 0, "getDate()", this.GetType().GetProperty("Date")));
            DataFields.Add("isHide", new Maniyat.DataField("isHide", System.Data.SqlDbType.Bit, 0, "0", this.GetType().GetProperty("IsHide")));
        }

        public Maniyat.IDatabase[] CreateNObjects(Int32 count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Folder(this.DataFields);

            return result;
        }
    }

    public abstract class Product : Maniyat.IDatabase
    {
        //public construcutes region
        public Product()
        {
            Id = -1;
            Name = Comment = Logo = Detail = null;
            Date = DateTime.Now;
            ParentId = -1;
            CreateCollections();
            IsHide = false;
        }

        public Product(Maniyat.DataFieldCollection dataFields)
        {
            Id = -1;
            Name = Comment = Logo = Detail = null;
            Date = DateTime.Now;
            ParentId = -1;
            IsHide = false;
            this.DataFields = dataFields;
        }

        public Product(Int32 id, String name, String comment, String logo, String detail, DateTime date, Int32 parentId)
        {
            Id = id;
            Name = name;
            Comment = comment;
            Logo = logo;
            Detail = detail;
            Date = date;
            ParentId = parentId;
            IsHide = false;
        }

        //public properties region
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

        public String Comment
        {
            get;
            set;
        }

        public String Logo
        {
            get;
            set;
        }

        public String Detail
        {
            get;
            set;
        }

        public DateTime Date
        {
            get;
            set;
        }

        public Int32 ParentId
        {
            get;
            set;
        }

        public Boolean IsHide
        {
            get;
            set;
        }

        //public fuctions region
        public virtual void CreateCollections()
        {
            //datafields collection defintion
            DataFields = new Maniyat.DataFieldCollection("");

            DataFields.Add("id", new Maniyat.DataField("id", System.Data.SqlDbType.Int, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("name", new Maniyat.DataField("name", System.Data.SqlDbType.NVarChar, 750, this.GetType().GetProperty("Name")));
            DataFields.Add("comment", new Maniyat.DataField("comment", System.Data.SqlDbType.NVarChar, 250, this.GetType().GetProperty("Comment")));
            DataFields.Add("logo", new Maniyat.DataField("logo", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Logo")));
            DataFields.Add("parentId", new Maniyat.DataField("parentId", System.Data.SqlDbType.Int, this.GetType().GetProperty("ParentId")));
            DataFields.Add("date", new Maniyat.DataField("addDate", System.Data.SqlDbType.DateTime, 0, "getDate()", this.GetType().GetProperty("Date")));
            DataFields.Add("detail", new Maniyat.DataField("detail", System.Data.SqlDbType.NText, this.GetType().GetProperty("Detail")));
            DataFields.Add("isHide", new Maniyat.DataField("isHide", System.Data.SqlDbType.Bit, 0, "0", this.GetType().GetProperty("IsHide")));
        }

        public abstract Maniyat.IDatabase[] CreateNObjects(Int32 count);

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }
    }

    public class Course : Product
    {
        //public construtures region
        public Course()
        {
            Level = Period = null;
            Price = 0;

            CreateCollections();
        }

        public Course(Int32 courceId)
        {
            Id = courceId;
            Level = Period = null;
            Price = 0;

            CreateCollections();
        }

        public Course(Int32 id, String name, String comment, String logo, String detail, DateTime date, Int32 parentId, String level, String period, Single price)
            : base(id, name, comment, logo, detail, date, parentId)
        {
            Level = level;
            Period = period;
            Price = price;

            CreateCollections();
        }

        public Course(Maniyat.DataFieldCollection dataFields)
        {
            Level = Period = null;
            Price = 0;

            this.DataFields = dataFields;
        }

        //public properties region
        public String Level
        {
            get;
            set;
        }

        public String Period
        {
            get;
            set;
        }

        public Single Price
        {
            get;
            set;
        }

        //public functions region
        public override Maniyat.IDatabase[] CreateNObjects(int count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Course(this.DataFields);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Courses";

            this.DataFields.Add("level", new Maniyat.DataField("level", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Level")));
            this.DataFields.Add("period", new Maniyat.DataField("period", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Period")));
            this.DataFields.Add("price", new Maniyat.DataField("price", System.Data.SqlDbType.Real, this.GetType().GetProperty("Price")));  
        }
    }

    public class Book : Product
    {
        //public construtures region
        public Book()
        {
            AuthorName = ISBN = null;
            Price = 0;
            PagesCount = 0;

            CreateCollections();
        }

        public Book(Int32 bookId)
        {
            Id = bookId;
            AuthorName = ISBN = null;
            Price = 0;
            PagesCount = 0;

            CreateCollections();
        }

        public Book(Int32 id, String name, String comment, String logo, String detail, DateTime date, Int32 parentId, String authorName, String isbn, Single price, Int32 pagesCount)
            : base(id, name, comment, logo, detail, date, parentId)
        {
            AuthorName = authorName;
            ISBN = isbn;
            Price = price;
            PagesCount = pagesCount;

            CreateCollections();
        }

        public Book(Maniyat.DataFieldCollection dataFields)
        {
            AuthorName = ISBN = null;
            Price = 0;
            PagesCount = 0;

            this.DataFields = dataFields;
        }

        //public properties region
        public String AuthorName
        {
            get;
            set;
        }

        public String ISBN
        {
            get;
            set;
        }

        public Single Price
        {
            get;
            set;
        }

        public Int32 PagesCount
        {
            get;
            set;
        }

        //public functions region
        public override Maniyat.IDatabase[] CreateNObjects(int count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Book(this.DataFields);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Books";

            this.DataFields.Add("authorName", new Maniyat.DataField("authorName", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("AuthorName")));
            this.DataFields.Add("isbn", new Maniyat.DataField("ISBN", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("ISBN")));
            this.DataFields.Add("price", new Maniyat.DataField("price", System.Data.SqlDbType.Real, this.GetType().GetProperty("Price")));
            this.DataFields.Add("pagesCount", new Maniyat.DataField("pagesCount", System.Data.SqlDbType.Int, this.GetType().GetProperty("PagesCount")));
        }
    }

    public class Post : Product
    {
        //public construtures region
        public Post()
        {
            AuthorName = null;
            CreateCollections();
        }

        public Post(Int32 id, String name, String comment, String logo, String detail, DateTime date, Int32 parentId, String authorName, String isbn, Single price, Int32 pagesCount)
            : base(id, name, comment, logo, detail, date, parentId)
        {
            AuthorName = authorName;
            CreateCollections();
        }

        public Post(Maniyat.DataFieldCollection dataFields)
        {
            AuthorName = null;
            this.DataFields = dataFields;
        }

        //public properties region
        public String AuthorName
        {
            get;
            set;
        }

        //public functions region
        public override Maniyat.IDatabase[] CreateNObjects(int count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Post(this.DataFields);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Posts";

            this.DataFields.Add("authorName", new Maniyat.DataField("authorName", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("AuthorName")));
        }
    }

    public class Sculpt : Product
    {
        //public construtures region
        public Sculpt()
        {
            Artist = null;
            CreateCollections();
        }

        public Sculpt(Int32 sculptId)
        {
            Id = sculptId;
            Artist = null;
            CreateCollections();
        }

        public Sculpt(Int32 id, String name, String comment, String logo, String detail, DateTime date, Int32 parentId, String artistName)
            : base(id, name, comment, logo, detail, date, parentId)
        {
            Artist = artistName;
            CreateCollections();
        }

        public Sculpt(Maniyat.DataFieldCollection dataFields)
        {
            Artist = null;
            this.DataFields = dataFields;
        }

        //public properties region
        public String Artist
        {
            get;
            set;
        }

        //public functions region
        public override Maniyat.IDatabase[] CreateNObjects(int count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Sculpt(this.DataFields);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Sculpts";

            this.DataFields.Add("artist", new Maniyat.DataField("artist", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Artist")));
        }
    }
}
