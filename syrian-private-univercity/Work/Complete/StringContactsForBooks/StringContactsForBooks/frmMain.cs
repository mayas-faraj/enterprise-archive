using System;
using System.Windows.Forms;

namespace StringContactsForBooks
{
    //12/12/2010
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            //close application
            this.Close();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            //clear texts
            txInput.Clear();
            txOutput.Clear();
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            //get input values lines
            String[] input = txInput.Text.Split(new String[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries);

            //clear output text : output is accumator
            txOutput.Clear();

            //for all line in input value
            for (Int32 i = 0; i < input.Length; i++)
            {
                //if input line have point must insert new line
                if (input[i].IndexOf('.') != -1)
                    input[i] = input[i].Insert(input[i].IndexOf('.') + 1, "\r\n");

                //factor of output line
                txOutput.Text += input[i] + (cmSpace.Checked ? " " : "");

            }

            Clipboard.SetData("Text", txOutput.Text);
        }

        private void cmRtl_CheckedChanged(object sender, EventArgs e)
        {
            //options
            txOutput.RightToLeft = cmRtl.Checked ? RightToLeft.Yes : RightToLeft.No;
            txInput.RightToLeft = cmRtl.Checked ? RightToLeft.Yes : RightToLeft.No;
        }
    }
}
