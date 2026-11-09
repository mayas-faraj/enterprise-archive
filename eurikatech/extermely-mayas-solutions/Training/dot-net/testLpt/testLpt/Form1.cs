using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace testLpt
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //[DllImport("inpout32.dll", EntryPoint = "Out32")]
        //public static extern void Output(int address, int value);

        private void button1_Click(object sender, EventArgs e)
        {
            //Output(888, 255);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Output(888, 0);
        }

    }
}
