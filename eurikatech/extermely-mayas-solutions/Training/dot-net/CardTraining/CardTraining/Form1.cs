using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CardTraining
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            for (Int32 i = 0; i < 70; i++)
                cbCount.Items.Add(i);
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            for (Int32 i = 0; i < Convert.ToInt32(cbCount.SelectedItem.ToString()); i++)
            {
                PicCard tmp = new PicCard();
                tmp.Size = new Size(250, 100);
                tmp.BorderStyle = BorderStyle.FixedSingle;
                tmp.BackColor = Color.Green;
                tmp.Location = new Point((pnlMain.Width - tmp.Width) / 2, i * (tmp.Height + 15));
                tmp.CardData = new String[] { System.IO.File.Exists((i+1).ToString() + ".jpg") ? (i+1).ToString() + ".jpg" : "1.jpg", "الرقم التسلسلي : " + (1000 + i * 10).ToString(), "الإسم : " + (1000 + i * 10).ToString(), " : العنوان" + i.ToString() };
                pnlMain.Controls.Add(tmp);
            }
        }

    }

    public class PicCard : Card.Card
    {
        public PicCard()
        {
            PictureBox img = new PictureBox();
            img.Name = "img";
            img.Size = new Size(80, 80);
            img.Location = new Point(160, 10);
            img.BackColor = Color.Red;
            img.BackgroundImageLayout = ImageLayout.Stretch;

            Label sn = new Label();
            sn.Name = "sn";
            sn.Size = new Size(140, 20);

            Label name = new Label();
            name.Name = "name";
            name.Size = new Size(140, 20);

            Label id = new Label();
            id.Name = "id";
            id.Size = new Size(140, 20);

            FlowLayoutPanel main = new FlowLayoutPanel();
            main.Size = new Size(140, 80);
            main.Location = new Point(10, 10);
            main.FlowDirection = FlowDirection.RightToLeft;
            main.BackColor = Color.LightGreen;

            this.FlpMain = main;
            this.CardControls = new Control[] { img };
            this.CardTabledControls = new Control[] { sn, name, id };
            //this.CardSchema = new String[] { "img", "sn", "name", "id" };
            this.CardControls = new Control[] { img, sn, name, id };
        }
    }
}

