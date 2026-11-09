using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace HeartClinic
{
    public partial class FrmDoctors : Form
    {
        public FrmDoctors()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMain form = new FrmMain();
            form.Show();
            this.Hide();
        }
    }
}