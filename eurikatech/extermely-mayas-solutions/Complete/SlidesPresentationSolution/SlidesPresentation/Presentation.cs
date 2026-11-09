using System;
using System.Windows.Controls;

namespace Maniyat.Presentation
{
    /// <summary>
    /// group of functions and properties are necessary for any presentation
    /// </summary>
    public interface IPresentation
    {
        SlideCollection Slides
        {
            get;
            set;
        }

        Boolean IsLoop
        {
            get;
            set;
        }

        Slide SettingSlide
        {
            get;
            set;
        }

        event EventHandler SlideFinishedEventHandler;

        event EventHandler PresentationFinishedEventHandler;

        void Start();

        void Pause();

        void Stop();

        void Next();

        void Prev();

        void Present(Int32 slideIndex);
    }

    /// <summary>
    /// Core class for slide presentation,  
    /// </summary>
    public class Presentation : ContentControl, IPresentation, ICloneable
    {
        //public constructures region

        /// <summary>
        /// the constructure for presnetation
        /// </summary>
        public Presentation()
        {
            mainGrid = new Grid();
            this.Content = mainGrid;
            this.SlideFinishedEventHandler += new EventHandler(Presentation_SlideFinishedEventHandler);
            this.PresentationFinishedEventHandler += new EventHandler(Presentation_PresentationFinishedEventHandler);

            timerInitialValue = TimeSpan.FromMilliseconds(1);

            timer = new System.Windows.Threading.DispatcherTimer();
            timer.IsEnabled = false;
            timer.Interval = timerInitialValue;
            timer.Tick += new EventHandler(timer_Tick);
            timerPhase = TimerPhase.Initial;
            slideIndex = 0;

            longestElementShow = longestElementHide = shortestElementShow = shortestElementHide = new TimeSpan();

            slides = new SlideCollection();

            isLoop = false;
            isPlay = false;     
        }

        //public properties region

        /// <summary>
        /// get or set the slides collection that will present when play presentation is started
        /// </summary>
        public SlideCollection Slides
        {
            get
            {
                return slides;
            }
            set
            {
                slides = value;
            }
        }

        /// <summary>
        /// get or set the value that determine if the slides presentation will play again from second slide after last slide will be present
        /// </summary>
        public Boolean IsLoop
        {
            get
            {
                return isLoop;
            }
            set
            {
                isLoop = value;
            }
        }

        /// <summary>
        /// get or set the slide that used for setting, the properites of this slide use
        /// as default values for any slide have the same value null or empty
        /// </summary>
        public Slide SettingSlide
        {
            get
            {
                return settingSlide;
            }
            set
            {
                settingSlide = value;
            }
        }

        /// <summary>
        /// get or set the background bursh for this presentation
        /// </summary>
        public new System.Windows.Media.Brush Background
        {
            get
            {
                return mainGrid.Background;
            }
            set
            {
                mainGrid.Background = value;
            }
        }

        //public events region

        /// <summary>
        /// the event that will raise when any slide has been presented
        /// </summary>
        public event EventHandler SlideFinishedEventHandler;

        /// <summary>
        /// the event that will raise when last slide has been presented in play mode
        /// </summary>
        public event EventHandler PresentationFinishedEventHandler;
 
        //public functions region

        /// <summary>
        /// start playing the slides from current slide in forword direction
        /// </summary>
        /// <exception cref="System.IO.FileNotFoundException">this exception will throw when the uri of image is invalid or not exsist</exception>
        public void Start()
        {
            isPlay = true;
            Next();
        }

        /// <summary>
        /// pause playing the slides
        /// </summary>
        public void Pause()
        {
            isPlay = false;
            timer.IsEnabled = false;

            if (slideIndex == 0)
                slideIndex = slides.Count - 1;
            else
                slideIndex--;
        }

        /// <summary>
        /// stop playing the slides and make current slide index is zero
        /// </summary>
        public void Stop()
        {
            isPlay = false;
            timer.IsEnabled = false;

            slideIndex = 0;
            textBlock = null;
            image = null;
            timerPhase = TimerPhase.Initial;
            timer.Interval = timerInitialValue;
            mainGrid.Children.Clear();
        }

        /// <summary>
        /// play the current slide and make the current slide is the next one
        /// </summary>
        /// <exception cref="System.IO.FileNotFoundException">this exception will throw when the uri of image is invalid or not exsist</exception>
        public void Next()
        {
            //precondition: none
            Present(slideIndex);

            if (slideIndex < slides.Count - 1)
                slideIndex++;
            else
                slideIndex = 0;
            //postcondition: slide will present,and increase slideIndex by one
        }

        /// <summary>
        /// make the current slide is the previous one and play the slide
        /// </summary>
        public void Prev()
        {
            //precondition:none
            if (slideIndex == 0)
                slideIndex = slides.Count - 1;
            else
                slideIndex--;

            Present(slideIndex);
            //postcondition:decrease slideIndex by one, and slide will present
        }

        /// <summary>
        /// Present the slide in Slides property in one timer frame
        /// </summary>
        /// <param name="slideIndex">index of slide in Slides property.</param>
        /// <exception cref="System.ArgumentOutOfRangeException">this exception thrown when slide index out of range from slides collection</exception>
        /// <exception cref="System.IO.FileNotFoundException">this exception will throw when the uri of image is invalid or not exsist</exception>
        public void Present(Int32 slideIndex)
        {
            //precondition:none
            if (slides.Count > 0)
            {
                if (slideIndex >= 0 && slideIndex < slides.Count)
                {
                    this.slideIndex = slideIndex;
                    currentSlide = slideFromSetting(slides[slideIndex]);
                    timer.IsEnabled = true;
                }
                else
                    throw (new System.ArgumentOutOfRangeException("slideIndex", slideIndex, "Present slideIndex range from 0.." + (slides.Count - 1).ToString()));
            }
            //postcondition:present current silde in one timer frame
        }

        public Object Clone()
        {
            Presentation presentation = (Presentation)this.MemberwiseClone();

            presentation.slides = (SlideCollection)this.slides.Clone();

            if (this.settingSlide != null)
                presentation.settingSlide = (Slide)this.settingSlide.Clone();

            if (this.currentSlide != null)
                presentation.currentSlide = (Slide)this.currentSlide.Clone();

            presentation.Background = (System.Windows.Media.Brush)this.Background.Clone();

            if (this.longestElement != null)
                presentation.longestElement = (Element)this.longestElement.Clone();

            if (this.shortestElement != null)
                presentation.shortestElement = (Element)this.shortestElement.Clone();

            if (this.secondPhaseElement != null)
                presentation.secondPhaseElement = (Element)this.secondPhaseElement.Clone();

            if (this.thirdPhaseElement != null)
                presentation.thirdPhaseElement = (Element)this.thirdPhaseElement.Clone();

            if (this.fourthPhaseElement != null)
                presentation.fourthPhaseElement = (Element)this.fourthPhaseElement.Clone();

            return presentation;
        }  

        //private events region
        private void timer_Tick(object sender, EventArgs e)
        {
            //precondition: none

            //define elements
            Slide slide = currentSlide;

            //timer phase branchs
            switch (timerPhase)
            {
                case TimerPhase.Initial:
                    {
                        //detect longest element and shortest one
                        if (slide.Text == null)
                            longestElement = slide.Image;
                        else if (slide.Image == null)
                            longestElement = slide.Text;
                        else if (slide.Text.GetElementDuration() > slide.Image.GetElementDuration())
                        {
                            longestElement = slide.Text;
                            shortestElement = slide.Image;
                        }
                        else
                        {
                            longestElement = slide.Image;
                            shortestElement = slide.Text;
                        }

                        //calculate timespans
                        longestElementShow = new TimeSpan();
                        longestElementHide = longestElement.ShowEffectDuration.Add(longestElement.Duration);

                        if (shortestElement != null)
                        {
                            shortestElementShow = longestElement.GetElementDuration().Subtract(shortestElement.GetElementDuration());
                            shortestElementHide = shortestElement.ShowEffectDuration.Add(shortestElement.Duration.Add(shortestElementShow));
                        }

                        //phase detects algoriths
                        if (shortestElement == null)
                        {
                            firstPhaseTime = longestElementHide;

                            secondPhaseTime = longestElement.HideEffectDuration;
                            secondPhaseVisibility = false;
                            secondPhaseElement = longestElement;

                            thirdPhaseElement = fourthPhaseElement = null;
                        }
                        else
                            if (longestElementHide < shortestElementShow)
                            {
                                firstPhaseTime = longestElementHide;

                                secondPhaseTime = shortestElementShow.Subtract(longestElementHide);
                                secondPhaseVisibility = false;
                                secondPhaseElement = longestElement;

                                thirdPhaseTime = shortestElementHide.Subtract(shortestElementShow);
                                thirdPhaseVisibility = true;
                                thirdPhaseElement = shortestElement;

                                fourthPhaseTime = shortestElement.HideEffectDuration;
                                fourthPhaseElement = shortestElement;
                            }
                            else
                            {
                                firstPhaseTime = shortestElementShow;

                                if (longestElementHide < shortestElementHide)
                                {
                                    secondPhaseTime = longestElementHide.Subtract(shortestElementShow);
                                    secondPhaseVisibility = true;
                                    secondPhaseElement = shortestElement;

                                    thirdPhaseTime = shortestElementHide.Subtract(longestElementHide);
                                    thirdPhaseVisibility = false;
                                    thirdPhaseElement = longestElement;

                                    fourthPhaseTime = shortestElement.HideEffectDuration;
                                    fourthPhaseElement = shortestElement;
                                }
                                else
                                {
                                    secondPhaseTime = shortestElementHide.Subtract(shortestElementShow);
                                    secondPhaseVisibility = true;
                                    secondPhaseElement = shortestElement;

                                    thirdPhaseTime = shortestElement.HideEffectDuration.Subtract(longestElement.HideEffectDuration);

                                    thirdPhaseVisibility = false;
                                    thirdPhaseElement = shortestElement;

                                    fourthPhaseTime = longestElement.HideEffectDuration;
                                    fourthPhaseElement = longestElement;
                                }

                            }

                        //defining elements
                        mainGrid.ColumnDefinitions.Clear();
                        mainGrid.FlowDirection = slide.RightToLeft ? System.Windows.FlowDirection.RightToLeft : System.Windows.FlowDirection.LeftToRight;
                        generateTextBlock(slide);
                        generateImage(slide);

                        timerPhase = TimerPhase.First;

                        break;
                    }
                case TimerPhase.First:
                    {
                        timer.Interval = firstPhaseTime;
                        elementVisibility(longestElement, true);
                        timerPhase = TimerPhase.Second;

                        break;
                    }
                case TimerPhase.Second:
                    {
                        timer.Interval = secondPhaseTime;
                        elementVisibility(secondPhaseElement, secondPhaseVisibility);
                        timerPhase = TimerPhase.Third;

                        break;
                    }
                case TimerPhase.Third:
                    {
                        timer.Interval = thirdPhaseTime;
                        elementVisibility(thirdPhaseElement, thirdPhaseVisibility);
                        timerPhase = TimerPhase.Fourth;

                        break;
                    }
                case TimerPhase.Fourth:
                    {
                        timer.Interval = fourthPhaseTime;
                        elementVisibility(fourthPhaseElement, false);
                        timerPhase = TimerPhase.Finishing;

                        break;
                    }
                case TimerPhase.Finishing:
                    {
                        //deliver oprations
                        timer.Interval = timerInitialValue;
                        timerPhase = TimerPhase.Initial;
                        timer.IsEnabled = false;
           
                        if (slideIndex == 0)
                            PresentationFinishedEventHandler(this, new EventArgs());

                        SlideFinishedEventHandler(this, new EventArgs());

                        if (textBlock != null)
                        {
                            textBlock.Visibility = System.Windows.Visibility.Hidden;
                            textBlock = null;
                        }

                        if (image != null)
                        {
                            image.Visibility = System.Windows.Visibility.Hidden;
                            image = null;
                        }
                        
                        longestElement = shortestElement = null;

                        break;
                    }
            }

            //postcondition: exhibit the slide with 5 times subframe
        }

        private void Presentation_SlideFinishedEventHandler(object sender, EventArgs e)
        {
            if (isPlay && slideIndex != 0)
                Next();
        }

        private void Presentation_PresentationFinishedEventHandler(object sender, EventArgs e)
        {
            if (isPlay && isLoop)
                Next();
        }

        private void dAnimation_LongestCompleted(object sender, EventArgs e)
        {
            elementConstantEffects(longestElement);
        }

        private void dAnimation_ShortestCompleted(object sender, EventArgs e)
        {
            elementConstantEffects(shortestElement);
        }

        //private functions region
        private void generateTextBlock(Slide slide)
        {
            //precondition:none
            if (slide.Text != null && slide.Text.Text != null && slide.Text.Text != "")
            {
                textBlock = new TextBlock();

                //textblock properties
                textBlock.Text = slide.Text.Text;

                textBlock.Effect = slide.Text.Effect;
                textBlock.TextWrapping = System.Windows.TextWrapping.Wrap;
                textBlock.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
                textBlock.VerticalAlignment = System.Windows.VerticalAlignment.Center;
                textBlock.TextAlignment = System.Windows.TextAlignment.Center;
                textBlock.Visibility = System.Windows.Visibility.Hidden;

                slide.Text.RelatedControl = textBlock;

                if (slide.Text.Width != 0)
                    textBlock.Width = slide.Text.Width;

                if (slide.Text.FontFamily != null)
                    textBlock.FontFamily = slide.Text.FontFamily;

                if (slide.Text.FontSize != 0)
                    textBlock.FontSize = slide.Text.FontSize;

                if (slide.Text.Brush != null)
                    textBlock.Foreground = slide.Text.Brush;  

                //add textblock to the control
                Grid.SetColumn(textBlock, mainGrid.ColumnDefinitions.Count);
                mainGrid.ColumnDefinitions.Add(new ColumnDefinition());
                mainGrid.Children.Add(textBlock);
            }
            //postcondition:generate textblock for slide parameter
        }

        private void generateImage(Slide slide)
        {
            //precondition:none
            if (slide.Image != null && slide.Image.ImageUri != null)
            {
                image = new Image();

                //image properties

                image.Source = new System.Windows.Media.Imaging.BitmapImage(slide.Image.ImageUri);
                image.Effect = slide.Image.Effect;
                image.Visibility = System.Windows.Visibility.Hidden;
                image.Stretch = System.Windows.Media.Stretch.Fill;
                image.VerticalAlignment = System.Windows.VerticalAlignment.Center;
                image.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;

                if (slide.Image.Width != 0)
                    image.Width = slide.Image.Width;

                if (slide.Image.Height != 0)
                    image.Height = slide.Image.Height;

                slide.Image.RelatedControl = image;

                //define column
                Grid.SetColumn(image, mainGrid.ColumnDefinitions.Count);
                mainGrid.ColumnDefinitions.Add(new ColumnDefinition());
                mainGrid.Children.Add(image);
            }

            //postcondition:generate image for slide 
        }

        private void elementVisibility(Element element, Boolean showElement)
        {
            //precondition: none
            if (element != null && element.RelatedControl != null)
            {
                System.Windows.Media.Animation.DoubleAnimation dAnimation = new System.Windows.Media.Animation.DoubleAnimation();
                TimeSpan duration;

                if (showElement)
                {
                    element.RelatedControl.Visibility = System.Windows.Visibility.Visible;

                    duration = element.ShowEffectDuration;

                    if (element == longestElement)
                        dAnimation.Completed += new EventHandler(dAnimation_LongestCompleted);
                    else
                        dAnimation.Completed += new EventHandler(dAnimation_ShortestCompleted);
                }
                else
                    duration = element.HideEffectDuration;

                dAnimation.Duration = new System.Windows.Duration(duration);
                
                switch (element.ShowTransitionEffect)
                {
                    case TransitionEffect.Fading:
                        { 
                            if (showElement)
                            {
                                dAnimation.From = fadingStart;
                                dAnimation.To = fadingEnd;
                            }
                            else
                            {
                                dAnimation.From = fadingEnd;
                                dAnimation.To = fadingStart;
                            }

                            element.RelatedControl.BeginAnimation(Control.OpacityProperty, dAnimation);
                            break;
                        }
                    case TransitionEffect.Blurring:
                        {
                            System.Windows.Media.Effects.BlurEffect blurEffect = new System.Windows.Media.Effects.BlurEffect();
                            element.RelatedControl.Effect = blurEffect;

                            if (showElement)
                            {
                                dAnimation.From = blurRadiusStart;
                                dAnimation.To = blurRadiusEnd;
                            }
                            else
                            {
                                dAnimation.From = blurRadiusEnd;
                                dAnimation.To = blurRadiusStart;
                            }

                            blurEffect.BeginAnimation(System.Windows.Media.Effects.BlurEffect.RadiusProperty, dAnimation);

                            break;
                        }
                    case TransitionEffect.Resizing:
                        {
                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;
                            
                            if (showElement)
                            {
                                dAnimation.From = resizeStart;
                                dAnimation.To = resizeEnd;
                            }
                            else
                            {
                                dAnimation.From = resizeEnd;
                                dAnimation.To = resizeStart; 
                            }

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleXProperty, dAnimation);
                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleYProperty, dAnimation);

                            break;
                        }
                    case TransitionEffect.ResizingWidth:
                        {
                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;

                            if (showElement)
                            {
                                dAnimation.From = resizeStart;
                                dAnimation.To = resizeEnd;
                            }
                            else
                            {
                                dAnimation.From = resizeEnd;
                                dAnimation.To = resizeStart;
                            }

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleXProperty, dAnimation);

                            break;
                        }
                    case TransitionEffect.ResizingHeight:
                        {
                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;

                            if (showElement)
                            {
                                dAnimation.From = resizeStart;
                                dAnimation.To = resizeEnd;
                            }
                            else
                            {
                                dAnimation.From = resizeEnd;
                                dAnimation.To = resizeStart;
                            }

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleYProperty, dAnimation);

                            break;
                        }
                }
            }
            //postcondition: show textblock or image element with specific effect if the textblock not null
        }

        private void elementConstantEffects(Element element)
        {
            if (element != null && element.VisibleEffectFrequency != 0)
            {
                System.Windows.Media.Animation.DoubleAnimation dAnimation = new System.Windows.Media.Animation.DoubleAnimation();
                dAnimation.Duration = TimeSpan.FromMilliseconds(element.Duration.TotalMilliseconds / element.VisibleEffectFrequency);
                dAnimation.AutoReverse = true;
                dAnimation.IsAdditive = true;
                dAnimation.RepeatBehavior = new System.Windows.Media.Animation.RepeatBehavior(element.VisibleEffectFrequency);

                switch (element.VisibleConstantEffeft)
                {
                    case ConstantEffect.Rotating:
                        {
                            dAnimation.By = element.VisibleRotatingAmount;
                           
                            System.Windows.Media.RotateTransform rotateTransform = new System.Windows.Media.RotateTransform();
                            element.RelatedControl.LayoutTransform = rotateTransform;

                            rotateTransform.BeginAnimation(System.Windows.Media.RotateTransform.AngleProperty, dAnimation);


                            break;
                        }
                    case ConstantEffect.Blurring:
                        {
                            dAnimation.By = element.VisibleBluringRadiusAmount;
                            System.Windows.Media.Effects.BlurEffect blurEffect = new System.Windows.Media.Effects.BlurEffect();
                            element.RelatedControl.Effect = blurEffect;

                            blurEffect.BeginAnimation(System.Windows.Media.Effects.BlurEffect.RadiusProperty, dAnimation);

                            break;
                        }
                    case ConstantEffect.Fading:
                        {
                            dAnimation.By = -element.VisibleFadingAmount;

                            element.RelatedControl.BeginAnimation(System.Windows.Controls.Control.OpacityProperty, dAnimation);

                            break;
                        }
                    case ConstantEffect.Resizing:
                        {
                            dAnimation.By = element.VisibleResizingAmount;
                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleXProperty, dAnimation);
                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleYProperty, dAnimation);
                            
                            break;
                        }

                    case ConstantEffect.ResizingWidth:
                        {
                            dAnimation.By = element.VisibleResizingAmount;

                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleXProperty, dAnimation);
                            
                            break;
                        }

                    case ConstantEffect.ResizingHeight:
                        {
                            dAnimation.By = element.VisibleResizingAmount;

                            System.Windows.Media.ScaleTransform scaleTransform = new System.Windows.Media.ScaleTransform();
                            element.RelatedControl.LayoutTransform = scaleTransform;

                            scaleTransform.BeginAnimation(System.Windows.Media.ScaleTransform.ScaleYProperty, dAnimation);
                            
                            break;
                        }
                }
            }
        }

        private Slide slideFromSetting(Slide slide)
        {
            //precondition: none
            if (slide != null)
            {
                Slide result = (Slide)slide.Clone();

                if (settingSlide != null)
                {
                    if (result.Text != null)
                    {
                        if (result.Text.Brush == null && settingSlide.Text.Brush != null)
                            result.Text.Brush = settingSlide.Text.Brush;

                        if (result.Text.Effect == null && settingSlide.Text.Effect != null)
                            result.Text.Effect = settingSlide.Text.Effect;

                        if (result.Text.FontFamily == null && settingSlide.Text.FontFamily != null)
                            result.Text.FontFamily = settingSlide.Text.FontFamily;

                        if (result.Text.FontSize == 0 && settingSlide.Text.FontSize != 0)
                            result.Text.FontSize = settingSlide.Text.FontSize;

                        if (result.Text.HideEffectDuration.TotalMilliseconds == 0 && settingSlide.Text.HideEffectDuration.TotalMilliseconds != 0)
                            result.Text.HideEffectDuration = settingSlide.Text.HideEffectDuration;

                        if (result.Text.ShowEffectDuration.TotalMilliseconds == 0 && settingSlide.Text.ShowEffectDuration.TotalMilliseconds != 0)
                            result.Text.ShowEffectDuration = settingSlide.Text.ShowEffectDuration;

                        if (result.Text.Duration.TotalMilliseconds == 0 && settingSlide.Text.Duration.TotalMilliseconds != 0)
                            result.Text.Duration = settingSlide.Text.Duration;

                        if (result.Text.HideTransitionEffect == TransitionEffect.None && settingSlide.Text.HideTransitionEffect != TransitionEffect.None)
                            result.Text.HideTransitionEffect = settingSlide.Text.HideTransitionEffect;

                        if (result.Text.ShowTransitionEffect == TransitionEffect.None && settingSlide.Text.ShowTransitionEffect != TransitionEffect.None)
                            result.Text.ShowTransitionEffect = settingSlide.Text.ShowTransitionEffect;

                        if (result.Text.VisibleConstantEffeft == ConstantEffect.None && settingSlide.Text.VisibleConstantEffeft != ConstantEffect.None)
                            result.Text.VisibleConstantEffeft = settingSlide.Text.VisibleConstantEffeft;

                        if (result.Text.Text == "" && settingSlide.Text.Text != "")
                            result.Text.Text = settingSlide.Text.Text;

                        if (result.Text.VisibleBluringRadiusAmount == 0 && settingSlide.Text.VisibleBluringRadiusAmount != 0)
                            result.Text.VisibleBluringRadiusAmount = settingSlide.Text.VisibleBluringRadiusAmount;

                        if (result.Text.VisibleEffectFrequency == 0 && settingSlide.Text.VisibleEffectFrequency != 0)
                            result.Text.VisibleEffectFrequency = settingSlide.Text.VisibleEffectFrequency;

                        if (result.Text.VisibleFadingAmount == 0 && settingSlide.Text.VisibleFadingAmount != 0)
                            result.Text.VisibleFadingAmount = settingSlide.Text.VisibleFadingAmount;

                        if (result.Text.VisibleResizingAmount == 0 && settingSlide.Text.VisibleResizingAmount != 0)
                            result.Text.VisibleResizingAmount = settingSlide.Text.VisibleResizingAmount;

                        if (result.Text.VisibleRotatingAmount == 0 && settingSlide.Text.VisibleRotatingAmount != 0)
                            result.Text.VisibleRotatingAmount = settingSlide.Text.VisibleRotatingAmount;

                        if (result.Text.Width == 0 && settingSlide.Text.Width != 0)
                            result.Text.Width = settingSlide.Text.Width;
                    }

                    if (result.Image != null)
                    {
                        if (result.Image.Effect == null && settingSlide.Image.Effect != null)
                            result.Image.Effect = settingSlide.Image.Effect;

                        if (result.Image.HideEffectDuration.TotalMilliseconds == 0 && settingSlide.Image.HideEffectDuration.TotalMilliseconds != 0)
                            result.Image.HideEffectDuration = settingSlide.Image.HideEffectDuration;

                        if (result.Image.ShowEffectDuration.TotalMilliseconds == 0 && settingSlide.Image.ShowEffectDuration.TotalMilliseconds != 0)
                            result.Image.ShowEffectDuration = settingSlide.Image.ShowEffectDuration;

                        if (result.Image.Duration.TotalMilliseconds == 0 && settingSlide.Image.Duration.TotalMilliseconds != 0)
                            result.Image.Duration = settingSlide.Image.Duration;

                        if (result.Image.HideTransitionEffect == TransitionEffect.None && settingSlide.Image.HideTransitionEffect != TransitionEffect.None)
                            result.Image.HideTransitionEffect = settingSlide.Image.HideTransitionEffect;

                        if (result.Image.ShowTransitionEffect == TransitionEffect.None && settingSlide.Image.ShowTransitionEffect != TransitionEffect.None)
                            result.Image.ShowTransitionEffect = settingSlide.Image.ShowTransitionEffect;

                        if (result.Image.VisibleConstantEffeft == ConstantEffect.None && settingSlide.Image.VisibleConstantEffeft != ConstantEffect.None)
                            result.Image.VisibleConstantEffeft = settingSlide.Image.VisibleConstantEffeft;

                        if (result.Image.ImageUri == null && settingSlide.Image.ImageUri != null)
                            result.Image.ImageUri = settingSlide.Image.ImageUri;

                        if (result.Image.VisibleBluringRadiusAmount == 0 && settingSlide.Image.VisibleBluringRadiusAmount != 0)
                            result.Image.VisibleBluringRadiusAmount = settingSlide.Image.VisibleBluringRadiusAmount;

                        if (result.Image.VisibleEffectFrequency == 0 && settingSlide.Image.VisibleEffectFrequency != 0)
                            result.Image.VisibleEffectFrequency = settingSlide.Image.VisibleEffectFrequency;

                        if (result.Image.VisibleFadingAmount == 0 && settingSlide.Image.VisibleFadingAmount != 0)
                            result.Image.VisibleFadingAmount = settingSlide.Image.VisibleFadingAmount;

                        if (result.Image.VisibleResizingAmount == 0 && settingSlide.Image.VisibleResizingAmount != 0)
                            result.Image.VisibleResizingAmount = settingSlide.Image.VisibleResizingAmount;

                        if (result.Image.VisibleRotatingAmount == 0 && settingSlide.Image.VisibleRotatingAmount != 0)
                            result.Image.VisibleRotatingAmount = settingSlide.Image.VisibleRotatingAmount;

                        if (result.Image.Width == 0 && settingSlide.Image.Width != 0)
                            result.Image.Width = settingSlide.Image.Width;

                        if (result.Image.Height == 0 && settingSlide.Image.Height != 0)
                            result.Image.Height = settingSlide.Image.Height;
                    }
                }

                return result;
            }
            else
                return null;
            //return value: result slide is merge between current slide and settingslide
        }

        //private fields region
        private SlideCollection slides;
        private Boolean isLoop;
        private Slide settingSlide;

        private Grid mainGrid;
        private Slide currentSlide;
        private Int32 slideIndex;
        private System.Windows.Threading.DispatcherTimer timer;
        private TimerPhase timerPhase;
        private TextBlock textBlock;
        private Image image;
        private Boolean isPlay;
        private Boolean secondPhaseVisibility;
        private Boolean thirdPhaseVisibility;
        private Element longestElement;
        private Element shortestElement;
        private Element secondPhaseElement;
        private Element thirdPhaseElement;
        private Element fourthPhaseElement;
        private TimeSpan longestElementShow;
        private TimeSpan longestElementHide;
        private TimeSpan shortestElementShow;
        private TimeSpan shortestElementHide;
        private TimeSpan timerInitialValue;
        private TimeSpan firstPhaseTime;
        private TimeSpan secondPhaseTime;
        private TimeSpan thirdPhaseTime;
        private TimeSpan fourthPhaseTime;

        //private constant region
        private const Int32 fadingStart = 0;
        private const Int32 fadingEnd = 1;
        private const Int32 blurRadiusStart = 80;
        private const Int32 blurRadiusEnd = 0;
        private const Int32 resizeStart = 0;
        private const Int32 resizeEnd = 1;
    }
}
