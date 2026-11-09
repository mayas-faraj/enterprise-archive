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
    public partial class frmConfigure : Form
    {
        private frmMain frmCaller;

        public Configure tempConfigure;

        private Point mouseLocation;

        private Boolean isStyleChanged;

        public frmConfigure(frmMain caller)
        {
            InitializeComponent();
            frmCaller = caller;
            tempConfigure = new Configure();
            mouseLocation = new Point(0, 0);
            isStyleChanged = false;

            this.MouseDown+=new MouseEventHandler(frmConfigure_MouseDown);
            this.MouseMove+=new MouseEventHandler(frmConfigure_MouseMove);
            this.MouseUp+=new MouseEventHandler(frmConfigure_MouseUp);

            btnCancel.Click += new EventHandler(btnCancel_Click);
            btnDefault.Click+=new EventHandler(btnDefault_Click);
            btnExit.Click+=new EventHandler(btnExit_Click);
            btnPassword.Click+=new EventHandler(btnPassword_Click);
            btnSave.Click+=new EventHandler(btnSave_Click);
            chkPassword.CheckedChanged += new EventHandler(chkPassword_CheckedChanged);

            if (!tempConfigure.LoadConfigure())
            {
                MessageBox.Show("Error while load configure , default configure will loaded", "Load Configure", MessageBoxButtons.OK, MessageBoxIcon.Error);
                tempConfigure.LoadConfigureDefaults();
            }

            setControlValues();
            frmCaller.style.SetStyle(frmCaller.style.CurrentStyle, this);
            applyStyle();
        }

        private void setControlValues()
        {
            chkAutoDelete.Checked = tempConfigure.AutoDeleteRisky;
            chkAutoIgnore.Checked = tempConfigure.AutoIgnoreSkepticims;
            chkAutoScan.Checked = tempConfigure.AutoScanFlash;
            chkAutoStart.Checked = tempConfigure.AutoStartWindows;
            chkMuteSound.Checked = tempConfigure.MuteSound;
            chkRunTaskbar.Checked = tempConfigure.RunTaskbar;
            cmScreenSize.SelectedIndex = Convert.ToInt32(tempConfigure.ScreenSize);

            chkPassword.Checked = !tempConfigure.CheckNotProg("");
        }

        private void getControlValues()
        {
            tempConfigure.AutoDeleteRisky = chkAutoDelete.Checked;
            tempConfigure.AutoIgnoreSkepticims = chkAutoIgnore.Checked;
            tempConfigure.AutoScanFlash = chkAutoScan.Checked;
            tempConfigure.AutoStartWindows = chkAutoStart.Checked;
            tempConfigure.MuteSound = chkMuteSound.Checked;
            tempConfigure.RunTaskbar = chkRunTaskbar.Checked;
            tempConfigure.ScreenSize = (FormWindowState)cmScreenSize.SelectedIndex;
            tempConfigure.FormStyle = frmCaller.style.CurrentStyle;
        }

        private void btnDefault_Click(object sender, EventArgs e)
        {
            tempConfigure.LoadConfigureDefaults();
            setControlValues();
        }

        private void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            btnPassword.Enabled = chkPassword.Checked;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            frmCaller.Show();
            this.Hide();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {

        }

        private void btnPassword_Click(object sender, EventArgs e)
        {
            frmNotProg frm = new frmNotProg(this);
            frm.Show();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            getControlValues();

            if (!chkPassword.Checked)
            {
                tempConfigure.NotProg = "";
                tempConfigure.SaveNotProg();
            }

            frmCaller.configure = tempConfigure;

            if (!tempConfigure.SaveConfigure())
            {
                MessageBox.Show("Error while saving configure", "Save Configure", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            frmCaller.Activate();

            if (isStyleChanged)
            {
                frmCaller.style.SetStyle(tempConfigure.FormStyle, frmCaller);
                frmCaller.ApplyStyle();
            }

            this.Hide();       
        }

        private void frmConfigure_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
                mouseLocation = e.Location;
        }

        private void frmConfigure_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseLocation.X != 0 && mouseLocation.Y != 0)
            {
                this.Left += e.X - mouseLocation.X;
                this.Top += e.Y - mouseLocation.Y;
            }
        }

        private void frmConfigure_MouseUp(object sender, MouseEventArgs e)
        {
            mouseLocation = new Point(0, 0);
        }

        private void btnStyle_Click(object sender, EventArgs e)
        {
            //get and load style values
            isStyleChanged = true;
            frmCaller.style.SetStyle(frmCaller.style.NextStyle(), this);
            applyStyle();
        }

        private void applyStyle()
        {
            frmCaller.style.SetStyle(frmCaller.style.CurrentStyle, this);
            this.BackgroundImage = frmCaller.style.X2;
            this.pnlCommands.BackgroundImage = frmCaller.style.X3;
            btnStyle.BackgroundImage = frmCaller.style.NextThumb;
        }

    }
}
