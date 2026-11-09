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

namespace Purveyance
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            AboutWindow about = new AboutWindow();
            about.Show();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void btnPurveyance_Click(object sender, RoutedEventArgs e)
        {
            PurveyancesWindow purveyance = new PurveyancesWindow(this);
            purveyance.Show();

            this.Hide();
        }

        private void btnMaterials_Click(object sender, RoutedEventArgs e)
        {
            MaterialsWindow materials = new MaterialsWindow(this);
            materials.Show();

            this.Hide();
        }

        private void btnMoney_Click(object sender, RoutedEventArgs e)
        {
            BalanceWindow balance = new BalanceWindow(this);

            balance.Show();
            this.Hide();
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            SearchWindow search = new SearchWindow(this, null);

            search.Show();
            this.Hide();
        }

        private void Window_Closing_1(object sender, System.ComponentModel.CancelEventArgs e)
        {
            UI.Exit(e);
        }
    }
}
