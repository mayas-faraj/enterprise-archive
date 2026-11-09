using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace NewsTv.Codes
{
    public abstract class MapButton
    {
        //public constructure region
        public MapButton()
        {
            buttonLabel = true;
        }

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

        public Int32 Index
        {
            get
            {
                return index;
            }
            set
            {
                index = value;
            }
        }

        public Boolean ButtonLabel
        {
            get
            {
                return buttonLabel;
            }
            set
            {
                buttonLabel = value;
            }
        }

        //public functions region

        /// <summary>
        /// encapsulate the button in stackpanel, contain name, and image if it exsists
        /// </summary>
        /// <returns>stack panel wpf control</returns>
        public abstract Grid ToGrid(ResourceDictionary resources);

        public Grid ToGrid(ResourceDictionary resources, String logoPath)
        {
            //precondition: name or image is not empty
            Grid grid = new Grid();    

            //image property
            Image imageControl = new Image();

            imageControl.Source = Library.LoadButtonImage(logoPath);
            imageControl.Stretch = Stretch.Uniform;

            if (imageControl.Source != null)
            {
                if (resources != null)
                    imageControl.Margin = (Thickness)resources["margin"];

                RowDefinition imageRow = new RowDefinition();
                imageRow.Height = new GridLength(1, GridUnitType.Star);
                grid.RowDefinitions.Add(imageRow);
                Grid.SetRow(imageControl, 0);

                grid.Children.Add(imageControl);
            }

            //text property, only if it should display
            if (this.ButtonLabel)
            {
                TextBlock textBlock = new TextBlock();
                textBlock.Text = this.Name;
                textBlock.HorizontalAlignment = HorizontalAlignment.Center;

                if (resources != null)
                {
                    textBlock.FontSize = (Double)resources["textsSize"];
                    textBlock.Foreground = (Brush)resources["texts"];
                    textBlock.Margin = (Thickness)resources["margin"];
                }

                RowDefinition textRow = new RowDefinition();
                textRow.Height = new GridLength(1, GridUnitType.Auto);
                grid.RowDefinitions.Add(textRow);
                Grid.SetRow(textBlock, grid.RowDefinitions.Count - 1);

                grid.Children.Add(textBlock);
            }

            //return value
            return grid;
        }

        public Grid ToGrid(ResourceDictionary resources, FrameworkElement fwElement)
        {
            //precondition: name or image is not empty
            Grid grid = new Grid();

            if (fwElement != null)
            {
                fwElement.HorizontalAlignment = HorizontalAlignment.Center;

                if (resources != null)
                    fwElement.Margin = (Thickness)resources["margin"];

                RowDefinition imageRow = new RowDefinition();
                imageRow.Height = new GridLength(1, GridUnitType.Star);
                grid.RowDefinitions.Add(imageRow);
                Grid.SetRow(fwElement, 0);

                grid.Children.Add(fwElement);
            }

            //text property, only if it should display
            if (this.ButtonLabel)
            {
                TextBlock textBlock = new TextBlock();
                textBlock.Text = this.Name;
                textBlock.HorizontalAlignment = HorizontalAlignment.Center;

                if (resources != null)
                {
                    textBlock.FontSize = (Double)resources["textsSize"];
                    textBlock.Foreground = (Brush)resources["texts"];
                    textBlock.Margin = (Thickness)resources["margin"];
                }

                RowDefinition textRow = new RowDefinition();
                textRow.Height = new GridLength(1, GridUnitType.Auto);
                grid.RowDefinitions.Add(textRow);
                Grid.SetRow(textBlock, grid.RowDefinitions.Count - 1);

                grid.Children.Add(textBlock);
            }

            //return value
            return grid;
        }

        //private fields region
        private Int32 id;
        private String name;
        private Int32 index;
        private Boolean buttonLabel;
    }

    public class CityButton : MapButton
    {
        //public constructions region
        public CityButton(String name)
        {
            this.Name = name;
            zoom = Settings.MinimumMapZoom;
            cities = new CityButtonCollection(this);
        }

        public CityButton(String name, Double latitude, Double longitude, Double zoom)
            : this(name)
        {
            this.latitude = latitude;
            this.longitude = longitude;
            this.zoom = zoom;
        }

        public CityButton(String name, Double latitude, Double longitude, Double zoom, Double heading)
            : this(name, latitude, longitude, zoom)
        {
            this.heading = heading;
        }

        public CityButton(String name, String imagePath, Double latitude, Double longitude, Double zoom, Double heading)
            : this(name, latitude, longitude, zoom, heading)
        {
            this.image = imagePath;
        }

        //public properties region
        public String Image
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

        public Double Zoom
        {
            get
            {
                return zoom;
            }
            set
            {
                zoom = value;
            }
        }

        public CityButtonCollection Cities
        {
            get
            {
                return cities;
            }
            set
            {
                cities = value;
            }
        }

        public Boolean IsHide
        {
            get
            {
                return isHide;
            }
            set
            {
                isHide = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            return this.ToGrid(resources, image);
        }

        //private fields region
        private String image;
        private Double latitude;
        private Double longitude;
        private Double heading;
        private Double zoom;
        private CityButtonCollection cities;
        private Boolean isHide;
    }

    public class OrderButton : MapButton
    {
        //public constructures region
        public OrderButton(String name)
        {
            this.Name = name;
            order = ButtonOrder.none;
        }

        public OrderButton(String name, ButtonOrder order)
            : this(name)
        {
            this.order = order;
        }

        public OrderButton(String name, ButtonOrder order, String image)
            : this(name, order)
        {
            this.image = image;
        }

        //public properties region
        public String Image
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

        public ButtonOrder Order
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

        public Double Parameter
        {
            get
            {
                return parameter;
            }
            set
            {
                parameter = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            return this.ToGrid(resources, image);
        }

        //private fields region
        private String image;
        private ButtonOrder order;
        private Double parameter;
    }

    public class ArrowButton : MapButton
    {
        //public constructures region
        public ArrowButton(String name)
        {
            this.Name = name;
            headWidth = 10;
            headHeight = 20;
            lineWidth = 10;
        }

        public ArrowButton(String name, GradientBrush stroke, Double strokeThickness, GradientBrush fill)
            : this(name)
        {
            this.stroke = stroke;
            this.strokeThickness = strokeThickness;
            this.fill = fill;
        }

        public ArrowButton(String name, GradientBrush stroke, Double strokeThickness, GradientBrush fill, Double lineWidth, Double headWidth, Double headHeight)
            : this(name, stroke, strokeThickness, fill)
        {
            this.lineWidth = lineWidth;
            this.headWidth = headWidth;
            this.headHeight = headHeight;
        }

        //public properties region
        public GradientBrush Stroke
        {
            get
            {
                return stroke;
            }
            set
            {
                stroke = value;
            }
        }

        public Double StrokeThickness
        {
            get
            {
                return strokeThickness;
            }
            set
            {
                strokeThickness = value;
            }
        }

        public GradientBrush Fill
        {
            get
            {
                return fill;
            }
            set
            {
                fill = value;
            }
        }

        public Double LineWidth
        {
            get
            {
                return lineWidth;
            }
            set
            {
                lineWidth = value;
            }
        }

        public Double HeadWidth
        {
            get
            {
                return headWidth;
            }
            set
            {
                headWidth = value;
            }
        }

        public Double HeadHeight
        {
            get
            {
                return headHeight;
            }
            set
            {
                headHeight = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            System.Windows.Shapes.Pointer pointer = new System.Windows.Shapes.Pointer();

            pointer.LineWidth = lineWidth;
            pointer.HeadWidth = headWidth;
            pointer.HeadHeight = headHeight;
            pointer.Fill = fill;
            pointer.Stroke = stroke;
            pointer.StrokeThickness = strokeThickness;

            pointer.X1 = pointer.Y1 = headHeight * 3;
            pointer.X2 = pointer.Y2 = 10;

            Viewbox viewbox = new Viewbox();
            viewbox.Child = pointer;

            return this.ToGrid(resources, viewbox);
        }

        //private fields region
        private GradientBrush stroke;
        private Double strokeThickness;
        private GradientBrush fill;
        private Double lineWidth;
        private Double headWidth;
        private Double headHeight;
    }

    public class CircleButton : MapButton
    {
        //public constructures region
        public CircleButton(String name)
        {
            this.Name = name;
        }

        public CircleButton(String name, GradientBrush stroke, Double strokeThickness)
            : this(name)
        {
            this.stroke = stroke;
            this.strokeThickness = strokeThickness;
        }

        //public properties region
        public GradientBrush Stroke
        {
            get
            {
                return stroke;
            }
            set
            {
                stroke = value;
            }
        }

        public Double StrokeThickness
        {
            get
            {
                return strokeThickness;
            }
            set
            {
                strokeThickness = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            System.Windows.Shapes.Ellipse ellipse = new System.Windows.Shapes.Ellipse();
            
            ellipse.Stroke = stroke;
            ellipse.StrokeThickness = strokeThickness;
            ellipse.Width = ellipse.Height = 100;

            Viewbox viewBox = new Viewbox();
            viewBox.Child = ellipse;

            return this.ToGrid(resources, viewBox);
        }

        //private fields region
        private GradientBrush stroke;
        private Double strokeThickness;
    }

    public class ImageButton : MapButton
    {
        //public constructures region
        public ImageButton(String name)
        {
            this.Name = name;
        }

        public ImageButton(String name, String imagePath)
            :this(name)
        {
            this.image = imagePath;
        }

        public ImageButton(String name, String imagePath, Double width, Double height)
            : this(name, imagePath)
        {
            this.width = width;
            this.height = height;
        }

        public ImageButton(String name, String imagePath, Double width, Double height, Stretch stretch)
            : this(name, imagePath, width, height)
        {
            this.stretch = stretch;
        }

        //public properties region
        public String Image
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

        public Stretch Stretch
        {
            get
            {
                return stretch;
            }
            set
            {
                stretch = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            return this.ToGrid(resources, image);
        }

        //private fields region
        private String image;
        private Double width;
        private Double height;
        private Stretch stretch;
    }

    public class ImageMediaButton : MapButton
    {
        //public constructures region
        public ImageMediaButton(String name)
        {
            this.Name = name;

            fullArea = true;
            clickToHide = true;
        }

        public ImageMediaButton(String name, String imagePath)
            :this(name)
        {
            this.image = imagePath;
        }

        public ImageMediaButton(String name, String imagePath, Boolean fullArea)
            : this(name, imagePath)
        {
            this.fullArea = fullArea;
        }

        public ImageMediaButton(String name, String imagePath, Double width, Double height, Stretch stretch)
            : this(name, imagePath)
        {
            fullArea = false;
            this.width = width;
            this.height = height;
            this.stretch = stretch;
        }

        //public properties region
        public String Image
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

        public Boolean FullArea
        {
            get
            {
                return fullArea;
            }
            set
            {
                fullArea = value;
            }
        }

        public Boolean ClickToHide
        {
            get
            {
                return clickToHide;
            }
            set
            {
                clickToHide = value;
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

        public Stretch Stretch
        {
            get
            {
                return stretch;
            }
            set
            {
                stretch = value;
            }
        }

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            return this.ToGrid(resources, image);
        }

        //private fields region
        private String image;
        private Boolean fullArea;
        private Boolean clickToHide;
        private Double width;
        private Double height;
        private Stretch stretch;
    }

    public class VedioMediaButton : MapButton
    {
        //public constructures region
        public VedioMediaButton(String name)
        {
            this.Name = name;

            fullArea = true;
            clickToHide = true;
        }

        public VedioMediaButton(String name, String vedioPath)
            :this(name)
        {
            this.vedio = vedioPath;
        }

        public VedioMediaButton(String name, String vedioPath,String imagePath, Boolean fullArea)
            : this(name, vedioPath)
        {
            this.fullArea = fullArea;
            this.image=imagePath;
        }

        public VedioMediaButton(String name, String vedioPath, String imagePath, Double width, Double height)
            : this(name, vedioPath)
        {
            fullArea = false;
            this.width = width;
            this.height = height;
            this.image = imagePath;
        }

        //public properties region
        public String Vedio
        {
            get
            {
                return vedio;
            }
            set
            {
                vedio = value;
            }
        }

        public String Image
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

        public Boolean FullArea
        {
            get
            {
                return fullArea;
            }
            set
            {
                fullArea = value;
            }
        }

        public Boolean ClickToHide
        {
            get
            {
                return clickToHide;
            }
            set
            {
                clickToHide = value;
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

        //public functions region
        public override Grid ToGrid(ResourceDictionary resources)
        {
            return this.ToGrid(resources, image);
        }

        //private fields region
        private String vedio;
        private String image;
        private Boolean fullArea;
        private Boolean clickToHide;
        private Double width;
        private Double height;
    }

    public class MapButtonCollection : System.Collections.CollectionBase
    {
        //public events region
        public event EventHandler ListUpdated;

        //public functions region
        public void Add(MapButton value)
        {
            List.Add(value);

            if (ListUpdated != null)
                ListUpdated(this, new EventArgs());
        }

        public void Insert(Int32 index, MapButton value)
        {
            List.Insert(index, value);

            if (ListUpdated != null)
                ListUpdated(this, new EventArgs());
        }

        public void Remove(MapButton value)
        {
            List.Remove(value);

            if (ListUpdated != null)
                ListUpdated(this, new EventArgs());
        }

        public Boolean Contain(MapButton value)
        {
            return List.Contains(value);
        }     

        public MapButton this[Int32 index]
        {
            get
            {
                return (MapButton)List[index];
            }
            set
            {
                List[index] = value;

                if (ListUpdated != null)
                    ListUpdated(this, new EventArgs());
            }
        }
    }

    public class CityButtonCollection : System.Collections.CollectionBase
    {
        //public constructions region
        public CityButtonCollection(CityButton parent)
        {
            this.parent = parent;
        }

        //public properties region
        public CityButton Parent
        {
            get
            {
                return parent;
            }
            set
            {
                parent = value;
            }
        }

        //public fuctions region
        public void Add(CityButton city)
        {
            List.Add(city);
        }

        public void Insert(Int32 index,CityButton city)
        {
            List.Insert(index,city);
        }

        public void Remove(CityButton city)
        {
            List.Remove(city);
        }

        public Boolean Contains(CityButton city)
        {
            return List.Contains(city);
        }

        public CityButton this[Int32 index]
        {
            get
            {
                return (CityButton)List[index];
            }
            set
            {
                List[index] = value;
            }
        }
        
        //private fields region
        private CityButton parent;
    }

    public enum ButtonOrder
    {
        none,
        ZoomIn,
        ZoomOut,
        Home,
        ClearImages,
        ClearCircles,
        ClearArrows,
        ClearMediaImages,
        ClearMediaVedios,
        ClearAll
    }
}
