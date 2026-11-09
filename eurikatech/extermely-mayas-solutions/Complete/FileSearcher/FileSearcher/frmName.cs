using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FileSearcher
{
    public partial class frmName : Form
    {
        public frmName()
        {
            InitializeComponent();
        }

        private void btnMain_Click(object sender, EventArgs e)
        {
            txMain.Clear();

            foreach (String fName in Maniyat.FileSearcher.Searching(txPath.Text, txPattern.Text, Convert.ToInt32(nudDepth.Value)))
                txMain.Text += fName + Environment.NewLine;
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            fbd.ShowNewFolderButton = true;

            if (txPath.Text != "")
                fbd.SelectedPath = txPath.Text;

            if (fbd.ShowDialog() == DialogResult.OK)
                txPath.Text = fbd.SelectedPath;
        }

        
    }
}
