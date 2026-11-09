using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmMain : Form
    {
        private Boolean[] keys;
        private Maniyat.HDLTone code;

        public frmMain()
        {
            InitializeComponent();

            code = new Maniyat.HDLTone();
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            String[] strKeys = txKeys.Text.Split(' ', ',', '.', '-', '_', '\\', '/');
            keys = new Boolean[strKeys.Length];

            if (txKeys.Text == "")
                return;

            for (Int32 i = 0; i < strKeys.Length; i++)
                if (strKeys[i].ToLower() == "true" || strKeys[i] == "1")
                    keys[i] = true;
                else
                    keys[i] = false;

            txRequestCode.Text = code.GetHDLTone(Convert.ToInt32(nudDepth.Value), Convert.ToInt32(nudMulti.Value), Convert.ToInt32(nudShift.Value), keys);
        }

        private void btnActivate_Click(object sender, EventArgs e)
        {
            Maniyat.HDLTone code = new Maniyat.HDLTone();

            String internalCode=txInternalCode.Text;
            String requestCode=txRequestCode.Text;
            String actCode=txActivateCode.Text;

            if (code.IsActivate(ref internalCode,ref requestCode, ref actCode))
                MessageBox.Show("Application Activate", "Activation Complite", MessageBoxButtons.OK, MessageBoxIcon.Information);
            else
                MessageBox.Show("Application not activate", "Activation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

          
        }
    }
}
