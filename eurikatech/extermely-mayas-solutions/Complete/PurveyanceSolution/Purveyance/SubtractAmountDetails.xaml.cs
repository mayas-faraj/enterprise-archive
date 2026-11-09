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
    /// Interaction logic for SubtractAmountDetails.xaml
    /// </summary>
    public partial class SubtractAmountDetails : Window
    {
        //public constructures region
        public SubtractAmountDetails(Window callerWindow, Material material, Income income, Outcome outcome)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
            this.material = material;
            this.income = income;

            txAmount.Text = "1";
            txTransport.Text = txOther.Text = "0";
            dpDate.SelectedDate = DateTime.Now;

            if (material != null)
            {
                lbPurveyance.Text = material.Name;

                if (income != null)
                    lbPurveyance.Text += Environment.NewLine + income.ToString();

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));

                txSellPrice.Text = material.DefaultSellPrice.ToString();
            }

            if (outcome != null)
            {
                isEdit = true;
                outcomeId = outcome.Id;

                txClient.Text = outcome.Client;
                txAmount.Text = outcome.Amount.ToString();
                txSellPrice.Text = outcome.SellPrice.ToString();
                txTransport.Text = outcome.TransportCost.ToString();
                txOther.Text = outcome.OtherCosts.ToString();
                txDescription.Text = outcome.Description;
            }
        }

        //private events region
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
            if ((income.Amount - income.MinusAmount) >= Convert.ToSingle(txAmount.Text))
            {
                Outcome outcome = new Outcome();

                outcome.Client = txClient.Text;
                outcome.Description = txDescription.Text;
                outcome.Date = Convert.ToDateTime(dpDate.SelectedDate);

                try
                {
                    outcome.Amount = Convert.ToSingle(txAmount.Text);
                    outcome.SellPrice = Convert.ToSingle(txSellPrice.Text);
                    outcome.TransportCost = Convert.ToSingle(txTransport.Text);
                    outcome.OtherCosts = Convert.ToSingle(txOther.Text);
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                }

                if (isEdit)
                {
                    try
                    {
                        outcome.Id = outcomeId;
                        outcome.Income = income;

                        Database.Update(outcome);
                    }
                    catch (Exception ex)
                    {
                        UI.ErrorMessage(ex);
                        return;
                    }
                }
                else
                {
                    try
                    {
                        outcome.Income = income;

                        Database.Save(outcome);
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
            else
                MessageBox.Show("لا يوجد في هذه الدفعة كمية كافية, المتبقي من تلك الدفعة هو " + (income.Amount - income.MinusAmount).ToString(), "توزيع دفعة غير ممكن", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        //private fields region
        private Window callerWindow;
        private Material material;
        private Income income;
        private Int32 outcomeId;
        private Boolean isEdit;
    }
}
