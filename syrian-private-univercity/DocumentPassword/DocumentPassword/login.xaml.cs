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
using System.Windows.Shapes;

namespace DocumentPassword
{
    /// <summary>
    /// Interaction logic for login.xaml
    /// </summary>
    public partial class login : Window
    {
        public login()
        {
            InitializeComponent();

            txRequest.Text = getTone();

            System.IO.StreamReader sr = new System.IO.StreamReader("intro2.mp3");

            String code = sr.ReadToEnd();
            sr.Close();

            if (code != "" && code != null)
                check(getTone(), code);
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("للحصول على مفتاح المنتج يرجى الإتصال بالكاتب:" + Environment.NewLine + "رقم الهاتف : 5771912" + Environment.NewLine + "الجوال : 0988839387" + Environment.NewLine + "الفاكس : 5771912" + Environment.NewLine + "في حال وجود أي سؤال أو أستفسار أو دروس خصوصية الإتصال على الأرقام.", "الأستاذ أسامة فرج", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private String getTone()
        {
            try
            {
                PcInformation pcI = new PcInformation(false);
                return (pcI.Bios.SerialNumber + pcI.Processor.Manufacturer + pcI.Processor.Name + pcI.Processor.SerialNumber + pcI.BaseBoard.Capacity + pcI.BaseBoard.SerialNumber + pcI.VedioController.SerialNumber + pcI.VedioController.Name + pcI.VedioController.Manufacturer).GetHashCode().ToString();
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            check(txRequest.Text, txCode.Text);
        }

        private String toning(String text)
        {
            Coding coding = new Coding();
            String result = coding.ParitalFlip(coding.ShiftRange(text, 450), new Boolean[] { true, true, false, false, true, false, true, true }).GetHashCode().ToString();
            result = result.Replace('-', 's');
            result = result.Replace('0', 'z');
            result = result.Replace('9', 'n');
            result += "0x1";
            return result;
        }

        private void check(String request,String code)
        {
            if (code != "")
            {
                
                if (code == toning(request).ToLower())
                {
                    System.IO.StreamWriter sw = new System.IO.StreamWriter("intro2.mp3", false);
                    sw.Write(code);
                    sw.Close();

                    MainWindow main = new MainWindow();
                    main.Show();
                    this.Close();
                }
                else
                    MessageBox.Show("الشيفرة المدخلة من أجل الترخيص غير صحيحة", "ترخيص النسخة", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
                MessageBox.Show("أدخل شيفرة الترخيص في مربع النص المخصص", "ترخيص النسخة", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
