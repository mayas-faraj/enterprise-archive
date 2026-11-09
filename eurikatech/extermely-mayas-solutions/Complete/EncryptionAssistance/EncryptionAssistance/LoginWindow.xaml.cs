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

namespace EncryptionAssistance
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        //public sturctures region
        public LoginWindow()
        {
            InitializeComponent();
        }

        //private events region
        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            MessageWindow message = new MessageWindow("About the Author", "this application specially used to manager of maniyat system ...Mayas Faraj" + Environment.NewLine + "if you have privilage to login, enter name and password." + Environment.NewLine + "Maniyat System Protection.", MessageIcon.information);
            message.Show();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            if ((txName.Text + ":").GetHashCode() == NAME && (txPassword.Password + ":").GetHashCode() == PASSWORD)
            {
                MainWindow main = new MainWindow();
                main.Show();
                this.Close();
            }
            else
            {
                MessageWindow message = new MessageWindow("Error name and/or password", "write name and password and then click enter, if you dont have the privilage to enter this application, call the programmer, manager of maniyat systems.", MessageIcon.error);
                message.Show();
                txName.Clear();
                txPassword.Clear();
            }

            progressBar.Value = 100;
        }

        //private static region
        private const Int32 NAME = 891075081;
        private const Int32 PASSWORD = 157114121;
    }
}
