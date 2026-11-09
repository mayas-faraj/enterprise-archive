using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FileUploader
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Multiselect = false;
            ofd.Filter = "all files (*.*)|*.*";


            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txFile.Text = ofd.FileName;
            }
        }

        private void btnUploadFile_Click(object sender, EventArgs e)
        {
            Byte[] result;

            try
            {
                System.Net.WebClient webClient = new System.Net.WebClient();
                result = webClient.UploadFile(txUri.Text, txFile.Text);

                txResult.Text = System.Text.Encoding.ASCII.GetString(result);
            }
            catch (System.ArgumentNullException ex)
            {
                MessageBox.Show(ex.Message, "ArgumentNullException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Net.WebException ex)
            {
                MessageBox.Show(ex.Message, "WebException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnUploadString_Click(object sender, EventArgs e)
        {
            String result;

            try
            {
                System.Net.WebClient webClient = new System.Net.WebClient();
                result = webClient.UploadString(txUri.Text, txFile.Text);

                txResult.Text = result;
            }
            catch (System.ArgumentNullException ex)
            {
                MessageBox.Show(ex.Message, "ArgumentNullException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Net.WebException ex)
            {
                MessageBox.Show(ex.Message, "WebException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnUploadData_Click(object sender, EventArgs e)
        {
            Byte[] data;
            String text;

            try
            {
                System.IO.StreamReader sr = new System.IO.StreamReader(txUri.Text);

                text = sr.ReadToEnd();
                sr.Close();

                data = System.Text.Encoding.Unicode.GetBytes(text);

                System.Net.WebClient webClient = new System.Net.WebClient();
                data = webClient.UploadData(txUri.Text, data);

                txResult.Text = System.Text.Encoding.Unicode.GetString(data);
            }
            catch (System.ArgumentNullException ex)
            {
                MessageBox.Show(ex.Message, "ArgumentNullException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Net.WebException ex)
            {
                MessageBox.Show(ex.Message, "WebException", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCopyFile_Click(object sender, EventArgs e)
        {
            try
            {
                System.IO.File.Copy(txFile.Text, txUri.Text);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Exception", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
