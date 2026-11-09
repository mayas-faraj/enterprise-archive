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
        private Maniyat.InformationOutput outInfo;
        private Maniyat.MultiInformationsCard cards;
        private Maniyat.MultiInformationsList list;

        public MainWindow()
        {
            InitializeComponent();

            Int32 tab = 0;
            StringBuilder str = new StringBuilder();
            Maniyat.ItemStyle cardStyle = new Maniyat.ItemStyle();

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

            outInfo = new Maniyat.InformationOutput(ps, ref tab, ref str);
            outInfo.Values = null;

            cards = new Maniyat.MultiInformationsCard(ref tab);
            cards.Margin = new Thickness(5);
            cards.CardOpacity = 0.55;
            cards.CardWidth = 350;
            cards.CardHeight = 280;
            cards.CardPadding = new Thickness(5);
            cards.CardActiveOpacity = 0.99;
            cards.CardStyle = cardStyle;
            cards.ItemMouseCLick += new RoutedEventHandler(cards_CardMouseCLick);
            cards.MouseClickActivate = Maniyat.MultiInformationsCard.ActivateMode.fadingTransparency;

            RadialGradientBrush lgb = new RadialGradientBrush();
            lgb.GradientStops.Add(new GradientStop(Colors.Silver, 0));
            lgb.GradientStops.Add(new GradientStop(Colors.Black, 1));

            LinearGradientBrush lgb2 = new LinearGradientBrush();
            lgb2.GradientStops.Add(new GradientStop(Colors.Red, 0));
            lgb2.GradientStops.Add(new GradientStop(Colors.Yellow, 1));

            cardStyle.Background = lgb;
            cardStyle.TitlesForeground = new SolidColorBrush(Colors.LightGreen);
            cardStyle.ValuesForeground = new SolidColorBrush(Colors.Pink);
            cardStyle.BorderThikness = new Thickness(5);
            cardStyle.BorderBrush = lgb2;
            cardStyle.CornerRadius = new CornerRadius(10);

            list = new Maniyat.MultiInformationsList();
            list.ItemWidth = 300;//Convert.ToInt32(list.Width);
            list.ItemHeight = 200;
            list.ItemStyle = cardStyle;
            list.SelectedItemChanged += new RoutedEventHandler(list_SelectedItemChanged);
            list.SelectionMode = SelectionMode.Extended;

            for (Int32 i = 0; i < pss.Length; i++)
            {
                cards.Items.Add((Person)pss[i]);
                list.Items.Add((Person)pss[i]);
            }

            cards.Items.Add(ps);
            list.Items.Add((ps));

            Grid.SetColumn(outInfo, 0);
            Grid.SetColumn(list, 1);

            grd.Children.Add(outInfo);
            grd.Children.Add(list);
        }

        void list_SelectedItemChanged(object sender, RoutedEventArgs e)
        {
            if (((ListBox)sender).SelectedItem != null)
                outInfo.Values = ((Maniyat.Card)((ListBox)sender).SelectedItem).Item;
            else
                outInfo.Clear();
        }

        void cards_CardMouseCLick(object sender, RoutedEventArgs e)
        {
            outInfo.Values = ((Maniyat.Card)sender).Item;
        }

        private void btn1_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).Margin = new Thickness(4);
        }

        private void btn2_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).Background = new SolidColorBrush(Colors.LightBlue);
        }

        private void btn3_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).Foreground = new SolidColorBrush(Colors.DarkBlue);
        }

        private void btn4_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).VerticalContentAlignment = System.Windows.VerticalAlignment.Bottom;
        }

        private void btn5_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).HorizontalContentAlignment = System.Windows.HorizontalAlignment.Center;
        }

        private void btn6_Click(object sender, RoutedEventArgs e)
        {
            ((Maniyat.Information)grd.Children[0]).Clear();
        }

        private void btn7_Click(object sender, RoutedEventArgs e)
        {
        }
    }
}
