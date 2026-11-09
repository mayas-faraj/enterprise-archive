using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maniyat
{
    public class NotProg
    {
        private Int32 id;
        private String name;
        private String tone;

        public NotProg(Int32 npId, String npName, String npTone)
        {
            id = npId;
            name = npName;
            tone = npTone;
        }

        public NotProg()
        {
            id = -1;
            name = tone = null;
        }

        public Int32 Id
        {
            get
            {
                return id;
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
            veriCode = Maniyat.Database.GetImageTone(image);
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