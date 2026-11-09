using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FunctionDrawer
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            FillTexts();

            txParameter.KeyPress += new KeyPressEventHandler(tx_KeyPress);
            txStartR.KeyPress += new KeyPressEventHandler(tx_KeyPress);
            txEndR.KeyPress += new KeyPressEventHandler(tx_KeyPress);
            txStep.KeyPress += new KeyPressEventHandler(tx_KeyPress);
            botDraw.Click += new EventHandler(botDraw_Click);
            this.Paint += new PaintEventHandler(this_Paint);
            this.SizeChanged += new EventHandler(frmMain_SizeChanged);
        }

        void frmMain_SizeChanged(object sender, EventArgs e)
        {
            FillTexts();
        }

        private void this_Paint(object sender, PaintEventArgs e)
        {
            DrawAxis(50, 50, 5, Color.Red, Color.Green);
        }

        private void tx_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (((int)e.KeyChar < 48 || (int)e.KeyChar > 57) && (int)e.KeyChar != 46 && (int)e.KeyChar != 8 && (int)e.KeyChar != 45)
                e.Handled = true;
        }

        private void botDraw_Click(object sender, EventArgs e)
        {
            Graphics gr = panel.CreateGraphics();
            gr.Clear(panel.BackColor);

            DrawAxis(25, 25, 5, Color.Red, Color.Green);
            Pen pen = new Pen(Color.Blue, 1);
            Single result = 0, lresult = 0;
            lresult = panel.ClientRectangle.Height / 2 - function(0, Convert.ToSingle(txParameter.Text));

            for (int n = Convert.ToInt32(txStartR.Text); n <= Convert.ToInt32(txEndR.Text); n += Convert.ToInt32(txStep.Text))
            {
                result = (panel.ClientRectangle.Height / 2) - function(n, Convert.ToSingle(txParameter.Text));
                gr.DrawLine(pen, n + (int)(panel.ClientRectangle.Width / 2), result, n - (1 - (int)(panel.ClientRectangle.Width / 2)), lresult);
                lresult = result;
            }

            pen.Dispose();
            gr.Dispose();
        }

        private void DrawAxis(int xStep, int yStep, int width, Color xColor, Color yColor)
        {
            Graphics gr = panel.CreateGraphics();

            gr.Clear(panel.BackColor);
            gr.DrawLine(new Pen(xColor, width), new Point(0, (int)panel.ClientRectangle.Height / 2), new Point((int)panel.ClientRectangle.Width, panel.ClientRectangle.Height / 2));
            gr.DrawLine(new Pen(yColor, width), new Point((int)panel.ClientRectangle.Width / 2, 0), new Point((int)panel.ClientRectangle.Width / 2, panel.ClientRectangle.Height));

            if (xStep != 0)
                for (int x = xStep; x < panel.ClientRectangle.Width; x += xStep)
                    gr.DrawLine(new Pen(xColor, 1), new Point(x, (int)(panel.ClientRectangle.Height / 2) + width), new Point(x, (int)(panel.ClientRectangle.Height / 2) - width));

            if (yStep != 0)
                for (int y = yStep; y < panel.ClientRectangle.Height; y += yStep)
                    gr.DrawLine(new Pen(yColor, 1), new Point((int)(panel.ClientRectangle.Width / 2) + width, y), new Point((int)(panel.ClientRectangle.Width / 2) - width, y));

            gr.Dispose();
        }

        private void FillTexts()
        {
            txStartR.Text = Convert.ToString(-panel.ClientRectangle.Width / 2);
            txEndR.Text = Convert.ToString(panel.ClientRectangle.Width / 2);
        }

        private float function(int range, float parameter)
        {
            //if (range == 0) return 0;
            return (float)
                (
                100 * Math.Log(Math.Abs(parameter * range))
                );
        }
    }
}