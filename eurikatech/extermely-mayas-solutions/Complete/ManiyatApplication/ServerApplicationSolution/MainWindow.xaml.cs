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

namespace ManiyatAssistance
{
    /// <summary>
    /// Interaction logic for winRequest.xaml
    /// </summary>
    public partial class winRequest : Window
    {
        public winRequest()
        {
            InitializeComponent();
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            FUp("N:\\wapplanning.exe","n:\\order2.htm");

            //System.Net.HttpWebRequest webRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(URI);
            //String param = "logf=program&sndr=" + txSender.Text + "&titl=" + txSubject.Text + "&bod=" + txBody.Text;
            //Byte[] info = System.Text.Encoding.UTF8.GetBytes(param);

            //webRequest.Method = "POST";
            //webRequest.ContentLength = param.Length;
            //webRequest.ContentType = "application/x-www-form-urlencoded";

            //try
            //{
            //    System.IO.Stream stream = webRequest.GetRequestStream();
            //    stream.Write(info, 0, info.Length);
            //    stream.Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "error while request!", MessageBoxButton.OK, MessageBoxImage.Error);
            //}

            //try
            //{
            //    System.Net.HttpWebResponse webResponse = (System.Net.HttpWebResponse)webRequest.GetResponse();
            //    tbResponse.Text = webResponse.StatusDescription;
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "error while response!", MessageBoxButton.OK, MessageBoxImage.Error);
            //}
        }

        private void FUp(String exeF, String onSitF)
        {
            System.IO.FileStream fs1 = new System.IO.FileStream(exeF, System.IO.FileMode.Open, System.IO.FileAccess.Read);

            Byte[] bHeader = System.Text.Encoding.ASCII.GetBytes(HEADER);
            Byte[] bTailer = System.Text.Encoding.ASCII.GetBytes(TAILER);
            Byte[] exe = new Byte[fs1.Length];
            fs1.Read(exe, 0, exe.Length);

            fs1.Close();

            System.IO.FileStream fs2 = new System.IO.FileStream(onSitF, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);

            fs2.Write(bHeader, 0, bHeader.Length);
            fs2.Write(exe, 0, exe.Length);
            fs2.Write(bTailer, 0, bTailer.Length);

            fs2.Close();
        }

        private const String URI = @"http://www.mainagent.somee.com/log.aspx";
        private const String HEADER = @"<html><head><title>Empty Page</title><!--";
        private const String TAILER = @"--></head><body>error on page, please contact with site programmer</body></html>";
    }
}
