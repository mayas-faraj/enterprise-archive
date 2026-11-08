using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace KafryScreenSaver
{
    public partial class frmMain : Form
    {
        [DllImport("user32.dll")]
        static extern IntPtr SetParent(IntPtr hWndChild, IntPtr hWndNewParent);

        [DllImport("user32.dll")]
        static extern int SetWindowLong(IntPtr hWnd, int nIndex, IntPtr dwNewLong);

        [DllImport("user32.dll", SetLastError = true)]
        static extern int GetWindowLong(IntPtr hWnd, int nIndex);

        [DllImport("user32.dll")]
        static extern bool GetClientRect(IntPtr hWnd, out Rectangle lpRect);

        private Boolean previewMode;
        private Point mouseLocation;

        public frmMain(Rectangle bounds)
        {
            InitializeComponent();

            this.Bounds = bounds;
        }

        public frmMain(IntPtr previewWndHandle)
        {
            InitializeComponent();

            SetParent(this.Handle, previewWndHandle);
            SetWindowLong(this.Handle, -16, new IntPtr(GetWindowLong(previewWndHandle, -16) | -0x40000000));

            Rectangle ParentRect;
            GetClientRect(previewWndHandle, out ParentRect);
            Size = ParentRect.Size;
            Location = new Point(0, 0);
            previewMode = true;
        }

        private void terminate()
        {
            if (!previewMode)
                Application.Exit();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            this.TopMost = true;
            Cursor.Hide();

        }

        private void frmMain_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseLocation.X == 0 && mouseLocation.Y == 0)
                mouseLocation = e.Location;

            if ((Math.Abs(e.X - mouseLocation.X) == 5) || Math.Abs(e.Y - mouseLocation.Y) == 5)
                terminate();

            mouseLocation = e.Location;
        }

        private void frmMain_KeyPress(object sender, KeyPressEventArgs e)
        {
            terminate();
        }

        private void frmMain_Click(object sender, EventArgs e)
        {
            terminate();
        }

        private void tmrMain_Tick(object sender, EventArgs e)
        {
            if (lbMain.Left != (this.Width - lbMain.Width) / 2)
                lbMain.Left -= 1;

            if (lbSlave.Left != (this.Width - lbSlave.Width) / 2)
                lbSlave.Left += 1;

            if ((lbMain.Left == (this.Width - lbMain.Width) / 2) && (lbSlave.Left == (this.Width - lbSlave.Width) / 2))
                if (lbManager.Top > lbSlave.Top + 150)
                    lbManager.Top -= 10;
                else
                    if (pbImage.Height < pbImage.Width)
                        pbImage.Height++;
                    else
                        if (pb1.Top > lbManager.Top + 150)
                        {
                            pb1.Top -= 10;
                            pb2.Top -= 10;
                            pb3.Top -= 10;
                        }
                        else
                            if (lbManager.Left > pbImage.Left + pbImage.Width + 50)
                                lbManager.Left--;
                            else
                                lbManager.Left = this.Width - lbManager.Width - 50;
                        

                    
                  


        }
    }
}
