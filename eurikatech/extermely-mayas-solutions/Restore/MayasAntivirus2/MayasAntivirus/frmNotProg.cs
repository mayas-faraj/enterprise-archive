using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MayasAntivirus
{
    public partial class frmNotProg : Form
    {
        frmConfigure frmCaller;
        Configure tempConfigure;

        public frmNotProg(frmConfigure caller)
        {
            InitializeComponent();
            frmCaller = caller;
            tempConfigure = caller.tempConfigure;

            if (frmCaller.tempConfigure.CheckNotProg(""))
            {
                lbOldPassword.Visible = false;
                txOldPassword.Visible = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Boolean acceptChange = false;

            if (txNewPassword.Text == txConfirmPassword.Text)
            {
                if (txOldPassword.Visible)
                {
                    if (tempConfigure.CheckNotProg(txOldPassword.Text))
                        acceptChange = true;
                    else
                    {
                        MessageBox.Show("Old password is wrone !", "Changing password", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        txNewPassword.Clear();
                        txConfirmPassword.Clear();
                    }
                }

                if (acceptChange || !txOldPassword.Visible)
                {
                    tempConfigure.NotProg = txNewPassword.Text;

                    if (tempConfigure.SaveNotProg())
                    {
                        MessageBox.Show("New password changed", "Changing password", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        frmCaller.tempConfigure = tempConfigure;
                    }
                    else
                        MessageBox.Show("exception while trying to save password !", "Changing password", MessageBoxButtons.OK, MessageBoxIcon.Error);

                   
                    this.Hide();
                }
            }
            else
            {
                MessageBox.Show("Input passwords not matching , try again!", "Changing password", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txNewPassword.Clear();
                txConfirmPassword.Clear();
            }
        }
    }
}
