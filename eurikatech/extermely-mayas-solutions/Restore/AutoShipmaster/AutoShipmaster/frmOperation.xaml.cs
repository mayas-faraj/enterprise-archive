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

namespace AutoShipmaster
{
    /// <summary>
    /// Interaction logic for frmOperationControl.xaml
    /// </summary>
    public partial class frmOperation : Window
    {
        //public constructures region
        public frmOperation(Window caller, Library.User currentUser)
        {
            InitializeComponent();

            user = currentUser;
            callerWindow = caller;
            selectMode = SelectMode.none;
            orders = new Library.OrderCollection();

            loadMaps();

            imgMap = new Image();

            imgHome = new Image();
            imgHome.Width = imgHome.Height = iconDim;
            imgHome.Source = iconHome.Source;
            imgHome.Visibility = Visibility.Hidden;
            Canvas.SetTop(imgHome, 0);
            Canvas.SetLeft(imgHome, 0);
            canvas.Background = new SolidColorBrush(Colors.Pink);
        }

        public frmOperation(Window caller, Library.User currentUser, Library.Option currentOption)
            : this(caller, currentUser)
        {
            option = currentOption;
        }

        //private events region
        private void btnFlag_Click(object sender, RoutedEventArgs e)
        {
            selectMode = SelectMode.flag;
        }

        private void btnDelFlag_Click(object sender, RoutedEventArgs e)
        {
            setupImage();
        }

        private void btnHome_Click(object sender, RoutedEventArgs e)
        {
            selectMode = SelectMode.house;
        }

        private void canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (lastPoint == e.GetPosition(canvas))
                return;

            switch (selectMode)
            {
                case SelectMode.house:
                    {
                        orders.Clear();
                        setupImage();
                        lastPoint = e.GetPosition(canvas);
                        Canvas.SetTop(imgHome, lastPoint.Y - (iconDim / 2));
                        Canvas.SetLeft(imgHome, lastPoint.X - (iconDim / 2));
                        imgHome.Visibility = Visibility.Visible;
                        orders.Add(new Library.Order(Convert.ToSingle(lastPoint.X), Convert.ToSingle(lastPoint.Y), Convert.ToSingle(sliderVelocity.Value), ++series));
                        break;
                    }
                case SelectMode.flag:
                    {
                        if (imgHome.Visibility == Visibility.Visible)
                        {
                            //save current point
                            Point currentPoint = e.GetPosition(canvas);

                            //save order
                            orders.Add(new Library.Order(Convert.ToSingle(currentPoint.X), Convert.ToSingle(currentPoint.Y), Convert.ToSingle(sliderVelocity.Value), ++series));

                            //drawing line
                            Line line = new Line();
                            line.X1 = lastPoint.X;
                            line.Y1 = lastPoint.Y;
                            line.X2 = currentPoint.X;
                            line.Y2 = currentPoint.Y;
                            line.Stroke = (LinearGradientBrush)this.FindResource("textBlockes");
                            line.StrokeThickness = 1;
                            canvas.Children.Add(line);

                            //drawing image
                            Image img = new Image();
                            img.Width = img.Height = iconDim;
                            img.Source = iconFlag.Source;
                            Canvas.SetTop(img, currentPoint.Y - iconDim);
                            Canvas.SetLeft(img, currentPoint.X);
                            canvas.Children.Add(img);
                            
                            //save last point
                            lastPoint = e.GetPosition(canvas);
                        }
                        else
                            MessageBox.Show("يجب تحديد نقطة البداية أولاً", "إضافة نقطة جديدة", MessageBoxButton.OK, MessageBoxImage.Information);

                        break;
                    }        
            }

            txOrders.Text = orders.ToString();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindow.Show();
            this.Close();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txName.Text != "" && lsMaps.SelectedItem != null)
            {
                Library.Operation operation = new Library.Operation(txName.Text, txComments.Text, orders, 0, 0, 0, user, (Library.Option)lsMaps.SelectedItem);
                Library.Database.Save(operation);

                txName.Clear();
                txComments.Clear();
                lsMaps.SelectedItem = null;
                setupImage();
                sliderVelocity.Value = 0;

                MessageBox.Show("تمت إضافة الرحلة الجديدة بنجاح", "إضافة رحلة جديدة", MessageBoxButton.OK, MessageBoxImage.Information);
                frmOperations fOperations = new frmOperations(this, user, operation);
            }
            else
                MessageBox.Show("يجب تحديد أسم وخريطة للرحلة", "إضافة رحلة جديدة", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void lsMaps_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lsMaps.SelectedItem != null)
                setupImage();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (callerWindow.Visibility != System.Windows.Visibility.Visible)
                callerWindow.Close();
        }

        //private functions region
        private void loadMaps()
        {
            lsMaps.Items.Clear();
            Library.Option[] options;
            Library.Database.Load(out options);

            if (options != null)
                for (int i = 0; i < options.Length; i++)
                    lsMaps.Items.Add(options[i]);
        }

        private void setupImage()
        {
            canvas.Children.Clear();
            orders.Clear();
            txOrders.Clear();
            series = 0;

            if (lsMaps.SelectedItem != null)
            {
                imgMap = new Image();
                imgMap.Stretch = Stretch.Fill;
                imgMap.Source = new BitmapImage(new Uri(((Library.Option)lsMaps.SelectedItem).MapPath));
                imgMap.Width = canvas.Width = ((Library.Option)lsMaps.SelectedItem).Width;
                imgMap.Height = canvas.Height = ((Library.Option)lsMaps.SelectedItem).Height;

                imgHome.Visibility = System.Windows.Visibility.Hidden;

                Canvas.SetTop(imgMap, 0);
                Canvas.SetLeft(imgMap, 0);
                canvas.Children.Add(imgMap);
                canvas.Children.Add(imgHome);
            }
        }

        //private consts region
        private const float iconDim = 25;

        //private enum regoin
        private enum SelectMode
        {
            none,
            flag,
            house
        }

        //private fields region
        private Library.User user;
        private Library.Option option;
        private Library.OrderCollection orders;
        private Window callerWindow;
        private SelectMode selectMode;
        private Image imgHome;
        private Image imgMap;
        private Point lastPoint;
        private int series;
    }
}
