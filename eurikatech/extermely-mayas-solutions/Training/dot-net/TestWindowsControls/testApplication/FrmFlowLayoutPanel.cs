using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace testApplication
{
    public partial class frmMain : Form
    {
        Int32 i = 0;

        public frmMain()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            TextBox tbTmp = new TextBox();
            tbTmp.Text = "Text " + i++.ToString();
            tbTmp.Width = 100;
            flpMain.Controls.Add(tbTmp);
        }
    }
}
