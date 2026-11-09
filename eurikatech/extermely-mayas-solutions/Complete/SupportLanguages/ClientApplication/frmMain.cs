using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String msg = "";

            if (comboBox1.SelectedItem == null)
            {
                msg = "the file that you try to open dosnt exists";
            }
            else
                msg = ((Maniyat.Language)comboBox1.SelectedItem).Translate("the file that you try to open dosnt exists");

            MessageBox.Show(msg, "caption");
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            Maniyat.LanguagesCollection langs = new Maniyat.LanguagesCollection();
            langs.LoadLanguages();

            foreach (Maniyat.Language lang in langs)
                comboBox1.Items.Add(lang);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            String msg = "";

            if (comboBox1.SelectedItem == null)
            {
                msg = "are you sure you want to exit";
            }
            else
                msg = ((Maniyat.Language)comboBox1.SelectedItem).Translate("are you sure you want to exit");

            MessageBox.Show(msg, "caption");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem != null)
            {
                Maniyat.Language lang = (Maniyat.Language)comboBox1.SelectedItem;

                this.RightToLeftLayout = lang.RightToLeft;
                this.RightToLeft = lang.RightToLeft ? RightToLeft.Yes : RightToLeft.No;
                pictureBox1.BackgroundImage = Bitmap.FromFile(lang.ImageName("bannar.jpg"));

                foreach (Control ctrl in this.Controls)
                    ctrl.Text = lang.Translate(ctrl.Text);
            }
        }
        
    }
}