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
using Mani = Maniyat.Presentation;

namespace ClientApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Mani.Presentation presentation;
        private System.Windows.Threading.DispatcherTimer timer;

        public MainWindow()
        {
            InitializeComponent();

            timer = new System.Windows.Threading.DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(100);
            timer.Tick += new EventHandler(timer_Tick);

            /*
            presentation = new Maniyat.Presentation();
            
            
            presentation.Background = new RadialGradientBrush(Colors.Pink, Colors.Red);
            content.Content = presentation;

            Maniyat.TextElement text = new Maniyat.TextElement("NO TEXT", 30, new LinearGradientBrush(Colors.Lime, Colors.Yellow, 0));
            text.FontFamily = new FontFamily("Impact");
            text.Width = 200;
            text.ShowEffectDuration = TimeSpan.FromSeconds(1);
            text.Duration = TimeSpan.FromSeconds(4);
            text.HideEffectDuration = TimeSpan.FromSeconds(1);
            text.ShowTransitionEffect = Maniyat.TransitionEffect.ResizingHeight;
            text.HideTransitionEffect = Maniyat.TransitionEffect.ResizingWidth;
            text.VisibleConstantEffeft = Maniyat.ConstantEffect.Resizing;
            text.VisibleResizingAmount = .005;
            text.VisibleEffectFrequency = 8;

            Maniyat.ImageElement image = new Maniyat.ImageElement("e:\\i1.jpg", 200, 200);
            image.ShowEffectDuration = TimeSpan.FromSeconds(2);
            image.Duration = TimeSpan.FromSeconds(6);
            image.HideEffectDuration = TimeSpan.FromSeconds(2);
            image.ShowTransitionEffect = Maniyat.TransitionEffect.ResizingWidth;
            image.HideTransitionEffect = Maniyat.TransitionEffect.ResizingHeight;
            image.VisibleConstantEffeft = Maniyat.ConstantEffect.Fading;
            image.VisibleFadingAmount = .2;
            image.VisibleEffectFrequency = 4;

            presentation.SettingSlide = new Maniyat.Slide(text, image, false);

            Maniyat.TextElement text1 = new Maniyat.TextElement();
            text1.Text = "Mayas Faraj";
            Maniyat.ImageElement image1 = new Maniyat.ImageElement("e:\\i1.jpg", 200, 200);
            presentation.Slides.Add(new Maniyat.Slide(text1, image1, false));

            Maniyat.TextElement text2 = new Maniyat.TextElement();
            text2.Text = "مياس فرج";
            Maniyat.ImageElement image2 = new Maniyat.ImageElement("e:\\i2.jpg", 200, 200);
            presentation.Slides.Add(new Maniyat.Slide(text2, image2, true));

            Maniyat.TextElement text3 = new Maniyat.TextElement();
            text3.Text = "Computer Programming";
            Maniyat.ImageElement image3 = new Maniyat.ImageElement("e:\\i3.jpg", 200, 200);
            presentation.Slides.Add(new Maniyat.Slide(text3, image3, false));

            Maniyat.TextElement text4 = new Maniyat.TextElement("برمجة الحواسيب", 20, new LinearGradientBrush(Colors.Red, Colors.Yellow, 0));
            Maniyat.ImageElement image4 = new Maniyat.ImageElement("e:\\i4.jpg", 200, 200);
            presentation.Slides.Add(new Maniyat.Slide(text4, image4, true));
             */

            presentation = new Maniyat.Presentation.Presentation();

            presentation.SlideFinishedEventHandler += new EventHandler(presentation_SlideFinishedEventHandler);
            presentation.PresentationFinishedEventHandler += new EventHandler(presentation_PresentationFinishedEventHandler);

            String dir = "e:\\";

            Maniyat.Presentation.TextElement settingText = new Mani.TextElement("", 30, new RadialGradientBrush(Colors.White, Colors.Silver));
            settingText.ShowTransitionEffect = Maniyat.Presentation.TransitionEffect.ResizingWidth;
            settingText.VisibleConstantEffeft = Maniyat.Presentation.ConstantEffect.Fading;
            settingText.HideTransitionEffect = Maniyat.Presentation.TransitionEffect.ResizingWidth;
            settingText.VisibleFadingAmount = .1;
            settingText.VisibleEffectFrequency = 10;

            Mani.ImageElement settingImage = new Mani.ImageElement();
            settingImage.ShowTransitionEffect = Mani.TransitionEffect.Blurring;
            settingImage.HideTransitionEffect = Mani.TransitionEffect.Blurring;
            settingImage.VisibleResizingAmount = -5;
            settingImage.VisibleEffectFrequency = 10;

            presentation.SettingSlide = new Mani.Slide(settingText, settingImage, true);

            Mani.ImageElement image1 = new Mani.ImageElement(new Uri(dir + "images\\bannar.jpg"));
            Mani.Slide slide1 = new Mani.Slide(null, image1, false);

            Mani.TextElement text2 = new Mani.TextElement();
            text2.Text = "شركة الكفري" + Environment.NewLine + "للتسويق العقاري عبر الأنترنت";
            Mani.Slide slide2 = new Mani.Slide(text2, null, false);

            Mani.TextElement text3 = new Mani.TextElement();
            text3.Text = "منذ أفتتاح فرعنا في سورية الحبيبة, عملت شركتنا على نيل ثقة العملاء";
            Mani.ImageElement image3 = new Mani.ImageElement(new Uri(dir + "images\\w.png"), 250, 250);
            Mani.Slide slide3 = new Mani.Slide(text3, image3, true);

            Mani.TextElement text4 = new Mani.TextElement();
            text4.Text = "نتيجة لسمعتنا الحسنة والثقة في التعامل" + Environment.NewLine + "تم أفتتاح 11 فرعاً توزعوا في معظم المحافظات السورية";
            Mani.ImageElement image4 = new Mani.ImageElement(new Uri(dir + "images\\ec.jpg"));
            Mani.Slide slide4 = new Mani.Slide(text4, image4, true);

            Mani.TextElement text5 = new Mani.TextElement();
            text5.Text = "لنتطور لنرتقي ببلدنا";
            Mani.ImageElement image5 = new Mani.ImageElement(new Uri(dir + "images\\4.jpg"));
            Mani.Slide slide5 = new Mani.Slide(text5, image5, true);

            Mani.TextElement text6 = new Mani.TextElement();
            text6.Text = "ليست فقط الشهادات التي نلناها من كثير من الجهات المتعلقة بالعقارات داخل سورية وخارجها فقط الدليل على أبداعنا في توفير ما يحتاجه الشعب السوري";
            Mani.ImageElement image6 = new Mani.ImageElement(new Uri(dir + "images\\p1.jpg"), 0, 0);
            Mani.Slide slide6 = new Mani.Slide(text6, image6, true);

            Mani.TextElement text7 = new Mani.TextElement();
            text7.Text = "بل أننا نهتم بالنتائج, لنبني وطننا, ونسمو لغدنا, من الأفضل ونحو الأفضل";
            Mani.ImageElement image7 = new Mani.ImageElement(new Uri(dir + "images\\1.tif"), 300, 300);
            Mani.Slide slide7 = new Mani.Slide(text7, image7, true);

            Mani.TextElement text8 = new Mani.TextElement();
            text8.Text = "تم أنشاء مدن سياحية كاملة في مناطق سياحية وسكنية";
            Mani.ImageElement image8 = new Mani.ImageElement(new Uri(dir + "images\\gzl.jpg"), 300, 300);
            Mani.Slide slide8 = new Mani.Slide(text8, image8, true);

            Mani.TextElement text9 = new Mani.TextElement();
            text9.Text = "بأسعار مناسبة للجميع وبالتقسيط لفترة تصل لعشرة سنوات";
            Mani.ImageElement image9 = new Mani.ImageElement(new Uri(dir + "images\\6.jpg"), 300, 300);
            Mani.Slide slide9 = new Mani.Slide(text9, image9, true);

            Mani.TextElement text10 = new Mani.TextElement();
            text10.Text = "وما زلنا نطور خدماتنا بأستخدام كل التقنيات المتاحة";
            Mani.ImageElement image10 = new Mani.ImageElement(new Uri(dir + "images\\coordinate.jpg"), 300, 300);
            Mani.Slide slide10 = new Mani.Slide(text10, image10, true);

            Mani.TextElement text11 = new Mani.TextElement();
            text11.Text = "وقريباً لن يكون هنالك شخص في سورية أو حتى خارجها إلا وسمع أو رأى أو لمس أنجازاتنا العقارية";
            Mani.ImageElement image11 = new Mani.ImageElement(new Uri(dir + "images\\5.jpg"), 300, 300);
            Mani.Slide slide11 = new Mani.Slide(text11, image11, true);

            Mani.TextElement text12 = new Mani.TextElement();
            text12.Text = "الدكتور المهندس حسين الكفري";
            Mani.ImageElement image12 = new Mani.ImageElement(new Uri(dir + "images\\hussen.gif"), 200, 200);

            Mani.Slide slide12 = new Mani.Slide(text12, image12, true);

            Mani.TextElement text13 = new Mani.TextElement();
            text13.Text = "رئيس مجلس أدارة شركة الكفري";
            Mani.ImageElement image13 = new Mani.ImageElement(new Uri(dir + "images\\hussen.gif"), 200, 200);

            Mani.Slide slide13 = new Mani.Slide(text13, image13, true);

            presentation.Slides.Add(slide1);
            presentation.Slides.Add(slide2);
            presentation.Slides.Add(slide3);
            presentation.Slides.Add(slide4);
            presentation.Slides.Add(slide5);
            presentation.Slides.Add(slide6);
            presentation.Slides.Add(slide7);
            presentation.Slides.Add(slide8);
            presentation.Slides.Add(slide9);
            presentation.Slides.Add(slide10);
            presentation.Slides.Add(slide11);
            presentation.Slides.Add(slide12);
            presentation.Slides.Add(slide13);

            presentation.IsLoop = true;

            Mani.DurationDivides.DividingByTextLength(presentation.Slides, TimeSpan.FromSeconds(25), .15, 0.25, 0.25, 0.2, true);

            content.Content = presentation;
        }

        void presentation_PresentationFinishedEventHandler(object sender, EventArgs e)
        {
            timer.IsEnabled = false;
        }

        void presentation_SlideFinishedEventHandler(object sender, EventArgs e)
        {
            this.Title += "(*)";
        }

        void timer_Tick(object sender, EventArgs e)
        {
            txTimer.Text = DateTime.Now.ToString("HH:mm:ss");
        }

        private void txTimer_MouseUp(object sender, MouseButtonEventArgs e)
        {
            timer.IsEnabled = true;
            presentation.Start();
        }

        private void btnStart_Click(object sender, RoutedEventArgs e)
        {
            presentation.Start();
        }

        private void btnPause_Click(object sender, RoutedEventArgs e)
        {
            presentation.Pause();
        }

        private void btnStop_Click(object sender, RoutedEventArgs e)
        {
            presentation.Stop();
        }
    }
}
