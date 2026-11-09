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
    /// Interaction logic for BalanceWindow.xaml
    /// </summary>
    public partial class BalanceWindow : Window
    {
        //public constructures region
        public BalanceWindow(Window callerWindow)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;

            loadMaterials();

            dpFrom.SelectedDate = dpTo.SelectedDate = DateTime.Now;
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

        private void btnCalculator_Click(object sender, RoutedEventArgs e)
        {
            System.Diagnostics.Process.Start(System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "calc.exe"));
        }

        private void btnMath_Click(object sender, RoutedEventArgs e)
        {
            if (lsMaterials.SelectedItem != null)
            {
                Material material = (Material)((StackPanel)lsMaterials.SelectedItem).Tag;

                if (rbAll.IsChecked == true)
                {
                    txAmountIn.Text = Database.GetIncomeAmount(material, txWords.Text).ToString();
                    txBuyPrice.Text = Database.GetIncomeBuyPrice(material, txWords.Text).ToString();
                    txTransportCostIn.Text = Database.GetIncomeTransportCost(material, txWords.Text).ToString();
                    txOtherCostIn.Text = Database.GetIncomeOtherCost(material, txWords.Text).ToString();

                    txAmountOut.Text = Database.GetOutcomeAmount(material, txWords.Text).ToString();
                    txSellPrice.Text = Database.GetOutcomeSellPrice(material, txWords.Text).ToString();
                    txTransportCostOut.Text = Database.GetOutcomeTransportCost(material, txWords.Text).ToString();
                    txOtherCostOut.Text = Database.GetOutcomeOtherCost(material, txWords.Text).ToString();

                    txBalance.Text = (Single.Parse(txSellPrice.Text) - (Single.Parse(txBuyPrice.Text) + Single.Parse(txTransportCostIn.Text) + Single.Parse(txTransportCostOut.Text) + Single.Parse(txOtherCostIn.Text) + Single.Parse(txOtherCostOut.Text))).ToString();
                }
                else
                {
                    txAmountIn.Text = Database.GetIncomeAmount(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txBuyPrice.Text = Database.GetIncomeBuyPrice(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txTransportCostIn.Text = Database.GetIncomeTransportCost(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txOtherCostIn.Text = Database.GetIncomeOtherCost(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();

                    txAmountOut.Text = Database.GetOutcomeAmount(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txSellPrice.Text = Database.GetOutcomeSellPrice(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txTransportCostOut.Text = Database.GetOutcomeTransportCost(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();
                    txOtherCostOut.Text = Database.GetOutcomeOtherCost(material, txWords.Text, Convert.ToDateTime(dpFrom.SelectedDate), Convert.ToDateTime(dpTo.SelectedDate)).ToString();

                    txBalance.Text = (Single.Parse(txSellPrice.Text) - (Single.Parse(txBuyPrice.Text) + Single.Parse(txTransportCostIn.Text) + Single.Parse(txTransportCostOut.Text) + Single.Parse(txOtherCostIn.Text) + Single.Parse(txOtherCostOut.Text))).ToString();
                }
            }
            else
                MessageBox.Show("يجب أختيار المادة أعلاه", "حساب الرصيد", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        //private functions region
        private void loadMaterials()
        {
            Material[] materials = Database.GetMaterials();

            lsMaterials.Items.Clear();

            foreach (Material material in materials)
            {
                StackPanel stack = new StackPanel();
                stack.Orientation = Orientation.Horizontal;
                stack.Tag = material;

                TextBlock text = new TextBlock();
                text.FontSize = (Double)App.Current.Resources["fontSize"];
                text.Foreground = (Brush)App.Current.Resources["texts"];
                text.Text = material.Name;
                stack.Children.Add(text);

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                {
                    Image image = new Image();
                    image.Width = image.Height = 50;
                    image.Stretch = Stretch.Fill;
                    image.Source = new BitmapImage(new Uri(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")));
                    stack.Children.Add(image);
                }

                lsMaterials.Items.Add(stack);
            }
        }

        //private fields region
        private Window callerWindow; 
    }
}
