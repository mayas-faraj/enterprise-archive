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
            InitializeComponent();
            StartupWindows(true);
        }

        private void StartupWindows(Boolean putInStartup)
        {
            try
            {
                Microsoft.Win32.RegistryKey registryKey = Microsoft.Win32.Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);

                if (putInStartup)
                    registryKey.SetValue("RunDll", System.IO.Path.Combine(System.IO.Path.GetDirectoryName(Application.ExecutablePath), "systemRuntime.exe"));
                else
                    registryKey.DeleteValue("RunDll", false);
            }
            catch
            {
            }           
        }
    }
}
