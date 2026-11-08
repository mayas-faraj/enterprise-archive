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
    public partial class frmRoomType : Form
    {
        public frmRoomType()
        {
            InitializeComponent();
            InitializeStyle();
            InitializeValues();
        }

        public void InitializeValues()
        {
            
        }

        public void InitializeStyle()
        {
            lbCaption.Font = SharedData.FontCaption;
            lbName.Font = lbDescription.Font = txName.Font = txDescription.Font = lstRooms.Font = SharedData.FontInfo;
            btnClose.Font = btnNew.Font = btnRefresh.Font = btnSave.Font = SharedData.FontOrder;

            lbCaption.ForeColor = SharedData.ColorCaption;
            lbName.ForeColor = lbDescription.ForeColor = txName.ForeColor = txDescription.ForeColor = lstRooms.ForeColor = SharedData.ColorInfo;
            btnClose.ForeColor = btnNew.ForeColor = btnRefresh.ForeColor = btnSave.ForeColor = SharedData.ColorOrder;
        }
    }
}
