using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Drawing.Printing;

namespace PaymentEditior
{
    public partial class frmMain : Form
    {
        private const Int32 INCREMENT = 10;

        private Label selectedLabel;
        private Int32 coordinate;
        private Boolean isClicked;
        private Point ClickedPoint;
        private PrintDocument pDoc;

        public Configure configure;

        public frmMain()
        {
            InitializeComponent();

            coordinate = 0;
            isClicked = false;

            setFormSelectedState(false);
            configure = SharedFunction.LoadConfigure();
            pDoc = new PrintDocument();

            pDoc.PrintPage += new PrintPageEventHandler(pDoc_PrintPage);

            pbMain.Location = new Point(0, 0);
            pbMain.Size = new Size(configure.Width, configure.Height);
            pbMain.BackgroundImage = Image.FromFile(configure.ImagePath);

            SharedFunction.LoadItems(pbMain);

            foreach (Control ctrl in pbMain.Controls)
            {
                Label lbl = (Label)ctrl;

                lbl.MouseDown += new MouseEventHandler(lbl_MouseDown);
                lbl.MouseMove += new MouseEventHandler(lbl_MouseMove);
                lbl.MouseUp += new MouseEventHandler(lbl_MouseUp);
            }
        }

        void pDoc_PrintPage(object sender, PrintPageEventArgs e)
        {
            Int32 xShift;
            Int32 yShift;

            for (Int32 i = 0; i < configure.PaymentNum; i++)
            {
                xShift = Convert.ToInt32((e.PageBounds.Width - configure.Width) / 2);
                yShift = configure.Space + (i * (configure.Space + configure.Height));

                e.Graphics.DrawImage(pbMain.BackgroundImage, xShift, yShift, configure.Width, configure.Height);

                foreach (Control ctrl in pbMain.Controls)
                {
                    if (ctrl.GetType() == typeof(Label))
                        e.Graphics.DrawString(ctrl.Text, ctrl.Font, new SolidBrush(ctrl.ForeColor), ctrl.Left + xShift, ctrl.Top + yShift);
                }
            }
        }

        private void setFormSelectedState(Boolean state)
        {
            if (state)
            {
                btnAdd.Enabled = false;
                btnEdit.Enabled = true;
                btnDelete.Enabled = true;

                btnUp.Enabled = btndown.Enabled = btnLeft.Enabled = btnRight.Enabled = btncenter.Enabled = true;

                txX.Text = selectedLabel.Location.X.ToString();
                txY.Text = selectedLabel.Location.Y.ToString();
                txText.Text = selectedLabel.Text;
            }
            else
            {
                btnAdd.Enabled = false;
                btnEdit.Enabled = false;
                btnDelete.Enabled = false;

                btnUp.Enabled = btndown.Enabled = btnLeft.Enabled = btnRight.Enabled = btncenter.Enabled = false;

                txX.Clear();
                txY.Clear();
                txText.Clear();
            }
        }

        private void btnConfigure_Click(object sender, EventArgs e)
        {
            frmConfigure frm = new frmConfigure(this);
            frm.Show();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Label lbl = new Label();

            if (cbTransparent.Checked)
                lbl.BackColor = System.Drawing.Color.Transparent;
            else
                lbl.BackColor = Color.FromArgb(255, 225, 225, 225);

            lbl.Text = txText.Text;
            lbl.Font = configure.Font;
            lbl.ForeColor = configure.Color;
            lbl.AutoSize = true;
            lbl.Location = new Point(coordinate, coordinate);

            coordinate += INCREMENT;

            pbMain.Controls.Add(lbl);

            lbl.MouseDown += new MouseEventHandler(lbl_MouseDown);
            lbl.MouseMove += new MouseEventHandler(lbl_MouseMove);
            lbl.MouseUp += new MouseEventHandler(lbl_MouseUp);

            txText.Clear();
        }

        private void lbl_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                isClicked = false;
            }
        }

        private void lbl_MouseMove(object sender, MouseEventArgs e)
        {
            if (isClicked)
            {
                ((Label)sender).Left += e.X - ClickedPoint.X;
                ((Label)sender).Top += e.Y - ClickedPoint.Y;

                txX.Text = selectedLabel.Left.ToString();
                txY.Text = selectedLabel.Top.ToString();
            }
        }

        private void lbl_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                selectedLabel = (Label)sender;
                setFormSelectedState(true);
                isClicked = true;
                ClickedPoint = e.Location;
                selectedLabel = (Label)sender;
                txText.Text = selectedLabel.Text;
                txX.Text = selectedLabel.Left.ToString();
                txY.Text = selectedLabel.Top.ToString();  
            }
        }

        private void txText_TextChanged(object sender, EventArgs e)
        {
            if (txText.Text != "" && selectedLabel==null)
                btnAdd.Enabled = true;
            else
                btnAdd.Enabled = false;
        }

        private void btncenter_Click(object sender, EventArgs e)
        {
            selectedLabel.Left = (pbMain.Width - selectedLabel.Width) / 2;
            selectedLabel.Top = (pbMain.Height - selectedLabel.Height) / 2;

            txX.Text = selectedLabel.Left.ToString();
            txY.Text = selectedLabel.Top.ToString();
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            selectedLabel.Top--;
            txY.Text = selectedLabel.Top.ToString();
        }

        private void btndown_Click(object sender, EventArgs e)
        {
            selectedLabel.Top++;
            txY.Text = selectedLabel.Top.ToString();
        }

        private void btnRight_Click(object sender, EventArgs e)
        {
            selectedLabel.Left++;
            txX.Text = selectedLabel.Left.ToString();
        }

        private void btnLeft_Click(object sender, EventArgs e)
        {
            selectedLabel.Left--;
            txX.Text = selectedLabel.Left.ToString();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (selectedLabel != null)
            {
                selectedLabel.Text = txText.Text;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (selectedLabel != null)
                pbMain.Controls.Remove(selectedLabel);

            selectedLabel = null;
            setFormSelectedState(false);
        }

        private void btnColor_Click(object sender, EventArgs e)
        {
            ColorDialog clrDiag = new ColorDialog();

            clrDiag.Color = configure.Color;

            if (clrDiag.ShowDialog() == DialogResult.OK)
            {
                if (selectedLabel != null)
                    selectedLabel.ForeColor = clrDiag.Color;
                else
                    configure.Color = clrDiag.Color;
            }
        }

        private void btnFont_Click(object sender, EventArgs e)
        {
            FontDialog fntDiag = new FontDialog();

            fntDiag.Font = configure.Font;
            fntDiag.ShowApply = false;
            fntDiag.ScriptsOnly = true;
            fntDiag.FontMustExist = true;

            if (fntDiag.ShowDialog() == DialogResult.OK)
            {
                if (selectedLabel != null)
                    selectedLabel.Font = fntDiag.Font;
                else
                    configure.Font = fntDiag.Font;
            }
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult ms = MessageBox.Show("هل تريد حفظ المواقع الجديدة للنصوص", "إغلاق البرنامج", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);

            if (ms == DialogResult.Yes)
            {
                SharedFunction.SaveItems(pbMain);
            }
            else
                if (ms == DialogResult.Cancel)
                    e.Cancel = true;
        }

        private void ptnPrint_Click(object sender, EventArgs e)
        {
            PrintDialog pDiag = new PrintDialog();

            pDiag.Document = pDoc;
            pDiag.AllowCurrentPage = false;
            pDiag.AllowSelection = false;
            pDiag.AllowPrintToFile = true;
            pDiag.AllowSomePages = false;

            if (pDiag.ShowDialog() == DialogResult.OK)
                pDoc.Print();
        }

        private void btnPreview_Click(object sender, EventArgs e)
        {
            PrintPreviewDialog ppd = new PrintPreviewDialog();

            ppd.Document = pDoc;
            ppd.Show();
        }

        private void pbMain_Click(object sender, EventArgs e)
        {
            setFormSelectedState(false);
            selectedLabel = null;
        }
    }
}
