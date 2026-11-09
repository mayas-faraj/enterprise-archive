using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace RentalApplication
{
    public partial class frmAddRoom : Form
    {
        public frmAddRoom()
        {
            InitializeComponent();
        }

        private void lbRoomType_Click(object sender, EventArgs e)
        {
            frmRoomType frm = new frmRoomType();
            frm.MdiParent = this.MdiParent;
            frm.Show();
        }
    }
}
