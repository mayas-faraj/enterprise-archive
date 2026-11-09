using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace testEmbeebExe
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            

            String path = System.IO.Path.GetTempFileName().Replace("tmp", "exe");;

            System.IO.Stream f1 = System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("WarPlanning");
            System.IO.FileStream f2 = new System.IO.FileStream(path, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            Byte[] buffter = new Byte[f1.Length];

            f1.Read(buffter, 0, buffter.Length);
            f2.Write(buffter, 0, buffter.Length);

            f1.Close();
            f2.Close();
            
            System.Diagnostics.Process.Start(path);
            
            
        }
    }
}
