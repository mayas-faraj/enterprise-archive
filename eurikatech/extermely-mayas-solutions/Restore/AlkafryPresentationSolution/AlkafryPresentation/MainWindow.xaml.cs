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

namespace AlkafryPresentation
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Maniyat.Presentation presentation = new Maniyat.Presentation();
            String dir = "e:\\";

            Maniyat.TextElement settingText = new Maniyat.TextElement("", 50, new RadialGradientBrush(Colors.White, Colors.Silver), new FontFamily("Times New Roman"), 450);
            settingText.ShowTransitionEffect = Maniyat.TransitionEffect.ResizingWidth;
            settingText.VisibleConstantEffeft = Maniyat.ConstantEffect.Fading;
            settingText.HideTransitionEffect = Maniyat.TransitionEffect.ResizingWidth;
            settingText.VisibleFadingAmount = .4;
            settingText.VisibleEffectFrequency = 8;

            Maniyat.ImageElement settingImage = new Maniyat.ImageElement();
            settingImage.ShowTransitionEffect = Maniyat.TransitionEffect.Blurring;
            settingImage.HideTransitionEffect = Maniyat.TransitionEffect.Blurring;
            settingImage.VisibleRotatingAmount = 3;
            settingImage.VisibleConstantEffeft = Maniyat.ConstantEffect.Rotating;
            settingImage.VisibleEffectFrequency = 4;

            presentation.SettingSlide = new Maniyat.Slide(settingText, settingImage, true);

            Maniyat.ImageElement image1 = new Maniyat.ImageElement(dir + "images\\bannar.jpg", 750, 350);
            image1.VisibleConstantEffeft = Maniyat.ConstantEffect.Resizing;
            image1.VisibleResizingAmount = .01;
            Maniyat.Slide slide1 = new Maniyat.Slide(null, image1, false);

            Maniyat.TextElement text2 = new Maniyat.TextElement();
            text2.Text = "شركة الكفري" + Environment.NewLine + "للتسويق العقاري عبر الأنترنت";
            Maniyat.Slide slide2 = new Maniyat.Slide(text2, null, false);

            Maniyat.TextElement text3 = new Maniyat.TextElement();
            text3.Text = "منذ أفتتاح فرعنا في سورية الحبيبة, عملت شركتنا على نيل ثقة العملاء";
            text3.ShowTransitionEffect = Maniyat.TransitionEffect.Fading;
            Maniyat.ImageElement image3 = new Maniyat.ImageElement(dir + "images\\w.png", 200, 200);
            Maniyat.Slide slide3 = new Maniyat.Slide(text3, image3, true);
            

            Maniyat.TextElement text4 = new Maniyat.TextElement();
            text4.Text = "نتيجة لسمعتنا الحسنة والثقة في التعامل" + Environment.NewLine + "تم أفتتاح 11 فرعاً توزعوا في معظم المحافظات السورية";
            text4.ShowTransitionEffect = Maniyat.TransitionEffect.Resizing;
            Maniyat.ImageElement image4 = new Maniyat.ImageElement(dir + "images\\ec.jpg", 250, 250);
            Maniyat.Slide slide4 = new Maniyat.Slide(text4, image4, true);

            Maniyat.TextElement text5 = new Maniyat.TextElement();
            text5.Text = "لنتطور من التعهدات, للبناء , لأنشاء المشاريع والمدن السياحة, لنرتقي ببلدنا";
            Maniyat.ImageElement image5 = new Maniyat.ImageElement(dir + "images\\4.jpg", 420, 420);
            Maniyat.Slide slide5 = new Maniyat.Slide(text5, image5, true);

            Maniyat.TextElement text6 = new Maniyat.TextElement();
            text6.Text = "ليست فقط الشهادات التي نلناها من كثير من الجامعات والنقابات داخل سورية وخارجها فقط الدليل على أبداعنا في توفير ما يحتاجه الشعب السوري";
            text6.ShowTransitionEffect = Maniyat.TransitionEffect.ResizingHeight;
            Maniyat.ImageElement image6 = new Maniyat.ImageElement(dir + "images\\certificate.gif", 420, 420);
            Maniyat.Slide slide6 = new Maniyat.Slide(text6, image6, true);

            Maniyat.TextElement text7 = new Maniyat.TextElement();
            text7.Text = "بل أننا نهتم بالنتائج, لنبني وطننا, ونسمو لغدنا, من الأفضل ونحو الأفضل";
            Maniyat.ImageElement image7 = new Maniyat.ImageElement(dir + "images\\1.tif", 420, 420);
            Maniyat.Slide slide7 = new Maniyat.Slide(text7, image7, true);

            Maniyat.TextElement text8 = new Maniyat.TextElement();
            text8.Text = "تم أنشاء مدن سياحية كاملة في مناطق سياحية وسكنية";
            Maniyat.ImageElement image8 = new Maniyat.ImageElement(dir + "images\\gzl.jpg", 420, 420);
            Maniyat.Slide slide8 = new Maniyat.Slide(text8, image8, true);

            Maniyat.TextElement text9 = new Maniyat.TextElement();
            text9.Text = "بأسعار مناسبة للجميع وبالتقسيط لفترة تصل لعشرة سنوات لتتناسب مع ذوي الدخل المحدود";
            text9.ShowTransitionEffect = Maniyat.TransitionEffect.Fading;
            Maniyat.ImageElement image9 = new Maniyat.ImageElement(dir + "images\\6.jpg", 420, 420);
            Maniyat.Slide slide9 = new Maniyat.Slide(text9, image9, true);

            Maniyat.TextElement text10 = new Maniyat.TextElement();
            text10.Text = "وما زلنا نطور خدماتنا بأستخدام أحدث النظريات العلمية والوسائل الهندسية المتاحة";
            text10.ShowTransitionEffect = Maniyat.TransitionEffect.ResizingHeight;
            Maniyat.ImageElement image10 = new Maniyat.ImageElement(dir + "images\\coordinate.jpg", 420, 420);
            Maniyat.Slide slide10 = new Maniyat.Slide(text10, image10, false);

            Maniyat.TextElement text11 = new Maniyat.TextElement();
            text11.Text = "وقريباً لن يكون هنالك شخص في سورية أو حتى خارجها إلا وسمع أو رأى أو لمس أنجازاتنا العقارية";
            text11.ShowTransitionEffect = Maniyat.TransitionEffect.Resizing;
            Maniyat.ImageElement image11 = new Maniyat.ImageElement(dir + "images\\5.jpg", 420, 420);
            Maniyat.Slide slide11 = new Maniyat.Slide(text11, image11, true);

            Maniyat.TextElement text12 = new Maniyat.TextElement();
            text12.Text = "الدكتور المهندس حسين الكفري";
            Maniyat.ImageElement image12 = new Maniyat.ImageElement(dir + "images\\hussen.gif", 350, 350);
            Maniyat.Slide slide12 = new Maniyat.Slide(text12, image12, false);

            Maniyat.TextElement text13 = new Maniyat.TextElement();
            text13.Text = "رئيس مجلس أدارة شركة الكفري";
            Maniyat.ImageElement image13 = new Maniyat.ImageElement(dir + "images\\hussen.gif", 350, 350);
            Maniyat.Slide slide13 = new Maniyat.Slide(text13, image13, false);

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

            Maniyat.DurationDivides.DividingByTextLength(presentation.Slides, TimeSpan.FromMinutes(3),TimeSpan.FromSeconds(10), .15, .15, .20, true);

            image12.ShowEffectDuration = new TimeSpan();
            image12.ShowTransitionEffect = Maniyat.TransitionEffect.None;
            image13.ShowEffectDuration = new TimeSpan();
            image13.ShowTransitionEffect = Maniyat.TransitionEffect.None;

            main.Content = presentation;
        }

        private void main_Loaded(object sender, RoutedEventArgs e)
        {
            System.Media.SoundPlayer sp = new System.Media.SoundPlayer("e:\\images\\max.wav");
            sp.Play();

            ((Maniyat.Presentation)main.Content).Start();
        }
    }
}
