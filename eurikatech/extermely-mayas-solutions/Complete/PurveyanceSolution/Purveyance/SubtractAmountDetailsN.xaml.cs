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
    /// Interaction logic for SubtractAmountDetailsN.xaml
    /// </summary>
    public partial class SubtractAmountDetailsN : Window
    {
        public SubtractAmountDetailsN(Window callerWindow, Material material, Income income, Int32 n)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
            this.material = material;
            this.income = income;
            this.n = n;

            if (material != null)
            {
                lbPurveyance.Text = material.Name;

                if (income != null)
                    lbPurveyance.Text += Environment.NewLine + income.ToString();

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));

                txSellPrice.Text = material.DefaultSellPrice.ToString();
            }

            txTransport.Text = txOther.Text = "0";
            dpDate.SelectedDate = DateTime.Now;

            for (Int32 i = 0; i < n; i++)
            {
                TextBox txClient = new TextBox();
                
                txClient.Margin = (Thickness)App.Current.Resources["margin"];
                txClient.Foreground = (Brush)App.Current.Resources["texts"];
                txClient.Background = (Brush)App.Current.Resources["textBoxes"];
                txClient.FontSize = (Double)App.Current.Resources["fontSize"];
                
                TextBox txCount = new TextBox();
                txCount.Margin = (Thickness)App.Current.Resources["margin"];
                txCount.Foreground = (Brush)App.Current.Resources["texts"];
                txCount.Background = (Brush)App.Current.Resources["textBoxes"];
                txCount.FontSize = (Double)App.Current.Resources["fontSize"];

                stackClients.Children.Add(txClient);
                stackAmounts.Children.Add(txCount);
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

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            for (Int32 i = 0; i < n; i++)
            {
                Outcome outcome = new Outcome();

                outcome.Income = income;
                outcome.SellPrice = Convert.ToSingle(txSellPrice.Text);
                outcome.Description = txDescription.Text;
                outcome.TransportCost = Convert.ToSingle(txTransport.Text);
                outcome.OtherCosts = Convert.ToSingle(txOther.Text);
                outcome.Date = Convert.ToDateTime(dpDate.SelectedDate);

                outcome.Client = ((TextBox)stackClients.Children[i]).Text;

                try
                {
                    outcome.Amount = Convert.ToSingle(((TextBox)stackAmounts.Children[i]).Text);
                }
                catch(Exception ex)
                {
                    UI.ErrorMessage(ex);
                    return;
                }

                Database.Save(outcome);
                callerWindow.Show();
                this.Close();
            }
        }

        //private fields region
        private Window callerWindow;
        private Material material;
        private Income income;
        private Int32 n;
    }
}
