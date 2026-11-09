using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace NewsTv.Codes
{
    public class User
    {
        //public properties region
        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32 Password
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
            }
        }

        public String Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        public String ImagePath
        {
            get
            {
                return imagePath;
            }
            set
            {
                imagePath = value;
            }
        }

        //public functions region
        public Int32 Toning(String value)
        {
            return (PREFIX + value + SUFFFIX).GetHashCode();
        }

        public StackPanel ToStackPanet(ResourceDictionary resources, Double imageWidth, Double imageHeight)
        {
            StackPanel stack = new StackPanel();

            Border border = new Border();
            Image image = new Image();
            TextBlock text = new TextBlock();

            image.Source = Library.LoadUserImage(imagePath);
            text.Text = name;
            border.Child = image;

            if (resources != null)
            {
                border.BorderBrush = (Brush)resources["borders"];
                border.BorderThickness = (Thickness)resources["bordersWidth"];
                border.Margin = (Thickness)resources["margin"];

                if (image != null)
                {
                    image.Margin = (Thickness)resources["margin"];
                    image.HorizontalAlignment = HorizontalAlignment.Center;
                    image.VerticalAlignment = VerticalAlignment.Center;

                    if (imageWidth == -1)
                        image.Width = (Double)resources["userWidth"];
                    else
                        image.Width = imageWidth;

                    if (imageHeight == -1)
                        image.Height = (Double)resources["userHeight"];
                    else
                        image.Height = imageHeight;
                }

                if (name != null && name != "")
                {
                    text.FontSize = (Double)resources["textsSize"];
                    text.Foreground = (Brush)resources["texts"];
                    text.Margin = (Thickness)resources["margin"];
                    text.HorizontalAlignment = HorizontalAlignment.Center;
                    text.VerticalAlignment = VerticalAlignment.Center;
                }
            }

            stack.Children.Add(border);
            stack.Children.Add(text);

            return stack;
        }

        public StackPanel ToStackPanet(ResourceDictionary resources)
        {
            return ToStackPanet(resources, -1, -1);
        }

        public override String ToString()
        {
            return Name;
        }

        //private fields region
        private String name;
        private Int32 password;
        private String description;
        private String imagePath;

        //private constant region
        private const String PREFIX = "!@#*[";
        private const String SUFFFIX = "]*$%^";
    }
}
