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
    public partial class frmItems : Form
    {
        public frmItems()
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
            lbName.Font = lbDescription.Font = lbType.Font = txName.Font = txDescription.Font = rbExport.Font = rbImport.Font = lstItems.Font = SharedData.FontCaption;
            btnClose.Font = btnNew.Font = btnRefresh.Font = btnSave.Font = SharedData.FontOrder;

            lbCaption.ForeColor = SharedData.ColorCaption;
            lbName.ForeColor = lbDescription.ForeColor = lbType.ForeColor = txName.ForeColor = txDescription.ForeColor = rbExport.ForeColor = rbImport.ForeColor = lstItems.ForeColor = SharedData.ColorInfo;
            btnClose.ForeColor = btnNew.ForeColor = btnRefresh.ForeColor = btnSave.ForeColor = SharedData.ColorOrder;
        }
    }
}
