using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace StartupHunter
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            RegistryStartup(@"E:\C#.Net\Complete\PcInformation\ClientApplication\bin\Debug\ClientApplication.exe");
            CheckRegistryStartup(@"E:\C#.Net\Complete\PcInformation\ClientApplication\bin\Debug\ClientApplication.exe");
            ExchangeStartup(@"E:\C#.Net\Complete\PcInformation\ClientApplication\bin\Debug\ClientApplication.exe");
        }

        private static void RegistryStartup(String path)
        {
            Microsoft.Win32.RegistryKey key = Microsoft.Win32.Registry.CurrentUser.OpenSubKey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", true);
            key.SetValue(System.IO.Path.GetFileNameWithoutExtension(path), path);
        }

        private static void RegistryStartup()
        {
            RegistryStartup(Application.ExecutablePath);
        }

        private static Boolean CheckRegistryStartup(String path)
        {
            Microsoft.Win32.RegistryKey key = Microsoft.Win32.Registry.CurrentUser.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Run", true);

            if (key.GetValue(System.IO.Path.GetFileNameWithoutExtension(path)) == null)
                return false;
            else
                return true;
        }

        private static Boolean CheckRegistryStartup()
        {
            return CheckRegistryStartup(Application.ExecutablePath);
        }

        private static void DirectoryStartup(String path)
        {
            IWshRuntimeLibrary.IWshShortcut shortcut;
            IWshRuntimeLibrary.WshShell shell = new IWshRuntimeLibrary.WshShell();
            String startupPath = Environment.GetFolderPath(Environment.SpecialFolder.Startup);

            shortcut = (IWshRuntimeLibrary.IWshShortcut)shell.CreateShortcut(System.IO.Path.Combine(startupPath, System.IO.Path.GetFileNameWithoutExtension(path) + ".lnk"));
            shortcut.TargetPath = path;
            shortcut.WorkingDirectory = System.IO.Path.GetDirectoryName(path);
            shortcut.Save();
        }

        private static void DirectoryStartup()
        {
            DirectoryStartup(Application.ExecutablePath);
        }

        private static Boolean CheckDirectoryStartup(String path)
        {

            String startupPath = Environment.GetFolderPath(Environment.SpecialFolder.Startup);

            foreach (String file in System.IO.Directory.GetFiles(startupPath))
                if (System.IO.Path.GetExtension(file).ToLower() == ".lnk")
                {
                    Shell32.Shell shell = new Shell32.ShellClass();
                    Shell32.Folder folder = shell.NameSpace(System.IO.Path.GetDirectoryName(file));
                    Shell32.FolderItem folderItem = folder.ParseName(System.IO.Path.GetFileName(file));

                    if (folderItem != null)
                    {
                        Shell32.ShellLinkObject link = (Shell32.ShellLinkObject)folderItem.GetLink;

                        if (link.Path.ToLower() == path.ToLower())
                            return true;
                    }
                }

            return false;
        }

        private static Boolean CheckDirectoryStartup()
        {
            return CheckDirectoryStartup(Application.ExecutablePath);
        }

        private static void ExchangeStartup(String path)
        {
            Microsoft.Win32.RegistryKey key = Microsoft.Win32.Registry.LocalMachine.OpenSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Run", true);

            String[] values = key.GetValueNames();

            foreach (String value in values)
            {
                String valuePath = Convert.ToString(key.GetValue(value));

                if (!String.IsNullOrEmpty(valuePath))
                {
                    //check if the application running and close it


                    //rename target into run.exe

                    //copy my file
                }
            }
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
    }
}
