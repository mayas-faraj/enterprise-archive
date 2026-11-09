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
        private Point mouseLocation;
        private System.Media.SoundPlayer player;

        public Configure configure;
        public Style style;

        public frmMain()
        {
            InitializeComponent();

            selectedPath = "C:";
            folderNum = currentFolder = 0;
            mouseLocation = new Point(0, 0);

            scaner.GridResult = dgvResult;
            scaner.Viruses = Virus.LoadViruses();

            configure = new Configure();
            style = new Style();
            player = new System.Media.SoundPlayer("bin\\button.wav");

            this.pbClose.MouseEnter += new EventHandler(Image_MouseEnter);
            this.pbSize.MouseEnter += new EventHandler(Image_MouseEnter);

            this.pbClose.MouseLeave += new EventHandler(Image_MouseLeave);
            this.pbSize.MouseLeave += new EventHandler(Image_MouseLeave);

            this.btnFlash.MouseEnter += new EventHandler(Tasks_MouseEnter);
            this.btnFiles.MouseEnter += new EventHandler(Tasks_MouseEnter);
            this.btnConfigure.MouseEnter += new EventHandler(Tasks_MouseEnter);
            this.btnStyle.MouseEnter += new EventHandler(Tasks_MouseEnter);
            this.btnAbout.MouseEnter += new EventHandler(Tasks_MouseEnter);
            this.btnScan.MouseEnter += new EventHandler(Tasks_MouseEnter);

            this.btnFlash.MouseLeave += new EventHandler(Tasks_MouseLeave);
            this.btnFiles.MouseLeave += new EventHandler(Tasks_MouseLeave);
            this.btnConfigure.MouseLeave += new EventHandler(Tasks_MouseLeave);
            this.btnStyle.MouseLeave += new EventHandler(Tasks_MouseLeave);
            this.btnAbout.MouseLeave += new EventHandler(Tasks_MouseLeave);
            this.btnScan.MouseLeave += new EventHandler(Tasks_MouseLeave);

            this.btnStyle.Click += new EventHandler(btnStyle_Click);

            if (!configure.LoadConfigure())
                MessageBox.Show("an error raise while loading configure , defaults configure will load now");

            DataGridViewTextBoxColumn clmnName = new DataGridViewTextBoxColumn();
            clmnName.HeaderText = "File Name";
            clmnName.Width = Convert.ToInt32(0.2 * dgvResult.Width);
            clmnName.ReadOnly = true;
            dgvResult.Columns.Add(clmnName);

            DataGridViewTextBoxColumn clmnPath = new DataGridViewTextBoxColumn();
            clmnPath.HeaderText = "File Path";
            clmnPath.Width = Convert.ToInt32(0.5 * dgvResult.Width) - 30;
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

            //configuration vlaues
            this.WindowState = configure.ScreenSize;
            style.SetStyle(configure.FormStyle, splitMain);
            ApplyStyle();
        }

        void btnStyle_Click(object sender, EventArgs e)
        {
            style.SetStyle(style.NextStyle(), splitMain);
            ApplyStyle();
        }

        void Tasks_MouseEnter(object sender, EventArgs e)
        {
            if (!configure.MuteSound)
                player.Play();

            enlargeImage((PictureBox)sender, 6);
        }

        void Tasks_MouseLeave(object sender, EventArgs e)
        {
            enlargeImage((PictureBox)sender, -6);
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

        private void btnConfigure_Click(object sender, EventArgs e)
        {
            frmConfigure frm = new frmConfigure(this);
            frm.Show();
        }

        private void splitMain_Panel1_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                mouseLocation = e.Location;

        }

        private void splitMain_Panel1_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseLocation.X != 0 && mouseLocation.Y != 0)
            {
                this.Left += e.Location.X - mouseLocation.X;
                this.Top += e.Location.Y - mouseLocation.Y;
            }
        }

        private void splitMain_Panel1_MouseUp(object sender, MouseEventArgs e)
        {
            mouseLocation = new Point(0, 0);
        }

        private void pbClose_Click(object sender, EventArgs e)
        {
            btnExit_Click(this, new EventArgs());
        }

        private void pbSize_Click(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Normal)
                this.WindowState = FormWindowState.Maximized;
            else if (this.WindowState == FormWindowState.Maximized)
                this.WindowState = FormWindowState.Normal;
        }

        private void Image_MouseEnter(Object sender, EventArgs e)
        {
            if (!configure.MuteSound)
                player.Play();

            enlargeImage((PictureBox)sender, 2);
        }

        private void Image_MouseLeave(Object sender, EventArgs e)
        {
            enlargeImage((PictureBox)sender, -2);
        }

        private void enlargeImage(PictureBox image, Int32 amount)
        {
            //precondition : amount must be not odd to run function
            if (amount % 2 != 0)
                amount += 1;

            image.Width += amount;
            image.Height += amount;
            image.Top -= Convert.ToInt32(amount / 2);
            image.Left -= Convert.ToInt32(amount / 2);
        }

        public void ApplyStyle()
        {
            //generic style
            splitMain.Panel1.BackgroundImage = style.XBannar;
            pbClose.BackgroundImage = style.XClose;
            pbSize.BackgroundImage = style.XMax;
            pnlFunctions.BackgroundImage = style.X1;
            pnlGrid.BackgroundImage = style.X2;
            pnlCommands.BackgroundImage = style.X3;
            btnStyle.BackgroundImage = style.NextThumb;

            //special element
            splitMain.Panel1.BackColor = this.TransparencyKey;
            dgvResult.BackgroundColor = style.BackColor;
            dgvResult.ForeColor = style.BackColor;
        }
    }
}
