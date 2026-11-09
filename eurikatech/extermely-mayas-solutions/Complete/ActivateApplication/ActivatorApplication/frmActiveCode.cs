using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ActivatorApplication
{
    public partial class frmActiveCode : Form
    {
        public frmActiveCode()
        {
            InitializeComponent();
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            Maniyat.Activator activator = new Maniyat.Activator();
            String[] strKeys = txKeys.Text.Split(' ', ',', '.', '-', '_', '\\', '/');
            Boolean[] keys = new Boolean[strKeys.Length];

            for (Int32 i = 0; i < strKeys.Length; i++)
                if (strKeys[i].ToLower() == "true" || strKeys[i] == "1")
                    keys[i] = true;
                else
                    keys[i] = false;

            txActivateCode.Text = activator.GenerateActivationTone(txRequestCode.Text, txInternalCode.Text);
        }
    }
}
