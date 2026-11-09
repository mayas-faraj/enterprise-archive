using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WarPlanning
{
    /// <summary>
    /// Interaction logic for WinMain.xaml
    /// </summary>
    public partial class WinMain : Window
    {
        public WinMain()
        {
            InitializeComponent();

            imgMap = new Image();
            imgMap.Stretch = Stretch.Fill;

            timer = new System.Windows.Forms.Timer();
            timer.Interval = 1;
            timer.Enabled = false;
            timer.Tick += new EventHandler(timer_Tick);

            btnClear_Click(this, null);
        }

        void timer_Tick(object sender, EventArgs e)
        {
            if (progressBar.Value < 100)
            {
                canvas.Cursor = Cursors.Wait;
                progressBar.Value += 3;
                Double x = progressBar.Value / 2;
                Double y = progressBar.Value * 5;

                txX.Text = x.ToString(STRING_FORMAT);
                txY.Text = y.ToString(STRING_FORMAT);
                txRanging.Text = (Math.Sqrt(x * x + y * y)).ToString(STRING_FORMAT);

                if (Double.Parse(txRanging.Text) < 1000)
                    txDetectable.Text = "Да";
                else
                    txDetectable.Text = "нет";

                txCovering.Text = ((x * x * x - y * y) / 3).ToString(STRING_FORMAT);

                if (txCorrelation.Text == "")
                    txCorrelation.Text = "0";

                txCorrelation.Text = (Double.Parse(txCorrelation.Text) + x + y).ToString(STRING_FORMAT);

                txCoherent.Text = ((x * 2 + y * 3) - x * y).ToString(STRING_FORMAT);
                txValidity.Text = ((x * y / this.Width * this.Height) * 100).ToString(STRING_FORMAT) + " %";
            }
            else
            {
                progressBar.Value = 0;
                timer.Enabled = false;
                drawItem(point);
                canvas.Cursor = Cursors.Hand;
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private enum Item
        {
            none,
            soldier,
            truck,
            transporter,
            tank,
            missiles
        }

        private void btnSoldier_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.soldier;
        }

        private void btnTruck_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.truck;
        }

        private void btnTransporter_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.transporter;
        }

        private void btnTank_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.tank;
        }

        private void btnMissile_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.missiles;
        }

        private void btnNone_Click(object sender, RoutedEventArgs e)
        {
            selectedItem = Item.none;
        }

        private void Canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (selectedItem != Item.none)
            {
                point = e.GetPosition(canvas);
                timer.Enabled = true;
            }
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            canvas.Children.Clear();

            if (imgMap.Tag == null)
                imgMap.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/syr.jpg", UriKind.Relative));
            else
                imgMap.Source = new BitmapImage(new Uri(Convert.ToString(imgMap.Tag), UriKind.Absolute));

            canvas.Width = imgMap.Width;
            canvas.Height = imgMap.Height;
            canvas.Children.Add(imgMap);

            txCoherent.Text = txCorrelation.Text = txCovering.Text = txDetectable.Text = txRanging.Text = txValidity.Text = txX.Text = txY.Text = "";
        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            System.Diagnostics.Process.Start("http://mod.gov.sy/portal/index.php?a=contact");
        }

        private void btnSimulation_Click(object sender, RoutedEventArgs e)
        {
            WinMessage message;

            if (checkInternetConnection())
                message = new WinMessage("Моделирование системы", "подключение к Интернету является слишком медленно имитировать вашу карту, вы должны иметь Интернет подключение по крайней мере 2 MB скорость потока, пожалуйста, проверьте Ваше Интернет армейской службы!", MessageIcon.information);
            else
                message = new WinMessage("Моделирование системы", "местные оружия базы данных не найден, для имитации вашу карту подключиться к Интернету для доступа к базе данных оружие, скорость потока должна быть высокой!", MessageIcon.information);

            message.Show();
        }

        private void btnMap_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.Filter = "JPEG Image (*.jpg)|*.jpg|Bitmap Image (*.bmp)|*.bmp|Animation Image (*.gif)|*.gif|PNG Image|*.png";
            ofd.Title = "Выбор карты битва.";

            if (ofd.ShowDialog() == true)
            {
                imgMap.Tag = ofd.FileName;
                btnClear_Click(sender, null);
            }
        }

        private void drawItem(Point pt)
        {
            Image img = new Image();
            Double x = pt.X;
            Double y = pt.Y;

            switch (selectedItem)
            {
                case Item.soldier:
                    img.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/soldier.png", UriKind.Relative));
                    img.Width = img.Height = 15;
                    break;
                case Item.truck:
                    img.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/truck.png", UriKind.Relative));
                    img.Width = img.Height = 25;
                    break;
                case Item.transporter:
                    img.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/armoredVechile.png", UriKind.Relative));
                    img.Width = img.Height = 25;
                    break;
                case Item.tank:
                    img.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/tank.png", UriKind.Relative));
                    img.Width = img.Height = 35;
                    break;
                case Item.missiles:
                    img.Source = new BitmapImage(new Uri("/WarPlanning;component/Images/missiles.png", UriKind.Relative));
                    img.Width = img.Height = 25;
                    break;
                case Item.none:
                    return;
            }

            Canvas.SetTop(img, y - img.Height / 2);
            Canvas.SetLeft(img, x - img.Width / 2);
            canvas.Children.Add(img);

            txX.Text = x.ToString(STRING_FORMAT);
            txY.Text = y.ToString(STRING_FORMAT);
            txRanging.Text = (Math.Sqrt(x * x + y * y)).ToString(STRING_FORMAT);

            if (Double.Parse(txRanging.Text) < 10000)
                txDetectable.Text = "Да";
            else
                txDetectable.Text = "нет";

            txCovering.Text = ((x * x * x - y * y) / 3).ToString(STRING_FORMAT);

            if (txCorrelation.Text == "")
                txCorrelation.Text = "0";

            txCorrelation.Text = (Double.Parse(txCorrelation.Text) + x + y).ToString(STRING_FORMAT);

            txCoherent.Text = ((x * 2 + y * 3) - x * y).ToString();
            txValidity.Text = ((x * y / (this.Width * this.Height)) * 100).ToString(STRING_FORMAT) + " %";
        }

        private Boolean checkInternetConnection()
        {
            System.Uri Url = new System.Uri("http://mod.gov.sy/portal/index.php?a=contact");

            System.Net.WebRequest WebReq;
            System.Net.WebResponse Resp;
            WebReq = System.Net.WebRequest.Create(Url);

            try
            {
                Resp = WebReq.GetResponse();
                Resp.Close();
                WebReq = null;
                return true;
            }

            catch
            {
                WebReq = null;
                return false;
            }

        }

        private System.Windows.Forms.Timer timer;
        private Item selectedItem;
        private Image imgMap;
        private Point point;

        private const String STRING_FORMAT = "#.##";

    }
}
