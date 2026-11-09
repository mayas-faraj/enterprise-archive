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
    /// Interaction logic for PurveyancesWindow.xaml
    /// </summary>
    public partial class PurveyancesWindow : Window
    {
        public PurveyancesWindow(Window callerWindow)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
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

        private void Window_Activated_1(object sender, EventArgs e)
        {
            pnlMain.Children.Clear();

            Material[] materials = Database.GetMaterials();

            foreach (Material material in materials)
            {
                Button button = new Button();
                StackPanel panel = new StackPanel();
                TextBlock text = new TextBlock();
                Image image = new Image();

                text.Text = material.Name;
                text.FontSize = (Double)App.Current.Resources["fontSize"];
                text.Foreground = (Brush)App.Current.Resources["buttonTexts"];
                text.Margin = (Thickness)App.Current.Resources["margin"];
                text.Effect = new System.Windows.Media.Effects.DropShadowEffect();
                text.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
                
                if (System.IO.File.Exists(System.IO.Path.Combine(UI.GetCurrentDirectory(), "Logo\\" + material.Name + ".gif")))
                {
                    image.Width = image.Height = 100;
                    image.Margin = (Thickness)App.Current.Resources["margin"];
                    image.Source = new BitmapImage(new Uri("pack://siteoforigin:,,,/Logo/" + material.Name + ".gif"));
                }

                button.Background = (Brush)App.Current.Resources["buttons"];
                button.Margin = (Thickness)App.Current.Resources["margin"];

                panel.Children.Add(text);
                panel.Children.Add(image);

                button.Tag = material;
                button.Click += button_Click;
                button.Content = panel;

                pnlMain.Children.Add(button);
            }
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            PurveyanceWindow purveyances = new PurveyanceWindow(this, (Material)((Button)sender).Tag);

            purveyances.Show();
            this.Hide();
        }

        private Window callerWindow;
    }
}
