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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfTraining
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            num = 0;
        }

        private void clicked(Object sender, RoutedEventArgs e)
        {
            //lbResult.Items.Add("-Event Num #" + (++num).ToString());
            //lbResult.Items.Add("sender:" + sender.ToString());
            //lbResult.Items.Add("e.Source:" + e.Source.ToString());
            //lbResult.Items.Add("e.OrginalSource:" + e.OriginalSource.ToString());
            //e.Handled = (Boolean)chkHandle.IsChecked;
        }

        private void keys(Object sender, KeyEventArgs e)
        {
            //if (e.IsRepeat)
            //    return;

            //lbResult.Items.Add("-Event Num #" + (++num).ToString());
            //lbResult.Items.Add("sender:" + sender.ToString());
            //lbResult.Items.Add("e.Source:" + e.Source.ToString());
            //lbResult.Items.Add("e.RoutedEvent:" + e.RoutedEvent.ToString());
            //lbResult.Items.Add("e.Key:" + e.Key.ToString());
            //e.Handled = (Boolean)chkHandle.IsChecked;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            foreach(System.Windows.Window win in Application.Current.Windows)
                if (win.GetType() == typeof(Window1))
                {
                    Window1 w = (Window1)win;
                    w.txt.Text = "edit by " + this.Title;
                    w.Background = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Colors.Lime);
                }
        }

        private Int32 num;
    } 
}
