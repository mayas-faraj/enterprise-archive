using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maniyat
{
    public class NotProg : IDatabase
    {
        public NotProg(Int32 npId, String npName, String npTone)
        {
            id = npId;
            name = npName;
            tone = npTone;
            CreateCollections();
        }

        public NotProg()
        {
            id = -1;
            name = tone = null;
            CreateCollections();
        }

        public NotProg(DataFieldCollection dataFields)
        {
            id = -1;
            name = tone = null;
            this.DataFields = dataFields;
        }

        public Int32 Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public String Tone
        {
            get
            {
                return tone;
            }
            set
            {
                tone = value;
            }
        }

        private Int32 id;
        private String name;
        private String tone;

        public IDatabase[] CreateNObjects(Int32 count)
        {
            IDatabase[] result = new NotProg[count];

            for (Int32 i = 0; i < count; i++)
                result[i] = new NotProg(this.DataFields);

            return result;
        }

        public void CreateCollections()
        {
            DataFields = new DataFieldCollection("NoProgsBox");

            DataFields.Add("id", new DataField("id", System.Data.SqlDbType.Int, 0, true, true, true, this.GetType().GetProperty("Id")));
            DataFields.Add("name", new DataField("name", System.Data.SqlDbType.NVarChar, 75, this.GetType().GetProperty("Name")));
            DataFields.Add("tone", new DataField("tone", System.Data.SqlDbType.NVarChar,75, this.GetType().GetProperty("Tone")));
        }

        public DataFieldCollection DataFields
        {
            get;
            set;
        }
    }

    public class Security
    {
        private static String veriCode;
        private static NotProg notProg;

        public Security()
        {
            veriCode = null;
            notProg = null;
        }

        public static void LoadImageCode(out String imageName)
        {
            Random rnd = new Random();
            Int32 num = (rnd.Next(24) + 1);
            String image = "c" + num.ToString();

            imageName = image + ".jpg";
            veriCode = Maniyat.LocalDatabase.GetImageTone(image);
        }

        public static String VeriCode
        {
            get
            {
                return veriCode;
            }
            set
            {
                veriCode = value;
            }
        }

        public static NotProg NotProg
        {
            get
            {
                return notProg;
            }
            set
            {
                notProg = value;
            }
        }
    }
}