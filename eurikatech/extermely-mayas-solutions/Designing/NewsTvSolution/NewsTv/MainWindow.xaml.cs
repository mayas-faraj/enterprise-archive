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
using System.Windows.Shapes;

namespace NewsTv
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private System.Windows.Media.Animation.DoubleAnimation da;

        public MainWindow()
        {
            InitializeComponent();

            da = new System.Windows.Media.Animation.DoubleAnimation(1, 10, new Duration(TimeSpan.FromSeconds(10)));
            

            GMap.NET.WindowsPresentation.GMapControl gMapControl = new GMap.NET.WindowsPresentation.GMapControl();

            gMapControl.MapProvider = GMap.NET.MapProviders.GoogleMapProvider.Instance;
            gMapControl.Zoom = 10;
            gMapControl.MinZoom = 5;
            gMapControl.MaxZoom = 20;
            gMapControl.PreviewMouseDown += new MouseButtonEventHandler(gMapControl_PreviewMouseDown);

            this.Content = gMapControl;
        }

        void gMapControl_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            ((GMap.NET.WindowsPresentation.GMapControl)this.Content).BeginAnimation(GMap.NET.WindowsPresentation.GMapControl.ZoomProperty, da);
        }
    }
}
