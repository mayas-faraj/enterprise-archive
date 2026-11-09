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

namespace ClientApplicaiton
{
    /// <summary>
    /// Interaction logic for Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {
        private Products.Folder folder;
        public Window2()

        {
            InitializeComponent();

            Maniyat.Database.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BlogDB;Integrated Security=True";
            Maniyat.Database.LogFilePath = "f:\\logSql.log";

            StringBuilder str = new StringBuilder(":لآإآ");
            Int32 tabOrder = 0;

            folder = new Products.Folder();
            folder.InformationControls["id"].IsUsed = false;

            Maniyat.MultiInformationsEdit multiInformationEdit = new Maniyat.MultiInformationsEdit(folder, ref tabOrder, ref str);
            multiInformationEdit.ItemsList.Width = 300;
            multiInformationEdit.ItemsList.ItemHeight = 150;
            multiInformationEdit.ItemsList.Height = 700;

            mainGrid.Content = multiInformationEdit;
            fillItems();

        }

        private void fillItems()
        {
            Maniyat.IDatabase[] items = Maniyat.Database.Select(folder);
            ((Maniyat.MultiInformationsEdit)mainGrid.Content).Items.Clear();

            for (Int32 i = 0; i < items.Length; i++)
                ((Maniyat.MultiInformationsEdit)mainGrid.Content).Items.Add((Products.Folder)items[i]);
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Maniyat.Database.Update((Products.Folder)((Maniyat.MultiInformationsEdit)mainGrid.Content).SelectedValue, new Maniyat.DataCondition(folder.DataFields["id"], Maniyat.SqlOperator.Equal, ((Products.Folder)((Maniyat.MultiInformationsEdit)mainGrid.Content).SelectedValue).Id));

            fillItems();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            Maniyat.Database.Delete((Products.Folder)((Maniyat.MultiInformationsEdit)mainGrid.Content).SelectedValue, new Maniyat.DataCondition(folder.DataFields["id"], Maniyat.SqlOperator.Equal, ((Products.Folder)((Maniyat.MultiInformationsEdit)mainGrid.Content).SelectedValue).Id));

            fillItems();
        }
    }
}
