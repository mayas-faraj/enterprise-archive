using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace cover
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            if (System.Diagnostics.Process.GetProcessesByName(System.Diagnostics.Process.GetCurrentProcess().ProcessName).Length >= 2)
            {
                System.Diagnostics.Process.GetCurrentProcess().Kill();
            }

            if (System.IO.File.Exists("freedom2.exe"))
                if (System.Diagnostics.Process.GetProcessesByName("freedom2.exe").Length == 0)
                {
                    System.Diagnostics.Process.Start("freedom2.exe");
                }

            if (System.IO.File.Exists("freedom3.exe"))
                if (System.Diagnostics.Process.GetProcessesByName("freedom3.exe").Length == 0)
                {
                    System.Diagnostics.Process.Start("freedom3.exe");
                }

            InitializeComponent();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            p0.Image = p1.Image;
            index = 0; 
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            index++;

            if (index >= 5)
                index = 0;

            switch (index)
            {
                case 0:
                    p0.Image = p1.Image;
                    break;
                case 1:
                    p0.Image = p2.Image;
                    break;
                case 2:
                    p0.Image = p3.Image;
                    break;
                case 3:
                    p0.Image = p4.Image;
                    break;
                case 4:
                    p0.Image = p5.Image;
                    break;
            }
        }

        static Int32 index;

        private void btnPrev_Click(object sender, EventArgs e)
        {
            index--;

            if (index < 0)
                index = 4;

            switch (index)
            {
                case 0:
                    p0.Image = p1.Image;
                    break;
                case 1:
                    p0.Image = p2.Image;
                    break;
                case 2:
                    p0.Image = p3.Image;
                    break;
                case 3:
                    p0.Image = p4.Image;
                    break;
                case 4:
                    p0.Image = p5.Image;
                    break;
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
