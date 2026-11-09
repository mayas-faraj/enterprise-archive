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

namespace UtilityWindows
{
    /// <summary>
    /// Interaction logic for BrushDialog.xaml
    /// </summary>
    public partial class BrushDialog : Window
    {
        //public constructors region
        public BrushDialog(Boolean colorAndName)
        {
            InitializeComponent();

            //default values
            isClicked = false;
            top = left = 0;
            opacity = this.Opacity;

            //fetch controls value

            SelectedColor1 = Colors.Black;
            SelectedColor2 = Colors.Blue;
            SelectedIsLinear = true;

            cp1.DisplayColorAndName = cp2.DisplayColorAndName = colorAndName;
        }

        public BrushDialog(Boolean colorAndName, Color color1, Color color2)
            : this(colorAndName)
        {
            cp1.SelectedColor = color1;
            cp2.SelectedColor = color2;
        }

        public BrushDialog(Boolean colorAndName, Color color1, Color color2, Boolean isLinear)
            : this(colorAndName, color1, color2)
        {
            if (isLinear)
                cmType.SelectedIndex = 0;
            else
                cmType.SelectedIndex = 1;
        }

        public BrushDialog(Boolean colorAndName, GradientBrush selectedColor) :
            this(colorAndName)
        {
            this.SelectedColor = selectedColor;
        }

        //public properties region

        /// <summary>
        /// get the selected color by type of gradient, two colors with offset 0,1
        /// </summary>
        public GradientBrush SelectedColor
        {
            get
            {
                GradientBrush brush;

                if (selectedIsLinear)
                    brush = new LinearGradientBrush();
                else
                    brush = new RadialGradientBrush();

                brush.GradientStops.Add(new GradientStop(selectedColor1, 0));
                brush.GradientStops.Add(new GradientStop(selectedColor2, 1));

                return brush;
            }
            set
            {
                if (value == null)
                {
                    SelectedIsLinear = true;
                    SelectedColor1 = SelectedColor2 = Colors.Black;
                }
                else
                {
                    GradientBrush brush = value;

                    if (brush.GetType() == typeof(LinearGradientBrush))
                        SelectedIsLinear = true;
                    else
                        SelectedIsLinear = false;

                    if (brush.GradientStops != null)
                    {
                        if (brush.GradientStops.Count > 0)
                            SelectedColor1 = brush.GradientStops[0].Color;

                        if (brush.GradientStops.Count > 1)
                            SelectedColor2 = brush.GradientStops[1].Color;
                    }
                }              
            }
        }

        public Color SelectedColor1
        {
            get
            {
                return selectedColor1;
            }
            set
            {
                selectedColor1 = value;

                cp1.SelectedColor = selectedColor1;
            }
        }

        public Color SelectedColor2
        {
            get
            {
                return selectedColor2;
            }
            set
            {
                selectedColor2 = value;

                cp2.SelectedColor = selectedColor2;
            }
        }

        public Boolean SelectedIsLinear
        {
            get
            {
                return selectedIsLinear;
            }
            set
            {
                selectedIsLinear = value;

                if (selectedIsLinear)
                    cmType.SelectedIndex = 0;
                else
                    cmType.SelectedIndex = 1;
            }
        }

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

        private void cp_MouseMove(object sender, MouseEventArgs e)
        {
            e.Handled = true;
        }

        private void cp_MouseUpDown(object sender, MouseButtonEventArgs e)
        {
            e.Handled = true;
        }

        private void cp1_SelectedColorChanged(object sender, RoutedPropertyChangedEventArgs<Color> e)
        {
            selectedColor1 = cp1.SelectedColor;
            setColor();
        }

        private void cp2_SelectedColorChanged(object sender, RoutedPropertyChangedEventArgs<Color> e)
        {
            selectedColor2 = cp2.SelectedColor;
            setColor();
        }

        private void cmType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmType.SelectedIndex == 0)
                selectedIsLinear = true;
            else
                selectedIsLinear = false;

            setColor();
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
        private void setColor()
        {
            if (border != null)
                border.Background = SelectedColor;
        }

        //private fields region
        private Color selectedColor1;
        private Color selectedColor2;
        private Boolean selectedIsLinear;
        private Boolean isClicked;
        private Double top, left;
        private Double opacity;
    }
}
