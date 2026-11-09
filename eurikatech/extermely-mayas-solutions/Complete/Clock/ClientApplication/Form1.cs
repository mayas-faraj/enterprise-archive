using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class Form1 : Form
    {
        Maniyat.Pointer ptr1;
        Maniyat.Pointer ptr2;
        Maniyat.Pointer ptr3;
        Maniyat.Alarm alrm;

        public Form1()
        {
            InitializeComponent();

            clk.Text = "الله";
            clk.TextColor = Color.DarkRed;
            clk.Font = new Font("Times New Roman", 15);

            ptr3 = new Maniyat.Pointer();
            ptr3.Image = Image.FromFile("F:\\تصاميم منتهية\\تصاميم برمجية\\Clock\\pointer2.png");
            ptr3.Image.RotateFlip(RotateFlipType.Rotate180FlipNone);
            ptr3.Size = new SizeF(3, 70);
            ptr3.Location = new PointF((clk.Width - ptr3.Size.Width) / 2, (clk.Height) / 2);
            ptr3.MinAngle = -90;
            ptr3.MinValue = 1;
            ptr3.RangeAngle = 360;
            ptr3.RangeValue = 60;
            ptr3.Visible = true;
            ptr3.Value = 1;

            ptr2 = new Maniyat.Pointer();
            ptr2.Image = Image.FromFile("F:\\تصاميم منتهية\\تصاميم برمجية\\Clock\\pointer2.png");
            ptr2.Image.RotateFlip(RotateFlipType.Rotate180FlipNone);
            ptr2.Location = ptr3.Location;
            ptr2.Size = new SizeF(6, 60);
            ptr2.MinAngle = -90;
            ptr2.MinValue = 1;
            ptr2.RangeAngle = 360;
            ptr2.RangeValue = 60;
            ptr2.Visible = true;
            ptr2.Value = 1;

            ptr1 = new Maniyat.Pointer();
            ptr1.Image = Image.FromFile("F:\\تصاميم منتهية\\تصاميم برمجية\\Clock\\pointer1.png");
            ptr1.Image.RotateFlip(RotateFlipType.Rotate180FlipNone);
            ptr1.Location = ptr3.Location;
            ptr1.Size = new SizeF(8, 40);
            ptr1.MinAngle = -90;
            ptr1.MinValue = 1;
            ptr1.RangeAngle = 360;
            ptr1.RangeValue = 12;
            ptr1.Visible = true;
            ptr1.Value = 1;

            clk.Pointers = new Maniyat.Pointer[] { ptr1 , ptr2, ptr3 };

            alrm = new Maniyat.Alarm();

            alrm.Name = "المنبه";
            alrm.Description = "تم إنطلاق التنبيه";
            alrm.Active = true;
            alrm.AlarmType[7] = true;
            alrm.AlarmEventHandler += new Maniyat.AlarmHandler(a1_AlarmEventHandler);
            
        }

        void a1_AlarmEventHandler(object sender, EventArgs e)
        {
            Maniyat.Alarm temp = (Maniyat.Alarm)sender;
            Console.Beep();
            MessageBox.Show(temp.Description, temp.Name, MessageBoxButtons.OK);
        }

        private void trm_Tick(object sender, EventArgs e)
        {
            clk.Pointers[2].Value = DateTime.Now.Second;
            clk.Pointers[1].Value = DateTime.Now.Minute;
            clk.Pointers[0].Value = DateTime.Now.Hour + (Convert.ToSingle(DateTime.Now.Minute) / 60);
            clk.Text = DateTime.Now.ToLongTimeString();

            alrm.Check();
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            alrm.AlarmStart = DateTime.Parse(txTime.Text);
            txTime.BackColor = Color.FromArgb(255, 128, 128, 255);
        }

        private void nIcon_Click(object sender, EventArgs e)
        {
            this.Show();
        }

        private void clk_MouseClick(object sender, MouseEventArgs e)
        {
            nIcon.Visible = true;
            this.Hide();
        }
    }
}
