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
using System.IO.Packaging;
using System.Windows.Xps.Packaging;

namespace DocumentPassword
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            XpsDocument xpsDoc = new XpsDocument("intro.mp3", System.IO.FileAccess.Read);
            documentViewer.Document = xpsDoc.GetFixedDocumentSequence();
        }

        void CommandBinding_CanExecutePrint(object sender, CanExecuteRoutedEventArgs e)
        {
            e.Handled = true;
        }

        void CommandBinding_CanExecuteCopy(object sender, CanExecuteRoutedEventArgs e)
        {
            e.Handled = true;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnAbout_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("رقم الهاتف : 5771912" + Environment.NewLine + "الجوال : 0988839387" + Environment.NewLine + "الفاكس : 5771912" + Environment.NewLine + "في حال وجود أي سؤال أو أستفسار أو دروس خصوصية الإتصال على الأرقام.", "الأستاذ أسامة فرج", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnFirst_Click(object sender, RoutedEventArgs e)
        {
            documentViewer.FirstPage();
        }

        private void btnLast_Click(object sender, RoutedEventArgs e)
        {
            documentViewer.LastPage();
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            documentViewer.NextPage();
        }

        private void btnPrevious_Click(object sender, RoutedEventArgs e)
        {
            documentViewer.PreviousPage();
        }
    }
}
