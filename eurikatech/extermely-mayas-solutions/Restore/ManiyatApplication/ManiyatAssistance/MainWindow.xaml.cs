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

namespace ManiyatAssistance
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            htmlPath = System.IO.Directory.GetCurrentDirectory() + "\\html\\result.htm";
            littersEnglish = "qwertyuiop[]asdfghjkl;'zxcvbnm,./YHNB";
            littersArabic = "ضصثقفغعهخحجدشسيبلاتنمكطئءؤرلىةوزظإأآل";
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnOpen_Click(object sender, RoutedEventArgs e)
        {
            //precondition: none

            System.Text.StringBuilder textFile = new StringBuilder("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title>Maniyat Assistance</title>");


            //open file dialog
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.Filter = "MP3 Format Sound|*.mp3|Text File|*.txt|All Files|*.*";
            ofd.Multiselect = false;

            if (ofd.ShowDialog() == true)
            {
                System.IO.StreamReader sr = new System.IO.StreamReader(ofd.FileName);
                String file = sr.ReadToEnd();
                sr.Close();

                if (rbArabic.IsChecked == true)
                {
                    textFile.Append("<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" /></head><body dir=\"rtl\"");
                    file = ToArabic(file);
                }
                else
                    textFile.Append("</head><body>");

                textFile.Append(file);
            }
            else
                return;

            //convert to html
            textFile = textFile.Replace(ENTER_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"Enter.gif\"/>");
            textFile = textFile.Replace(ESC_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"esc.gif\"/>");
            textFile = textFile.Replace(SHIFT_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"shiftDown.gif\"/>");
            textFile = textFile.Replace(SHIFT_UP, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"shiftUp.gif\"/>");
            textFile = textFile.Replace(ALT_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"altDown.gif\"/>");
            textFile = textFile.Replace(ALT_UP, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"altUp.gif\"/>");
            textFile = textFile.Replace(CTRL_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"ctrlDown.gif\"/>");
            textFile = textFile.Replace(CTRL_UP, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"ctrlUp.gif\"/>");
            textFile = textFile.Replace(DELETE_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"del.gif\"/>");
            textFile = textFile.Replace(START_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"start.gif\"/>");
            textFile = textFile.Replace(BACKSPACE_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"Backspace.gif\"/>");
            textFile = textFile.Replace(HOME_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"home.gif\"/>");
            textFile = textFile.Replace(END_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"end.gif\"/>");
            textFile = textFile.Replace(CAPS_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"capslock.gif\"/>");
            textFile = textFile.Replace(TAB_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"tab.gif\"/>");
            textFile = textFile.Replace(LMOUSE_CLICK, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"leftMouse.gif\"/>");
            textFile = textFile.Replace(RMOUSE_CLICK, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"rightMouse.gif\"/>");
            textFile = textFile.Replace(MMOUSE_CLICK, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"middleMouse.gif\"/>");
            textFile = textFile.Replace(X1MOUSE_CLICK, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"x1Mouse.gif\"/>");
            textFile = textFile.Replace(X2MOUSE_CLICK, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"x2Mouse.gif\"/>");
            textFile = textFile.Replace(ARROWLEFT_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"arrowLeft.gif\"/>");
            textFile = textFile.Replace(ARROWRIGHT_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"arrowRight.gif\"/>");
            textFile = textFile.Replace(ARROWUP_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"arrowUp.gif\"/>");
            textFile = textFile.Replace(ARROWDOWN_DOWN, "<img width=" + imageWidth + " height=" + imageHeight + " src=\"arrowDown.gif\"/>");

            textFile.Append("</body></html>");

            //save html
            System.IO.StreamWriter sw = new System.IO.StreamWriter(htmlPath, false);
            sw.Write(textFile.ToString());
            sw.Close();

            //read html
            frameMain.Source = new Uri(htmlPath);
            
            //postcondition: texts files exhite as html file
        }

        private String ToArabic(String englishText)
        {
            System.Text.StringBuilder englishTextString = new StringBuilder(englishText);

            for (Int32 i = 0; i < englishTextString.Length; i++)
                if (englishTextString[i] == '{')
                {
                    if (englishTextString.Length >= i)
                        if (englishTextString[i + 1] == '*')
                            i += 5;
                        else
                            if (englishTextString[i + 1] == '\'' || englishTextString[i + 1] == '\"')
                                i += 3;
                            else
                                englishTextString[i] = 'ج';

                }
                else
                    if (littersEnglish.IndexOf(englishTextString[i]) >= 0)
                        englishTextString[i] = littersArabic[littersEnglish.IndexOf(englishTextString[i])];

            return englishTextString.ToString();
        }

        private String htmlPath;
        private String littersEnglish;
        private String littersArabic;

        private const String ENTER_DOWN = "{*EN*}";

        private const String ESC_DOWN = "{*ES*}";

        private const String SHIFT_DOWN = "{*SD*}";
        private const String SHIFT_UP = "{*SU*}";

        private const String ALT_DOWN = "{*LD*}";
        private const String ALT_UP = "{*LU*}";

        private const String CTRL_DOWN = "{*CD*}";
        private const String CTRL_UP = "{*CU*}";

        private const String DELETE_DOWN = "{*DD*}";

        private const String START_DOWN = "{*RD*}";

        private const String BACKSPACE_DOWN = "{*BD*}";

        private const String HOME_DOWN = "{*HD*}";

        private const String END_DOWN = "{*ED*}";

        private const String CAPS_DOWN = "{*PD*}";

        private const String TAB_DOWN = "{*TD*}";

        private const String LMOUSE_CLICK = "{\'}";
        private const String RMOUSE_CLICK = "{\"}";
        private const String MMOUSE_CLICK = "{*MM*}";
        private const String X1MOUSE_CLICK = "{*M1*}";
        private const String X2MOUSE_CLICK = "{*M2*}";

        private const String ARROWLEFT_DOWN = "{*AL*}";
        private const String ARROWRIGHT_DOWN = "{*AR*}";
        private const String ARROWUP_DOWN = "{*AU*}";
        private const String ARROWDOWN_DOWN = "{*AD*}";

        private const String STARTING = "str";
        private const String STOPPING = "stp";
        private const String ERROR = "err";
        private const String TIME_FORMAT = "hh:mm:ss-dd/MM/yyyy";

        private const String ERROR_APPLICATION_START = "0";
        private const String ERROR_APPLICATION_STOP = "1";
        private const String ERROR_HOOK_START = "2";
        private const String ERROR_HOOK_STOP = "3";
        private const String ERROR_WINDOWS_STARTUP = "4";
        private const String ERROR_WRITELOG = "5";
        private const String ERROR_CONFIGURE_LOADING = "6";
        private const String ERROR_FILE_SWITCHING = "7";
        private const String ERROR_FILE_UPLOADING = "8";

        private const Int32 imageWidth = 32;
        private const Int32 imageHeight = 32;
    }
}
