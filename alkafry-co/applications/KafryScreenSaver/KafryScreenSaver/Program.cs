using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace KafryScreenSaver
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(String[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (args.Length > 0)
            {
                String firstArgument = args[0].ToLower().Trim();
                String secondArgument = null;

                if (firstArgument.Length > 2)
                {
                    secondArgument = firstArgument.Substring(3);
                    firstArgument = firstArgument.Substring(0, 2);
                }
                else
                    if (args.Length > 1)
                        secondArgument = args[1];

                if (firstArgument == "/c")
                {
                    Application.Run(new frmConfigure());
                }
                else if (firstArgument == "/p")
                {
                    if (secondArgument == null)
                        MessageBox.Show("no preview available");
                    else
                    {
                        IntPtr previewWndHandle = new IntPtr(long.Parse(secondArgument));
                        Application.Run(new frmMain(previewWndHandle));
                    }
                    
                }
                else if (firstArgument == "/s")
                {
                    showScreenSaver();
                    Application.Run();
                }
                else
                {
                    MessageBox.Show("the input arguments not matched with application system", "run screen saver");
                }
                   
            }
            else
            {
                Application.Run(new frmConfigure());
            }
        }

        static void showScreenSaver()
        {
            foreach (Screen screen in Screen.AllScreens)
            {
                frmMain frm = new frmMain(screen.Bounds);
                frm.Show();
            }
        }
    }
}
