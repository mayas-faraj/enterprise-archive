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
    public partial class frmAddPart : Form
    {
        public frmAddPart()
        {
            InitializeComponent();
        }

        private void lbFeatures_Click(object sender, EventArgs e)
        {
            frmPartFeature frm = new frmPartFeature();
            frm.MdiParent = this.MdiParent;
            frm.Show();
        }

        private void btnRooms_Click(object sender, EventArgs e)
        {
            frmAddRoom frm = new frmAddRoom();
            frm.MdiParent = this.MdiParent;
            frm.Show();
        }
    }
}
