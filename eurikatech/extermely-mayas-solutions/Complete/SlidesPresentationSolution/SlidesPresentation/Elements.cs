using System;
using System.Windows.Media;

namespace Maniyat.Presentation
{
    /// <summary>
    /// this class provides base class for text and image in the slide, this is an abstract class
    /// </summary>
    public abstract class Element : ICloneable
    {
        //public constructures region
        public Element()
        {
            durration = TimeSpan.FromSeconds(0);
            showEffectDurration = TimeSpan.FromSeconds(0);
            hideEffectDurration = TimeSpan.FromSeconds(0);
            
            showTransitionEffect = TransitionEffect.None;
            hideTransitionEffect = TransitionEffect.None;
            visibleConstantEffeft = ConstantEffect.None;

            effect = null;

            visibleBluringRadiusAmount = visibleFadingAmount = visibleResizingAmount = visibleRotatingAmount = 0;
        }

        //public properties region

        /// <summary>
        /// get or set the effect that will preform when the element is shown
        /// </summary>
        public TransitionEffect ShowTransitionEffect
        {
            get
            {
                return showTransitionEffect;
            }
            set
            {
                showTransitionEffect = value;
            }
        }

        /// <summary>
        /// get or set the effect that will apply to the element when it is visible
        /// </summary>
        public ConstantEffect VisibleConstantEffeft
        {
            get
            {
                return visibleConstantEffeft;
            }
            set
            {
                visibleConstantEffeft = value;
            }
        }

        /// <summary>
        /// get or set the effect that will preform when the element is hidden
        /// </summary>
        public TransitionEffect HideTransitionEffect
        {
            get
            {
                return hideTransitionEffect;
            }
            set
            {
                hideTransitionEffect = value;
            }
        }

        /// <summary>
        /// get of set the duration of element when it is totally visible
        /// </summary>
        public TimeSpan Duration
        {
            get
            {
                return durration;
            }
            set
            {
                durration = value;
            }
        }

        /// <summary>
        /// get or set the duration of showing element
        /// </summary>
        public TimeSpan ShowEffectDuration
        {
            get
            {
                return showEffectDurration;
            }
            set
            {
                showEffectDurration = value;
            }
        }

        /// <summary>
        /// get or set the duration of hidding element
        /// </summary>
        public TimeSpan HideEffectDuration
        {
            get
            {
                return hideEffectDurration;
            }
            set
            {
                hideEffectDurration = value;
            }
        }

        /// <summary>
        /// get or set the effect that will preform to the element
        /// </summary>
        public System.Windows.Media.Effects.Effect Effect
        {
            get
            {
                return effect;
            }
            set
            {
                effect = value;
            }
        }

        /// <summary>
        /// get of set the framework element control that represent in UI
        /// </summary>
        public System.Windows.FrameworkElement RelatedControl
        {
            get
            {
                return relatedControl;
            }
            set
            {
                relatedControl = value;
            }
        }

        /// <summary>
        /// get or set the number of applying visibleConstantEffect on element in it period, the value 0
        /// is used for non applying visibleConstantEffect
        /// </summary>
        public Double VisibleEffectFrequency
        {
            get
            {
                return visibleEffectFrequency;
            }
            set
            {
                visibleEffectFrequency = value;
            }
        }

        /// <summary>
        /// get or set the amount of fading 0..1 that will apply to the visibleConstantEffect on it period
        /// </summary>
        public Double VisibleFadingAmount
        {
            get
            {
                return visibleFadingAmount;
            }
            set
            {
                visibleFadingAmount=value;
            }
        }

        /// <summary>
        /// get or set the amount of resizing 0..1 that will apply to the visibleConstantEffect on it period
        /// </summary>
        public Double VisibleResizingAmount
        {
            get
            {
                return visibleResizingAmount;
            }
            set
            {
                visibleResizingAmount = value;
            }
        }

        /// <summary>
        /// get or set the amount of bluring that will apply to the visibleConstantEffect on it period
        /// </summary>
        public Double VisibleBluringRadiusAmount
        {
            get
            {
                return visibleBluringRadiusAmount;
            }
            set
            {
                visibleBluringRadiusAmount = value;
            }
        }

        /// <summary>
        /// get or set the amount of rotating angel 0..359+360k in degree that will apply to the visibleConstantEffect on it period
        /// </summary>
        public Double VisibleRotatingAmount
        {
            get
            {
                return visibleRotatingAmount;
            }
            set
            {
                visibleRotatingAmount = value;
            }
        }
       
        //public functions region
        /// <summary>
        /// get the total duration of element, it consists of show and visible and hide element duration
        /// </summary>
        /// <returns></returns>
        public TimeSpan GetElementDuration()
        {
            return durration.Add(showEffectDurration.Add(hideEffectDurration));
        }

        public Object Clone()
        {
            return this.MemberwiseClone();
        }

        //private fields region
        private TransitionEffect showTransitionEffect;
        private ConstantEffect visibleConstantEffeft;
        private TransitionEffect hideTransitionEffect;
        private TimeSpan durration;
        private TimeSpan showEffectDurration;
        private TimeSpan hideEffectDurration;
        private System.Windows.Media.Effects.Effect effect;
        private System.Windows.FrameworkElement relatedControl;

        private Double visibleEffectFrequency;
        private Double visibleFadingAmount;
        private Double visibleResizingAmount;
        private Double visibleBluringRadiusAmount;
        private Double visibleRotatingAmount;
    }


    /// <summary>
    /// this class provides properties for text that displayed in the slide
    /// </summary>
    public class TextElement : Element
    {
        //public constructures region

        public TextElement()
        {
            text = "";
            fontFamily = null;
            fontSize = 0;
            brush = null;
            width = 0;
        }

        public TextElement(String text)
            : this()
        {
            this.text = text;
        }

        public TextElement(String text,Double fontSize, Brush textBrush)
            : this(text)
        {
            this.fontSize = fontSize;
            this.brush = textBrush;
        }

        public TextElement(String text, Double fontSize, Brush textBrush, FontFamily fontFamily, Double textWidth)
            : this(text, fontSize, textBrush)
        {
            this.fontFamily = fontFamily;
            this.width = textWidth;
        }

        //public properties region

        /// <summary>
        /// get or set the text that will present in slide
        /// </summary>
        public String Text
        {
            get
            {
                return text;
            }
            set
            {
                text = value;
            }
        }

        /// <summary>
        /// get or set the font family for the text
        /// </summary>
        public FontFamily FontFamily
        {
            get
            {
                return fontFamily;
            }
            set
            {
                fontFamily = value;
            }
        }

        /// <summary>
        /// get or set the font size for the text
        /// </summary>
        public Double FontSize
        {
            get
            {
                return fontSize;
            }
            set
            {
                fontSize = value;
            }
        }

        /// <summary>
        /// get of set the brush for the text
        /// </summary>
        public Brush Brush
        {
            get
            {
                return brush;
            }
            set
            {
                brush = value;
            }
        }

        /// <summary>
        /// get or set the width text, it is useful for multiline text visibilty
        /// </summary>
        public Double Width
        {
            get
            {
                return width;
            }
            set
            {
                width = value;
            }
        }

        //private fields region
        private String text;
        private FontFamily fontFamily;
        private Double fontSize;
        private Brush brush;
        private Double width;
    }

    /// <summary>
    /// this class provides properties for image that displayed in the slide
    /// </summary>
    public class ImageElement : Element
    {
        //public constructures region
        public ImageElement()
        {
            width = height = 0;
        }

        public ImageElement(Uri imageUri)
            :this()
        {
            this.imageUri = imageUri;
        }

        public ImageElement(Uri imageUri, Double width, Double height)
            : this(imageUri)
        {
            this.width = width;
            this.height = height;
        }

        //public properties region

        /// <summary>
        /// get or set the uri of image that will present in the slide
        /// </summary>
        public Uri ImageUri
        {
            get
            {
                return imageUri;
            }
            set
            {
                imageUri = value;
            }
        }

        /// <summary>
        /// get or set the width of the image that will present in the slide
        /// </summary>
        public Double Width
        {
            get
            {
                return width;
            }
            set
            {
                width = value;
            }
        }

        /// <summary>
        /// get or set the hieght of the image that will present in the slide
        /// </summary>
        public Double Height
        {
            get
            {
                return height;
            }
            set
            {
                height = value;
            }
        }

        //private fields region
        private Uri imageUri;
        private Double width;
        private Double height;
    }
}
