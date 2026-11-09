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
    /// Interaction logic for AddAmountWindow.xaml
    /// </summary>
    public partial class AddAmountWindow : Window
    {
        public AddAmountWindow(Window callerWindow, Material material, Income income)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
            this.material = material;

            if (material != null)
            {
                lbPurveyance.Text = material.Name;

                if (income != null)
                    lbPurveyance.Text += Environment.NewLine + income.ToString();

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));

                txAmount.Text = material.DefaultAmount.ToString();
                txBuyPrice.Text = material.DefaultBuyPrice.ToString();
                txVendor.Text = material.DefaultVendor;
            }

            if (income != null)
            {
                isEdit = true;
                incomeId = income.Id;

                txVendor.Text = income.Vendor.ToString();
                txAmount.Text = income.Amount.ToString();
                txBuyPrice.Text = income.BuyPrice.ToString();
                txTransport.Text = income.TransportCost.ToString();
                txOther.Text = income.OtherCosts.ToString();
                txDescription.Text = income.Description;
                dpDate.SelectedDate = income.Date;
            }
            else
                dpDate.SelectedDate = DateTime.Now;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();

            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            Income income = new Income();

            income.Vendor = txVendor.Text;
            income.Description = txDescription.Text;
            income.Date = Convert.ToDateTime(dpDate.SelectedDate);

            try
            {
                income.Amount = Convert.ToSingle(txAmount.Text);
                income.BuyPrice = Convert.ToSingle(txBuyPrice.Text);
                income.OtherCosts = Convert.ToSingle(txOther.Text);
                income.TransportCost = Convert.ToSingle(txTransport.Text);
            }
            catch (Exception ex)
            {
                UI.ErrorMessage(ex);
            }

            if (isEdit)
            {
                income.Id = incomeId;

                try
                {
                    Database.Update(income);
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                    return;
                }

                callerWindow.Show();
                this.Close();
            }
            else
            {
                try
                {
                    income.Material = material;

                    Database.Save(income);
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                    return;
                }
            }

            callerWindow.Show();
            this.Close();
        }

        private void Window_Closing_1(object sender, System.ComponentModel.CancelEventArgs e)
        {
            UI.Exit(e);
        }

        private Window callerWindow;
        private Boolean isEdit;
        private Int32 incomeId;
        private Material material;        
    }
}
