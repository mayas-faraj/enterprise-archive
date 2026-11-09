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

namespace AutoShipmaster
{
    /// <summary>
    /// Interaction logic for frmAbout.xaml
    /// </summary>
    public partial class frmAbout : Window
    {
        public frmAbout(Window caller)
        {
            InitializeComponent();

            callerWindow = caller;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();
            this.Close();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (callerWindow.Visibility != System.Windows.Visibility.Visible)
                callerWindow.Close();
        }

        private Window callerWindow;
    }
}
