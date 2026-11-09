using System;
using System.Collections.Generic;
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

namespace NewsTV
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            GMap.NET.WindowsPresentation.GMapControl gMapControl = new GMap.NET.WindowsPresentation.GMapControl();

            gMapControl.Manager.Mode = GMap.NET.AccessMode.ServerAndCache;
            gMapControl.MapProvider = GMap.NET.MapProviders.BingSatelliteMapProvider.Instance;
            gMapControl.MinZoom = 1;
            gMapControl.MaxZoom = 20;
            gMapControl.Zoom = 10;
            //gMapControl.EmptyTileBorders = new Pen(Brushes.Yellow, 0);
            //gMapControl.EmptyMapBackground = Brushes.LightBlue;

            contenter.Content = gMapControl;
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            if (txKeyword.Text != "")
                ((GMap.NET.WindowsPresentation.GMapControl)contenter.Content).SetCurrentPositionByKeywords(txKeyword.Text);

            if (txLatitude.Text != "" && txLongitude.Text != "")
                ((GMap.NET.WindowsPresentation.GMapControl)contenter.Content).Position = new GMap.NET.PointLatLng(Double.Parse(txLatitude.Text), Double.Parse(txLongitude.Text));
        }
    }
}
