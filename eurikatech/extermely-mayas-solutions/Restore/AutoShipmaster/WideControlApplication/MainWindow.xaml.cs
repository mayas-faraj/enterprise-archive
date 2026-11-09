using System;
using System.Windows;
using System.Windows.Controls;
using System.Runtime.InteropServices;

namespace WideControlApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //public constructions region
        public MainWindow()
        {
            InitializeComponent();

            serialPost = new System.IO.Ports.SerialPort("COM1", 5200, System.IO.Ports.Parity.None);
            serialPost.Open();

            timer = new System.Timers.Timer(3000);
            timer.Enabled = false;
            timer.Elapsed += new System.Timers.ElapsedEventHandler(timer_Elapsed);

            timer_Elapsed(null, null);
            setAutomaticMode();
        }

        //private events region
        private void btnManual_Click(object sender, RoutedEventArgs e)
        {
            setManualMode();
        }

        private void btnAutomatic_Click(object sender, RoutedEventArgs e)
        {
            setAutomaticMode();
        }

        private void btnUp_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btnRight_Click(object sender, RoutedEventArgs e)
        {
            serialPost.RtsEnable = !serialPost.RtsEnable;
        }

        private void btnLeft_Click(object sender, RoutedEventArgs e)
        {
            serialPost.DtrEnable = !serialPost.DtrEnable;
        }

        private void btnDown_Click(object sender, RoutedEventArgs e)
        {
            serialPost.Close();
        }

        private void timer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            Library.OrderCollection orders;
            Library.Internet.Recived(out orders);

            if (orders != null)
                MessageBox.Show(orders.ToString());
        }

        //private functions region
        [DllImport("inpout32.dll", EntryPoint = "Out32")]
        public static extern void Output(int address, int value);

        private void setAutomaticMode()
        {
            timer.Enabled = true;
            btnAutomatic.IsEnabled = false;
            btnManual.IsEnabled = true;
            btnUp.IsEnabled = btnLeft.IsEnabled = btnRight.IsEnabled = btnDown.IsEnabled = sliderVelocity.IsEnabled = false;
        }

        private void setManualMode()
        {
            timer.Enabled = false;
            btnAutomatic.IsEnabled = true;
            btnManual.IsEnabled = false;
            btnUp.IsEnabled = btnLeft.IsEnabled = btnRight.IsEnabled = btnDown.IsEnabled = sliderVelocity.IsEnabled = true;
        }

        //private fields region
        private System.Timers.Timer timer;
        private System.IO.Ports.SerialPort serialPost;
    }
}
