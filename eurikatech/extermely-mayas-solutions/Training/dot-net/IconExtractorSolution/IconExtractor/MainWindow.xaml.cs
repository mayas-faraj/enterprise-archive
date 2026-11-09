using System;

namespace IconExtractor
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        public MainWindow()
        {
            InitializeComponent();

            
        }

        private void Icon()
        {
            System.Collections.Generic.List<System.Drawing.Icon> icons = new System.Collections.Generic.List<System.Drawing.Icon>();

            System.Drawing.Icon i = new System.Drawing.Icon(TAFactory.IconPack.IconHelper.GetAssociatedIcon("e:\\new.docx", TAFactory.IconPack.IconFlags.LargeIcon), 500, 500);
            icons.Add(i);

            if (icons.Count != 0)
            {
                System.Drawing.Icon icon = TAFactory.IconPack.IconHelper.Merge(icons.ToArray());

                System.IO.FileStream fs = new System.IO.FileStream("E:\\icon400.ico", System.IO.FileMode.Create);
                icon.Save(fs);
                fs.Close();
            }
        }

        private void btn1_Click(object sender, System.Windows.RoutedEventArgs e)
        {

            Icon();
        }

        private void btn2_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.Explore("c:\\");
        }

        private void btn3_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.Open("c:\\");
        }

        private void btn4_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.SearchCommand();
        }

        private void btn5_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.ShellExecute("notepad.exe");
        }

        private void btn6_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.ToggleDesktop();
        }

        private void btn7_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            Shell32.Shell sc = new Shell32.Shell();
            sc.ShutdownWindows();         
        }
    }
}

