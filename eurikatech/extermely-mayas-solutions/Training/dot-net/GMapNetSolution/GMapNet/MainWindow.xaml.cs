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

namespace GMapNet
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            isRoute = isPolygon = false;
            routeList = null;
            polygonList = null;

            gmapControl.MapProvider = GMap.NET.MapProviders.BingMapProvider.Instance;
            gmapControl.CanDragMap = true;
            gmapControl.MinZoom = 0;
            gmapControl.MaxZoom = 15;
            gmapControl.IsEnabled = true;
            gmapControl.SelectionUseCircle = true;

            gmapControl.SelectedAreaFill = new SolidColorBrush(Colors.Green);
            gmapControl.SelectionPen = new Pen(new SolidColorBrush(Colors.Navy), 3);
            gmapControl.SelectionUseCircle = true;

            gmapControl.MouseUp += gmapControl_MouseUp;

            cbMapProvider.Items.Add(GMap.NET.MapProviders.ArcGIS_DarbAE_Q2_2011_NAVTQ_Eng_V5_MapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.ArcGIS_World_Physical_MapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.ArcGIS_World_Street_MapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.BingMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.BingSatelliteMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.CloudMadeMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.CzechMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.CzechSatelliteMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.GoogleChinaMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.GoogleHybridMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.GoogleSatelliteMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.MapBenderWMSProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.NearMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.OpenCycleLandscapeMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.OpenCycleTransportMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.OpenStreetMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.OviMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.WikiMapiaMapProvider.Instance.Name);
            cbMapProvider.Items.Add(GMap.NET.MapProviders.YahooMapProvider.Instance.Name);
        }

        void gmapControl_MouseUp(object sender, MouseButtonEventArgs e)
        {
            Point point = e.GetPosition(gmapControl);
            GMap.NET.PointLatLng pointLatLng = gmapControl.FromLocalToLatLng((Int32)point.X, (Int32)point.Y);
            txMarkerLatitude.Text = txLaditude.Text = pointLatLng.Lat.ToString();
            txMarkerLongitude.Text = txLongitude.Text = pointLatLng.Lng.ToString();

            if (!isRoute)
                if (!isPolygon)
                    gmapControl.Markers.Add(new GMap.NET.WindowsPresentation.GMapMarker(pointLatLng));
                else
                {
                    if (polygonList == null)
                        polygonList = new List<Point>();

                    polygonList.Add(point);
                }
            else
            {
                if (routeList == null)
                    routeList = new List<Point>();

                routeList.Add(point);
            }
        }

        private void btnGoto_Click(object sender, RoutedEventArgs e)
        {
            Double longitude, latitude;

            if (Double.TryParse(txLongitude.Text, out longitude))
            {
                if (Double.TryParse(txLaditude.Text, out latitude))
                    gmapControl.Position = new GMap.NET.PointLatLng(latitude, longitude);
                else
                {
                    MessageBox.Show("Error latitude value, except numeric value!");
                    txLaditude.Text = "0";
                }
            }
            else
                gmapControl.SetPositionByKeywords(txLongitude.Text);
        }

        private void btnZoom_Click(object sender, RoutedEventArgs e)
        {
            Double zoom;

            if (chkZoom.IsChecked == true)
            {
                if (Double.TryParse(txZoom.Text, out zoom))
                    gmapControl.Zoom = zoom;
                else
                {
                    MessageBox.Show("Error zoom value, except numeric value!");
                    txZoom.Text = "0";
                }
            }
            else
            {
                if (Double.TryParse(txAnimationZoom.Text, out zoom))
                {
                    System.Windows.Media.Animation.DoubleAnimation da = new System.Windows.Media.Animation.DoubleAnimation();

                    da.From = gmapControl.Zoom;
                    da.To = zoom;
                    da.Duration = new Duration(TimeSpan.FromSeconds(3));

                    gmapControl.BeginAnimation(GMap.NET.WindowsPresentation.GMapControl.ZoomProperty, da);
                }
                else
                {
                    MessageBox.Show("Error zoom value, except numeric value!");
                    txAnimationZoom.Text = "0";
                }
            }
        }

        private void btnMarker_Click(object sender, RoutedEventArgs e)
        {
            Double markerLatitude, markerLongitude;

            if (Double.TryParse(txMarkerLatitude.Text, out markerLatitude))
                if (Double.TryParse(txMarkerLongitude.Text, out markerLongitude))
                {
                    gmapControl.Markers.Add(new GMap.NET.WindowsPresentation.GMapMarker(new GMap.NET.PointLatLng(markerLatitude, markerLongitude)));
                }
                else
                {
                    MessageBox.Show("Error marker longitude value, except numeric value!");
                    txMarkerLongitude.Text = "0";
                }
            else
            {
                MessageBox.Show("Error marker latitude value, except numeric value!");
                txMarkerLatitude.Text = "0";
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
            if (routeList != null)
            {
                Path path = gmapControl.CreateRoutePath(routeList);
                path.Fill = new SolidColorBrush(Colors.Red);
                path.Stroke = new SolidColorBrush(Colors.Blue);
                path.StrokeThickness = 2;
                path.Opacity = .5;


                routeList = null;
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

            isPolygon = true;
        }

        private void btnEndPoly_Click(object sender, RoutedEventArgs e)
        {
            if (polygonList != null)
            {
                Path path = gmapControl.CreateRoutePath(polygonList);
                path.Fill = new SolidColorBrush(Colors.Red);
                path.Stroke = new SolidColorBrush(Colors.Blue);
                path.StrokeThickness = 2;
                path.Opacity = .5;

                routeList = null;
            }
            else
                MessageBox.Show("Error, null polyogn list values");
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {

        }

        private void cbMapProvider_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbMapProvider.SelectedItem != null)
            {
                if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.ArcGIS_DarbAE_Q2_2011_NAVTQ_Eng_V5_MapProvider.Instance.Name)
                    gmapControl.MapProvider = GMap.NET.MapProviders.ArcGIS_DarbAE_Q2_2011_NAVTQ_Eng_V5_MapProvider.Instance;
                else
                    if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.ArcGIS_World_Physical_MapProvider.Instance.Name)
                        gmapControl.MapProvider = GMap.NET.MapProviders.ArcGIS_World_Physical_MapProvider.Instance;
                    else
                        if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.ArcGIS_World_Street_MapProvider.Instance.Name)
                            gmapControl.MapProvider = GMap.NET.MapProviders.ArcGIS_World_Street_MapProvider.Instance;
                        else
                            if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.BingMapProvider.Instance.Name)
                                gmapControl.MapProvider = GMap.NET.MapProviders.BingMapProvider.Instance;
                            else
                                if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.BingSatelliteMapProvider.Instance.Name)
                                    gmapControl.MapProvider = GMap.NET.MapProviders.BingSatelliteMapProvider.Instance;
                                else
                                    if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.CloudMadeMapProvider.Instance.Name)
                                        gmapControl.MapProvider = GMap.NET.MapProviders.CloudMadeMapProvider.Instance;
                                    else
                                        if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.CzechMapProvider.Instance.Name)
                                            gmapControl.MapProvider = GMap.NET.MapProviders.CzechMapProvider.Instance;
                                        else
                                            if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.CzechSatelliteMapProvider.Instance.Name)
                                                gmapControl.MapProvider = GMap.NET.MapProviders.CzechSatelliteMapProvider.Instance;
                                            else
                                                if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.GoogleChinaMapProvider.Instance.Name)
                                                    gmapControl.MapProvider = GMap.NET.MapProviders.GoogleChinaMapProvider.Instance;
                                                else
                                                    if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.GoogleHybridMapProvider.Instance.Name)
                                                        gmapControl.MapProvider = GMap.NET.MapProviders.GoogleHybridMapProvider.Instance;
                                                    else
                                                        if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.GoogleSatelliteMapProvider.Instance.Name)
                                                            gmapControl.MapProvider = GMap.NET.MapProviders.GoogleSatelliteMapProvider.Instance;
                                                        else
                                                            if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.MapBenderWMSProvider.Instance.Name)
                                                                gmapControl.MapProvider = GMap.NET.MapProviders.MapBenderWMSProvider.Instance;
                                                            else
                                                                if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.NearMapProvider.Instance.Name)
                                                                    gmapControl.MapProvider = GMap.NET.MapProviders.NearMapProvider.Instance;
                                                                else
                                                                    if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.OpenCycleLandscapeMapProvider.Instance.Name)
                                                                        gmapControl.MapProvider = GMap.NET.MapProviders.OpenCycleLandscapeMapProvider.Instance;
                                                                    else
                                                                        if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.OpenCycleTransportMapProvider.Instance.Name)
                                                                            gmapControl.MapProvider = GMap.NET.MapProviders.OpenCycleTransportMapProvider.Instance;
                                                                        else
                                                                            if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.OpenStreetMapProvider.Instance.Name)
                                                                                gmapControl.MapProvider = GMap.NET.MapProviders.OpenStreetMapProvider.Instance;
                                                                            else
                                                                                if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.OviMapProvider.Instance.Name)
                                                                                    gmapControl.MapProvider = GMap.NET.MapProviders.OviMapProvider.Instance;
                                                                                else
                                                                                    if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.WikiMapiaMapProvider.Instance.Name)
                                                                                        gmapControl.MapProvider = GMap.NET.MapProviders.WikiMapiaMapProvider.Instance;
                                                                                    else
                                                                                        if (cbMapProvider.SelectedItem.ToString() == GMap.NET.MapProviders.YahooMapProvider.Instance.Name)
                                                                                            gmapControl.MapProvider = GMap.NET.MapProviders.YahooMapProvider.Instance;
            }
        }

        private void btnApply_Click_1(object sender, RoutedEventArgs e)
        {
            Single bear;

            if (Single.TryParse(txBearing.Text, out bear))
                gmapControl.Bearing = bear;
            else
                MessageBox.Show("Error, bearing value should be numeric!");
        }

        private Boolean isRoute;
        private Boolean isPolygon;
        private List<Point> routeList;
        private List<Point> polygonList;  
    }
}
