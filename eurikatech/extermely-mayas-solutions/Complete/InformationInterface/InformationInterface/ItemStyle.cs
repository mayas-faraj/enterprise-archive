using System;
using System.Windows;
using System.Windows.Media;
using System.Windows.Controls;

namespace Maniyat
{
    public class ItemStyle
    {
        //public constructures region
        public ItemStyle()
        {
            background = new SolidColorBrush(SystemColors.ControlColor);
            titlesForeground = valuesForeground = new SolidColorBrush(SystemColors.ActiveCaptionTextColor);
            borderThikness = new Thickness(1);
            cornerRadius = new CornerRadius(1);
        }

        public ItemStyle(Brush itemBackground, Brush itemForeground)
        {
            background = itemBackground;
            titlesForeground = valuesForeground = itemForeground;
            borderThikness = new Thickness(1);
            cornerRadius = new CornerRadius(1);
        }

        //public properties regoin
        public Brush Background
        {
            get
            {
                return background;
            }
            set
            {
                background = value;
            }
        }

        public Brush TitlesForeground
        {
            get
            {
                return titlesForeground;
            }
            set
            {
                titlesForeground = value;
            }
        }

        public Brush ValuesForeground
        {
            get
            {
                return valuesForeground;
            }
            set
            {
                valuesForeground = value;
            }
        }

        public Brush BorderBrush
        {
            get
            {
                return borderBrush;
            }
            set
            {
                borderBrush = value;
            }
        }

        public Thickness BorderThikness
        {
            get
            {
                return borderThikness;
            }
            set
            {
                borderThikness = value;
            }
        }

        public CornerRadius CornerRadius
        {
            get
            {
                return cornerRadius;
            }
            set
            {
                cornerRadius = value;
            }
        }
 
        //private fields region
        private Brush background;
        private Brush titlesForeground;
        private Brush valuesForeground;
        private Thickness borderThikness;
        private CornerRadius cornerRadius;
        private Brush borderBrush;
    }
}
