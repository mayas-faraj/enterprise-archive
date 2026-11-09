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

namespace VcfToTable
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private String[] files;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnEnd_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnSource_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.Multiselect = true;
            ofd.Filter = "VCF File (*.vcf)|*.vcf|All files (*.*)|*.*";

            if (ofd.ShowDialog() == true)
            {
                files = ofd.FileNames;
                txSource.Text = files.Length > 0 ? files[0] : "";
            }
        }

        private void btnDestination_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.SaveFileDialog sfd = new Microsoft.Win32.SaveFileDialog();

            sfd.Filter = "Comma Sperated Value (*.csv)|*.csv|All files (*.*)|*.*";

            if (sfd.ShowDialog() == true)
            {
                txDestination.Text = sfd.FileName;
            }
        }

        private void btnStart_Click(object sender, RoutedEventArgs e)
        {
            if (txDestination.Text != "" && txSource.Text != "")
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(txDestination.Text, false, Encoding.Default);

                foreach (String file in files)
                {
                    System.IO.StreamReader sr = new System.IO.StreamReader(file);
                    String text = sr.ReadToEnd().ToLower();
                    sr.Close();

                    String name = System.IO.Path.GetFileNameWithoutExtension(file);
                    String cell = "";
                    String home = "";
                    String voice = "";

                    Int32 cellIndex = text.IndexOf("tel;cell:");
                    
                    if (cellIndex >= 0)
                    {
                        Int32 endCellIndex = text.IndexOf(Environment.NewLine, cellIndex);

                        if (endCellIndex == -1)
                            cell = text.Substring(cellIndex + 9);
                        else
                            cell = text.Substring(cellIndex + 9, endCellIndex - cellIndex - 9);
                        
                    }

                    Int32 homeIndex = text.IndexOf("tel;home:");
                    
                    if (homeIndex >= 0)
                    {
                        Int32 endHomeIndex = text.IndexOf(Environment.NewLine, homeIndex);

                        if (endHomeIndex == -1)
                            home = text.Substring(homeIndex + 9);
                        else
                            home = text.Substring(homeIndex + 9, endHomeIndex - homeIndex - 9);
                    }

                    Int32 voiceIndex = text.IndexOf("tel;voice:");

                    if (voiceIndex >= 0)
                    {
                        Int32 endVoiceIndex = text.IndexOf(Environment.NewLine, voiceIndex);

                        if (endVoiceIndex == -1)
                            voice = text.Substring(voiceIndex + 10);
                        else
                            voice = text.Substring(voiceIndex + 10, endVoiceIndex - voiceIndex - 10);
                    }

                    Char c1 = (cell == "") ? '\0' : '#';
                    Char c2 = (home == "") ? '\0' : '#';
                    Char c3 = (voice == "") ? '\0' : '#';

                    sw.WriteLine(name + "," + c1 + cell + "," + c2 + home + "," + c3 + voice);
                }

                sw.Close();

                txReport.Text = files.Length.ToString() + " Element converted.";
            }
            else
                MessageBox.Show("Enter the source and destination in the text box", "texts requiered", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
