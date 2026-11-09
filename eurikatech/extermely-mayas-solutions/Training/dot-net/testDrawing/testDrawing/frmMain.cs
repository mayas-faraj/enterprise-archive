using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace testDrawing
{
    public partial class frmMain : Form
    {
        private Graphics gr;

        public frmMain()
        {
            InitializeComponent();
            gr = Graphics.FromHwndInternal(pnlDraw.Handle);
        }

        private void btnDraw_Click(object sender, EventArgs e)
        {
            gr.TranslateTransform(Convert.ToSingle(nudX.Value), Convert.ToSingle(nudY.Value));
            gr.RotateTransform(Convert.ToSingle(nudA.Value));
            gr.DrawImage(Image.FromFile("f:\\asd.jpg"),0,0,50,200);
        }
    }
}
