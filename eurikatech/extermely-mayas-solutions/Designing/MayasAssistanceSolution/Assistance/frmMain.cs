using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Assistance
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnServices_Click(object sender, EventArgs e)
        {
            frmService frm = new frmService();
            frm.Show();
            this.Hide();
        }

        private void btnFiles_Click(object sender, EventArgs e)
        {
            frmFileManager frm = new frmFileManager();
            frm.Show();
            this.Hide();
        }
    }
}
