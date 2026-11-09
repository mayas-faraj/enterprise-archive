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

namespace WpfTraining
{
    /// <summary>
    /// Interaction logic for Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {
        public Window2()
        {
            InitializeComponent();

            tx.Text = (System.Windows.Media.RenderCapability.Tier).ToString();

            CommandBinding commandBinding = new CommandBinding(System.Windows.Input.ApplicationCommands.New);

            commandBinding.Executed += commandBinding_Executed;
            this.CommandBindings.Add(commandBinding);

            //System.Windows.Resources.StreamResourceInfo sri = Application.GetResourceStream(new Uri("voice/WebSearcher.exe", UriKind.Relative));

            //System.IO.FileStream fs = new System.IO.FileStream("e:\\des.exe", System.IO.FileMode.Create);
            //Int32 i;
            //while ((i = sri.Stream.ReadByte()) != -1)
            //    fs.WriteByte((Byte)i);

            //fs.Close();

            //this.Background=new ImageBrush(new BitmapImage(new Uri("pack://application:,,,/WpfTraining;component/src.jpg")));
            this.Background = (LinearGradientBrush)this.Resources["lgb"];
        }

        void commandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Command executed!" + Environment.NewLine + "Source: " + e.Source + Environment.NewLine + "Command: " + e.Command + Environment.NewLine + "Parameters: " + e.Parameter, e.OriginalSource.ToString(), MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void Slider_ValueChanged_1(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            tx.Text = ((Slider)sender).Value.ToString();

            
        }

        private void ProgressBar_MouseDown_1(object sender, MouseButtonEventArgs e)
        {
            Window win;

            if (e.LeftButton == MouseButtonState.Pressed)
            {
                win = new Window1();
            }
            else
            {
                win = new MainWindow();
            }
            

            win.Owner = this;
            win.WindowStartupLocation = System.Windows.WindowStartupLocation.CenterOwner;
            win.Show();
        }
    }
}
