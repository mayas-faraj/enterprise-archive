using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BingMap
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            routes = null;
            polygons = null;
            rotating = 0;
            map.UseInertia = true;
            map.Mode = new Microsoft.Maps.MapControl.WPF.AerialMode(true);
            map.AnimationLevel = Microsoft.Maps.MapControl.WPF.AnimationLevel.Full;
            map.Heading = 45;
            map.MouseUp += map_MouseUp;
        }

        private void map_MouseUp(object sender, MouseButtonEventArgs e)
        {
            Point point = e.GetPosition(map);
            Microsoft.Maps.MapControl.WPF.Location location = map.ViewportPointToLocation(point);
            txLaditude.Text = location.Latitude.ToString();
            txLongitude.Text = location.Longitude.ToString();
            txAltitude.Text = location.Altitude.ToString();
            
            if (!isRoute)
                if (!isPolygon)
                {
                    Microsoft.Maps.MapControl.WPF.Pushpin pushpin = new Microsoft.Maps.MapControl.WPF.Pushpin();

                    pushpin.Content = 'P';

                    pushpin.Location = location;
                    
                    map.Children.Add(pushpin);
                }
                else
                {
                    if (polygons == null)
                        polygons = new Microsoft.Maps.MapControl.WPF.LocationCollection();

                    polygons.Add(location);
                }
            else
            {
                if (routes == null)
                    routes = new Microsoft.Maps.MapControl.WPF.LocationCollection();

                routes.Add(location);
            }
        }

        private void btnGoto_Click(object sender, RoutedEventArgs e)
        {
            Double longitude, latitude, zoom, heading;

            if (Double.TryParse(txLongitude.Text, out longitude))
            {
                if (Double.TryParse(txLaditude.Text, out latitude))
                {
                    Double.TryParse(txZoom.Text, out zoom);
                    Double.TryParse(txHeading.Text, out heading);

                    map.SetView(new Microsoft.Maps.MapControl.WPF.Location(latitude, longitude), zoom, heading);
                }
                else
                {
                    MessageBox.Show("Error latitude value, except numeric value!");
                    txLaditude.Text = "0";
                }
            }
            else
            {
                MessageBox.Show("Error Longitude value, except numeric value!");
                txLongitude.Text = "0";
            }
        }

        private void btnApply_Click(object sender, RoutedEventArgs e)
        {
            Double zoom;

            if (Double.TryParse(txZoom.Text, out zoom))
                map.ZoomLevel = zoom;
            else
            {
                MessageBox.Show("Error zoom value, except numeric value!");
                txZoom.Text = "0";
            }  
        }

        private void btnAddRoute_Click(object sender, RoutedEventArgs e)
        {
            if (isPolygon)
            {
                btnEndPoly_Click(sender, e);
                isPolygon = false;
            }

            isRoute = true;
        }

        private void btnEndRoute_Click(object sender, RoutedEventArgs e)
        {
            if (routes != null)
            {
                Microsoft.Maps.MapControl.WPF.MapPolyline path = new Microsoft.Maps.MapControl.WPF.MapPolyline();

                path.Locations = routes;
                path.Fill = new SolidColorBrush(Colors.Red);
                path.Stroke = new SolidColorBrush(Colors.Blue);
                path.StrokeThickness = 2;
                path.Opacity = .5;

                map.Children.Add(path);

                routes = null;
            }
            else
                MessageBox.Show("Error, null route list values");
        }

        private void btnAddPoly_Click(object sender, RoutedEventArgs e)
        {
            if (isRoute)
            {
                btnEndRoute_Click(sender, e);
                isRoute = false;
            }

            if (polygons == null)
            {
                polygons = new Microsoft.Maps.MapControl.WPF.LocationCollection();  
            }

            isPolygon = true;
        }

        private void btnEndPoly_Click(object sender, RoutedEventArgs e)
        {
            if (polygons != null)
            {
                Microsoft.Maps.MapControl.WPF.MapPolygon path = new Microsoft.Maps.MapControl.WPF.MapPolygon();

                path.Locations = polygons;
                path.Fill = new SolidColorBrush(Colors.Red);
                path.Stroke = new SolidColorBrush(Colors.Blue);
                path.StrokeThickness = 2;
                path.Opacity = .5;

                map.Children.Add(path);

                polygons = null;
            }
            else
                MessageBox.Show("Error, null polyogn list values");
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            map.Children.Clear();
        }

        private void btnHeading_Click(object sender, RoutedEventArgs e)
        {
            Double val, time;

            if (!Double.TryParse(txHeading.Text, out val))
            {
                MessageBox.Show("heading should be a numeric value!");
                txHeading.Text = "0";
            }

            if (txHeadingTime.Text == "0")
                map.Heading = val;
            else
            {
                System.Windows.Media.Animation.DoubleAnimation da = new System.Windows.Media.Animation.DoubleAnimation();

                if (!Double.TryParse(txHeadingTime.Text, out time))
                {
                    MessageBox.Show("heading time should be a numeric value!");
                    txHeadingTime.Text = "0";
                }

                da.From = map.Heading;
                da.To = da.From + val;
                da.Duration = new Duration(TimeSpan.FromSeconds(time));

                map.BeginAnimation(Microsoft.Maps.MapControl.WPF.Map.HeadingProperty, da);
            }
        }

        private void btnZoom_Click(object sender, RoutedEventArgs e)
        {
            Double val, time;

            if (!Double.TryParse(txZoom.Text, out val))
            {
                MessageBox.Show("zoom should be a numeric value!");
                txZoom.Text = "0";
            }

            if (txZoomTime.Text == "0")
                map.ZoomLevel = val;
            else
            {
                System.Windows.Media.Animation.DoubleAnimation da = new System.Windows.Media.Animation.DoubleAnimation();

                if (!Double.TryParse(txZoomTime.Text, out time))
                {
                    MessageBox.Show("zoom time should be a numeric value!");
                    txZoomTime.Text = "0";
                }

                da.From = map.ZoomLevel;
                da.To = da.From + val;
                da.Duration = new Duration(TimeSpan.FromSeconds(time));

                map.BeginAnimation(Microsoft.Maps.MapControl.WPF.Map.ZoomLevelProperty, da);
            }
        }

        private void btnImage_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Maps.MapControl.WPF.MapLayer imageLayer = new Microsoft.Maps.MapControl.WPF.MapLayer();

            Image image = new Image();
            image.Height = 150;

            BitmapImage myBitmapImage = new BitmapImage();

            myBitmapImage.BeginInit();
            myBitmapImage.UriSource = new Uri(txImage.Text);
            myBitmapImage.DecodePixelHeight = 150;
            myBitmapImage.EndInit();

            image.Source = myBitmapImage;
            image.Opacity = 0.6;
            image.Stretch = System.Windows.Media.Stretch.None;

            //The map location to place the image at
            Microsoft.Maps.MapControl.WPF.Location location = new Microsoft.Maps.MapControl.WPF.Location(Convert.ToDouble(txLaditude.Text), Convert.ToDouble(txLongitude.Text));
            //Center the image around the location specified
            Microsoft.Maps.MapControl.WPF.PositionOrigin position = Microsoft.Maps.MapControl.WPF.PositionOrigin.Center;

            //Add the image to the defined map layer
            imageLayer.AddChild(image, location, position);
            //Add the image layer to the map
            map.Children.Add(imageLayer);

        }
       
        private Boolean isRoute;
        private Boolean isPolygon;
        private Microsoft.Maps.MapControl.WPF.LocationCollection routes;
        private Microsoft.Maps.MapControl.WPF.LocationCollection polygons;
        private Double rotating;   
    }
}
