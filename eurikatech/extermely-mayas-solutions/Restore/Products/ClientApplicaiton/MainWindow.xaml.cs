using System;
using System.Text;
using System.Windows;
using System.Windows.Media;

namespace ClientApplicaiton
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Maniyat.Database.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BlogDB;Integrated Security=True";
            Maniyat.Database.LogFilePath = "f:\\logSql.log";

            Int32 tabOrder = 0;
            StringBuilder str = new StringBuilder(":,-لآألأآ");
            Products.Course item = new Products.Course();
            item.InformationControls["id"].IsUsed = !true;
            Maniyat.InformationInput informationInput = new Maniyat.InformationInput(item, ref tabOrder, ref str);
            Maniyat.InformationOutput informationOutput = new Maniyat.InformationOutput(item, ref tabOrder, ref str);
            Maniyat.MultiInformationsGrid multiInformationGrid = new Maniyat.MultiInformationsGrid(item);

            informationInput.Margin = new Thickness(10);
            informationOutput.Margin = new Thickness(10);
            multiInformationGrid.Margin = new Thickness(10);

            informationInput.Foreground = informationOutput.Foreground = new SolidColorBrush(Colors.Red);
            informationInput.Padding = new Thickness(3);
            informationInput.Button1.Visibility = Visibility.Visible;
            informationInput.Button1.Content = "Add";
            informationInput.Button1.Click += new RoutedEventHandler(Button1_Click);

            informationInput.Button2.Visibility = Visibility.Visible;
            informationInput.Button2.Content = "Reset";
            informationInput.Button2.Click += new RoutedEventHandler(Button2_Click);

            informationOutput.ButtonUpdate.Click += new RoutedEventHandler(ButtonUpdate_Click);
            informationOutput.Padding = new Thickness(3);

            multiInformationGrid.InnerDataGrid.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(InnerDataGrid_SelectionChanged);

            informationInput.Values = item;
            informationOutput.Values = item;

            borderInput.Child = informationInput;
            borderGrid.Child = multiInformationGrid;
            borderOutput.Child = informationOutput;

            fillTable();
        }

        void InnerDataGrid_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            ((Maniyat.InformationOutput)borderOutput.Child).Values = (Products.Course)((Maniyat.MultiInformationsGrid)borderGrid.Child).SelectedValue;
        }

        void ButtonUpdate_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.MultiInformationsGrid)borderGrid.Child).Items.Clear();
        }

        void Button2_Click(object sender, RoutedEventArgs e)
        {
            fillTable();
        }

        void Button1_Click(object sender, RoutedEventArgs e)
        {
            Maniyat.Database.Insert((Products.Course)((Maniyat.InformationInput)borderInput.Child).Values);
            fillTable();
            ((Maniyat.InformationInput)borderInput.Child).Clear();
        }

        void fillTable()
        {
            ((Maniyat.MultiInformationsGrid)borderGrid.Child).Items.Clear();
            Maniyat.IDatabase[] items = Maniyat.Database.Select((Products.Course)((Maniyat.InformationInput)borderInput.Child).Values);

            for (Int32 i = 0; i < items.Length; i++)
                ((Maniyat.MultiInformationsGrid)borderGrid.Child).Items.Add((Products.Course)items[i]);
        }

        private void btn1_Click(object sender, RoutedEventArgs e)
        {
            Window1 win = new Window1();
            win.Show();
            this.Hide();
        }

        private void btn2_Click(object sender, RoutedEventArgs e)
        {
            Window2 win = new Window2();
            win.Show();
            this.Hide();
        }

        private void btn3_Click(object sender, RoutedEventArgs e)
        {
            Window3 win = new Window3();
            win.Show();
            this.Hide();
        }
    }
}
