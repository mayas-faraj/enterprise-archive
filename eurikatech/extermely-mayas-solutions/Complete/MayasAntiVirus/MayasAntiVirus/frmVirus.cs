using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;

using System.Windows.Forms;

namespace MayasAntiVirus
{
    public partial class frmVirus : Form
    {
        public frmVirus()
        {
            InitializeComponent();

            txLocation.Text = Shared.virusPath;
            loadFile(txDatabase, Shared.virusPath);
            btnAdd.Click+=new EventHandler(btnAdd_Click);
        }

        private void loadFile(TextBox textBox, String path)
        {
            txDatabase.Text = "";
            try
            {
                FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);
                StreamReader sr = new StreamReader(fs);
                Char sp = ' ';
                String text;

                while ((text = sr.ReadLine()) != null)
                {
                    text = Shared.Encode(text);

                    text = text.Replace(';', sp);

                    textBox.Text += text+"\r\n";
                }
                
                sr.Close();
            }
            catch (System.IO.IOException ex)
            {
                MessageBox.Show("Error While Loading File\n" + ex.Message);
            }

            
        }

        private void btnReload_Click(object sender, EventArgs e)
        {
            loadFile(txDatabase, Shared.virusPath);
        }

        private void btnChange_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Virus Database (*.vdb)|*.vdb|All Files (*.*)|*.*";
            ofd.FileName = Shared.virusPath;
            ofd.Multiselect = false;

            if (ofd.ShowDialog() == DialogResult.OK)
                txLocation.Text = ofd.FileName;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            String info = txName.Text + ";" + txType.Text + ";" + txLength.Text;
            FileStream fs = new FileStream(Shared.virusPath, FileMode.Append, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);

            sw.WriteLine(Shared.Encode(info));
            sw.Close();

            loadFile(txDatabase, Shared.virusPath);
        }
    }
}
