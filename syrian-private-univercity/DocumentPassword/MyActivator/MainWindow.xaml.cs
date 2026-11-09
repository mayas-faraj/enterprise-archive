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

namespace MyActivator
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnRun_Click(object sender, RoutedEventArgs e)
        {
            Coding coding = new Coding();
            String result = coding.ParitalFlip(coding.ShiftRange(txRequest.Text, 450), new Boolean[] { true, true, false, false, true, false, true, true }).GetHashCode().ToString();
            result = result.Replace('-', 's');
            result = result.Replace('0', 'z');
            result = result.Replace('9', 'n');
            result += "0x1";

            txCode.Text = result;
        }

        public class Coding
        {
            private System.Byte bitsNumber;

            public System.Int32 pow(System.Int32 n, System.Int32 x)
            {
                System.Int32 result = 1;

                for (System.Int32 i = 0; i < x; i++)
                    result = result * n;

                return result;
            }

            private System.Char generate(ref System.Boolean[] key)
            {
                System.Byte r = (System.Convert.ToByte(key.Length) >= bitsNumber) ? bitsNumber : System.Convert.ToByte(key.Length);
                System.Int32 charCode = 0;

                for (System.Int32 i = 0; i < r; i++)
                    if (key[i])
                        charCode += pow(2, i);

                return (System.Char)charCode;
            }

            public Coding()
            {
                bitsNumber = 16;
            }

            public System.Byte BitsNumber
            {
                get
                {
                    return bitsNumber;
                }
                set
                {
                    bitsNumber = value;
                }
            }

            public System.String ParitalFlip(System.String str, System.Boolean[] key)
            {
                //precondition : none
                System.Text.StringBuilder chrArray = new System.Text.StringBuilder(str);
                System.Char generatedChar = generate(ref key);

                for (System.Int32 i = 0; i < chrArray.Length; i++)
                    chrArray[i] = System.Convert.ToChar(chrArray[i] ^ generatedChar);
                return chrArray.ToString();
            }

            public System.String ShiftRange(System.String str, System.Int32 location)
            {
                //precondition : none
                System.Text.StringBuilder charArray = new System.Text.StringBuilder(str);

                for (System.Int32 i = 0; i < charArray.Length; i++)
                {
                    //loop invariant : for all chars , shift them by location value
                    //critical operation
                    System.Int32 num = (charArray[i] + location) % pow(2, bitsNumber);

                    if (num >= 0)
                        charArray[i] = System.Convert.ToChar(num);
                    else
                        charArray[i] = System.Convert.ToChar(pow(2, bitsNumber) + num);
                }

                //post condition : chars on charArray rotated by location step
                return charArray.ToString();
            }
        }
    }
}
