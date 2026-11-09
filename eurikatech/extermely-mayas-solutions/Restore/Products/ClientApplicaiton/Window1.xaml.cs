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
using System.Diagnostics;

namespace ClientApplicaiton
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();

            Maniyat.Database.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BlogDB;Integrated Security=True";
            Maniyat.Database.LogFilePath = "f:\\logSql.log";

            StringBuilder str = new StringBuilder(":لآإآ");
            Int32 tabOrder = 0;
            Products.Folder folder = new Products.Folder();
            folder.InformationControls["id"].IsUsed = false;

            Maniyat.MultiInformationsComboBox multiInformationsCard = new Maniyat.MultiInformationsComboBox();
            Maniyat.InformationOutput multiInformationEdit = new Maniyat.InformationOutput(folder, ref tabOrder, ref str);

            multiInformationsCard.Width = 340;
            multiInformationsCard.ItemHeight = 160;
           
            scrollViewer1.Content = multiInformationsCard;
            scrollViewer2.Content = multiInformationEdit;

            multiInformationsCard.SelectedItemChanged += new RoutedEventHandler(multiInformationsCard_SelectedItemChanged);

            fillCards();
        }

        void multiInformationsCard_SelectedItemChanged(object sender, RoutedEventArgs e)
        {
            ((Maniyat.InformationOutput)scrollViewer2.Content).Values = ((Products.Folder)((Maniyat.MultiInformationsComboBox)scrollViewer1.Content).SelectedValue);
        }

        void fillCards()
        {
            Products.Folder folder = new Products.Folder();
            folder.InformationControls["id"].IsUsed = false;
            Maniyat.IDatabase[] result = Maniyat.Database.Select(folder);

            for (Int32 i = 0; i < result.Length; i++)
                ((Maniyat.MultiInformationsComboBox)scrollViewer1.Content).Items.Add((Products.Folder)result[i]);
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Process.GetCurrentProcess().Kill();
        }
    }
}
