using System;

namespace Maniyat.Presentation
{
    /// <summary>
    /// class prepresents slide that will present in presentation solution,
    /// and it consists from two main elements, text and image element
    /// </summary>
    public class Slide : ICloneable
    {
        //public constructures region
        public Slide()
        {
            text = new TextElement();
            image = new ImageElement();
            rightToLeft = false;
        }

        public Slide(TextElement textElement)
        {
            this.Text = textElement;
            image = new ImageElement();
        }

        public Slide(TextElement textElement, ImageElement imageElement, Boolean rightToLeft)
        {
            text = textElement;
            image = imageElement;
            this.rightToLeft = rightToLeft;
        }

        //public properties region

        /// <summary>
        /// get of set the text element for the slide, if it is null, only image will displayed
        /// </summary>
        public TextElement Text
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
        /// get of set the image element for the slide, if it is null, only text will displayed
        /// </summary>
        public ImageElement Image
        {
            get
            {
                return image;
            }
            set
            {
                image = value;
            }
        }

        /// <summary>
        /// get of set the value that determine the position for text and image
        /// if it is false, the text appears in left and image in right
        /// ,else the text appears in right and image in left
        /// </summary>
        public Boolean RightToLeft
        {
            get
            {
                return rightToLeft;
            }
            set
            {
                rightToLeft = value;
            }
        }

        //public functions region

        /// <summary>
        /// get the total time for slide to present and text and image elements
        /// </summary>
        /// <returns></returns>
        public TimeSpan GetSlideDuration()
        {
            if (text.GetElementDuration() > image.GetElementDuration())
                return text.GetElementDuration();
            else
                return image.GetElementDuration();
        }

        public Object Clone()
        {
            Slide slide = (Slide)this.MemberwiseClone();

            if (this.text != null)
                slide.text = (TextElement)this.text.Clone();

            if (this.image != null)
                slide.image = (ImageElement)this.image.Clone();

            return slide;
        }

        //private fields region
        private TextElement text;
        private ImageElement image;
        private Boolean rightToLeft;
    }

    /// <summary>
    /// collection of slides
    /// </summary>
    public class SlideCollection : System.Collections.CollectionBase, ICloneable
    {
        //public functions region

        /// <summary>
        /// insert new slide to the collection and storage it
        /// </summary>
        public void Add(Slide slide)
        {
            List.Add(slide);
        }

        /// <summary>
        /// remove specific slide from the collection
        /// </summary>
        public void Remove(Slide slide)
        {
            List.Remove(slide);
        }

        /// <summary>
        /// the indexer for collection to get specific class by it index
        /// </summary>
        public Slide this[Int32 index]
        {
            get
            {
                return (Slide)List[index];
            }
            set
            {
                List[index] = value;
            }
        }

        public Object Clone()
        {
            SlideCollection slides = new SlideCollection();

            foreach (Slide slide in this)
                slides.Add(slide);

            return slides;
        }
    }
}
