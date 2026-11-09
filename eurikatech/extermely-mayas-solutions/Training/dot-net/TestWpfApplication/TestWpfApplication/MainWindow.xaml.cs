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
using frm = System.Windows.Forms;

namespace TestWpfApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 
    public partial class MainWindow : Window
    {
        private frm.Timer tmr;
        private Double i;
        private Boolean left;

        public MainWindow()
        {
            InitializeComponent();  
        }

        void tmr_Tick(object sender, EventArgs e)
        {

            if ((i < 1) && !left)
                i += 0.01;
            else
            {
                if ((i > 0))
                {
                    left = true;
                    i -= 0.05;
                }
                else
                    left = false;
            }
        }

        public void eventBtn_Click(Object sender, RoutedEventArgs e)
        {
            Button btn = new Button();
            btn.Content = "New Button";
            btn.Background = ((Button)sender).Background;
            btn.Width = 100;
            btn.Height = 50;
            btn.Margin = new Thickness(30, 30, 0, 0);
            btn.Click += new RoutedEventHandler(btn_Click);

            this.grd.Children.Add(btn);
        }

        void btn_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("New Button Clicked");
        }
    }
}
