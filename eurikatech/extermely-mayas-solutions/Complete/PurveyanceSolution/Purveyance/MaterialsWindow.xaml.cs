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
    /// Interaction logic for MaterialsWindow.xaml
    /// </summary>
    public partial class MaterialsWindow : Window
    {
        //public constructors region
        public MaterialsWindow(Window callerWindow)
        {
            InitializeComponent();

            this.callerWindow = callerWindow;
        }

        //private events region
        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            MaterialWindow material = new MaterialWindow(this, (Material)lsMaterials.SelectedItem);

            material.Show();
            this.Hide();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            MaterialWindow material = new MaterialWindow(this, null);

            material.Show();
            this.Hide();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();

            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            UI.Exit();
        }

        private void lsMaterials_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            btnEdit.IsEnabled = btnDelete.IsEnabled = lsMaterials.SelectedItem != null;
        }

        private void Window_Activated_1(object sender, EventArgs e)
        {
            fillList();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Material selectedItem = (Material)lsMaterials.SelectedItem;

            if (MessageBox.Show("هل أنت متأكد من حذف المادة", "حذف مادة", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    Database.Delete(selectedItem);
                }
                catch (Exception ex)
                {
                    UI.ErrorMessage(ex);
                }
            }
        }

        //private functions region
        private void fillList()
        {
            lsMaterials.Items.Clear();

            Material[] materials = Database.GetMaterials();

            foreach (Material material in materials)
                lsMaterials.Items.Add(material);
        }

        //private fields region
        private Window callerWindow;
    }
}
