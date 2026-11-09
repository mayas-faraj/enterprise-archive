using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace RentalApplication
{
    public partial class frmMDI : Form
    {
        private const String EXIT_CONFIRM = "تأكيد الخروج من البرنامج";
        private const String EXIT_CAPTION = "الخروج وإغلاق النوافذ";

        public frmMDI()
        {
            InitializeComponent();

            SharedData.LoadValues();
        }

        private void tsbCalc_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("calc");
        }

        private void ShowChild(Form frm)
        {
            frm.MdiParent = this;
            frm.Show();
        }

        private void tsbExit_Click(object sender, EventArgs e)
        {
            if (this.MdiChildren.Length == 0)
                this.Close();
            else
                if (MessageBox.Show(EXIT_CONFIRM, EXIT_CAPTION, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
                    this.Close();
        }

        private void tsbStatics_Click(object sender, EventArgs e)
        {
            ShowChild(new frmStatic());
        }

        private void tsbAddPart_Click(object sender, EventArgs e)
        {
            ShowChild(new frmAddPart());
        }

        private void tsbSerach_Click(object sender, EventArgs e)
        {
            ShowChild(new frmSearch());
        }

        private void tsbCashes_Click(object sender, EventArgs e)
        {
            ShowChild(new frmCashStatics());
        }

        private void tbsAddBuild_Click(object sender, EventArgs e)
        {
            ShowChild(new frmAddBuild());
        }

        private void tsbAddGround_Click(object sender, EventArgs e)
        {
            ShowChild(new frmAddGround());
        }

        private void tsbAddClient_Click(object sender, EventArgs e)
        {
            ShowChild(new frmClientStatics());
        }

        private void tsbHelp_Click(object sender, EventArgs e)
        {

        }
    }
}
