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

namespace ClientApplicationWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            LinearGradientBrush lgbRow = new LinearGradientBrush();
            LinearGradientBrush lgbARow = new LinearGradientBrush();

            lgbRow.GradientStops.Add(new GradientStop(Colors.Pink, 0));
            lgbRow.GradientStops.Add(new GradientStop(Colors.LightBlue, 1));

            lgbARow.GradientStops.Add(new GradientStop(Colors.LightBlue, 0));
            lgbARow.GradientStops.Add(new GradientStop(Colors.Pink, 1));

            Person ps = new Person();
            ps.Name = "Mezo Farjo";
            ps.Age = 60;
            ps.BirthDate = new DateTime(1986, 8, 24);
            ps.Weight = 40.5;
            ps.Password = "123";
            ps.IsMarried = true;
            ps.FileStorage = "C:\\windows\\program files\\log.txt";
            ps.FolderStorage = "C:\\interpub\\wwroot";
            ps.ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Desert.jpg";
            ps.HairColor = Colors.Gray;
            ps.InformationControls["ImagePath"].IsUsed = true;

            Person[] pss = new Person[5];
            
            pss[0] = new Person(ps.InformationControls);
            pss[0].Name = "Mayas";
            pss[0].Age = 50;
            pss[0].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Desert.jpg";
            pss[0].Weight = 40;


            pss[1] = new Person(ps.InformationControls);
            pss[1].Name = "Ali";
            pss[1].Age = 40;
            pss[1].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Jellyfish.jpg";
            pss[1].Weight = 50;

            pss[2] = new Person(ps.InformationControls);
            pss[2].Name = "Zaher";
            pss[2].Age = 30;
            pss[2].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Desert.jpg";
            pss[2].Weight = 60;

            pss[3] = new Person(ps.InformationControls);
            pss[3].Name = "Mohammad";
            pss[3].Age = 20;
            pss[3].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Koala.jpg";
            pss[3].Weight = 70;

            pss[4] = new Person(ps.InformationControls);
            pss[4].Name = "Nour";
            pss[4].Age = 10;
            pss[4].ImagePath = "C:\\Users\\Public\\Pictures\\Sample Pictures\\Tulips.jpg";
            pss[4].Weight = 80;

            Maniyat.MultiInformationsGrid grid = new Maniyat.MultiInformationsGrid(ps);
            grid.HorizontalContentAlignment = HorizontalAlignment.Center;
            grid.RowBackground = lgbRow;
            grid.AlternatingRowBackground = lgbARow;
            

            scrollviewer.Children.Add(grid);

            for (Int32 i = 0; i < pss.Length; i++)
                grid.Items.Add(pss[i]);

            grid.Items.Add(ps);
        }
    }
}
