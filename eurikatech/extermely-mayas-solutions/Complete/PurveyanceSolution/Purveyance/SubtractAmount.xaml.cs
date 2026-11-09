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
    /// Interaction logic for SubtractAmount.xaml
    /// </summary>
    public partial class SubtractAmount : Window
    {
        //public constructures region
        public SubtractAmount(Window callerWindow,Material material,Income income)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
            this.material = material;
            this.income = income;

            txN.Text = "1";

            if (material != null)
            {
                lbPurveyance.Text = material.Name;

                if (income != null)
                    lbPurveyance.Text += Environment.NewLine + income.ToString();

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));

                
            }
        }

        //public events region
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

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();

            this.Close();
        }

        private void lsOutcome_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            btnEdit.IsEnabled = btnDelete.IsEnabled = lsOutcome.SelectedItem != null;
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Outcome selectedItem = (Outcome)lsOutcome.SelectedItem;

            if (MessageBox.Show("المتابعة في عملية حذف الدفعة؟", "حذف دفعة", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    Database.Delete(selectedItem);

                    loadOutcomes();
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                }
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            SubtractAmountDetails subtract = new SubtractAmountDetails(this, material, income, (Outcome)lsOutcome.SelectedItem);

            subtract.Show();
        }

        private void btnRemove_Click(object sender, RoutedEventArgs e)
        {
            SubtractAmountDetails subtract = new SubtractAmountDetails(this, material, income, null);

            subtract.Show();
        }

        private void btnRemoveN_Click(object sender, RoutedEventArgs e)
        {
            Int32 n = Int32.Parse(txN.Text);

            if (n <= income.Amount - income.MinusAmount)
            {
                SubtractAmountDetailsN subtractN = new SubtractAmountDetailsN(this, material, income, Convert.ToInt32(txN.Text));

                subtractN.Show();
            }
            else
                MessageBox.Show("لا يوجد في هذه الدفعة كمية كافية, المتبقي من تلك الدفعة هو " + (income.Amount - income.MinusAmount).ToString(), "توزيع دفعة غير ممكن", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void lsOutcome_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            SubtractAmountDetails subtract = new SubtractAmountDetails(this, material, income, (Outcome)lsOutcome.SelectedItem);

            subtract.Show();
        }

        private void Window_Activated_1(object sender, EventArgs e)
        {
            loadOutcomes();

            if (material != null)
            {
                lbPurveyance.Text = material.ToString();

                if (income != null)
                {
                    income.MinusAmount = Database.GetMinusAmount(income);
                    lbPurveyance.Text += Environment.NewLine + income.ToString();
                }
            }
        }

        //private functions region
        private void loadOutcomes()
        {
            Outcome[] outcome = Database.GetOutcome(income);

            lsOutcome.Items.Clear();

            foreach (Outcome oc in outcome)
                lsOutcome.Items.Add(oc);
        }

        //private fields region
        private Window callerWindow;
        private Material material;
        private Income income;
    }
}
