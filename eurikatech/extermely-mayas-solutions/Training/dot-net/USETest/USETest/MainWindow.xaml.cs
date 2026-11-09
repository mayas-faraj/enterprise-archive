using System;
using System.IO.Ports;
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

namespace USETest
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            foreach (String port in SerialPort.GetPortNames())
                cmbPorts.Items.Add(port);


        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            SerialPort com = new SerialPort(cmbPorts.Text, Convert.ToInt32(txbBitRate.Text));

            com.Open();
            
        }
    }
}
