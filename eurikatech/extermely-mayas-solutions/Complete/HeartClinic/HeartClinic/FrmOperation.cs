using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace HeartClinic
{
    public partial class FrmOperation : Form
    {
        public FrmOperation()
        {
            InitializeComponent();

            //numeric check
            txCostOperation.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txCostDiscus.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txCostCare.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txCostOxiderBig.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txCostOxiderSmall.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceBalon.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceDiagram.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceIco.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceIcoPenj1.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceIcoPenj2.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceVector.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceDA.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceDM.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceDT.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumBalon.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumDiagram.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumIco.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumIcoPenj1.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumIcoPenj2.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumVector.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumDA.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumDM.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumDT.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txOperationId.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceSleepCare.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceSleepSweet.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumSleepCare.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumSleepSweet.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txPriceSleepFriend.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txNumSleepFriend.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);
            txCostTotalNum.KeyPress += new KeyPressEventHandler(numericControl_KeyPress);

            //Multiply process
            txNumBalon.TextChanged += new EventHandler(multiBalon_TextChanged);
            txPriceBalon.TextChanged += new EventHandler(multiBalon_TextChanged);
            txNumDiagram.TextChanged += new EventHandler(multiDiagram_TextChanged);
            txPriceDiagram.TextChanged += new EventHandler(multiDiagram_TextChanged);
            txNumIco.TextChanged += new EventHandler(multiIco_TextChanged);
            txPriceIco.TextChanged += new EventHandler(multiIco_TextChanged);
            txNumIcoPenj1.TextChanged += new EventHandler(multiIcoPenj1_TextChanged);
            txPriceIcoPenj1.TextChanged += new EventHandler(multiIcoPenj1_TextChanged);
            txNumIcoPenj2.TextChanged += new EventHandler(multiIcoPenj2_TextChanged);
            txPriceIcoPenj2.TextChanged += new EventHandler(multiIcoPenj2_TextChanged);
            txNumVector.TextChanged += new EventHandler(multiVector_TextChanged);
            txPriceVector.TextChanged += new EventHandler(multiVector_TextChanged);
            txNumDA.TextChanged += new EventHandler(multiDA_TextChanged);
            txPriceDA.TextChanged += new EventHandler(multiDA_TextChanged);
            txNumDT.TextChanged += new EventHandler(multiDT_TextChanged);
            txPriceDT.TextChanged += new EventHandler(multiDT_TextChanged);
            txNumDM.TextChanged += new EventHandler(multiDM_TextChanged);
            txPriceDM.TextChanged += new EventHandler(multiDM_TextChanged);
            txNumSleepCare.TextChanged += new EventHandler(multiSleepCare_TextChanged);
            txPriceSleepCare.TextChanged += new EventHandler(multiSleepCare_TextChanged);
            txNumSleepSweet.TextChanged += new EventHandler(multiSleepSweet_TextChanged);
            txPriceSleepSweet.TextChanged += new EventHandler(multiSleepSweet_TextChanged);
            txNumSleepFriend.TextChanged += new EventHandler(multiSleepFriend_TextChanged);
            txPriceSleepFriend.TextChanged += new EventHandler(multiSleepFriend_TextChanged);

            //plus process
            txCostOxiderBig.TextChanged += new EventHandler(plusOxider_TextChanged);
            txCostOxiderSmall.TextChanged += new EventHandler(plusOxider_TextChanged);
        }

        void numericControl_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar < 48 || e.KeyChar > 57) && e.KeyChar != 8 && e.KeyChar != 46)
                e.Handled = true;
            else
            {
                if (((TextBox)sender).Text == "")
                    ((TextBox)sender).Text = "0";
                else if (((TextBox)sender).Text == ".")
                    ((TextBox)sender).Text = "0.";
            }
        }

        void plusOxider_TextChanged(object sender, EventArgs e)
        {
            txCostOxider.Text = plus(txCostOxiderSmall, txCostOxiderBig);
        }

        void multiDiagram_TextChanged(object sender, EventArgs e)
        {
            txCostDiagram.Text = mult(txNumDiagram, txPriceDiagram);
        }

        void multiIco_TextChanged(object sender, EventArgs e)
        {
            txCostIco.Text = mult(txNumIco, txPriceIco);
        }

        void multiIcoPenj1_TextChanged(object sender, EventArgs e)
        {
            txCostIcoPenj1.Text = mult(txNumIcoPenj1, txPriceIcoPenj1);
        }

        void multiIcoPenj2_TextChanged(object sender, EventArgs e)
        {
            txCostIcoPenj2.Text = mult(txNumIcoPenj2, txPriceIcoPenj2);
        }

        void multiVector_TextChanged(object sender, EventArgs e)
        {
            txCostVector.Text = mult(txNumVector, txPriceVector);
        }

        void multiDT_TextChanged(object sender, EventArgs e)
        {
            txCostDT.Text = mult(txNumDT, txPriceDT);
        }

        void multiDM_TextChanged(object sender, EventArgs e)
        {
            txCostDM.Text = mult(txNumDM, txPriceDM);
        }

        void multiDA_TextChanged(object sender, EventArgs e)
        {
            txCostDA.Text = mult(txNumDA, txPriceDA);
        }

        void multiSleepCare_TextChanged(object sender, EventArgs e)
        {
            txCostSleepCare.Text = mult(txNumSleepCare, txPriceSleepCare);
        }

        void multiSleepSweet_TextChanged(object sender, EventArgs e)
        {
            txCostSleepSweet.Text = mult(txNumSleepSweet, txPriceSleepSweet);
        }

        void multiSleepFriend_TextChanged(object sender, EventArgs e)
        {
            txCostSleepFriend.Text = mult(txNumSleepFriend, txPriceSleepFriend);
        }

        void multiBalon_TextChanged(object sender, EventArgs e)
        {
            txCostBalon.Text = mult(txNumBalon, txPriceBalon);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMain form = new FrmMain();
            form.Show();
            this.Hide();
        }

        private String mult(TextBox num, TextBox price)
        {
            float cost;

            //plus value and return
            cost = Convert.ToSingle(num.Text) * Convert.ToSingle(price.Text);
            cost = Convert.ToInt32(cost);
            return cost.ToString();
        }

        private String plus(TextBox cost1, TextBox cost2)
        {
            float cost;
          
            //plus value and return
            cost = Convert.ToSingle(cost1.Text) + Convert.ToSingle(cost2.Text);
            cost = Convert.ToInt32(cost);
            return cost.ToString();

        }
    }
}