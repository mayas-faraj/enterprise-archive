using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace NewsTv.Codes
{
    public class Panel
    {
        //public constructure region
        public Panel(String name)
        {
            this.name = name;

            buttons = new MapButtonCollection();
        }

        public Panel(String name, Double opacity, GradientBrush background, GradientBrush textsForeground, Double textsFontSize, Double buttonWidth, Double buttonHeight)
            :this(name)
        {
            this.opacity = opacity;
            this.background = background;
            this.textsForeground = textsForeground;
            this.textsFontSize = textsFontSize;
            this.buttonWidth = buttonWidth;
            this.buttonHeight = buttonHeight;
        }

        public Panel(String name, Double opacity, GradientBrush background, GradientBrush textsForeground, Double textsFontSize, Double buttonWidth, Double buttonHeight, ResourceDictionary resources, PanelAlignment alignment)
            : this(name, opacity, background, textsForeground, textsFontSize, buttonWidth, buttonHeight)
        {
            this.resources = resources;
            this.alignment = alignment;
        }

        //public events region
        public event RoutedEventHandler OrderButtonClick;
        public event RoutedEventHandler CityButtonClick;
        public event RoutedEventHandler ImageMediaButtonClick;
        public event RoutedEventHandler VedioMediaButtonClick;

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

        public Double Opacity
        {
            get
            {
                return opacity;
            }
            set
            {
                opacity = value;
            }
        }

        public Double ButtonsOpacity
        {
            get
            {
                return buttonsOpacity;
            }
            set
            {
                buttonsOpacity = value;
            }
        }

        public GradientBrush Background
        {
            get
            {
                return background;
            }
            set
            {
                background = value;
            }
        }

        public GradientBrush TextsForeground
        {
            get
            {
                return textsForeground;
            }
            set
            {
                textsForeground = value;
            }
        }

        public Double TextsFontSize
        {
            get
            {
                return textsFontSize;
            }
            set
            {
                textsFontSize = value;
            }
        }

        public Double ButtonWidth
        {
            get
            {
                return buttonWidth;
            }
            set
            {
                buttonWidth = value;
            }
        }

        public Double ButtonHeight
        {
            get
            {
                return buttonHeight;
            }
            set
            {
                buttonHeight = value;
            }
        }

        public ResourceDictionary Resources
        {
            get
            {
                return resources;
            }
            set
            {
                resources = value;
            }
        }

        public PanelAlignment Alignment
        {
            get
            {
                return alignment;
            }
            set
            {
                alignment = value;
            }
        }

        public MapButton SelectedButton
        {
            get
            {
                return selectedButton;
            }
            set
            {
                selectedButton = value;
            }
        }

        public MapButtonCollection Buttons
        {
            get
            {
                return buttons;
            }
            set
            {
                buttons = value;
            }
        }

        //public functions region
        public ToolBar ToToolBar()
        {
            //precondition: none
            ToolBar toolBar = new ToolBar();

            //toolbar property
            toolBar.Background = background;

            GradientBrush tbBrush = toolBar.Background as GradientBrush;
            if (tbBrush != null)
                for (Int32 i = 0; i < tbBrush.GradientStops.Count; i++)
                {
                    Color color = tbBrush.GradientStops[i].Color;
                    Int32 op = Convert.ToByte(opacity * 255);

                    if (op > 255)
                        color.A = 255;
                    else
                        color.A = Convert.ToByte(op);
                    
                    tbBrush.GradientStops[i].Color = color;
                }

            //set the toolbar location with the contenter grid
            switch (alignment)
            {
                case PanelAlignment.Top:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 1);
                    break;
                case PanelAlignment.TopWithLeft:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetColumnSpan(toolBar, 2);
                    break;
                case PanelAlignment.TopWithRight:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 1);
                    Grid.SetColumnSpan(toolBar, 2);
                    break;
                case PanelAlignment.TopWithLeftRight:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetColumnSpan(toolBar, 3);
                    break;
                case PanelAlignment.Left:
                    Grid.SetRow(toolBar, 1);
                    Grid.SetColumn(toolBar, 0);
                    break;
                case PanelAlignment.LeftWithTop:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetRowSpan(toolBar, 2);
                    break;
                case PanelAlignment.LeftWithBottom:
                    Grid.SetRow(toolBar, 1);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetRowSpan(toolBar, 2);
                    break;
                case PanelAlignment.LeftWithTopBottom:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetRowSpan(toolBar, 3);
                    break;
                case PanelAlignment.Right:
                    Grid.SetRow(toolBar, 1);
                    Grid.SetColumn(toolBar, 2);
                    break;
                case PanelAlignment.RightWithTop:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 2);
                    Grid.SetRowSpan(toolBar, 2);
                    break;
                case PanelAlignment.RightWithBottom:
                    Grid.SetRow(toolBar, 1);
                    Grid.SetColumn(toolBar, 2);
                    Grid.SetRowSpan(toolBar, 2);
                    break;
                case PanelAlignment.RightWithTopBottom:
                    Grid.SetRow(toolBar, 0);
                    Grid.SetColumn(toolBar, 2);
                    Grid.SetRowSpan(toolBar, 3);
                    break;
                case PanelAlignment.Bottom:
                    Grid.SetRow(toolBar, 2);
                    Grid.SetColumn(toolBar, 1);
                    break;
                case PanelAlignment.BottomWithLeft:
                    Grid.SetRow(toolBar, 2);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetColumnSpan(toolBar, 2);
                    break;
                case PanelAlignment.BottomWithRight:
                    Grid.SetRow(toolBar, 2);
                    Grid.SetColumn(toolBar, 1);
                    Grid.SetColumnSpan(toolBar, 2);
                    break;
                case PanelAlignment.BottomWithLeftRight:
                    Grid.SetRow(toolBar, 2);
                    Grid.SetColumn(toolBar, 0);
                    Grid.SetColumnSpan(toolBar, 3);
                    break;
            }

            //add buttons to the panel
            foreach (MapButton button in buttons)
                //add buttons to the toolbar
                if (button.GetType() == typeof(OrderButton) || button.GetType() == typeof(CityButton))
                    toolBar.Items.Add(getButton(button));
                else
                    toolBar.Items.Add(getToggleButton(button));

            return toolBar;
        }

        //private functions region
        private void btn_Click(object sender, RoutedEventArgs e)
        {
            //get sender button
            Button btn = sender as Button;

            if (btn != null)
            {
                //set selectedButton property
                selectedButton = (MapButton)btn.Tag;

                //hide the city buttons and add nested cities
                ToolBar toolBar = btn.Parent as ToolBar;

                if (toolBar != null)
                {
                    //unpress all toggle button
                    unpressToolbarButton(toolBar, null);

                    //raise order button event
                    if (selectedButton.GetType() == typeof(OrderButton))
                        if (OrderButtonClick != null)
                            OrderButtonClick(this, new RoutedEventArgs());

                    //raise city button event
                    if (selectedButton.GetType() == typeof(CityButton))
                    {
                        if (CityButtonClick != null)
                            CityButtonClick(this, new RoutedEventArgs());


                        //the index of the sender button on the toolbar
                        Int32 btnIdx = 0;

                        for (Int32 i = 0; i < toolBar.Items.Count; i++)
                        {
                            Object content = toolBar.Items[i];

                            if (content.GetType() == typeof(Button))
                                if (((Button)content).Tag.GetType() == typeof(CityButton))
                                {
                                    //set the index if the selected button is the same of this button
                                    if (selectedButton == ((Button)content).Tag)
                                        btnIdx = i;

                                    ((Button)content).Visibility = Visibility.Collapsed;
                                }
                        }

                        foreach (CityButton city in ((CityButton)selectedButton).Cities)
                            toolBar.Items.Insert(btnIdx, getButton(city));
                    }
                }
            }
        }

        private void toogleButton_Click(object sender, RoutedEventArgs e)
        {
            //get sender toggle button
            System.Windows.Controls.Primitives.ToggleButton toggle = sender as System.Windows.Controls.Primitives.ToggleButton;
            
            if (toggle != null)
            {
                //set the selected button property
                selectedButton = (MapButton)toggle.Tag;

                //get the toolbar
                ToolBar toolBar = toggle.Parent as ToolBar;

                //un-press all the other button on the toolbar
                if (toolBar != null)
                {
                    //unpress the toggle buttons
                    unpressToolbarButton(toolBar, toggle);

                    //raise event for image media button
                    if (selectedButton.GetType() == typeof(ImageMediaButton))
                        if (ImageMediaButtonClick != null)
                            ImageMediaButtonClick(this, new RoutedEventArgs());

                    //raise event for vedio media button
                    if (selectedButton.GetType() == typeof(VedioMediaButton))
                        if (VedioMediaButtonClick != null)
                            VedioMediaButtonClick(this, new RoutedEventArgs());
                }
            }
        }

        private System.Windows.Controls.Primitives.ToggleButton getToggleButton(MapButton button)
        {
            System.Windows.Controls.Primitives.ToggleButton toggleButton = new System.Windows.Controls.Primitives.ToggleButton();
            Grid grid = button.ToGrid(resources);

            //apply textsForground to the text on the texts
            setTextBrush(grid);

            //toggle button properties
            toggleButton.Content = grid;
            toggleButton.Width = buttonWidth;
            toggleButton.Height = buttonHeight;
            toggleButton.Opacity = buttonsOpacity;

            //click event
            toggleButton.Tag = button;
            toggleButton.Click += toogleButton_Click;

            return toggleButton;
        }

        private Button getButton(MapButton button)
        {
            Button btn = new Button();
            Grid grid = button.ToGrid(resources);

            //apply textsForground to the text on the texts
            setTextBrush(grid);

            //toggle button properties
            btn.Content = grid;
            btn.Width = buttonWidth;
            btn.Height = buttonHeight;
            btn.Opacity = buttonsOpacity;

            //click event
            btn.Tag = button;
            btn.Click += btn_Click;

            return btn;
        }

        private void setTextBrush(Grid grid)
        {
            foreach (FrameworkElement fwElement in grid.Children)
                if (fwElement.GetType() == typeof(TextBlock))
                    ((TextBlock)fwElement).Foreground = textsForeground;
        }

        private void unpressToolbarButton(ToolBar toolBar, System.Windows.Controls.Primitives.ToggleButton toggle)
        {
            foreach (Object content in toolBar.Items)
            {
                if (content.GetType() == typeof(System.Windows.Controls.Primitives.ToggleButton))
                    if ((System.Windows.Controls.Primitives.ToggleButton)content != toggle)
                        ((System.Windows.Controls.Primitives.ToggleButton)content).IsChecked = false;
            }
        }

        //private fields region
        private Int32 id;
        private String name;
        private Double opacity;
        private Double buttonsOpacity;
        private GradientBrush background;
        private GradientBrush textsForeground;
        private Double textsFontSize;
        private Double buttonWidth;
        private Double buttonHeight;
        private ResourceDictionary resources;
        private PanelAlignment alignment;
        private MapButton selectedButton;
        private MapButtonCollection buttons;
    }

    public enum PanelAlignment
    {
        Top,
        TopWithLeft,
        TopWithRight,
        TopWithLeftRight,
        Left,
        LeftWithTop,
        LeftWithBottom,
        LeftWithTopBottom,
        Right,
        RightWithTop,
        RightWithBottom,
        RightWithTopBottom,
        Bottom,
        BottomWithLeft,
        BottomWithRight,
        BottomWithLeftRight
    }

    public class MapPolygon : Microsoft.Maps.MapControl.WPF.MapPolygon
    {
        //public constructor region
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

        public Double StartZoomLevel
        {
            get
            {
                return startZoomLevel;
            }
            set
            {
                startZoomLevel = value;
            }
        }

        public Double EndZoomLevel
        {
            get
            {
                return endZoomLevel;
            }
            set
            {
                endZoomLevel = value;
            }
        }

        //private fields region
        private Int32 id;
        private Double startZoomLevel;
        private Double endZoomLevel;
    }

    public class MapLabel
    {
        //public constructor region
        public MapLabel(String name)
        {
            this.name = name;
            pointRadius = 50;
        }

        public MapLabel(String name, Double pointRadius)
            : this(name)
        {
            this.pointRadius = pointRadius;
        }

        public MapLabel(String name, Double pointRadius, Double latitude, Double longitude)
            : this(name, pointRadius)
        {
            this.latitude = latitude;
            this.longitude = longitude;
        }

        public MapLabel(String name, Int32 id, Double pointRadius, Double latitude, Double longitude, GradientBrush foreground, GradientBrush pointForeground)
            : this(name, pointRadius, latitude, longitude)
        {
            this.foreground = foreground;
            this.pointForeground = pointForeground;
            this.id = id;
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

        public Double FontSize
        {
            get
            {
                return fontSize;
            }
            set
            {
                fontSize = value;
            }
        }

        public FontFamily FontFamily
        {
            get
            {
                return fontFamily;
            }
            set
            {
                fontFamily = value;
            }
        }

        public GradientBrush Foreground
        {
            get
            {
                return foreground;
            }
            set
            {
                foreground = value;
            }
        }

        public Double PointRadius
        {
            get
            {
                return pointRadius;
            }
            set
            {
                pointRadius = value;
            }
        }

        public GradientBrush PointForeground
        {
            get
            {
                return pointForeground;
            }
            set
            {
                pointForeground = value;
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

        public Double StartZoomLevel
        {
            get
            {
                return startZoomLevel;
            }
            set
            {
                startZoomLevel = value;
            }
        }

        public Double EndZoomLevel
        {
            get
            {
                return endZoomLevel;
            }
            set
            {
                endZoomLevel = value;
            }
        }

        //public functions region
        public System.Windows.Shapes.Ellipse ToPoint()
        {
            System.Windows.Shapes.Ellipse ellipse = new System.Windows.Shapes.Ellipse();

            ellipse.Width = ellipse.Height = pointRadius * 2;
            ellipse.Fill = pointForeground;

            return ellipse;
        }

        public TextBlock ToText()
        {
            TextBlock textBlock = new TextBlock();

            textBlock.Text = name;
            textBlock.FontFamily = fontFamily;
            textBlock.FontSize = fontSize;
            textBlock.Foreground = foreground;

            return textBlock;
        }

        //private fields region
        private Int32 id;
        private String name;
        private Double fontSize;
        private FontFamily fontFamily;
        private GradientBrush foreground;
        private Double pointRadius;
        private GradientBrush pointForeground;
        private Double latitude;
        private Double longitude;
        private Double startZoomLevel;
        private Double endZoomLevel;
    }

    public class MapContent
    {
        //public constructors region

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

        public String Text1
        {
            get
            {
                return text1;
            }
            set
            {
                text1 = value;
            }
        }

        public String Text2
        {
            get
            {
                return text2;
            }
            set
            {
                text2 = value;
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

        public Double ImageWidth
        {
            get
            {
                return imageWidth;
            }
            set
            {
                imageWidth = value;
            }
        }

        public Double ImageHeight
        {
            get
            {
                return imageHeight;
            }
            set
            {
                imageHeight = value;
            }
        }

        public Stretch ImageStrech
        {
            get
            {
                return imageStrech;
            }
            set
            {
                imageStrech = value;
            }
        }

        public Double FontSize1
        {
            get
            {
                return fontSize1;
            }
            set
            {
                fontSize1 = value;
            }
        }

        public Double FontSize2
        {
            get
            {
                return fontSize2;
            }
            set
            {
                fontSize2 = value;
            }
        }

        public FontFamily FontFamily1
        {
            get
            {
                return fontFamily1;
            }
            set
            {
                fontFamily1 = value;
            }
        }

        public FontFamily FontFamily2
        {
            get
            {
                return fontFamily2;
            }
            set
            {
                fontFamily2 = value;
            }
        }

        public GradientBrush Foreground1
        {
            get
            {
                return foreground1;
            }
            set
            {
                foreground1 = value;
            }
        }

        public GradientBrush Foreground2
        {
            get
            {
                return foreground2;
            }
            set
            {
                foreground2 = value;
            }
        }

        public GradientBrush Background1
        {
            get
            {
                return background1;
            }
            set
            {
                background1 = value;
            }
        }

        public GradientBrush Background2
        {
            get
            {
                return background2;
            }
            set
            {
                background2 = value;
            }
        }

        public GradientBrush Backgournd
        {
            get
            {
                return backgournd;
            }
            set
            {
                backgournd = value;
            }
        }

        public GradientBrush BorderBrush
        {
            get
            {
                return borderBrush;
            }
            set
            {
                borderBrush = value;
            }
        }

        public Double BorderThickness
        {
            get
            {
                return borderThickness;
            }
            set
            {
                borderThickness = value;
            }
        }

        public Double Margin
        {
            get
            {
                return margin;
            }
            set
            {
                margin = value;
            }
        }

        public Orientation Orientation
        {
            get
            {
                return orientation;
            }
            set
            {
                orientation = value;
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

        public Double StartZoomLevel
        {
            get
            {
                return startZoomLevel;
            }
            set
            {
                startZoomLevel = value;
            }
        }

        public Double EndZoomLevel
        {
            get
            {
                return endZoomLevel;
            }
            set
            {
                endZoomLevel = value;
            }
        }

        public ContentOrder Order
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

        //public functions region
        public StackPanel ToSackPanel()
        {
            StackPanel stackPanel = new StackPanel();

            stackPanel.Orientation = orientation;
            stackPanel.Background = backgournd;

            TextBlock textBlock1 = new TextBlock();
            TextBlock textBlock2 = new TextBlock();
            Image imageControl = new Image();

            FrameworkElement element1, element2, element3;

            textBlock1.Text = text1;
            textBlock1.FontFamily = fontFamily1;
            textBlock1.FontSize = fontSize1;
            textBlock1.Foreground = foreground1;
            textBlock1.Background = background1;
            textBlock1.HorizontalAlignment = HorizontalAlignment.Center;
            textBlock1.VerticalAlignment = VerticalAlignment.Center;
            textBlock1.Margin = new Thickness(margin);

            textBlock2.Text = text2;
            textBlock2.FontFamily = fontFamily2;
            textBlock2.FontSize = fontSize2;
            textBlock2.Foreground = foreground2;
            textBlock2.Background = background2;
            textBlock2.HorizontalAlignment = HorizontalAlignment.Center;
            textBlock2.VerticalAlignment = VerticalAlignment.Center;
            textBlock2.Margin = new Thickness(margin);

            imageControl.Source = Library.LoadImage(image);
            imageControl.Width = imageWidth;
            imageControl.Height = imageHeight;
            imageControl.Stretch = imageStrech;
            imageControl.HorizontalAlignment = HorizontalAlignment.Center;
            imageControl.VerticalAlignment = VerticalAlignment.Center;
            imageControl.Margin = new Thickness(margin);

            if (borderThickness > 0)
            {
                Border border1 = new Border();
                Border border2 = new Border();
                Border border3 = new Border();

                border1.BorderBrush = border2.BorderBrush = border3.BorderBrush = borderBrush;
                border1.BorderThickness = border2.BorderThickness = border3.BorderThickness = new Thickness(borderThickness);

                border1.Child = textBlock1;
                border2.Child = textBlock2;
                border3.Child = imageControl;

                element1 = border1;
                element2 = border2;
                element3 = border3;
            }
            else
            {
                element1 = textBlock1;
                element2 = textBlock2;
                element3 = imageControl;
            }

            switch (order)
            {
                case ContentOrder.ImageTextText:
                    stackPanel.Children.Add(element3);
                    stackPanel.Children.Add(element1);
                    stackPanel.Children.Add(element2);
                    break;
                case ContentOrder.TextImageText:
                    stackPanel.Children.Add(element1);
                    stackPanel.Children.Add(element3);
                    stackPanel.Children.Add(element2);
                    break;
                case ContentOrder.TextTextImage:
                    stackPanel.Children.Add(element1);
                    stackPanel.Children.Add(element2);
                    stackPanel.Children.Add(element3);
                    break;
            }

            return stackPanel;
        }

        //private fields region
        private Int32 id;
        private String text1;
        private String text2;
        private String image;
        private Double imageWidth;
        private Double imageHeight;
        private Stretch imageStrech;
        private Double fontSize1;
        private Double fontSize2;
        private FontFamily fontFamily1;
        private FontFamily fontFamily2;
        private GradientBrush foreground1;
        private GradientBrush foreground2;
        private GradientBrush background1;
        private GradientBrush background2;
        private GradientBrush backgournd;
        private GradientBrush borderBrush;
        private Double borderThickness;
        private Double margin;
        private Orientation orientation;
        private Double latitude;
        private Double longitude;
        private Double startZoomLevel;
        private Double endZoomLevel;
        private ContentOrder order;
    }

    public class Profile
    {
        //public constructors region
        public Profile(String name)
        {
            this.name = name;

            panels = new System.Collections.Generic.List<Panel>();
            mapPolygons = new System.Collections.Generic.List<MapPolygon>();
            mapLabels = new System.Collections.Generic.List<MapLabel>();
        }

        public Profile(String name, String description, MapMode mode, Double initialZoom, Double initialHeading, Double initialLatitude, Double initialLongitude)
            : this(name)
        {
            this.description = description;
            this.mode = mode;
            this.initialZoom = initialZoom;
            this.initialHeading = initialHeading;
            this.initialLatitude = initialLatitude;
            this.initialLongitude = initialLongitude;
        }

        public Profile(String name, String description, MapMode mode, Double initialZoom, Double initialHeading, Double initialLatitude, Double initialLongitude,
             System.Collections.Generic.List<Panel> panels, System.Collections.Generic.List<MapPolygon> mapPolygons, System.Collections.Generic.List<MapLabel> mapLabels)
            : this(name, description, mode, initialZoom, initialHeading, initialLatitude, initialLongitude)
        {
            this.panels = panels;
            this.mapPolygons = mapPolygons;
            this.mapLabels = mapLabels;
        }

        //public fields region
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

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
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

        public Boolean ScaleVisibility
        {
            get
            {
                return scaleVisibility;
            }
            set
            {
                scaleVisibility = value;
            }
        }

        public Boolean MoveMapByMouse
        {
            get
            {
                return moveMapByMouse;
            }
            set
            {
                moveMapByMouse = value;
            }
        }

        public Boolean ZoomMapByMouse
        {
            get
            {
                return zoomMapByMouse;
            }
            set
            {
                zoomMapByMouse = value;
            }
        }

        public MapMode Mode
        {
            get
            {
                return mode;
            }
            set
            {
                mode = value;
            }
        }

        public Double InitialZoom
        {
            get
            {
                return initialZoom;
            }
            set
            {
                initialZoom = value;
            }
        }

        public Double InitialHeading
        {
            get
            {
                return initialHeading;
            }
            set
            {
                initialHeading = value;
            }
        }

        public Double InitialLatitude
        {
            get
            {
                return initialLatitude;
            }
            set
            {
                initialLatitude = value;
            }
        }

        public Double InitialLongitude
        {
            get
            {
                return initialLongitude;
            }
            set
            {
                initialLongitude = value;
            }
        }

        public System.Collections.Generic.List<Panel> Panels
        {
            get
            {
                return panels;
            }
            set
            {
                panels = value;
            }
        }

        public System.Collections.Generic.List<MapPolygon> MapPolygons
        {
            get
            {
                return mapPolygons;
            }
            set
            {
                mapPolygons = value;
            }
        }

        public System.Collections.Generic.List<MapLabel> MapLabels
        {
            get
            {
                return mapLabels;
            }
            set
            {
                mapLabels = value;
            }
        }

        //public functions region
        public StackPanel ToStackPanet(ResourceDictionary resources,Double imageWidth,Double imageHeight)
        {
            StackPanel stack = new StackPanel();

            Border border = new Border();
            Image imageControl = new Image();
            TextBlock text = new TextBlock();

            imageControl.Source = Library.LoadProfileImage(image);
            text.Text = name;
            border.Child = imageControl;

            if (resources != null)
            {
                border.BorderBrush = (Brush)resources["borders"];
                border.BorderThickness = (Thickness)resources["bordersWidth"];
                border.Margin = (Thickness)resources["margin"];

                if (imageControl != null)
                {
                    imageControl.Margin = (Thickness)resources["margin"];
                    imageControl.VerticalAlignment = VerticalAlignment.Center;
                    imageControl.HorizontalAlignment = HorizontalAlignment.Center;

                    if (imageWidth == -1)
                        imageControl.Width = (Double)resources["userWidth"];
                    else
                        imageControl.Width = imageWidth;

                    if (imageHeight == -1)
                        imageControl.Height = (Double)resources["userHeight"];
                    else
                        imageControl.Height = imageHeight;
                }

                if (name != null && name != "")
                {
                    text.FontSize = (Double)resources["textsSize"];
                    text.Foreground = (Brush)resources["texts"];
                    text.Margin = (Thickness)resources["margin"];
                    text.HorizontalAlignment = HorizontalAlignment.Center;
                    text.VerticalAlignment = VerticalAlignment.Center;
                }
            }

            stack.Children.Add(border);
            stack.Children.Add(text);

            return stack;
        }

        public StackPanel ToStackPanet(ResourceDictionary resources)
        {
            return ToStackPanet(resources, -1, -1);
        }

        public override String ToString()
        {
            return Name;
        }

        //private fields region
        private Int32 id;
        private String name;
        private String description;
        private String image;
        private Boolean scaleVisibility;
        private Boolean moveMapByMouse;
        private Boolean zoomMapByMouse;
        private MapMode mode;
        private Double initialZoom;
        private Double initialHeading;
        private Double initialLatitude;
        private Double initialLongitude;
        private System.Collections.Generic.List<Panel> panels;
        private System.Collections.Generic.List<MapPolygon> mapPolygons;
        private System.Collections.Generic.List<MapLabel> mapLabels;
    }

    public enum MapMode
    {
        AerialMode,
        AerialModeWidthLabel,
        RoadMode,
        MercatorMode
    }

    public enum ContentOrder
    {
        ImageTextText,
        TextImageText,
        TextTextImage
    }
}
