using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace PaymentEditior
{
    public partial class frmConfigure : Form
    {
        private Configure currentConfigure;
        private frmMain callerForm;

        public frmConfigure(frmMain caller)
        {
            InitializeComponent();

            currentConfigure = SharedFunction.LoadConfigure();
            callerForm = caller;

            nudPayNum.Value = currentConfigure.PaymentNum;
            nudCopesNum.Value = currentConfigure.CopesNum;
            txSpace.Text = currentConfigure.Space.ToString();
            txWidth.Text = currentConfigure.Width.ToString();
            txHeight.Text = currentConfigure.Height.ToString();


        }

        private void button1_Click(object sender, EventArgs e)
        {
            ColorDialog clrDiag = new ColorDialog();
            
            clrDiag.Color = currentConfigure.Color;

            if (clrDiag.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                currentConfigure.Color = clrDiag.Color;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FontDialog fntDiag = new FontDialog();

            fntDiag.Font = currentConfigure.Font;
            fntDiag.ShowApply = false;
            fntDiag.ScriptsOnly = true;
            fntDiag.FontMustExist = true;

            if (fntDiag.ShowDialog() == DialogResult.OK)
                currentConfigure.Font = fntDiag.Font;
        }

        private void btnImage_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();

            ofd.Title = "إختيار مسار الصورة";
            ofd.Multiselect = false;
            ofd.FileName = currentConfigure.ImagePath;
            ofd.Filter = "Image Files (jpg,png,bmp,gif)|*.jpg;*.png;*.bmp;*.gif|All Files|*.*";

            if (ofd.ShowDialog() == DialogResult.OK)
                currentConfigure.ImagePath = ofd.FileName;
        }

        private void btnsave_Click(object sender, EventArgs e)
        {
            currentConfigure.CopesNum = Convert.ToInt32(nudCopesNum.Value);
            currentConfigure.PaymentNum = Convert.ToInt32(nudPayNum.Value);
            currentConfigure.Space = Convert.ToInt32(txSpace.Text);
            currentConfigure.Width = Convert.ToInt32(txWidth.Text);
            currentConfigure.Height = Convert.ToInt32(txHeight.Text);
            currentConfigure.TransBg = cbTransparent.Checked;

            SharedFunction.SaveConfigure(currentConfigure);
            this.Hide();

            RefreshCallerForm();
        }

        private void btnDefault_Click(object sender, EventArgs e)
        {

            DialogResult ms = MessageBox.Show("سيتم مسح الإعدادات الحالية واستبدالها بالإعدادات الإفتراضية للبرنامج", "تحميل الإعدادات الإفتراضية" + "\r\n" + "هل تريد المتابعة ؟", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (ms == DialogResult.Yes)
            {
                currentConfigure.Color = System.Drawing.Color.Black;
                currentConfigure.CopesNum = 1;
                currentConfigure.Font = new Font("Times New Roman", 12, FontStyle.Regular);
                currentConfigure.Width = 600;
                currentConfigure.Height = 283;
                currentConfigure.Space = 5;
                currentConfigure.PaymentNum = 3;
                currentConfigure.TransBg = true;
                currentConfigure.ImagePath = Application.StartupPath + "\\Default.jpg";

                SharedFunction.SaveConfigure(currentConfigure);

                this.Hide();

                RefreshCallerForm(); 
            }
        }

        private void RefreshCallerForm()
        {
            PictureBox pbMain = (PictureBox)(callerForm.Controls["pnlPb"].Controls["pbMain"]);
            Size pbMainSize = pbMain.Size;
            callerForm.configure = currentConfigure;
            ((CheckBox)callerForm.Controls["cbTransparent"]).Checked = currentConfigure.TransBg;
            pbMain.BackgroundImage = Image.FromFile(currentConfigure.ImagePath);
            pbMain.Width = currentConfigure.Width;
            pbMain.Height = currentConfigure.Height;

            foreach (Control ctrl in pbMain.Controls)
            {
                ctrl.ForeColor = currentConfigure.Color;
                ctrl.Font = currentConfigure.Font;

                if (currentConfigure.TransBg)
                    ctrl.BackColor = Color.Transparent;
                else
                    ctrl.BackColor = Color.FromArgb(255, 225, 225, 225);

                if (pbMainSize != pbMain.Size)
                {
                    ctrl.Left = Convert.ToInt32(pbMain.Size.Width * ctrl.Left / (Single)pbMainSize.Width);
                    ctrl.Top = Convert.ToInt32(pbMain.Size.Height * ctrl.Top / (Single)pbMainSize.Height);
                }
            }

            SharedFunction.SaveItems(pbMain);
            callerForm.Activate();
        }

    }
}
