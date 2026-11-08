using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;

namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
    public partial class App : Application
    {
        /// <summary>
        /// Application Entry Point.
        /// </summary>
        [System.STAThreadAttribute()]
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public static void Main(String[] args)
        {
            ClientApplication.App app = new ClientApplication.App();

            if (args.Length != 0)
                app.Run(new MainWindow(args[0]));
            else
                app.Run(new MainWindow());
        }
    }
}
