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

namespace WarPlanning
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            System.Diagnostics.Process.Start("http://mod.gov.sy/portal/index.php?a=contact");
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            for (Int32 i = 0; i < 100; i++)
                progressBar.Value = i;

            if (txName.Text == NAME && txPassword.Password == PASSWORD)
            {
                WinMessage message = new WinMessage("Принятия", "пользователь получает доступ к системе.", MessageIcon.accept);
                message.ButtonClicked += new EventHandler(messageTrue_ButtonClicked);
                message.Show();
            }
            else
            {
                WinMessage message = new WinMessage("Ошибка", "Недопустимое имя пользователя или пароль!", MessageIcon.error);
                message.ButtonClicked += new EventHandler(messageFalse_ButtonClicked);
                message.Show();    
            }

            progressBar.Value = 0;
        }

        void messageTrue_ButtonClicked(object sender, EventArgs e)
        {
            WinMain main = new WinMain();
            main.Show();
            this.Close();
        }

        void messageFalse_ButtonClicked(object sender, EventArgs e)
        {
            txName.Clear();
            txPassword.Clear();
        }

        private const String NAME = "علي صالح";
        private const String PASSWORD = "كتائب الأسد 635";
    }
}
