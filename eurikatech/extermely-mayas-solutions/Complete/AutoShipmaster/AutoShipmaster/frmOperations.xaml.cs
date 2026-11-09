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
    /// Interaction logic for frmOperations.xaml
    /// </summary>
    public partial class frmOperations : Window
    {
        //public constructures region
        public frmOperations(Window caller, Library.User currentUser)
        {
            InitializeComponent();

            user = currentUser;
            callerWindoow = caller;
            operation = null;
            
            loadOperations();
        }

        public frmOperations(Window caller, Library.User currentUser,Library.Operation currentOperation)
            :this(caller,currentUser)
        {
            operation = currentOperation;

            lsOperations.SelectedItem = currentOperation;
        }

        //private events region
        private void txBack_Click(object sender, RoutedEventArgs e)
        {
            callerWindoow.Show();
            this.Close();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (callerWindoow.Visibility != Visibility.Visible)
                callerWindoow.Close();
        }

        private void lsOperations_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lsOperations.SelectedItem != null)
            {
                canvas.Children.Clear();

                txName.Text = ((Library.Operation)lsOperations.SelectedItem).Name;
                txComment.Text = ((Library.Operation)lsOperations.SelectedItem).Comment;
                txUser.Text = ((Library.Operation)lsOperations.SelectedItem).OperationUser.Name;

                Point lastPoint = new Point();

                imgMap = new Image();
                imgMap.Stretch = Stretch.Fill;
                imgMap.Width=canvas.Width = ((Library.Operation)lsOperations.SelectedItem).OperationOption.Width;
                imgMap.Height=canvas.Height = ((Library.Operation)lsOperations.SelectedItem).OperationOption.Height;
                imgMap.Source = new BitmapImage(new Uri(((Library.Operation)lsOperations.SelectedItem).OperationOption.MapPath));

                Canvas.SetTop(imgMap, 0);
                Canvas.SetLeft(imgMap, 0);
                canvas.Children.Add(imgMap);

                foreach (Library.Order order in ((Library.Operation)lsOperations.SelectedItem).Orders)
                {
                    Image image = new Image();

                    if (order.Serial == 1)
                    {
                        image.Source = iconHome.Source;
                        image.Width = iconDim;
                        image.Height = iconDim;
                        Canvas.SetTop(image, order.Y - (iconDim / 2));
                        Canvas.SetLeft(image, order.X - (iconDim / 2));
                        lastPoint.X = order.X;
                        lastPoint.Y = order.Y;
                        canvas.Children.Add(image);
                    }
                    else
                    {
                        Line line = new Line();

                        line.X1 = lastPoint.X;
                        line.Y1 = lastPoint.Y;

                        lastPoint.X = order.X;
                        lastPoint.Y = order.Y;

                        line.X2 = lastPoint.X;
                        line.Y2 = lastPoint.Y;

                        line.Stroke = (LinearGradientBrush)this.FindResource("textBoxes");

                        image.Source = iconFlag.Source;
                        image.Width = iconDim;
                        image.Height = iconDim;
                        Canvas.SetTop(image, order.Y-iconDim);
                        Canvas.SetLeft(image, order.X);
                        canvas.Children.Add(image);
                        canvas.Children.Add(line);
                    }
                }
            }
        }

        private void txDelete_Click(object sender, RoutedEventArgs e)
        {
            if (lsOperations.SelectedItem != null)
                if (MessageBox.Show("تأكيد حذف الرحلة " + ((Library.Operation)lsOperations.SelectedItem).Name, "حذف رحلة", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                    Library.Database.Delete((Library.Operation)lsOperations.SelectedItem);

            loadOperations();
        }

        private void txRun_Click(object sender, RoutedEventArgs e)
        {
            if (lsOperations.SelectedItem != null)
            {
                Library.Internet.Transmit(((Library.Operation)lsOperations.SelectedItem).Orders);
                Library.Internet.Transmit(Library.Command.run);
                Library.Database.OperationUpdateCommand((Library.Operation)lsOperations.SelectedItem, Library.Command.run);
            }
        }

        private void txPause_Click(object sender, RoutedEventArgs e)
        {
            if (lsOperations.SelectedItem != null)
            {
                Library.Internet.Transmit(Library.Command.pause);
                Library.Database.OperationUpdateCommand((Library.Operation)lsOperations.SelectedItem, Library.Command.pause);
            }
        }

        private void txStop_Click(object sender, RoutedEventArgs e)
        {
            if (lsOperations.SelectedItem != null)
            {
                Library.Internet.Transmit(Library.Command.stop);
                Library.Database.OperationUpdateCommand((Library.Operation)lsOperations.SelectedItem, Library.Command.stop);
            }
        }

        //private functions region
        private void loadOperations()
        {
            lsOperations.Items.Clear();

            Library.Operation[] operations;

            Library.Database.Load(out operations);

            if (operations != null)
                foreach (Library.Operation operation in operations)
                    lsOperations.Items.Add(operation);
        }

        //private consts region
        private const float iconDim = 25;

        //private fields region
        private Library.User user;
        private Window callerWindoow;
        private Library.Operation operation;
        private Image imgMap;
    }
}
