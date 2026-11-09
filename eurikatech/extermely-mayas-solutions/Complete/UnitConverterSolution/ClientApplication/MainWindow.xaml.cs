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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Maniyat.InformationInput unitInput;
        Maniyat.MultiInformationsCard unitCards;

        public MainWindow()
        {
            InitializeComponent();

            Maniyat.Database.ConnectionString = "Data Source=.\\sqlexpress;Initial Catalog=DataBridgeTest;Integrated Security=True;Pooling=False";
            Maniyat.Database.LogFilePath = "f:\\mas.txt";

            SolidColorBrush black = new SolidColorBrush(Colors.Black);
            SolidColorBrush red = new SolidColorBrush(Colors.Red);
            SolidColorBrush pink = new SolidColorBrush(Colors.Pink);

            Maniyat.Unit unit = new Maniyat.Unit();
           
            StringBuilder str = new StringBuilder();
            Int32 tab = 0;

            unitInput = new Maniyat.InformationInput(unit,ref tab, ref str);
            unitCards = new Maniyat.MultiInformationsCard(ref tab);

            unitInput.Background = pink;
            unitInput.Foreground = black;
            unitInput.WarningForeground = red;
            unitInput.WarningBackground = black;
            unitInput.Margin = new Thickness(5);
            unitInput.Values = unit;

            unitCards.CardWidth = 400;

            Grid.SetColumn(unitInput, 0);
            Grid.SetRow(unitInput, 0);

            mainGrd.Children.Add(unitInput);


            Grid.SetColumn(unitCards, 1);
            Grid.SetRow(unitCards, 0);

            mainGrd.Children.Add(unitCards);

            unitInput.Button1.Visibility = System.Windows.Visibility.Visible;
            unitInput.Button1.Content = "Run";
            unitInput.Button1.Click += new RoutedEventHandler(Button1_Click);


            load();
        }

        void Button1_Click(object sender, RoutedEventArgs e)
        {
            Maniyat.Database.Insert((Maniyat.Unit)unitInput.Values);

            unitCards.Items.Add((Maniyat.Unit)unitInput.Values);
            
        }

        private void btn_Click(object sender, RoutedEventArgs e)
        {
            //Maniyat.Unit unit = (Maniyat.Unit)unitCards.SelectedValue;
            //Maniyat.UnitConverter.SelectedUnit = unit;
            //tx2.Text = Maniyat.UnitConverter.ConvertToSelectedUnit(Double.Parse(tx1.Text)).ToString();

            Double value;

            Maniyat.UnitConverter.BaseUnitFactor = -100;
            Maniyat.UnitConverter.BaseUnitRoundType = Maniyat.RoundType.round;

            if (Double.TryParse(tx1.Text, out value))
            {
                tx2.Text = Maniyat.UnitConverter.Round(value).ToString();
            }
            else
                tx2.Text = "error input value";
        }

        private void load()
        {
            try
            {
                Maniyat.IDatabase[] result = Maniyat.Database.Select(new Maniyat.Unit());

                for (Int32 i = 0; i < result.Length; i++)
                    unitCards.Items.Add((Maniyat.Unit)result[i]);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }  
        }
    }
}
