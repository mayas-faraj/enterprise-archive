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
using System.Windows.Shapes;

namespace Purveyance
{
    /// <summary>
    /// Interaction logic for PurveyanceWindow.xaml
    /// </summary>
    public partial class PurveyanceWindow : Window
    {
        //public constructures region
        public PurveyanceWindow(Window callerWindow, Material material)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
            this.material = material;

            if (material != null)
            {
                lbPurveyance.Text = material.Name;

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo\\" + material.Name + ".gif"));
            }
        }

        //private events region
        private void Window_Activated_1(object sender, EventArgs e)
        {
            loadAmounts();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();

            this.Close();
        }        

        private void btnCalculator_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                System.Diagnostics.Process.Start(System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "calc.exe"));
            }
            catch (Exception ex)
            {
                UI.ErrorMessage(ex);
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddAmountWindow addAmount = new AddAmountWindow(this, material, null);

            addAmount.Show();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            AddAmountWindow addAmount = new AddAmountWindow(this, material, (Income)lsAmounts.SelectedItem);

            addAmount.Show();
        }

        private void btnManage_Click(object sender, RoutedEventArgs e)
        {
            SubtractAmount subtract = new SubtractAmount(this, material, (Income)lsAmounts.SelectedItem);
            subtract.Show();

            this.Hide();
        }

        private void lsAmounts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            btnDelete.IsEnabled = btnEdit.IsEnabled = btnManage.IsEnabled = lsAmounts.SelectedItem != null;
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Income selectedItem = (Income)lsAmounts.SelectedItem;

            if (MessageBox.Show("المتابعة في عملية حذف الدفعة؟", "حذف دفعة", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    Database.Delete(selectedItem);

                    loadAmounts();
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                }
            }
        }

        private void lsAmounts_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            AddAmountWindow addAmount = new AddAmountWindow(this, material, (Income)lsAmounts.SelectedItem);

            addAmount.Show();
        }

        private void chkActiveAmount_Click(object sender, RoutedEventArgs e)
        {
            loadAmounts();
        }

        //private functions region
        private void loadAmounts()
        {
            Income[] income = Database.GetIncome(material);

            lsAmounts.Items.Clear();

            foreach (Income inc in income)
                if (chkActiveAmount.IsChecked != true || ((inc.Amount - inc.MinusAmount) > 0))
                    lsAmounts.Items.Add(inc);
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            SearchWindow search = new SearchWindow(this, material);

            search.Show();
            this.Hide();
        }

        //private fields region
        private Window callerWindow;

        private Material material;
    }
}
