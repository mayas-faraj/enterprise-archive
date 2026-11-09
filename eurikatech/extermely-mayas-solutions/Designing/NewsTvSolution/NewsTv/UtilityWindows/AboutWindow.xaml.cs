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
    /// Interaction logic for AboutWindow.xaml
    /// </summary>
    public partial class AboutWindow : Window, IAboutWindow
    {
        //public constructures region
        public AboutWindow()
        {
            InitializeComponent();

            //window default values
            isClicked = false;
            top = left = 0;

            //calculate coordinates
            draw();
        }

        static AboutWindow()
        {
            //dependency properties defentions and default values
            AboutWidthProperty = DependencyProperty.Register("AboutWidth", typeof(Double), typeof(Window), new PropertyMetadata(350D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            AboutHeightProperty = DependencyProperty.Register("AboutHeight", typeof(Double), typeof(Window), new PropertyMetadata(240D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoShiftPercentProperty = DependencyProperty.Register("ALogoShiftPercent", typeof(Double), typeof(Window), new PropertyMetadata(-.8D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoIntersectPercentProperty = DependencyProperty.Register("ALogoIntersectPercent", typeof(Double), typeof(Window), new PropertyMetadata(0.08D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoWidthPercentProperty = DependencyProperty.Register("ALogoWidthPercent", typeof(Double), typeof(Window), new PropertyMetadata(.22D, new PropertyChangedCallback(dependencyPropertiesChanged)));
            LogoHeightPercentProperty = DependencyProperty.Register("ALogoHeightPercent", typeof(Double), typeof(Window), new PropertyMetadata(.4D, new PropertyChangedCallback(dependencyPropertiesChanged)));
        }

        //public properties region
        public Double AboutWidth
        {
            get
            {
                return (Double)this.GetValue(AboutWidthProperty);
            }
            set
            {
                this.SetValue(AboutWidthProperty, value);
            }
        }

        public Double AboutHeight
        {
            get
            {
                return (Double)this.GetValue(AboutHeightProperty);
            }
            set
            {
                this.SetValue(AboutHeightProperty, value);
            }
        }

        public Visibility LogoVisible
        {
            get
            {
                return logoPanel.Visibility;
            }

            set
            {
                logoPanel.Visibility = value;
            }
        }

        public Double LogoShiftPercent
        {
            get
            {
                return (Double)this.GetValue(LogoShiftPercentProperty);
            }
            set
            {
                this.SetValue(LogoShiftPercentProperty, value);
            }
        }

        public Double LogoIntersectPercent
        {
            get
            {
                return (Double)this.GetValue(LogoIntersectPercentProperty);
            }
            set
            {
                this.SetValue(LogoIntersectPercentProperty, value);
            }
        }

        public Double LogoWidthPercent
        {
            get
            {
                return (Double)this.GetValue(LogoWidthPercentProperty);
            }
            set
            {
                this.SetValue(LogoWidthPercentProperty, value);
            }
        }

        public Double LogoHeightPercent
        {
            get
            {
                return (Double)this.GetValue(LogoHeightPercentProperty);
            }
            set
            {
                this.SetValue(LogoHeightPercentProperty, value);
            }
        }

        public Visibility ButtonBackVisibilty
        {
            get
            {
                return btnBack.Visibility;
            }
            set
            {
                btnBack.Visibility = value;
            }
        }

        public String ButtonBackText
        {
            get
            {
                return Convert.ToString(btnBack.Content);
            }
            set
            {
                btnBack.Content = value;
            }
        }

        public Visibility ProgramNameVisibilty
        {
            get
            {
                return txHeader.Visibility;
            }
            set
            {
                txHeader.Visibility = value;
            }
        }

        public String ProgramNameText
        {
            get
            {
                return Convert.ToString(txHeader.Content);
            }
            set
            {
                txHeader.Content = value;
            }
        }

        public Visibility RegNumberVisibilty
        {
            get
            {
                return txRegNumber.Visibility;
            }
            set
            {
                txRegNumber.Visibility = value;
            }
        }

        public String RegNumberText
        {
            get
            {
                return txRegNumber.Text;
            }
            set
            {
                txRegNumber.Text = value;
            }
        }

        public Visibility ProgramInfoVisibilty
        {
            get
            {
                return txProgramInfo.Visibility;
            }
            set
            {
                txProgramInfo.Visibility = value;
            }
        }

        public String ProgramInfoText
        {
            get
            {
                return txProgramInfo.Text;
            }
            set
            {
                txProgramInfo.Text = value;
            }
        }

        public Visibility DesignerVisibilty
        {
            get
            {
                return txDesigner.Visibility;
            }
            set
            {
                txDesigner.Visibility = value;
            }
        }

        public String DesignerText
        {
            get
            {
                return txDesigner.Text;
            }
            set
            {
                txDesigner.Text = value;
            }
        }

        public Visibility CompanyVisibilty
        {
            get
            {
                return txCompany.Visibility;
            }
            set
            {
                txCompany.Visibility = value;
            }
        }

        public String CompanyText
        {
            get
            {
                return txCompany.Text;
            }
            set
            {
                txCompany.Text = value;
            }
        }

        public Visibility DateVisibilty
        {
            get
            {
                return txDate.Visibility;
            }
            set
            {
                txDate.Visibility = value;
            }
        }

        public String DateText
        {
            get
            {
                return txDate.Text;
            }
            set
            {
                txDate.Text = value;
            }
        }

        public Visibility FooterVisibilty
        {
            get
            {
                return txFooter.Visibility;
            }
            set
            {
                txFooter.Visibility = value;
            }
        }

        public String FooterText
        {
            get
            {
                return Convert.ToString(txFooter.Content);
            }
            set
            {
                txFooter.Content = value;
            }
        }

        //public dependency properties
        public static readonly DependencyProperty AboutWidthProperty;
        public static readonly DependencyProperty AboutHeightProperty;
        public static readonly DependencyProperty LogoShiftPercentProperty;
        public static readonly DependencyProperty LogoIntersectPercentProperty;
        public static readonly DependencyProperty LogoWidthPercentProperty;
        public static readonly DependencyProperty LogoHeightPercentProperty;

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
            this.Opacity = 1;
            isClicked = false;
        }

        private static void dependencyPropertiesChanged(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            AboutWindow about = (AboutWindow)sender;
            about.draw();
        }

        //private functions region
        private void draw()
        {
            //defention
            Double x0, x, y, loginX, loginY, logoX, logoY;

            //layer orders
            Canvas.SetZIndex(logoPanel, 1);
            Canvas.SetZIndex(AboutGrid, 0);

            //login grid and logo panel dimentions
            AboutGrid.Width = AboutWidth;
            AboutGrid.Height = AboutHeight;

            logoPanel.Width = AboutWidth * LogoWidthPercent;
            logoPanel.Height = AboutHeight * LogoHeightPercent;

            x0 = (AboutWidth - logoPanel.Width) / 2;
            x = x0 + (LogoShiftPercent * (logoPanel.Width + AboutWidth) / 2);
            y = (LogoIntersectPercent * AboutHeight) - logoPanel.Height;

            if (x > 0)
            {
                loginX = 0;
                logoX = x;
            }
            else
            {
                loginX = -x;
                logoX = 0;
            }

            Canvas.SetLeft(AboutGrid, loginX);
            Canvas.SetLeft(logoPanel, logoX);

            if (y > 0)
            {
                loginY = 0;
                logoY = y;
            }
            else
            {
                loginY = -y;
                logoY = 0;
            }

            Canvas.SetTop(AboutGrid, loginY);
            Canvas.SetTop(logoPanel, logoY);
        }

        //private fields region
        private Boolean isClicked;
        private Double top, left;

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }

    public interface IAboutWindow
    {
        Double AboutWidth
        {
            get;
            set;
        }

        Double AboutHeight
        {
            get;
            set;
        }

        Visibility ButtonBackVisibilty
        {
            get;
            set;
        }

        String ButtonBackText
        {
            get;
            set;
        }

        Visibility ProgramNameVisibilty
        {
            get;
            set;
        }

        String ProgramNameText
        {
            get;
            set;
        }

        Visibility RegNumberVisibilty
        {
            get;
            set;
        }

        String RegNumberText
        {
            get;
            set;
        }

        Visibility ProgramInfoVisibilty
        {
            get;
            set;
        }

        String ProgramInfoText
        {
            get;
            set;
        }

        Visibility DesignerVisibilty
        {
            get;
            set;
        }

        String DesignerText
        {
            get;
            set;
        }

        Visibility CompanyVisibilty
        {
            get;
            set;
        }

        String CompanyText
        {
            get;
            set;
        }

        Visibility DateVisibilty
        {
            get;
            set;
        }

        String DateText
        {
            get;
            set;
        }

        Visibility FooterVisibilty
        {
            get;
            set;
        }

        String FooterText
        {
            get;
            set;
        }

        Visibility LogoVisible
        {
            get;
            set;
        }

        Double LogoShiftPercent
        {
            get;
            set;
        }

        Double LogoIntersectPercent
        {
            get;
            set;
        }

        Double LogoWidthPercent
        {
            get;
            set;
        }

        Double LogoHeightPercent
        {
            get;
            set;
        }
    }
}
