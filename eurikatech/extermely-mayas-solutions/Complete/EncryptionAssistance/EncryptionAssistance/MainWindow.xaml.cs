using System;
using System.Windows;
using System.Windows.Media.Imaging;

namespace EncryptionAssistance
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            cbEncSystems.Items.Add("SA11");
            cbEncSystems.Items.Add("SA11Reverse");

            cbCodeSystems.Items.Add("Unicode");
            cbCodeSystems.Items.Add("ASCII");
            cbCodeSystems.Items.Add("UTF8");
            cbCodeSystems.Items.Add("UTF32");
        }

        private void btnOpen_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();

            if (ofd.ShowDialog() == true)
            {
                try
                {
                    System.IO.StreamReader sr = new System.IO.StreamReader(ofd.FileName);
                    txInput.Text = sr.ReadToEnd();
                    sr.Close();
                }
                catch (Exception ex)
                {
                    MessageWindow message = new MessageWindow(ex.Source, ex.Message, MessageIcon.error);
                    message.Show();
                }
            }
        }

        private void btnSort_Click(object sender, RoutedEventArgs e)
        {
            String[] input = txInput.Text.Split(new String[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);

            for (Int32 i = 0; i <input.Length; i++)
                for (Int32 j = i; j < input.Length; j++)
                    if (input[i].CompareTo(input[j]) > 0)
                    {
                        String tmp = input[j];
                        input[j] = input[i];
                        input[i] = tmp;
                    }

            txOutput.Clear();

            foreach (String line in input)
                txOutput.Text += line + Environment.NewLine;

        }

        private void btnEncrypt_Click(object sender, RoutedEventArgs e)
        {
            String uncoded = "";

            if (cbEncSystems.SelectedItem != null)
            {
                switch (cbEncSystems.SelectedItem.ToString())
                {
                    case "SA11":
                        uncoded = Toning.SA11(txInput.Text);
                        break;
                    case "SA11Reverse":
                        uncoded = Toning.SA11Reverse(txInput.Text);
                        break;
                }
            }

            Byte[] bytes = null;

            if (cbCodeSystems.SelectedItem != null)
            {
                switch (cbCodeSystems.SelectedItem.ToString())
                {
                    case "ASCII":
                        bytes = System.Text.Encoding.ASCII.GetBytes(uncoded);
                        break;
                    case "UTF8":
                        bytes = System.Text.Encoding.UTF8.GetBytes(uncoded);
                        break;
                    case "UTF32":
                        bytes = System.Text.Encoding.UTF32.GetBytes(uncoded);
                        break;
                }
            }

            text = uncoded;
            txOutput.Text = text;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txInput.Clear();
            txOutput.Clear();
            cbEncSystems.SelectedItem = null;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.SaveFileDialog sfd = new Microsoft.Win32.SaveFileDialog();        

            if (sfd.ShowDialog() == true)
            {
                try
                {
                    System.IO.StreamWriter sw = new System.IO.StreamWriter(sfd.FileName, false);
                    sw.Write(text);
                    sw.Close();
                }
                catch (Exception ex)
                {
                    MessageWindow message = new MessageWindow(ex.Source, ex.Message, MessageIcon.error);
                    message.Show();
                }
            }
        }

        private String text;
    }
}
