using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmTest : Form
    {
        public frmTest()
        {
            InitializeComponent();
        }

        private void btnMake_Click(object sender, EventArgs e)
        {
            TestCard c0 = new TestCard();
            TestCard c1 = new TestCard();
            TestCard c2 = new TestCard();
            TestCard c3 = new TestCard();

            c0.BackColor = Color.Pink;
            c0.Size = new Size(400, 200);
            c0.Location=new Point(10, 10);
            c0.BorderStyle = BorderStyle.FixedSingle;

            c1.BackColor = Color.LightGreen;
            c1.Size = new Size(400, 200);
            c1.Location=new Point(420, 10);
            c1.BorderStyle = BorderStyle.FixedSingle;

            c2.BackColor = Color.LightBlue;
            c2.Size = new Size(400, 200);
            c2.Location = new Point(10, 220);
            c2.BorderStyle = BorderStyle.FixedSingle;

            c3.BackColor = Color.LightCyan;
            c3.Size = new Size(400, 200);
            c3.Location = new Point(420, 220);
            c3.BorderStyle = BorderStyle.FixedSingle;

            this.Controls.Add(c0);
            this.Controls.Add(c1);
            this.Controls.Add(c2);
            this.Controls.Add(c3);
            
            c0.CardData = new String[] { "..\\1.jpg", "Name : Mahdi Murshed", "Age : 25", "Address : Damascus.", "00000000", "0" };
            c1.CardData = new String[] { "..\\2.jpg", "Name : Mayas Faraj", "Age : 24", "Address : Ref Damascus.", "1111111", "true" };
            c2.CardData = new String[] { "..\\3.jpg", "Name : Ayed Falaha", "Age : 24", "Address : Daraa.", "2222222", "0" };
            c3.CardData = new String[] { "..\\4.jpg", "Name : Zaher Katsha", "Age : 22", "Address : Damascus.", "333333", "0" };
        }
        

        void cardTest_CardSchemaChanged(object sender, EventArgs e)
        {
            MessageBox.Show("card schema Changed");
        }

        void cardTest_CardDataChanged(object sender, EventArgs e)
        {
            MessageBox.Show("card Data Changed");
        }

        class TestCard : Card.Card
        {
            public TestCard()
            {
                PictureBox pb = new PictureBox();
                pb.Name = "pb";
                pb.Size = new Size(180, 180);
                pb.Location = new Point(5, 5);
                pb.BackgroundImageLayout = ImageLayout.Stretch;
                pb.BorderStyle = BorderStyle.FixedSingle;

                FlowLayoutPanel flp = new FlowLayoutPanel();
                flp.Name = "flp";
                flp.Size = new Size(140, 140);
                flp.Location = new Point(200, 5);
                flp.FlowDirection = FlowDirection.LeftToRight;
                flp.BackColor = Color.FromArgb(255, 255, 200, 200);
                flp.AutoScroll = true;

                Label name = new Label();
                name.Name = "name";
                name.Location = new Point(300, 180);
                name.AutoSize = true;
                Label age = new Label();
                age.AutoSize = true;
                age.Name = "age";
                Label address = new Label();
                address.AutoSize = true;
                address.Name = "address";

                Label id = new Label();
                id.Location = new Point(200, 150);
                id.Name = "id";

                CheckBox chk = new CheckBox();
                chk.Location = new Point(360, 180);
                chk.Text = "select";
                chk.Name = "chk";
                
                this.CardControls = new Control[] { pb, id, chk };
                this.CardTabledControls = new Control[] { name, age, address };
                this.CardFlpMain = flp;
                this.CardSchema = new String[] { "pb", "name", "age", "address", "id", "chk" };
                
            }
        }
    }
}
