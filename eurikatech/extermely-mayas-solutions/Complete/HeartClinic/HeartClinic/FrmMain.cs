using System;
using System.Windows.Forms;

namespace HeartClinic
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }

        private void btnOperation_Click(object sender, EventArgs e)
        {
            FrmOperation fOperation = new FrmOperation();
            fOperation.Show();
            this.Hide();
        }

        private void btnOperationShort_Click(object sender, EventArgs e)
        {
            FrmOperationShort fOperation = new FrmOperationShort();
            fOperation.Show();
            this.Hide();
        }

        private void btnSicks_Click(object sender, EventArgs e)
        {
            FrmSicks fSicks = new FrmSicks();
            fSicks.Show();
            this.Hide();
        }

        private void btnDoctors_Click(object sender, EventArgs e)
        {
            FrmDoctors fDoctors = new FrmDoctors();
            fDoctors.Show();
            this.Hide();
        }

        private void btnHalls_Click(object sender, EventArgs e)
        {
            FrmHalls fHalls = new FrmHalls();
            fHalls.Show();
            this.Hide();
        }

        private void btnGives_Click(object sender, EventArgs e)
        {
            FrmGives fGives = new FrmGives();
            fGives.Show();
            this.Hide();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}