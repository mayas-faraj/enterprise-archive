using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace NewsTv.Codes
{
    internal class Record
    {
        //public properties region
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

        public Double Duration
        {
            get
            {
                return duration;
            }
            set
            {
                duration = value;
            }
        }

        public Double Percent
        {
            get
            {
                return percent;
            }
            set
            {
                percent = value;
            }
        }

        //private fields region
        private Int32 id;
        private Double duration;
        private Double percent;
    }

    internal class MapOrder : Record
    {
        //public properties region
        public OrderButton Order
        {
            get
            {
                return order;
            }
            set
            {
                order = value;
            }
        }

        //private fields region
        private OrderButton order;
    }

    internal class MapArrow : Record
    {
        //public properties region
        public ArrowButton Arrow
        {
            get
            {
                return arrow;
            }
            set
            {
                arrow = value;
            }
        }

        public Double Longitude1
        {
            get
            {
                return longitude1;
            }
            set
            {
                longitude1 = value;
            }
        }

        public Double Latitude1
        {
            get
            {
                return latitude1;
            }
            set
            {
                latitude1 = value;
            }
        }

        public Double Longitude2
        {
            get
            {
                return longitude2;
            }
            set
            {
                longitude2 = value;
            }
        }

        public Double Latitude2
        {
            get
            {
                return latitude2;
            }
            set
            {
                latitude2 = value;
            }
        }

        //private fields region
        private ArrowButton arrow;
        private Double longitude1;
        private Double latitude1;
        private Double longitude2;
        private Double latitude2;
    }

    internal class MapCircle : Record
    {
        //public properties region
        public CircleButton Circle
        {
            get
            {
                return circle;
            }
            set
            {
                circle = value;
            }
        }

        public Double Longitude
        {
            get
            {
                return longitude;
            }
            set
            {
                longitude = value;
            }
        }

        public Double Latitude
        {
            get
            {
                return latitude;
            }
            set
            {
                latitude = value;
            }
        }

        public Double Width
        {
            get
            {
                return width;
            }
            set
            {
                width = value;
            }
        }

        public Double Height
        {
            get
            {
                return height;
            }
            set
            {
                height = value;
            }
        }

        //private fields region
        private CircleButton circle;
        private Double longitude;
        private Double latitude;
        private Double width;
        private Double height;
    }

    internal class MapImage : Record
    {
        //public properties region
        public ImageButton Image
        {
            get
            {
                return image;
            }
            set
            {
                image = value;
            }
        }

        public Double Longitude
        {
            get
            {
                return longitude;
            }
            set
            {
                longitude = value;
            }
        }

        public Double Latitude
        {
            get
            {
                return latitude;
            }
            set
            {
                latitude = value;
            }
        }

        public Double Heading
        {
            get
            {
                return heading;
            }
            set
            {
                heading = value;
            }
        }

        //public funtions region
        public Image ToImage()
        {
            if (image == null)
                return null;
            else
            {
                System.Windows.Controls.Image result = new System.Windows.Controls.Image();

                result.Width = image.Width;
                result.Height = image.Height;
                result.Source = Library.LoadImage(image.Image);
                result.Stretch = image.Stretch;

                return result;
            }
        }

        //private fields region   
        private ImageButton image;
        private Double longitude;
        private Double latitude;
        private Double heading;
    }

    internal class MapVedioMedia : Record
    {
        //public properties region
        public VedioMediaButton VedioMedia
        {
            get
            {
                return vedioMedia;
            }
            set
            {
                vedioMedia = value;
            }
        }

        //private fields region
        private VedioMediaButton vedioMedia;
    }

    internal class MapImageMedia : Record
    {
        //public properties region
        public ImageMediaButton ImageMedia
        {
            get
            {
                return imageMedia;
            }
            set
            {
                imageMedia = value;
            }
        }

        //private fields region
        private ImageMediaButton imageMedia;
    }

    internal class MapCItyButton : Record
    {
        //public properties region
        public CityButton ImageMedia
        {
            get
            {
                return city;
            }
            set
            {
                city = value;
            }
        }

        //private fields region
        private CityButton city;
    }
}
