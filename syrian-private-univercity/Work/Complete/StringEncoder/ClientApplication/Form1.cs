using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ClientApplication
{
    public partial class frmTest : Form
    {
        public frmTest()
        {
            InitializeComponent();

            tx1.Text = @"abcdefghijklmnopqrstuvwxyz
ابتثجحخدذرزسشصضطظعغفقكلمنهوي
1234567890 !@#$%^&*()   :;""'<>{}[].,-+*/_=|\/?~`
!@#$%^&*()  ذّ,.؟/÷×؛،ًٌَُلإٍِ[]~ْؤلآآ";

            tx2.Text = "abc\0def";
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder(UInt16.MaxValue);

            for (int i = 1; i < UInt16.MaxValue; i++)
            {
                str.Append(Convert.ToChar(i));

                if ((Double)i * 100 / UInt16.MaxValue % 1 == 0)
                    pBar.Value = i * 100 / UInt16.MaxValue;
            }

            tx4.Text = str.ToString();
            /*
            StringEncoder.Coding cod = new StringEncoder.Coding();
            cod.BitsNumber = 16;

            tx3.Text = cod.RotateLeft(tx1.Text, Convert.ToInt32(tx2.Text));
            tx4.Text = cod.RotateRight(tx3.Text, Convert.ToInt32(tx2.Text));

            if (tx4.Text != tx1.Text)
                btnRun.BackColor = Color.Red;
            else
                btnRun.BackColor = SystemColors.Control;

            

            
            StringEncoder.Coding cod = new StringEncoder.Coding();
            cod.BitsNumber = 16;
            Int32 ErrorNum = 0;
            StringBuilder str = new StringBuilder();
            pBar.Value = 0;
            Int32 testNum = System.UInt16.MaxValue;

            for (Int32 i = 0; i < testNum; i++)
            {
                tx2.Text = cod.ShiftRange(tx1.Text, i);

                if (tx1.Text != cod.ShiftRange(tx2.Text, -i))
                { 
                    str.AppendLine(i.ToString());
                    ErrorNum++;
                }

                if ((Double)i * 100 / testNum % 1 == 0)
                    pBar.Value = i * 100 / testNum;
            }

            pBar.Value = 100;
            tx4.Text = str.ToString();
            btnRun.Text = ErrorNum.ToString() + " Errors !";

            
            StringEncoder.Coding cod = new StringEncoder.Coding();
            cod.BitsNumber = 16;
            Boolean[] keys = new Boolean[cod.BitsNumber];
            Int32 testNum = 10000;
            Int32 ErrorNum = 0;
            StringBuilder str = new StringBuilder(testNum * cod.BitsNumber);
            pBar.Value =    0;

            for (Int32 i = 0; i < cod.BitsNumber; i++)
                keys[i] = false;

            for (Int32 i = 0; i < testNum; i++)
            {
                nextBit(keys);
                tx2.Text = cod.ParitalFlip(tx1.Text, keys);
                

                if (tx1.Text != cod.ParitalFlip(tx2.Text, keys))
                {
                    str.AppendLine("**************************");
                    str.AppendLine(stringArray(keys));
                    str.AppendLine(cod.ParitalFlip(tx2.Text, keys));
                    ErrorNum++;
                }

                if (((Double)i * 100 / testNum) % 1 == 0)
                    pBar.Value = (i * 100 / testNum);
            }

            pBar.Value = 100;
            tx4.Text = str.ToString();
            btnRun.Text = ErrorNum.ToString() + " Errors !";
            */
        }

        private void nextBit(Boolean[] array)
        {
            Int32 i = 0;

            while (i < array.Length)
            {
                if (!array[i])
                {
                    array[i] = true;
                    break;
                }
                else
                {
                    array[i++] = false;
                }
            }
        }

        private String stringArray(Boolean[] array)
        {
            StringBuilder str = new StringBuilder(array.Length);

            for (Int32 i = array.Length - 1; i >= 0; i--)
                if (array[i])
                    str.Append('1');
                else
                    str.Append('0');

            return str.ToString();
        }
    }
}














