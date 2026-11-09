using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MayasAntivirus
{
    public partial class tests : Form
    {
        private String path;
        private Scaner sc;
        private Int32 num;
        private Int32 total;
        private DateTime time;

        public tests()
        {
            InitializeComponent();

            sc = new Scaner();
            sc.OnError += new ExceptionEventHandler(sc_OnError);
            sc.OnScanStarted += new EventHandler(sc_OnScanStarted);
            sc.OnScanFinished += new EventHandler(sc_OnScanFinished);
            sc.OnPassDirectory += new PassDirectoryEventHandler(sc_OnPassDirectory);
        }

        private void btnPath_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            fbd.SelectedPath = path;

            if (fbd.ShowDialog() == DialogResult.OK)
                path = fbd.SelectedPath;

            sc.GridResult = dgvResult;
            sc.Viruses = Virus.LoadViruses();
            sc.VirusScan(path);
        }

        void sc_OnPassDirectory(object sender, PassDirectoryEventArgs e)
        {
            txName.Text = e.DirectoryName;
            pBar.Value = Convert.ToInt32((++num * 100) / total);
        }

        void sc_OnScanFinished(object sender, EventArgs e)
        {
            btnPath.Enabled = true;
            pBar.Value = 100;
            btnRun.Text = DateTime.Now.Subtract(time).ToString();

        }

        void sc_OnScanStarted(object sender, EventArgs e)
        {
            time = DateTime.Now;
            btnPath.Enabled = false;
            pBar.Value = 0;
            txResult.Clear();
            dgvResult.Rows.Clear();
            dgvResult.ColumnCount = 5;
            total = sc.GetDirectoryNumber(path);
            num = 0;
            txName.Clear();
            txResult.Clear();
        }

        void sc_OnError(object sender, ExceptionEventArgs e)
        {
            txResult.Text += e.SourceException.Message.ToString() + "\r\n";
        }

        
 
    }
}
