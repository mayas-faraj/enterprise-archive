using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace WindowsWeb
{
    public partial class Form1 : Form
    {
        public Form1()
       {
            InitializeComponent();

            GMap.NET.MapProviders.GMapProvider.WebProxy = null;

            gMapCtrl.SetCurrentPositionByKeywords("Syria");
            gMapCtrl.MapProvider = GMap.NET.MapProviders.BingMapProvider.Instance;
            gMapCtrl.Manager.Mode = GMap.NET.AccessMode.ServerAndCache;
            gMapCtrl.MinZoom = 1;
            gMapCtrl.MaxZoom = 20;
            gMapCtrl.Zoom = 10;
            gMapCtrl.BackColor = Color.Red;
            gMapCtrl.EmptyMapBackground = Color.LightBlue;
            gMapCtrl.EmptyTileBorders = new Pen(Brushes.Yellow);
            gMapCtrl.EmptyTileText = "Mayas";
            
            GMap.NET.WindowsForms.GMapOverlay gmapOverlay = new GMap.NET.WindowsForms.GMapOverlay(gMapCtrl, "OverlayOne");

            putImage = false;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (((GMap.NET.WindowsForms.GMapControl)this.Controls["gMapCtrl"]).Created)
            {
                ((GMap.NET.WindowsForms.GMapControl)this.Controls["gMapCtrl"]).Bearing += .5F;
            }
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            gMapCtrl.Bearing = Single.Parse(txBrearing.Text);
            gMapCtrl.Offset(Int32.Parse(txOffsetX.Text), Int32.Parse(txOffsetY.Text));

            if (txAddress.Text != "")
                gMapCtrl.SetCurrentPositionByKeywords(txAddress.Text);

            if (txLang.Text != "" && txLati.Text != "")
                gMapCtrl.Position = new GMap.NET.PointLatLng(Double.Parse(txLati.Text), Double.Parse(txLang.Text));

            txLang.Text = gMapCtrl.Position.Lng.ToString();
            txLati.Text = gMapCtrl.Position.Lat.ToString();

        }

        private void btnTimer_Click(object sender, EventArgs e)
        {
            timer1.Enabled = !timer1.Enabled;
        }

        private void btnImage_Click(object sender, EventArgs e)
        {
            putImage = true;
        }

        private Boolean putImage;

        private void gMapCtrl_MouseUp(object sender, MouseEventArgs e)
        {
            if (putImage)
            {
                putImage = false;

                PictureBox box = new PictureBox();
                box.Image = Image.FromFile("img.GIF");
                box.Location = new Point(e.X, e.Y);
                box.Size = new System.Drawing.Size(100, 100);

                gMapCtrl.Controls.Add(box);
            }
        }

    
    }
}
