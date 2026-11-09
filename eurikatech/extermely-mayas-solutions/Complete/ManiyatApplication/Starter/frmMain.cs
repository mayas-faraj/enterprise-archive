using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Starter
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();        
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            try
            {
                mainService.mainService main = new mainService.mainService();
                main.Url = "http://www.mainagent.somee.com/mainService.asmx";

                String[] result = main.Splite(tx1.Text);

                tx2.Text = "";

                foreach (String str in result)
                    tx2.Text += str + "*";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.Source);
            }
        }
    }
}
