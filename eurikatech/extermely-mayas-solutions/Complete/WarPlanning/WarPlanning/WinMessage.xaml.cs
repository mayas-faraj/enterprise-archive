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

namespace WarPlanning
{
    /// <summary>
    /// Interaction logic for WinMessage.xaml
    /// </summary>
    public partial class WinMessage : Window
    {
        public event EventHandler ButtonClicked;

        public WinMessage(String title, String message, MessageIcon icon)
        {
            InitializeComponent();

            this.Title = title;
            this.txMessage.Text = message;

            switch (icon)
            {
                case MessageIcon.none:
                    this.imgIcon.Source = null;
                    break;
                case MessageIcon.error:
                    this.imgIcon.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/armyError.png", UriKind.Relative));
                    break;
                case MessageIcon.information:
                    this.imgIcon.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/armyinfo.png", UriKind.Relative));
                    break;
                case MessageIcon.accept:
                    this.imgIcon.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/armyok.png", UriKind.Relative));
                    break;
            }
        }

        private void btnAccept_Click(object sender, RoutedEventArgs e)
        {
            if (ButtonClicked != null)
                ButtonClicked(sender, null);

            this.Close();
        }
    }

    public enum MessageIcon
    {
        none,
        error,
        accept,
        information
    }
}
