using System;
using System.Windows;
using System.Windows.Media.Imaging;

namespace EncryptionAssistance
{
    /// <summary>
    /// Interaction logic for MessageWindow.xaml
    /// </summary>
    public partial class MessageWindow : Window
    {
        public event EventHandler ButtonClicked;

        public MessageWindow(String title, String message, MessageIcon icon)
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
                    this.imgIcon.Source = new BitmapImage(new Uri("/EncryptionAssistance;component/bin/Debug/images/armyError.png", UriKind.Relative));
                    break;
                case MessageIcon.information:
                    this.imgIcon.Source = new BitmapImage(new Uri("/EncryptionAssistance;component/bin/Debug/images/armyinfo.png", UriKind.Relative));
                    break;
                case MessageIcon.accept:
                    this.imgIcon.Source = new BitmapImage(new Uri("/EncryptionAssistance;component/bin/Debug/images/armyok.png", UriKind.Relative));
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
