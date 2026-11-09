using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;


namespace ClientApplication
{
    public partial class frmMain : Form
    {
        Maniyat.PcInformation info;

        public frmMain()
        {
            InitializeComponent();
            info = new Maniyat.PcInformation();
            info.ExceptionRaised += new Maniyat.ExceptionEventHandler(info_ExceptionRaised);
        }

        void info_ExceptionRaised(object sender, Maniyat.ExceptionEventArgs e)
        {
            MessageBox.Show(e.ToString(), "Error Detials", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            txOutput.Text = "----- Processor ------";
            txOutput.Text += Environment.NewLine + info.Processor.Name;
            txOutput.Text += Environment.NewLine + info.Processor.Caption;
            txOutput.Text += Environment.NewLine + info.Processor.SerialNumber;
            txOutput.Text += Environment.NewLine + info.Processor.Manufacturer;
            txOutput.Text += Environment.NewLine + info.Processor.Capacity;

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- Hard Disks -------";
            foreach (Maniyat.HardwareInformation obj in info.DiskDrive)
            {
                txOutput.Text += Environment.NewLine + "** HDD : " + obj.Name + " **";
                txOutput.Text += Environment.NewLine + obj.Caption;
                txOutput.Text += Environment.NewLine + obj.Capacity;
                txOutput.Text += Environment.NewLine + obj.Manufacturer;
                txOutput.Text += Environment.NewLine + obj.SerialNumber;
            }

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- Physics Memories -------";
            foreach (Maniyat.HardwareInformation obj in info.PhysicalMemory)
            {
                txOutput.Text += Environment.NewLine + "** Memo : " + obj.Name + " **";
                txOutput.Text += Environment.NewLine + obj.Caption;
                txOutput.Text += Environment.NewLine + obj.Capacity;
                txOutput.Text += Environment.NewLine + obj.Manufacturer;
                txOutput.Text += Environment.NewLine + obj.SerialNumber;
            }

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- Vedio Controller ------";
            txOutput.Text += Environment.NewLine + info.VedioController.Name;
            txOutput.Text += Environment.NewLine + info.VedioController.Caption;
            txOutput.Text += Environment.NewLine + info.VedioController.SerialNumber;
            txOutput.Text += Environment.NewLine + info.VedioController.Manufacturer;
            txOutput.Text += Environment.NewLine + info.VedioController.Capacity;

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- Sound Device ------";
            txOutput.Text += Environment.NewLine + info.SoundDevice.Name;
            txOutput.Text += Environment.NewLine + info.SoundDevice.Caption;
            txOutput.Text += Environment.NewLine + info.SoundDevice.SerialNumber;
            txOutput.Text += Environment.NewLine + info.SoundDevice.Manufacturer;

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- Mother Board ------";
            txOutput.Text += Environment.NewLine + info.BaseBoard.Name;
            txOutput.Text += Environment.NewLine + info.BaseBoard.Caption;
            txOutput.Text += Environment.NewLine + info.BaseBoard.SerialNumber;
            txOutput.Text += Environment.NewLine + info.BaseBoard.Manufacturer;
            txOutput.Text += Environment.NewLine + info.BaseBoard.Capacity;

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "----- B I O S ------";
            txOutput.Text += Environment.NewLine + info.Bios.Name;
            txOutput.Text += Environment.NewLine + info.Bios.Caption;
            txOutput.Text += Environment.NewLine + info.Bios.SerialNumber;
            txOutput.Text += Environment.NewLine + info.Bios.Manufacturer;
            txOutput.Text += Environment.NewLine + info.Bios.Capacity;

            txOutput.Text += Environment.NewLine;
            txOutput.Text += Environment.NewLine + "============================";
            txOutput.Text += Environment.NewLine + DateTime.Now.ToString("dd/mm/yyyy hh:mm:ss");
            txOutput.Text += Environment.NewLine + "Mayas and ayed";

            //saving file
            FileStream fs = new FileStream(txFileName.Text, FileMode.CreateNew, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);

            sw.Write(txOutput.Text);

            sw.Close(); 
        }

        private void btnQuery_Click(object sender, EventArgs e)
        {
            txOutput.Text = info.GetHardwareInformationString(txTableName.Text, txKeyName.Text);
        }
    }
}
