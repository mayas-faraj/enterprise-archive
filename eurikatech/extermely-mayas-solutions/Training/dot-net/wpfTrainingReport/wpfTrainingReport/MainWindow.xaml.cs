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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace wpfTrainingReport
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            System.Windows.Xps.Packaging.XpsDocument document = new System.Windows.Xps.Packaging.XpsDocument("e:\\exam.xps", System.IO.FileAccess.Read);
            documentViewer.Document = document.GetFixedDocumentSequence();
            
        }
    }
}
