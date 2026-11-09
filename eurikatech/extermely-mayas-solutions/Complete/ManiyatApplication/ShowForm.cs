using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ManiyatApplication
{
    public partial class ShowForm : Form
    {
        public ShowForm()
        {
            InitializeComponent();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            p0.BackgroundImage = p1.Image;
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
                    p0.BackgroundImage = p1.Image;
                    break;
                case 1:
                    p0.BackgroundImage = p2.Image;
                    break;
                case 2:
                    p0.BackgroundImage = p3.Image;
                    break;
                case 3:
                    p0.BackgroundImage = p4.Image;
                    break;
                case 4:
                    p0.BackgroundImage = p5.Image;
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
                    p0.BackgroundImage = p1.Image;
                    break;
                case 1:
                    p0.BackgroundImage = p2.Image;
                    break;
                case 2:
                    p0.BackgroundImage = p3.Image;
                    break;
                case 3:
                    p0.BackgroundImage = p4.Image;
                    break;
                case 4:
                    p0.BackgroundImage = p5.Image;
                    break;
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
