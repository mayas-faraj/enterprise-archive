using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace crystalReportTest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
            this.reportViewer1.RefreshReport();
        }
    }
}

namespace test
{
    class result
    {
        public String Name;
        public Int32 Value;
        public DateTime Date;
        public String Sender;
        public Boolean IsRead;

        public result()
        {
            Name = "no name";
            Value = -1;
            Sender = "Computer";
            IsRead = false;
        }

        public Int32 Value2()
        {
            return 2 * Value;
        }
    }
}
