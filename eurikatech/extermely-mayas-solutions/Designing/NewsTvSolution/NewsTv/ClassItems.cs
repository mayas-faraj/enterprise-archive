using System;

namespace NewsTv
{
    class Profile
    {
        //public construtures region
        public Profile()
        {
            Id = -1;
            Name = "(default)";
            Language = null;
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

        public String Path
        {
            get;
            set;
        }

        public Maniyat.Language Language
        {
            get;
            set;
        }

        //public functions region
        public static System.Windows.Media.Color FromInt64(Int64 color)
        {
            Byte a, r, g, b;
            Int64 tmp;

            tmp = color % 16777216U;
            b = Convert.ToByte((color - tmp) / 16777216);
            color = tmp;

            tmp = (tmp % 65536);
            g = Convert.ToByte((color - tmp) / 65536);
            color = tmp;

            tmp = (tmp % 256);
            r = Convert.ToByte((color - tmp) / 256);
            a = Convert.ToByte(tmp);

            return System.Windows.Media.Color.FromArgb(a, r, g, b);
        }

        public static Int64 ToInt64(System.Windows.Media.Color color)
        {
            return color.A + color.R * 256 + color.G * 65536 + color.B * 16777216U;
        }
    }

    class Site
    {
        //public construtures region
        public Site()
        {
            Id = -1;
            Name = "(no name)";
            Longitude = Latitude = 0;
            Zoom = 1;
            MotionVelocity = MotionAccelerate = 0;
            SweepStartAngle = SweepEndAngle = SweepVelocityAngle = SweepAttunationAngle = 0;
            Image = null;
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

        public Double Longitude
        {
            get;
            set;
        }

        public Double Latitude
        {
            get;
            set;
        }

        public Double Zoom
        {
            get;
            set;
        }

        public Int32 MotionVelocity
        {
            get;
            set;
        }

        public Int32 MotionAccelerate
        {
            get;
            set;
        }

        public Single SweepStartAngle
        {
            get;
            set;
        }

        public Single SweepEndAngle
        {
            get;
            set;
        }

        public Single SweepVelocityAngle
        {
            get;
            set;
        }

        public Single SweepAttunationAngle
        {
            get;
            set;
        }

        public String Image
        {
            get;
            set;
        }
    }

    class Circle
    {
        //public constructors region
        public Circle()
        {
            Id = -1;
            Color1 = Color2 = System.Windows.Media.Colors.Black;
            Thikness = 1;
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public System.Windows.Media.Color Color1
        {
            get;
            set;
        }

        public System.Windows.Media.Color Color2
        {
            get;
            set;
        }

        public Double Thikness
        {
            get;
            set;
        }
    }

    class Image
    {
        //public constructors region
        public Image()
        {
            Id = -1;    
            Thikness = 1;
            Width = Height = 30;
            Path = "";
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public String Path
        {
            get;
            set;
        }

        public Double Width
        {
            get;
            set;
        }

        public Double Height
        {
            get;
            set;
        }

        public Double Thikness
        {
            get;
            set;
        }
    }

    class Pointer
    {
         //public constructors region
        public Pointer()
        {
            Id = -1;
            Color1 = Color2 = System.Windows.Media.Colors.Black;
            HeadThikness = 1;
            BodyThikness = 1;
            HeadHeight = 1;
        }

        //public properties region
        public Int32 Id
        {
            get;
            set;
        }

        public System.Windows.Media.Color Color1
        {
            get;
            set;
        }

        public System.Windows.Media.Color Color2
        {
            get;
            set;
        }

        public Double BodyThikness
        {
            get;
            set;
        }

        public Double HeadThikness
        {
            get;
            set;
        }

        public Double HeadHeight
        {
            get;
            set;
        }
    }
}