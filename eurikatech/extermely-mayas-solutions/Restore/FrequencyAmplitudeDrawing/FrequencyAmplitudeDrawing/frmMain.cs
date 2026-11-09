using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FrequencyAmplitudeDrawing
{
    public partial class frmMain : Form
    {
        private Graphics gr;
        private Pen pen;
        private Boolean isDrawer;
        private Single N6, S, T, K, Kc;
        private Single XL, XH, YL, YH, ZL, ZH;
        private Single NS, N, DY, DX, SZ;
        private Single ZT, YT;
        private Single B, V, X, Y;
        private Char P, O, A;
        private String NR, K2;
        private Color textErrorColor;
        private Color textNormalColor;
        private Color drawingColor;
        private Single A0, A1, A2, A3, A4, A5, A6;
        private Single O11, O12, O13;
        private Single RM1, JM1, GO, RM, JM, G, F, Z, TZ;
        private Single DJ, J = 0, TZ0, P0;

        const Single PERCENT = 80;
        const Single DRAWPERCENT = .2f;
        
        public frmMain()
        {
            InitializeComponent();

            textErrorColor = Color.FromArgb(255, 255, 180, 180);
            textNormalColor = Color.FromArgb(255, 255, 255, 255);
            drawingColor = Color.FromArgb(255, 0, 0, 255);

            pen = new Pen(drawingColor, 5);

            isDrawer = false;

            this.Paint += new PaintEventHandler(frmMain_Paint);
            txK.LostFocus += new EventHandler(tx_LostFocus);
            txKc.LostFocus += new EventHandler(tx_LostFocus);
            txN6.LostFocus += new EventHandler(tx_LostFocus);
            txNR.LostFocus += new EventHandler(tx_LostFocus);
            txNS.LostFocus += new EventHandler(tx_LostFocus);
            txS.LostFocus += new EventHandler(tx_LostFocus);
            txT.LostFocus += new EventHandler(tx_LostFocus);
            txXH.LostFocus += new EventHandler(tx_LostFocus);
            txXL.LostFocus += new EventHandler(tx_LostFocus);
            txYH.LostFocus += new EventHandler(tx_LostFocus);
            txYL.LostFocus += new EventHandler(tx_LostFocus);
            txYT.LostFocus += new EventHandler(tx_LostFocus);
            txZH.LostFocus += new EventHandler(tx_LostFocus);
            txZL.LostFocus += new EventHandler(tx_LostFocus);
            txZT.LostFocus += new EventHandler(tx_LostFocus);

            pnlSurface.DoubleClick += new EventHandler(pnlSurface_DoubleClick);

        }

        void frmMain_Paint(object sender, PaintEventArgs e)
        {
            if (isDrawer)
                draw();
        }

        void pnlSurface_DoubleClick(object sender, EventArgs e)
        {
            isDrawer = true;
            draw();
        }

        private void draw()
        {

            Font fnt = new Font("Times New Roman", 11);

            gr = pnlSurface.CreateGraphics();
            //gr.Clear(Color.White);

            N6 = Single.Parse(txN6.Text);
            S = Single.Parse(txS.Text);
            T = Single.Parse(txT.Text);
            K = Single.Parse(txK.Text);
            Kc = Single.Parse(txKc.Text);
            XL = Single.Parse(txXL.Text);
            XH = Single.Parse(txXH.Text);
            YL = Single.Parse(txYL.Text);
            YH = Single.Parse(txYH.Text);
            ZL = Single.Parse(txZL.Text);
            ZH = Single.Parse(txZH.Text);
            NS = Single.Parse(txNS.Text);
            ZT = Single.Parse(txZT.Text);
            YT = Single.Parse(txYT.Text);
            NR = txNR.Text;

            if (rbB.Checked)
                P = 'B';
            else
                P = 'V';

            txOutput.Text = "number of curves APFC" + P + "\r\n";
            txOutput.Text += "Picking values : ZT=" + ZT + ", YT=" + YT + "\r\n";
            txOutput.Text += "FORM." + NR + "APFC" + "\r\n";
            txOutput.Text += "Model " + S + " " + T + " " + Kc + " " + K + " " + XL + "<" + O + "<" + XH;

            N = NS - 1;

            if (P == 'B')
            {
                O = 'b';
                A = 'v';
            }
            else
            {
                O = 'v';
                A = 'b';

                Single tmp;

                tmp = XL;
                XL = YL;
                YL = tmp;

                tmp = XH;
                XH = YH;
                YH = tmp;
            }

            DY = (YH - YL) / 155;
            if (N != 0)
                DX = (XH - XL) / N;
            SZ = 189 / (ZH - ZL);

            X = XL;

            gr.DrawLine(pen, 0, 190, 625, 190);
            gr.DrawLine(pen, 0, 0, 0, 190);
            gr.DrawLine(pen, 0, 0, 625, 0);
            gr.DrawLine(pen, 625, 0, 625, 190);


            YH = YL;
            Y = YL;
            gosub660();

            for (Int32 I = 0; I <= N; I++)
            {
                Y = YL;
                gosub660();
                Z = Z - ZT * X;
                TZ0 = 189 - SZ * (Z - ZL);
                gr.TranslateTransform(0, TZ0*DRAWPERCENT);

                for (Int32 J = 1; J <= 155; J++)
                {
                    gosub660();
                    Z = Z - ZT * X;
                    gosub540();
                    TZ0 = TZ;
                    Y = Y + DY;
                }

                X = X + DX;
            }

            K2 = "#.##";

            if (YL != 0)
                gr.DrawString(YL.ToString(K2), fnt, Brushes.Red, 24 * PERCENT, 4 * PERCENT);

            gr.DrawString(YH.ToString(K2), fnt, Brushes.Red, 24 * PERCENT, 71 * PERCENT);
            gr.DrawString("(0)", fnt, Brushes.Red, 0, 0);

            if (ZL != 0)
                gr.DrawString(ZL.ToString(K2), fnt, Brushes.Red, 23 * PERCENT, 1 * PERCENT);

            gr.DrawString(ZH.ToString(K2), fnt, Brushes.Red, 1 * PERCENT, 1 * PERCENT);
            gr.DrawString("| Q(JV) |", fnt, Brushes.Red, 3 * PERCENT, 2 * PERCENT);
            gr.DrawString(A.ToString(), fnt, Brushes.Red, 22 * PERCENT, 75 * PERCENT);
        }

        private void checkInput(TextBox text)
        {
            Single result;
            if (Single.TryParse(text.Text, out result))
                text.BackColor = textNormalColor;
            else
            {
                text.Text = "0";
                text.BackColor = textErrorColor;
            }
        }

        private void tx_LostFocus(Object sender, EventArgs e)
        {
            checkInput((TextBox)sender);
        }

        private void gosub660()
        {
            if (P == 'B')
            {
                B = X;
                V = Y;
            }
            else
            {
                V = X;
                B = X;
            }

            if (V == 0)
                V = 1E-9f;



            A6 = 2 * T * T;
            A5 = 2 * T * (1 + T * Kc * S / N6);
            A4 = 2 * T * (T + S * Kc / N6) + 1;
            A3 = Kc * S / N6 + 2 * T + K * B * S;
            A2 = B * S * Kc * K / N6 + K * S + 1;
            A1 = K * (B + Kc * S / N6);
            A0 = K;

            O13 = B * Kc * S / N6;
            O12 = Kc * S / N6 + B;
            O11 = 1;
            RM1 = O12 * V * V;
            JM1 = O11 * V - O13 * V * V * V;
            GO = (Single)(K * N6 * Math.Sqrt(RM1 * RM1 + JM1 * JM1));
            RM = A0 - A2 * V * V + A4 * V * V * V * V - A6 * V * V * V * V * V * V;
            JM = A1 * V - A3 * V * V * V + A5 * V * V * V * V * V;
            G = (Single)Math.Sqrt(RM * RM + JM * JM);
            F = GO / G;
            Z = F;

            return;
        }

        private void gosub540()
        {
            TZ = 189 - SZ * (Z - ZL);
            if (TZ > 189)
                return;

            DJ = 4 * J;
            if (TZ < 0)
            {
                gr.TranslateTransform(DJ * DRAWPERCENT, 0);
                return;
            }

            if (TZ == 189)
                return;
            
            gr.DrawLine(pen, DJ - 4, TZ0, DJ, TZ);
            for (P0 = 0; P0 <= 2; P0++)
                gr.DrawLine(pen, DJ + P0, 189, DJ + P0, TZ);

            return;
        }
    }
}