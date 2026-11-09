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
    public partial class frmMain : Form
    {
        private Scaner scaner = new Scaner();
        private String selectedPath;
        private Int32 folderNum;
        private Int32 currentFolder;
        private DateTime timeStart;

        public frmMain()
        {
            InitializeComponent();

            selectedPath = "C:";
            folderNum = currentFolder = 0;

            scaner.GridResult = dgvResult;
            scaner.Viruses = Virus.LoadViruses();

            DataGridViewTextBoxColumn clmnName = new DataGridViewTextBoxColumn();
            clmnName.HeaderText = "File Name";
            clmnName.Width = Convert.ToInt32(0.2 * dgvResult.Width);
            clmnName.ReadOnly = true;
            dgvResult.Columns.Add(clmnName);

            DataGridViewTextBoxColumn clmnPath = new DataGridViewTextBoxColumn();
            clmnPath.HeaderText = "File Path";
            clmnPath.Width = Convert.ToInt32(0.5 * dgvResult.Width) - 60;
            clmnPath.ReadOnly = true;
            dgvResult.Columns.Add(clmnPath);

            DataGridViewTextBoxColumn clmnRisk = new DataGridViewTextBoxColumn();
            clmnRisk.HeaderText = "Risk Type";
            clmnRisk.Width = Convert.ToInt32(0.15 * dgvResult.Width);
            clmnRisk.ReadOnly = true;
            dgvResult.Columns.Add(clmnRisk);

            DataGridViewComboBoxColumn clmnAction = new DataGridViewComboBoxColumn();
            clmnAction.HeaderText = "Action";
            clmnAction.Items.Add("Delete");
            clmnAction.Items.Add("Ignore");
            clmnAction.Width = Convert.ToInt32(0.15 * dgvResult.Width);
            clmnRisk.ReadOnly = false;
            dgvResult.Columns.Add(clmnAction);

            dgvResult.AllowUserToAddRows = dgvResult.AllowUserToDeleteRows = false;

            scaner.OnScanStarted += new EventHandler(scaner_OnScanStarted);
            scaner.OnScanFinished += new EventHandler(scaner_OnScanFinished);
            scaner.OnPassDirectory += new PassDirectoryEventHandler(scaner_OnPassDirectory);
            scaner.OnScanStoppet += new EventHandler(scaner_OnScanStoppet);
        }

        void scaner_OnScanStoppet(object sender, EventArgs e)
        {
            btnAction.Enabled = true;
            btnStop.Enabled = false;
            lbInfo.Text = "Stopped !";
        }

        void scaner_OnPassDirectory(object sender, PassDirectoryEventArgs e)
        {
            Application.DoEvents();
            lbInfo.Text = "Checking Files in : " + e.DirectoryName;
            pbProcess.Value = Convert.ToInt32(currentFolder++ * 100 / folderNum);
            lbPercent.Text = pbProcess.Value.ToString() + " %";
        }

        void scaner_OnScanFinished(object sender, EventArgs e)
        {
            btnAction.Enabled = true;
            btnStop.Enabled = false;
            pbProcess.Value = 100;
            lbPercent.Text = "100 %";
            lbInfo.Text = "Done , Elapse Time " + DateTime.Now.Subtract(timeStart).ToString();
        }

        void scaner_OnScanStarted(object sender, EventArgs e)
        {
            timeStart = DateTime.Now;
            btnAction.Enabled = false;
            btnStop.Enabled = true;
            currentFolder = 0;
            folderNum = scaner.GetDirectoryNumber(selectedPath);
            pbProcess.Value = 0;
            lbInfo.Text = "Starting scan path " + selectedPath;
            lbPercent.Text = "0 %";
            dgvResult.Rows.Clear();
            Application.DoEvents();
        }

        private void btnChangePath_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();

            fbd.SelectedPath = selectedPath;
            fbd.ShowNewFolderButton = true;

            if (fbd.ShowDialog() == DialogResult.OK)
                selectedPath = fbd.SelectedPath;

            lbInfo.Text = "Ready to check path " + selectedPath;
        }

        private void btnScan_Click(object sender, EventArgs e)
        {
            scaner.VirusScan(selectedPath);
        }

        private void btnFlash_Click(object sender, EventArgs e)
        {
            scaner.VirusTopScan(selectedPath);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.GetCurrentProcess().Kill();
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            scaner.Stop = true;
        }

        private void btnAction_Click(object sender, EventArgs e)
        {
           
        }
    }
}
