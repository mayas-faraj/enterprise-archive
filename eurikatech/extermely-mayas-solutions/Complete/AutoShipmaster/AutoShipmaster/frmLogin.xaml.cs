using System;
using System.Windows;
using System.Windows.Controls;

namespace AutoShipmaster
{
    /// <summary>
    /// Interaction logic for frmLogin.xaml
    /// </summary>
    public partial class frmLogin : Window
    {
        public frmLogin()
        {
            InitializeComponent();

            System.IO.StreamReader sr = new System.IO.StreamReader("connectionString.txt");
            String cstring = sr.ReadToEnd();
            Library.Database.LoadConnectionString(cbDataSource.Text);
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            Library.User user = new Library.User(txName.Text, txPassword.Password);
            if (Library.Database.UserLogin(ref user))
            {
                frmMain fmain = new frmMain(user);
                fmain.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("أسم المستخدم و/أو كلمة المرور خاطئة!", "تسجيل الدخول", MessageBoxButton.OK, MessageBoxImage.Error);
                txName.Clear();
                txPassword.Clear();
            }
        }

        private void cbDataSource_DropDownOpened(object sender, EventArgs e)
        {
            System.Data.Sql.SqlDataSourceEnumerator instance = System.Data.Sql.SqlDataSourceEnumerator.Instance;

            foreach (System.Data.DataRow row in instance.GetDataSources().Rows)
                cbDataSource.Items.Add(row[0]);
        }
    }
}
