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
using System.Windows.Shapes;

namespace AutoShipmaster
{
    /// <summary>
    /// Interaction logic for frmUsers.xaml
    /// </summary>
    public partial class frmUsers : Window
    {
        //public constructions region
        public frmUsers(Window caller)
        {
            InitializeComponent();

            LoadUsers();

            setNewMode();

            callerWindow = caller;
        }

        //private fuctions region
        private void LoadUsers()
        {
            lsUsers.Items.Clear();
            Library.User[] users;
            Library.Database.Load(out users);

            if (users != null)
                for (int i = 0; i < users.Length; i++)
                    lsUsers.Items.Add(users[i]);
        }

        private void setEditingMode()
        {
            btnAdd.IsEnabled = false;
            btnEdit.IsEnabled = true;
            btnDelete.IsEnabled = true;

            txName.Text = ((Library.User)lsUsers.SelectedItem).Name;
        }

        private void setNewMode()
        {
            btnAdd.IsEnabled = true;
            btnEdit.IsEnabled = false;
            btnDelete.IsEnabled = false;

            txName.Clear();
            txPassword.Clear();
            txPassword2.Clear();

            lsUsers.SelectedItem = null;

            txName.Focus();
        }

        //private events region
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();
            this.Close();
        }

        private void btnNew_Click(object sender, RoutedEventArgs e)
        {
            setNewMode();
        }

        private void lsUsers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lsUsers.SelectedItem != null)
                setEditingMode();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (txPassword.Password == txPassword2.Password)
            {
                if (txName.Text != "" && txPassword.Password != "")
                    try
                    {
                        Library.Database.Save(new Library.User(txName.Text, txPassword.Password));
                        MessageBox.Show(" تم إضافة المستخدم" + txName.Text + " بنجاح", "إضافة مستخدم جديد", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                        LoadUsers();
                        setNewMode();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "خطأ أثناء عملية الإدخال", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                else
                    MessageBox.Show("تتطلب عملية الإدخال قيمة غير فارغة في الأسم أو كلمة المرور", "إضافة مستخدم جديد", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
                MessageBox.Show("كلمتا المرور في الحقلين غير متطابقتين", "إضافة مستخدم جديد", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (txPassword.Password == txPassword2.Password)
            {
                if (txName.Text != "" && txPassword.Password != "")
                    try
                    {
                        Library.Database.Edit(new Library.User(((Library.User)lsUsers.SelectedItem).Id, txName.Text, txPassword.Password));
                        MessageBox.Show(" تم تعديل المستخدم" + ((Library.User)lsUsers.SelectedItem).ToString() + " بنجاح", "تعديل مستخدم", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                        LoadUsers();
                        setNewMode();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "خطأ أثناء عملية التعديل", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                else
                    MessageBox.Show("تتطلب عملية التعديل قيمة غير فارغة في الأسم أو كلمة المرور", "تعديل مستخدم", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
                MessageBox.Show("كلمتا المرور في الحقلين غير متطابقتين", "تعديل مستخدم", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (lsUsers.Items.Count > 1)
            {
                try
                {
                    Library.Database.Delete(new Library.User(((Library.User)lsUsers.SelectedItem).Id, "", ""));
                    MessageBox.Show(" تم حذف المستخدم" + ((Library.User)lsUsers.SelectedItem).ToString() + " بنجاح", "حذف مستخدم", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    LoadUsers();
                    setNewMode();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "خطأ أثناء عملية الحذف", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
                MessageBox.Show("يتطلب الولوج للنظام وجود مستخدم واحد على الأقل", "عملية الحذف", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (callerWindow.Visibility != System.Windows.Visibility.Visible)
                callerWindow.Close();
        }

        //private fields region
        private Window callerWindow;
    }
}
