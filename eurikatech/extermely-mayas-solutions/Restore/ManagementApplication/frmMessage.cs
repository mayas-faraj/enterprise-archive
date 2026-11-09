using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ManagementApplication
{
    public partial class frmMessage : Form
    {
        public frmMessage()
        {
            InitializeComponent();
            
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txSender.Text = txBCC.Text = txBody.Text = txCC.Text = txFrom.Text = txHost.Text = txPort.Text = txReplayTo.Text = txSubject.Text = txTo.Text = "";
            lsAttachments.Items.Clear();
            cbSelected.Checked = false;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();

            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(ofd.FileName);
                lsAttachments.Items.Add(attachment);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (lsAttachments.SelectedItem != null)
                lsAttachments.Items.Remove(lsAttachments.SelectedItem);
        }

        private void lsAttachments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lsAttachments.SelectedItem != null)
                txFileName.Text = ((System.Net.Mail.Attachment)lsAttachments.SelectedItem).Name;
            else
                txFileName.Text = "";
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();

                if (txFrom.Text != "")
                    mailMessage.From = new System.Net.Mail.MailAddress(txFrom.Text);

                if (txSender.Text != "")
                    mailMessage.Sender = new System.Net.Mail.MailAddress(txSender.Text);

                if (txReplayTo.Text != "")
                    mailMessage.ReplyTo = new System.Net.Mail.MailAddress(txReplayTo.Text);

                if (txTo.Text != "")
                    foreach (String address in txTo.Text.Split(',', ';'))
                        mailMessage.To.Add(address);

                if (txCC.Text != "")
                    foreach (String address in txCC.Text.Split(',', ';'))
                        mailMessage.CC.Add(address);

                if (txBCC.Text != "")
                    foreach (String address in txBCC.Text.Split(',', ';'))
                        mailMessage.Bcc.Add(address);

                if (txBody.Text != "")
                    mailMessage.Body = txBody.Text;
                
                mailMessage.IsBodyHtml = cbSelected.Checked;

                if (txSubject.Text != "")
                    mailMessage.Subject = txSubject.Text;

                foreach (System.Net.Mail.Attachment attachment in lsAttachments.Items)
                    mailMessage.Attachments.Add(attachment);



                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();

                if (txHost.Text != "")
                    smtpClient.Host = txHost.Text;

                if (txPort.Text != "")
                    smtpClient.Port = Convert.ToInt32(txPort.Text);

                if (txPassword.Text != "")
                    smtpClient.Credentials = new System.Net.NetworkCredential(txFrom.Text, txPassword.Text);
                else
                    smtpClient.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;

                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.Source, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }  
    }
}
