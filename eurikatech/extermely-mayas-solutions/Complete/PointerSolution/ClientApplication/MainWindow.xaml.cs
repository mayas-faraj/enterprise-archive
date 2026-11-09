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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            isClicked = false;

            Pointer pt = new Pointer();

            pt.Stroke = new LinearGradientBrush(Colors.Yellow, Colors.Orange, 0);
            pt.StrokeThickness = 10;
            pt.HeadWidth = 20;
            pt.HeadHeight = 30;
            pt.X1 = pt.Y1 = 50;
            pt.X2 = 50;
            pt.Y2 = 250;

            canvas.Children.Add(pt);

            pt.X2 = 50;
            pt.Y2 = 100;

            canvas.MouseDown += new MouseButtonEventHandler(canvas_PreviewMouseDown);
            canvas.MouseMove += new MouseEventHandler(canvas_PreviewMouseMove);
            canvas.MouseUp += new MouseButtonEventHandler(canvas_PreviewMouseUp);
        }

        void canvas_PreviewMouseUp(object sender, MouseButtonEventArgs e)
        {
            isClicked = false;
            currentPointer = null;
        }

        void canvas_PreviewMouseMove(object sender, MouseEventArgs e)
        {
            if (isClicked)
            {
                currentPointer.X2 = e.GetPosition(canvas).X;
                currentPointer.Y2 = e.GetPosition(canvas).Y;
            }
        }

        void canvas_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            isClicked = true;

            currentPointer = new Pointer();
            currentPointer.X1 = e.GetPosition(canvas).X;
            currentPointer.Y1 = e.GetPosition(canvas).Y;

            currentPointer.Stroke = new LinearGradientBrush(Colors.Silver, Colors.Black, 0);
            currentPointer.StrokeThickness = 1;
            currentPointer.HeadWidth = 12;
            currentPointer.HeadHeight = 15;
            currentPointer.LineWidth = 10;

            currentPointer.Fill = new RadialGradientBrush(Colors.Red, Colors.Yellow);

            canvas.Children.Add(currentPointer);
        }

        private Pointer currentPointer;
        private Boolean isClicked;
    }
}
