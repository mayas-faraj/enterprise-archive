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
    /// Interaction logic for frmMain.xaml
    /// </summary>
    public partial class frmMain : Window
    {
        //public constructions region
        public frmMain(Library.User currentUser)
        {
            InitializeComponent();

            user = currentUser;
        }

        //private events region
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnMaps_Click(object sender, RoutedEventArgs e)
        {
            frmMaps fmaps = new frmMaps(this);
            fmaps.Show();

            this.Hide();
        }

        private void btnOperation_Click(object sender, RoutedEventArgs e)
        {
            frmOperation fOperation = new frmOperation(this, user);
            fOperation.Show();

            this.Hide();
        }

        private void btnOperations_Click(object sender, RoutedEventArgs e)
        {
            frmOperations fOperations = new frmOperations(this, user);
            fOperations.Show();

            this.Hide();
        }

        private void btnUsers_Click(object sender, RoutedEventArgs e)
        {
            frmUsers fUser = new frmUsers(this);
            fUser.Show();

            this.Hide();
        }

        private void btnConnections_Click(object sender, RoutedEventArgs e)
        {
            frmDataConnection fDC = new frmDataConnection();
            fDC.Show();

            this.Hide();
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            frmAbout fAbout = new frmAbout(this);
            fAbout.Show();

            this.Hide();
        }

        //private fields region
        private Library.User user;
    }
}
