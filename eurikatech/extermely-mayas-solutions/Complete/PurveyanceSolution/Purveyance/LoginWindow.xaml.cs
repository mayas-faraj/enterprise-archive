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
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();

            System.IO.StreamReader sr = new System.IO.StreamReader(System.IO.Path.Combine(UI.GetCurrentDirectory(), "cs.dat"));
            Database.ConnectionString = sr.ReadToEnd();
            sr.Close();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txName.Clear();
            txPassword.Clear();
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            AboutWindow about = new AboutWindow();
            about.Show();
        }

        private void btnOk_Click(object sender, RoutedEventArgs e)
        {
            if (txName.Text == ProgramConsts.USER_NAME && txPassword.Password == ProgramConsts.USER_PASSWORD)
            {
                MainWindow main = new MainWindow();
                main.Show();
                this.Hide();
            }
            else
                MessageBox.Show("أسم المستخدم و/أو كلمة المرور خاطئة", "فشل تسجيل الدخول", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
