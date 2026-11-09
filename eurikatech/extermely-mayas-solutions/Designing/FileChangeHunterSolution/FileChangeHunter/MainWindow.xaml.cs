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

namespace FileChangeHunter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            hunter = new Hunter();

            hunter.ProgressChanged += hunter_ProgressChanged;
        }

        void hunter_ProgressChanged(object sender, EventArgs e)
        {
            progressBar.Value = ((ProgressEventArgs)e).Value;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btn1Directory_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();

            ofd.Filter = "Maniyat File States (*.mfs)|*.mfs|All Files (*.*)|*.*";

            if (ofd.ShowDialog() == true)
                tx1Directory.Text = ofd.FileName;
        }

        private void btn2Directory_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();

            if (ofd.ShowDialog() == true)
                tx2Directory.Text = System.IO.Path.GetDirectoryName(ofd.FileName);
        }

        private void btnSaveState_Click(object sender, RoutedEventArgs e)
        {
            if(tx2Directory.Text!="")
                if(System.IO.Directory.Exists(tx2Directory.Text))
                {
                    Microsoft.Win32.SaveFileDialog sfd = new Microsoft.Win32.SaveFileDialog();

                    sfd.Filter = "Maniyat File States (*.mfs)|*.mfs|All Files (*.*)|*.*";

                    if (sfd.ShowDialog() == true)
                    {
                        FileStateCollection fs = new FileStateCollection();

                        hunter.CheckHashCode = (Boolean)chkHash.IsChecked;
                        hunter.CheckSize = (Boolean)chkSize.IsChecked;
                        hunter.CheckModifiedDate = (Boolean)chkDate.IsChecked;

                        hunter.GetFiles(tx2Directory.Text, ref fs, (Boolean)chkRecycle.IsChecked, (Boolean)chkInternet.IsChecked, false);
                        hunter.SaveStates(sfd.FileName, fs);
                    }
                }
        }

        private void btnSimulate_Click(object sender, RoutedEventArgs e)
        {
            lsResult.Items.Clear();

            hunter.CheckHashCode = (Boolean)chkHash.IsChecked;
            hunter.CheckSize = (Boolean)chkSize.IsChecked;
            hunter.CheckModifiedDate = (Boolean)chkDate.IsChecked;

            FileStateCollection fs = new FileStateCollection();
            FileStateCollection ss = new FileStateCollection();

            if(tx1Directory.Text!="")
                if(System.IO.File.Exists(tx1Directory.Text))
                {
                    hunter.LoadStates(tx1Directory.Text, out fs);
                    hunter.GetFiles(tx2Directory.Text, ref ss, (Boolean)chkRecycle.IsChecked, (Boolean)chkInternet.IsChecked, false);

                    hunter.FirstStates = fs;
                    hunter.SecondeStates = ss;

                    foreach (ChangeLog changeLog in hunter.Hunt())
                        lsResult.Items.Add(changeLog.ToString());
                }
        }

        private Hunter hunter;

       
    }
}
