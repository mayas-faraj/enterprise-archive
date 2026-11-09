using System;
using System.Windows;
using System.Net;

namespace WebSearcher
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnMain_Click(object sender, RoutedEventArgs e)
        {
            System.Threading.Thread thread = new System.Threading.Thread(runThread);
            
            searchWords = txMain.Text;
            searchDepth = Convert.ToInt32(txSearchDepth.Text);
            if (txResultFile.Text == "")
                fileAddress = txMain.Text + ".csv";
            else
                fileAddress = txResultFile.Text;
            result = "";

            thread.Start();
            thread.Join();

            txResult.Text = result;
        }

        private void btnPause_Click(object sender, RoutedEventArgs e)
        {
            Options.Pause = true;
        }

        private void runThread()
        {
            result = "";
            Options.StoppingPagesNumber = searchDepth;
            Options.Pause = false;
            Options.NotValidURIs = new String[] { "www.ask.com", "www.youtube.com", "www.vimeo.com", "www.myspace.com", "www.wikipedia.org", "www.twitter.com", "www.facebook.com", "www.google.com", "www.yahoo.com", "www.hotmail.com", "www.mozillalabs.com", "www.mozilla.com", "www.w3.org", "www.www..org", "www.www.org", };
            Operations.WebSearcher(Operations.GetSearcherUri(searchWords), 0, ref result);
        }

        private Int32 searchDepth;
        private String searchWords;
        private String fileAddress;
        private String result;
    }
}
