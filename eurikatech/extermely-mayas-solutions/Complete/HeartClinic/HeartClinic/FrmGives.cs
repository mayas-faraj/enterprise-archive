using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace HeartClinic
{
    public partial class FrmGives : Form
    {
        public FrmGives()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FrmMain form = new FrmMain();
            form.Show();
            this.Hide();
        }
    }
}