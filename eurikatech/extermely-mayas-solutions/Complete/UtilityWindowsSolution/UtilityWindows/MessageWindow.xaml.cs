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

namespace UtilityWindows
{
    /// <summary>
    /// Interaction logic for MessageWindow.xaml
    /// </summary>
    public partial class MessageWindow : Window, IMessageWindow
    {
        //public constructures region
        public MessageWindow()
        {
            InitializeComponent();

            //default values
            isClicked = false;
            top = left = 0;
            HasTwoButtons = false;
            opacity = this.Opacity;

            //change size form relation with image size
            this.SizeChanged += MessageWindow_SizeChanged;

            //draw image logo
            drawImage(this, new DependencyPropertyChangedEventArgs());
        }

        public MessageWindow(String message)
            : this()
        {
            this.Message = message;
        }

        public MessageWindow(String message, Object header)
            : this(message)
        {
            this.Header = header;
        }

        public MessageWindow(String message, Object header, Boolean hasTwoButtons)
            : this(message, header)
        {
            this.HasTwoButtons = hasTwoButtons;
        }

        public MessageWindow(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image)
            : this(message, header, hasTwoButtons)
        {
            this.Image = image;
        }

        public MessageWindow(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer)
            : this(message, header, hasTwoButtons, image)
        {
            this.Tip = tip;
            this.Footer = footer;
        }

        public MessageWindow(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer, Double width, Double height)
            : this(message, header, hasTwoButtons, image, tip, footer)
        {
            this.Width = width;
            this.Height = height;
        }

        public MessageWindow(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer, Double width, Double height, Brush imageStroke, Brush imageFill, Double imageStrokeThickness)
            : this(message, header, hasTwoButtons, image, tip, footer, width, height)
        {
            this.ImageStroke = imageStroke;
            this.ImageFill = imageFill;
            this.ImageStrokeThickness = imageStrokeThickness;
        }

        static MessageWindow()
        {
            ImageStrokeProperty = DependencyProperty.Register("ImageStroke", typeof(Brush), typeof(Window), new PropertyMetadata(null, new PropertyChangedCallback(drawImage)));
            ImageFillProperty = DependencyProperty.Register("ImageFill", typeof(Brush), typeof(Window), new PropertyMetadata(null, new PropertyChangedCallback(drawImage)));
            ImageStrokeThicknessProperty = DependencyProperty.Register("ImageStrokeThickness", typeof(Double), typeof(Window), new PropertyMetadata(2D, new PropertyChangedCallback(drawImage)));
            ImageProperty = DependencyProperty.Register("Image", typeof(MessageWindowImage), typeof(Window), new PropertyMetadata(MessageWindowImage.None, new PropertyChangedCallback(drawImage)));
        }

        //public properties region
        public Object Header
        {
            get
            {
                return this.txHeader.Content;
            }
            set
            {
                this.txHeader.Content = value;
            }
        }

        public Object Footer
        {
            get
            {
                return this.txFooter.Content;
            }
            set
            {
                this.txFooter.Content = value;
            }
        }

        public String Message
        {
            get
            {
                return this.txMessage.Text;
            }
            set
            {
                this.txMessage.Text = value;
            }
        }

        public String Tip
        {
            get
            {
                return this.txTip.Text;
            }
            set
            {
                this.txTip.Text = value;
            }
        }

        public Boolean HasTwoButtons
        {
            get
            {
                if (btnCancel.Visibility == System.Windows.Visibility.Visible)
                    return true;
                else
                    return false;
            }
            set
            {
                if (value)
                    btnCancel.Visibility = System.Windows.Visibility.Visible;
                else
                    btnCancel.Visibility = System.Windows.Visibility.Collapsed;
            }
        }

        public Brush ImageStroke
        {
            get
            {
                return (Brush)this.GetValue(ImageStrokeProperty);
            }
            set
            {
                this.SetValue(ImageStrokeProperty, value);
            }
        }

        public Brush ImageFill
        {
            get
            {
                return (Brush)this.GetValue(ImageFillProperty);
            }
            set
            {
                this.SetValue(ImageFillProperty, value);
            }
        }

        public Double ImageStrokeThickness
        {
            get
            {
                return (Double)this.GetValue(ImageStrokeThicknessProperty);
            }
            set
            {
                this.SetValue(ImageStrokeThicknessProperty, value);
            }
        }

        public MessageWindowImage Image
        {
            get
            {
                return (MessageWindowImage)this.GetValue(ImageProperty);
            }
            set
            {
                this.SetValue(ImageProperty, value);
            }
        }

        //public functions region

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <returns>if the ok button is clicked, return true and close the message window</returns>
        public static Boolean? Show(String message)
        {
            MessageWindow window = new MessageWindow(message);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <returns>if the ok button is clicked, return true and close the message window</returns>
        public static Boolean? Show(String message, Object header)
        {
            MessageWindow window = new MessageWindow(message, header);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <param name="hasTwoButtons">determine if the message has ok and cancel button or only ok button</param>
        /// <returns>if the ok button is clicked, return true, and if the cancel button is clicked, return false</returns>
        public static Boolean? Show(String message, Object header, Boolean hasTwoButtons)
        {
            MessageWindow window = new MessageWindow(message, header, hasTwoButtons);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <param name="hasTwoButtons">determine if the message has ok and cancel button or only ok button</param>
        /// <param name="image">the image of the window that present on the left of the message</param>        
        /// <returns>if the ok button is clicked, return true, and if the cancel button is clicked, return false</returns>
        public static Boolean? Show(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image)
        {
            MessageWindow window = new MessageWindow(message, header, hasTwoButtons, image);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <param name="hasTwoButtons">determine if the message has ok and cancel button or only ok button</param>
        /// <param name="image">the image of the window that present on the left of the message</param>        
        /// <param name="tip">set the value of the text area under the massage text and above of the buttons</param>
        /// <param name="footer">set the value of the footer under the buttons</param>
        /// <returns>if the ok button is clicked, return true, and if the cancel button is clicked, return false</returns>
        public static Boolean? Show(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer)
        {
            MessageWindow window = new MessageWindow(message, header, hasTwoButtons, image, tip, footer);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <param name="hasTwoButtons">determine if the message has ok and cancel button or only ok button</param>
        /// <param name="image">the image of the window that present on the left of the message</param>
        /// <param name="tip">set the value of the text area under the massage text and above of the buttons</param>
        /// <param name="footer">set the value of the footer under the buttons</param>
        /// <param name="width">the width of the window</param>
        /// <param name="height">the height of the window</param>
        /// <returns>if the ok button is clicked, return true, and if the cancel button is clicked, return false</returns>
        public static Boolean? Show(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer, Double width, Double height)
        {
            MessageWindow window = new MessageWindow(message, header, hasTwoButtons, image, tip, footer, width, height);
            return window.ShowDialog();
        }

        /// <summary>
        /// Show the window as dialog with specific parameters
        /// </summary>
        /// <param name="message">the massege that present on the window</param>
        /// <param name="header">the caption of the message that present on the top of window</param>
        /// <param name="hasTwoButtons">determine if the message has ok and cancel button or only ok button</param>
        /// <param name="image">the image of the window that present on the left of the message</param>
        /// <param name="width">the width of the window</param>
        /// <param name="height">the height of the window</param>
        /// <param name="imageStroke">change the style of image and determine the stroke brush of the image</param>
        /// <param name="imageFill">change the style of image and determine the fill brush of the image</param>
        /// <param name="imageStrokeThickness">change the style of image and determine the stroke thickness of the image</param>
        /// <returns>if the ok button is clicked, return true, and if the cancel button is clicked, return false</returns>
        public static Boolean? Show(String message, Object header, Boolean hasTwoButtons, MessageWindowImage image, String tip, Object footer, Double width, Double height, Brush imageStroke, Brush imageFill, Double imageStrokeThickness)
        {
            MessageWindow window = new MessageWindow(message, header, hasTwoButtons, image, tip, footer, width, height, imageStroke, imageFill, imageStrokeThickness);
            return window.ShowDialog();
        }

        //public static fields region
        public static readonly DependencyProperty ImageStrokeProperty;
        public static readonly DependencyProperty ImageFillProperty;
        public static readonly DependencyProperty ImageStrokeThicknessProperty;
        public static readonly DependencyProperty ImageProperty;

        //private events region
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            isClicked = true;

            top = e.GetPosition(this).Y;
            left = e.GetPosition(this).X;
        }

        private void Window_MouseMove(object sender, MouseEventArgs e)
        {
            if (isClicked)
            {
                this.Opacity = .75;
                this.Top += e.GetPosition(this).Y - top;
                this.Left += e.GetPosition(this).X - left;
            }
        }

        private void Window_MouseUp(object sender, MouseButtonEventArgs e)
        {
            this.Opacity = opacity;
            isClicked = false;
        }

        private void MessageWindow_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            drawImage(this, new DependencyPropertyChangedEventArgs());
        }

        private void button_Click(object sender, EventArgs e)
        {
            if (((Button)sender).Name == "btnOk")
                DialogResult = true;
            else
                DialogResult = false;

            this.Close();
        }

        //private functions region
        private static void drawImage(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            MessageWindow window = (MessageWindow)sender;
            Canvas canvas = new Canvas();

            Double width = window.Width / 6;
            Double height = window.Width / 6;

            window.btnOk.Width = window.btnCancel.Width = window.Width / 4;

            canvas.Background = new SolidColorBrush(Colors.Transparent);
            canvas.Width = width;
            canvas.Height = height;
            canvas.Margin = (Thickness)window.Resources["margin"];

            switch (window.Image)
            {
                case MessageWindowImage.Error:
                    {
                        Polygon polygon = new Polygon();
                        Double distance = 0.1178511301977579D * width;

                        if (window.ImageStroke == null)
                            polygon.Stroke = new SolidColorBrush(Colors.Black);
                        else
                            polygon.Stroke = window.ImageStroke;

                        if (window.ImageFill == null)
                            polygon.Fill = new LinearGradientBrush(Colors.Red, Colors.White, 0);
                        else
                            polygon.Fill = window.ImageFill;

                        polygon.StrokeThickness = window.ImageStrokeThickness;

                        polygon.Points.Add(new Point(0, distance));
                        polygon.Points.Add(new Point(distance, 0));
                        polygon.Points.Add(new Point(width / 2, (height / 2) - distance));
                        polygon.Points.Add(new Point(width - distance, 0));
                        polygon.Points.Add(new Point(width, distance));
                        polygon.Points.Add(new Point((width / 2) + distance, height / 2));
                        polygon.Points.Add(new Point(width, height - distance));
                        polygon.Points.Add(new Point(width - distance, height));
                        polygon.Points.Add(new Point(width / 2, (height / 2) + distance));
                        polygon.Points.Add(new Point(distance, height));
                        polygon.Points.Add(new Point(0, height - distance));
                        polygon.Points.Add(new Point((width / 2) - distance, height / 2));

                        Canvas.SetTop(polygon, 0);
                        Canvas.SetLeft(polygon, 0);

                        canvas.Children.Add(polygon);
                    }
                    break;
                case MessageWindowImage.Exclamation:
                    {
                        Polygon polygon = new Polygon();
                        Ellipse ellipse = new Ellipse();

                        if (window.ImageStroke == null)
                            polygon.Stroke = ellipse.Stroke = new SolidColorBrush(Colors.Black);
                        else
                            polygon.Stroke = ellipse.Stroke = window.ImageStroke;

                        if (window.ImageFill == null)
                            polygon.Fill = ellipse.Fill = new LinearGradientBrush(Colors.Yellow, Colors.White, 0);
                        else
                            polygon.Fill = ellipse.Fill = window.ImageFill;

                        polygon.StrokeThickness = window.ImageStrokeThickness;

                        polygon.Points.Add(new Point(width / 3, 0));
                        polygon.Points.Add(new Point(2 * width / 3, 0));
                        polygon.Points.Add(new Point(7 * width / 12, 3 * height / 4));
                        polygon.Points.Add(new Point(5 * width / 12, 3 * height / 4));

                        Canvas.SetLeft(polygon, 0);
                        Canvas.SetRight(polygon, 0);

                        ellipse.Width = ellipse.Height = height / 5;

                        Canvas.SetLeft(ellipse, (width - ellipse.Width) / 2);
                        Canvas.SetBottom(ellipse, 0);

                        canvas.Children.Add(polygon);
                        canvas.Children.Add(ellipse);
                    }
                    break;
                case MessageWindowImage.Pass:
                    {
                        Polygon polygon = new Polygon();
                        
                        if (window.ImageStroke == null)
                            polygon.Stroke = new SolidColorBrush(Colors.Black);
                        else
                            polygon.Stroke = window.ImageStroke;

                        if (window.ImageFill == null)
                            polygon.Fill = new LinearGradientBrush(Colors.Green, Colors.White, 0);
                        else
                            polygon.Fill = window.ImageFill;

                        polygon.StrokeThickness = window.ImageStrokeThickness;

                        polygon.Points.Add(new Point(0,7* height / 15));
                        polygon.Points.Add(new Point(width / 3, 4 * height / 5));
                        polygon.Points.Add(new Point(width - (height / 5), 0));
                        polygon.Points.Add(new Point(width, 0));
                        polygon.Points.Add(new Point(width / 3, height));
                        polygon.Points.Add(new Point(0, 2 * height / 3));

                        Canvas.SetTop(polygon, 0);
                        Canvas.SetLeft(polygon, 0);

                        canvas.Children.Add(polygon);
                    }
                    break;
                case MessageWindowImage.Question:
                    {
                        Polygon polygon = new Polygon();
                        Ellipse ellipse = new Ellipse();

                        if (window.ImageStroke == null)
                            polygon.Stroke = ellipse.Stroke = new SolidColorBrush(Colors.Black);
                        else
                            polygon.Stroke = ellipse.Stroke = window.ImageStroke;

                        if (window.ImageFill == null)
                            polygon.Fill = ellipse.Fill = new LinearGradientBrush(Colors.Blue, Colors.White, 0);
                        else
                            polygon.Fill = ellipse.Fill = window.ImageFill;

                        polygon.StrokeThickness = window.ImageStrokeThickness;

                        polygon.Points.Add(new Point(width / 4, 0));
                        polygon.Points.Add(new Point(3 * width / 4, 0));
                        polygon.Points.Add(new Point(3 * width / 4, height / 2));
                        polygon.Points.Add(new Point(7 * width / 12, height / 2));
                        polygon.Points.Add(new Point(7 * width / 12, 3 * height / 4));
                        polygon.Points.Add(new Point(5 * width / 12, 3 * height / 4));
                        polygon.Points.Add(new Point(5 * width / 12, 1 * height / 3));
                        polygon.Points.Add(new Point(7 * width / 12, height / 3));
                        polygon.Points.Add(new Point(7 * width / 12, height / 6));
                        polygon.Points.Add(new Point(5 * width / 12, height / 6));
                        polygon.Points.Add(new Point(5 * width / 12, height / 4));
                        polygon.Points.Add(new Point(width / 4, height / 4));

                        Canvas.SetLeft(polygon, 0);
                        Canvas.SetRight(polygon, 0);

                        ellipse.Width = ellipse.Height = height / 5;

                        Canvas.SetLeft(ellipse, (width - ellipse.Width) / 2);
                        Canvas.SetBottom(ellipse, 0);

                        canvas.Children.Add(polygon);
                        canvas.Children.Add(ellipse);
                    }
                    break;
            }
            
            window.borderImage.Child = canvas;
        }
  
        //private fields region
        private Boolean isClicked;
        private Double top, left;
        private Double opacity;
    }

    public enum MessageWindowImage
    {
        None,
        Pass,
        Error,
        Question,
        Exclamation
    }

    public interface IMessageWindow
    {
        Object Header
        {
            get;
            set;
        }

        Object Footer
        {
            get;
            set;
        }

        String Message
        {
            get;
            set;
        }

        String Tip
        {
            get;
            set;
        }

        Boolean HasTwoButtons
        {
            get;
            set;
        }

        Brush ImageStroke
        {
            get;
            set;
        }

        Brush ImageFill
        {
            get;
            set;
        }

        Double ImageStrokeThickness
        {
            get;
            set;
        }

        MessageWindowImage Image
        {
            get;
            set;
        }
    }
}
