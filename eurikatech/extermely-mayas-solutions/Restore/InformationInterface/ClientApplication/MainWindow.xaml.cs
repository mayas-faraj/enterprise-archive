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
        private Person ps;

        public MainWindow()
        {
            InitializeComponent();

            ps = new Person();
            Person[] pss = new Person[5];

            pss[0] = new Person();
            pss[0].Name = "Mayas";
            pss[0].Age = 50;
            pss[0].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Desert.jpg";
            pss[0].Weight = 40;

            pss[1] = new Person();
            pss[1].Name = "Ali";
            pss[1].Age = 40;
            pss[1].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Jellyfish.jpg";
            pss[1].Weight = 50;

            pss[2] = new Person();
            pss[2].Name = "Zaher";
            pss[2].Age = 30;
            pss[2].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Desert.jpg";
            pss[2].Weight = 60;

            pss[3] = new Person();
            pss[3].Name = "Mohammad";
            pss[3].Age = 20;
            pss[3].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Koala.jpg";
            pss[3].Weight = 70;

            pss[4] = new Person();
            pss[4].Name = "Nour";
            pss[4].Age = 10;
            pss[4].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Tulips.jpg";
            pss[4].Weight = 80;

            Button btnAdd = new Button();
            Button btnClear = new Button();

            LinearGradientBrush lgb = new LinearGradientBrush();
            lgb.GradientStops.Add(new GradientStop(Colors.Yellow, 0));
            lgb.GradientStops.Add(new GradientStop(Colors.Green, 1));

            LinearGradientBrush lgb2 = new LinearGradientBrush();
            lgb2.GradientStops.Add(new GradientStop(Colors.Black, 0));
            lgb2.GradientStops.Add(new GradientStop(Colors.Silver, 1));

            
            Maniyat.Information.Background = lgb;
            Maniyat.Information.Foreground = new SolidColorBrush(Colors.Black);
            Maniyat.Information.Margin = new Thickness(6);

            Maniyat.Information.ParentControl = this.scViewer1;
            Maniyat.Information.ToInput(ps,out btnAdd,out btnClear);

            Maniyat.Information.ParentControl = this.scViewer2;
            Maniyat.Information.ToList(pss, true, 40, 40);

            btnAdd.Click += new RoutedEventHandler(AddButton_Click);
        }

        void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Maniyat.Information.ToOutput(ps);
        }
    }
}
