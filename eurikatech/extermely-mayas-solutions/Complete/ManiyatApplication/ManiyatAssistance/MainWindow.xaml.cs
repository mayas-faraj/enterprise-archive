using System;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Runtime.InteropServices;

namespace ManiyatAssistance
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //public constructors region
        public MainWindow()
        {
            InitializeComponent();
            htmlPath = System.IO.Directory.GetCurrentDirectory() + "\\html\\result.htm";
            littersEnglish = "qwertyuiop[]`asdfghjkl;'zxcvbnm,./YHNBJ";
            littersArabic = "ضصثقفغعهخحجدذشسيبلاتنمكطئءؤرلىةوزظإأآلـ";

            index = 0;
        }

        //private events region
        private void btnOpen_Click(object sender, RoutedEventArgs e)
        {
            //open file dialog
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.Filter = "MP4 Format|*.mp4|Text File|*.txt|All Files|*.*";
            ofd.Multiselect = true;
            
            if (ofd.ShowDialog() == true)
            {
                readFile(ofd.FileNames);
                btnNext.IsEnabled = btnPrev.IsEnabled = false;

                fileNames = null;
            }
        }

        private void btnDir_Click(object sender, RoutedEventArgs e)
        {
            //open folder dialog
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.Filter = "MP4 Format|*.mp4|Text File|*.txt|All Files|*.*";
            ofd.Multiselect = true;
            
            if (ofd.ShowDialog() == true)
            {
                fileNames = ofd.FileNames;

                if (fileNames.Length > 0)
                {
                    index = 0;
                    btnNext.IsEnabled = btnPrev.IsEnabled = true;
                    readFile(fileNames[0]);
                }
            }
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            if (fileNames.Length > 1)
            {
                index++;

                if (index >= fileNames.Length)
                    index = 0;

                if (System.IO.File.Exists(fileNames[index]))
                    readFile(fileNames[index]);
                else
                    btnNext_Click(btnNext, new RoutedEventArgs());
            }
        }

        private void btnPrev_Click(object sender, RoutedEventArgs e)
        {
            if (fileNames.Length > 1)
            {
                index--;

                if (index < 0)
                    index = fileNames.Length - 1;

                if (System.IO.File.Exists(fileNames[index]))
                    readFile(fileNames[index]);
                else
                    btnNext_Click(btnNext, new RoutedEventArgs());
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Delete " + fileNames[index], "Confirm", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.Yes) == MessageBoxResult.Yes)
                    System.IO.File.Delete(fileNames[index]);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.Source, MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnRename_Click(object sender, RoutedEventArgs e)
        {
            if (txName.Text != "")
                System.IO.File.Copy(fileNames[index], System.IO.Path.Combine(System.IO.Path.GetDirectoryName(fileNames[index]), txRename.Text));
        } 

        //private functions region
        [DllImport("wininet.dll")]
        private extern static bool InternetGetConnectedState(out int Description, int ReservedValue); 

        private String toArabic(String englishText)
        {
            System.Text.StringBuilder englishTextString = new StringBuilder(englishText);

            for (Int32 i = 0; i < englishTextString.Length; i++)
                if (englishTextString[i] == '{')
                {
                    if (englishTextString.Length >= i)
                        if (englishTextString[i + 1] == '*')
                            i += 5;
                        else
                            if (englishTextString.ToString(i + 1, STARTING.Length) == STARTING)
                                i = englishTextString.ToString().IndexOf('}') + 1;
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

        private static bool isConnectedToInternet()
        {
            int Desc;
            return InternetGetConnectedState(out Desc, 0);
        }

        private void readFile(String[] filePath)
        {
            //precondition: none
            if (filePath != null && filePath.Length > 0)
            {
                txName.Text = System.IO.Path.GetFileNameWithoutExtension(filePath[0]);

                if (filePath.Length > 2)
                {
                    txName.Text += '-' + System.IO.Path.GetFileNameWithoutExtension(filePath[filePath.Length - 1]);
                    btnDelete.IsEnabled = btnRename.IsEnabled = false;
                }
                else
                    btnDelete.IsEnabled = btnRename.IsEnabled = true;

                System.Text.StringBuilder textFile = new StringBuilder("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><head><title>Maniyat Assistance</title>");
                String file = "";

                foreach (String fPath in filePath)
                {
                    System.IO.StreamReader sr = new System.IO.StreamReader(fPath);
                    file += System.IO.Path.GetFileNameWithoutExtension(fPath) + "<br/>";
                    file += sr.ReadToEnd() + "<br/>";
                    sr.Close();
                }

                if (rbHack.IsChecked == true)
                {
                    file = file.Replace('Ô', 'a');
                    file = file.Replace('Ä', 'c');
                    file = file.Replace('í', 'd');
                    file = file.Replace('Ë', 'e');
                    file = file.Replace('È', 'f');
                    file = file.Replace('á', 'g');
                    file = file.Replace('Ç', 'h');
                    file = file.Replace('å', 'i');
                    file = file.Replace('Ê', 'j');
                    file = file.Replace('ä', 'k');
                    file = file.Replace('ã', 'l');
                    file = file.Replace('É', 'm');
                    file = file.Replace('ì', 'n');
                    file = file.Replace('Î', 'o');
                    file = file.Replace('Í', 'p');
                    file = file.Replace('Ö', 'q');
                    file = file.Replace('Þ', 'r');
                    file = file.Replace('Ó', 's');
                    file = file.Replace('Ý', 't');
                    file = file.Replace('Ú', 'u');
                    file = file.Replace('Ñ', 'v');
                    file = file.Replace('Õ', 'w');
                    file = file.Replace('Á', 'x');
                    file = file.Replace('Û', 'y');
                    file = file.Replace('Æ', 'z');
                    file = file.Replace('Ã', 'H');
                    file = file.Replace('Ü', 'J');
                    file = file.Replace('Å', 'Y');

                    file = file.Replace('Ò', '.');
                    file = file.Replace('Ø', '\'');
                    file = file.Replace('Ð', '`');
                    file = file.Replace('Ì', '[');
                    file = file.Replace('ß', ';');
                    file = file.Replace('Ï', ']');
                    file = file.Replace('æ', ',');
                    file = file.Replace('Ù', '/');
                }

                if (rbArabic.IsChecked == true)
                {
                    textFile.Append("<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" /></head><body dir=\"rtl\"");
                    file = toArabic(file);
                }
                else
                    textFile.Append("</head><body>");

                textFile.Append(file);

                //convert to html
                if (rbRemoveShifts.IsChecked == true)
                {
                    textFile.Replace(SHIFT_DOWN, "");
                    textFile.Replace(SHIFT_UP, "");
                }

                if (rbRemoveAltCtrl.IsChecked == true)
                {
                    textFile.Replace(ALT_DOWN, "");
                    textFile.Replace(ALT_UP, "");
                    textFile.Replace(CTRL_DOWN, "");
                    textFile.Replace(CTRL_UP, "");
                }

                if (rbRemoveArrows.IsChecked == true)
                {
                    textFile.Replace(ARROWDOWN_DOWN, "");
                    textFile.Replace(ARROWUP_DOWN, "");
                    textFile.Replace(ARROWLEFT_DOWN, "");
                    textFile.Replace(ARROWRIGHT_DOWN, "");
                }

                if (rbRemoveMouses.IsChecked == true)
                {
                    textFile.Replace(LMOUSE_CLICK, "");
                    textFile.Replace(RMOUSE_CLICK, "");
                    textFile.Replace(MMOUSE_CLICK, "");
                }

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
        }

        private void readFile(String filePath)
        {
            readFile(new String[] { filePath });
        }

        //private fields region
        private String[] fileNames;
        private String htmlPath;
        private String littersEnglish;
        private String littersArabic;
        private Int32 index;

        //private constants region
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
