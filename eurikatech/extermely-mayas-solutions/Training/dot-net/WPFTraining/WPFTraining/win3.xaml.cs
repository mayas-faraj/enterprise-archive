using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WPFTraining
{
    /// <summary>
    /// Interaction logic for win3.xaml
    /// </summary>
    public partial class win3 : Window
    {
        private Point point;
        private Boolean isClicked;
        private Rectangle rect;

        public win3()
        {
            InitializeComponent();

            BitmapImage bitmapImage = new BitmapImage(new Uri("e:\\images\\bannar.jpg"));
            TransformedBitmap transformedBitmap = new TransformedBitmap(bitmapImage, new ScaleTransform(1,1));

            img1.Source = transformedBitmap;
            point = new Point(0, 0);
            isClicked = false;
            rect = null;
        }

        private void img1_PreviewMouseUp(object sender, MouseButtonEventArgs e)
        {
            /*
            isClicked = false;
            CroppedBitmap bmp = new CroppedBitmap((BitmapSource)img1.Source, new Int32Rect((Int32)point.X, (Int32)point.Y, (Int32)rect.Width, (Int32)rect.Height));
            img2.Source = bmp;

            Byte[] pixels = new Byte[bmp.PixelHeight * bmp.PixelWidth];

            bmp.CopyPixels(pixels, bmp.PixelHeight * 4, 0);
             */
        }

        private void img1_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            point = e.GetPosition(img1);

            CroppedBitmap croppedBitmap = new CroppedBitmap((BitmapSource)img1.Source, new Int32Rect((Int32)e.GetPosition(img1).X, (Int32)e.GetPosition(img1).Y,2, 2));

            Byte[] pixels = new Byte[17];

            croppedBitmap.CopyPixels(pixels, (croppedBitmap.PixelWidth * 4)+1, 0);

            lbColor.Background = new SolidColorBrush(Color.FromArgb(255, pixels[2], pixels[1], pixels[0]));

            lbColor.Text = "";

            for (Int32 i = 0; i < pixels.Length; i++)
                lbColor.Text += "(" + pixels[i] + ")" + Environment.NewLine;

                

            //croppedBitmap.CopyPixels(pixels, 4, 0);

            //lbColor.Background = new SolidColorBrush(Color.FromArgb(255, pixels[2], pixels[1], pixels[0]));

            /*
            point = e.GetPosition(img1);
            isClicked = true;
            rect = new Rectangle();
            Canvas.SetLeft(rect, point.X);
            Canvas.SetTop(rect, point.Y);
            rect.Stroke = new SolidColorBrush(Colors.Red);
            main.Children.Add(rect);
             */
        }

        private void img1_PreviewMouseMove(object sender, MouseEventArgs e)
        {
            /*
            if (isClicked)
            {
                rect.Width = System.Math.Abs(e.GetPosition(img1).X - point.X);
                rect.Height = System.Math.Abs(e.GetPosition(img1).Y - point.Y);
            }
             */
        }
    }
}
