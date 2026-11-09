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
    /// Interaction logic for SearchWindow.xaml
    /// </summary>
    public partial class SearchWindow : Window
    {
        public SearchWindow(Window callerWindow,Material material)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;

            calendar.SelectedDate = DateTime.Now;

            if (material == null)
            {
                lbPurveyance.Visibility = System.Windows.Visibility.Collapsed;
                imgPurveyance.Visibility = System.Windows.Visibility.Collapsed;
                lbMetarial.Visibility = System.Windows.Visibility.Visible;
                lsMaterials.Visibility = System.Windows.Visibility.Visible;

                loadMaterials();
            }
            else
            {
                this.material = material;

                lbPurveyance.Visibility = System.Windows.Visibility.Visible;
                imgPurveyance.Visibility = System.Windows.Visibility.Visible;
                lbMetarial.Visibility = System.Windows.Visibility.Collapsed;
                lsMaterials.Visibility = System.Windows.Visibility.Collapsed;

                lbPurveyance.Text = material.Name;

                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                    imgPurveyance.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo\\" + material.Name + ".gif"));     
            }

            loadGrid();
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
            System.Diagnostics.Process.Start(System.IO.Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "calc.exe"));
        }

        private void lsMaterials_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lsMaterials.SelectedItem != null)
            {
                this.material = (Material)((StackPanel)lsMaterials.SelectedItem).Tag;

                dgMain.Items.Clear();
            }
        }

        private void calendar_MouseUp(object sender, MouseButtonEventArgs e)
        {

        }

        private void btnMath_Click(object sender, RoutedEventArgs e)
        {
            if (material == null)
                MessageBox.Show("لم يتم تحديد مادة للعرض الأجمالي", "العرض الأجمالي", MessageBoxButton.OK, MessageBoxImage.Information);

            loadGrid();
        } 

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

        private void loadGrid()
        {
            if (calendar.SelectedDate != null && material != null)
            {
                Int32 year = calendar.SelectedDate.Value.Year;
                Int32 month = calendar.SelectedDate.Value.Month;
                Int32 days = DateTime.DaysInMonth(year, month);
                Overall[] overall = new Overall[days];

                for (Int32 i = 0; i < days; i++)
                    if (txSearch.Text == "")
                        overall[i] = Database.GetOverall(material, new DateTime(year, month, i + 1));
                    else
                        overall[i] = Database.GetOverall(material, new DateTime(year, month, i + 1), txSearch.Text);

                dgMain.ItemsSource = overall;

                if (dgMain.Columns.Count >= 11)
                {
                    dgMain.Columns[0].Header = "المادة";
                    dgMain.Columns[1].Header = "التاريخ";
                    dgMain.Columns[2].Header = "المزود";
                    dgMain.Columns[3].Header = "الكمية الواردة";
                    dgMain.Columns[4].Header = "تكاليف الأستيراد";
                    dgMain.Columns[5].Header = "المبلغ الصادر";
                    dgMain.Columns[6].Header = "الزبائن";
                    dgMain.Columns[7].Header = "الكمية الصادرة";
                    dgMain.Columns[8].Header = "تكاليف التصدير";
                    dgMain.Columns[9].Header = "المبلغ الوارد";
                    dgMain.Columns[10].Header = "الرصيد";

                    dgMain.Columns[0].Width = new DataGridLength(1, DataGridLengthUnitType.Star);
                    dgMain.Columns[1].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[2].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[3].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[4].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[5].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[6].Width = new DataGridLength(5, DataGridLengthUnitType.Star);
                    dgMain.Columns[7].Width = new DataGridLength(1, DataGridLengthUnitType.Star);
                    dgMain.Columns[8].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[9].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                    dgMain.Columns[10].Width = new DataGridLength(2, DataGridLengthUnitType.Star);
                }
            }
        }
        
        private Window callerWindow;
        private Material material; 
    }
}
