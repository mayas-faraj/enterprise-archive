using System;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            Maniyat.Database.ConnectionString = "Data Source=.\\sqlexpress;Initial Catalog=DataBridgeTest;Integrated Security=True;Pooling=False";
            Maniyat.Database.LogFilePath = "theLog.txt";
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            //Image im1 = new Image();
            //Image im2 = new Image();
            //Image im3 = new Image();

            //im1.Path = "c:\\windows";
            //im1.Height = im1.Width = 400;
            //im1.Location = new System.Drawing.Point(40, 50);

            //im2.Path = "d:\\documents";
            //im2.Height = 500;
            //im2.Width = 1000;
            //im2.Location = new System.Drawing.Point(20, 56);

            //im3.Path = "e:\\extra";
            //im3.Height = 867;
            //im3.Width = 1024;
            //im3.Location = new System.Drawing.Point(800, 600);

            //Image.DbPath.Length = 5600;

            Office o1 = new Office();
            Office o2 = new Office();

            mas.Name = "5";

            
            
        }


        public class mas
        {
            public static Int32 Age;
            public static String Name;
        }

        public class Office
        {
            public System.Drawing.Size size;
            public mas m;
        }
    }
}
