using System;

namespace Products
{
    public class Folder : Maniyat.IDatabase, Maniyat.IInformation
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

            CreateCollections();
        }

        public Folder()
        {
            Id = -1;
            Name = Comment = Logo = null;
            ParentId = -1;
            Date = DateTime.Now;

            CreateCollections();
        }

        public Folder(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informationControls)
        {
            Id = -1;
            Name = Comment = Logo = null;
            ParentId = -1;
            Date = DateTime.Now;

            this.InformationControls = informationControls;
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

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }

        public Maniyat.InformationControlCollection InformationControls
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
            DataFields.Add("parentId", new Maniyat.DataField("parentId", System.Data.SqlDbType.Int, this.GetType().GetProperty("ParentId")));
            DataFields.Add("date", new Maniyat.DataField("addDate", System.Data.SqlDbType.DateTime, 0, "getDate()", this.GetType().GetProperty("Date")));

            //informaitonControl collection defintion
            InformationControls = new Maniyat.InformationControlCollection();

            InformationControls.Add("id", new Maniyat.InformationControl("Identity:", "get Id for selected object", Maniyat.ControlType.NumericText, this.GetType().GetProperty("Id")));
            InformationControls.Add("name", new Maniyat.InformationControl("Name:", "name of object", "", Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("Name")));
            InformationControls.Add("comment", new Maniyat.InformationControl("Comment:", "comment to the object", "", Maniyat.ControlType.Text, 0, 250, this.GetType().GetProperty("Comment")));
            InformationControls.Add("logo", new Maniyat.InformationControl("Logo:", "logo of object", null, Maniyat.ControlType.Image, 0, 150, this.GetType().GetProperty("Logo")));
            InformationControls.Add("parentId", new Maniyat.InformationControl("parent folder number:", "get Id for selected object", Maniyat.ControlType.NumericText, this.GetType().GetProperty("ParentId")));
            InformationControls.Add("date", new Maniyat.InformationControl("date:", "get Id for selected object", Maniyat.ControlType.DateTime, this.GetType().GetProperty("Date")));
        }

        public Maniyat.IDatabase[] CreateNObjects(Int32 count)
        {
            Maniyat.IDatabase[] result = new Maniyat.IDatabase[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new Folder(this.DataFields, this.InformationControls);

            return result;
        }
    }

    public abstract class Product : Maniyat.IDatabase, Maniyat.IInformation
    {
        //public construcutes region
        public Product()
        {
            Id = -1;
            Name = Comment = Logo = Detail = null;
            Date = DateTime.Now;
            ParentId = -1;
            CreateCollections();
        }

        public Product(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informationControls)
        {
            Id = -1;
            Name = Comment = Logo = Detail = null;
            Date = DateTime.Now;
            ParentId = -1;

            this.DataFields = dataFields;
            this.InformationControls = informationControls;
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

            //informaitonControl collection defintion
            InformationControls = new Maniyat.InformationControlCollection();

            InformationControls.Add("id", new Maniyat.InformationControl("Identity:", "get Id for selected object", Maniyat.ControlType.NumericText, this.GetType().GetProperty("Id")));
            InformationControls.Add("name", new Maniyat.InformationControl("Name:", "name of object", "", Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("Name")));
            InformationControls.Add("comment", new Maniyat.InformationControl("Comment:", "comment to the object", "", Maniyat.ControlType.Text, 0, 250, this.GetType().GetProperty("Comment")));
            InformationControls.Add("logo", new Maniyat.InformationControl("Logo:", "logo of object", null, Maniyat.ControlType.Image, 0, 150, this.GetType().GetProperty("Logo")));
            InformationControls.Add("parentId", new Maniyat.InformationControl("parent folder number:", "get Id for selected object", Maniyat.ControlType.NumericText, this.GetType().GetProperty("ParentId")));
            InformationControls.Add("date", new Maniyat.InformationControl("date:", "get Id for selected object", Maniyat.ControlType.DateTime, this.GetType().GetProperty("Date")));
            InformationControls.Add("detail", new Maniyat.InformationControl("detail:", "comment to the object", Maniyat.ControlType.Text, this.GetType().GetProperty("Detail")));
        }

        public abstract Maniyat.IDatabase[] CreateNObjects(Int32 count);

        public Maniyat.DataFieldCollection DataFields
        {
            get;
            set;
        }

        public Maniyat.InformationControlCollection InformationControls
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

        public Course(String level, String period, Single price)
        {
            Level = level;
            Period = period;
            Price = price;

            CreateCollections();
        }

        public Course(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informaitonControls)
        {
            Level = Period = null;
            Price = 0;

            this.DataFields = dataFields;
            this.InformationControls = informaitonControls;
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
                result[i] = new Course(this.DataFields, this.InformationControls);

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

            //informationControls editing
            this.InformationControls.Add("level", new Maniyat.InformationControl("Level:", "level of this course", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("Level")));
            this.InformationControls.Add("period", new Maniyat.InformationControl("Period:", "period of this course", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("Period")));
            this.InformationControls.Add("price", new Maniyat.InformationControl("Price:", "price of this course", "S.P.", Maniyat.ControlType.NumericText, 0, 0, this.GetType().GetProperty("Price")));
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

        public Book(String authorName, String isbn, Single price,Int32 pagesCount)
        {
            AuthorName = authorName;
            ISBN = isbn;
            Price = price;
            PagesCount = pagesCount;

            CreateCollections();
        }

        public Book(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informaitonControls)
        {
            AuthorName = ISBN = null;
            Price = 0;
            PagesCount = 0;

            this.DataFields = dataFields;
            this.InformationControls = informaitonControls;
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
                result[i] = new Book(this.DataFields, this.InformationControls);

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

            //informationControls editing
            this.InformationControls.Add("authorName", new Maniyat.InformationControl("Author Name:", "level of this course", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("AuthorName")));
            this.InformationControls.Add("isbn", new Maniyat.InformationControl("ISBN:", "period of this course", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("ISBN")));
            this.InformationControls.Add("price", new Maniyat.InformationControl("Price:", "price of this course", "S.P.", Maniyat.ControlType.NumericText, 0, 0, this.GetType().GetProperty("Price")));
            this.InformationControls.Add("pagesCount", new Maniyat.InformationControl("Pages Count:", "price of this course", "page", Maniyat.ControlType.NumericText, 0, 0, this.GetType().GetProperty("PagesCount")));
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

        public Post(String authorName, String isbn, Single price, Int32 pagesCount)
        {
            AuthorName = authorName;
            CreateCollections();
        }

        public Post(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informaitonControls)
        {
            AuthorName = null;
            this.DataFields = dataFields;
            this.InformationControls = informaitonControls;
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
                result[i] = new Post(this.DataFields, this.InformationControls);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Posts";

            this.DataFields.Add("authorName", new Maniyat.DataField("authorName", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("AuthorName")));

            //informationControls editing
            this.InformationControls.Add("authorName", new Maniyat.InformationControl("Author Name:", "level of this course", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("AuthorName")));
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

        public Sculpt(String authorName, String isbn, Single price, Int32 pagesCount)
        {
            Artist = authorName;
            CreateCollections();
        }

        public Sculpt(Maniyat.DataFieldCollection dataFields, Maniyat.InformationControlCollection informaitonControls)
        {
            Artist = null;
            this.DataFields = dataFields;
            this.InformationControls = informaitonControls;
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
                result[i] = new Post(this.DataFields, this.InformationControls);

            return result;
        }

        public override void CreateCollections()
        {
            base.CreateCollections();

            //dataFields editing
            this.DataFields.DataTableName = "Sculpts";

            this.DataFields.Add("artist", new Maniyat.DataField("artist", System.Data.SqlDbType.NVarChar, 150, this.GetType().GetProperty("Artist")));

            //informationControls editing
            this.InformationControls.Add("artist", new Maniyat.InformationControl("Artist Name:", "name of the artist that create this sculpt", null, Maniyat.ControlType.Text, 0, 75, this.GetType().GetProperty("Artist")));
        }
    }
}
