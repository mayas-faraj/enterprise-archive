using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace RentalApplication
{
    class SharedData
    {
        private static StringEncoder.Coding coding = new StringEncoder.Coding();
        private static Char Spliter = ';';

        public static String Name;
        public static String Enter;

        public static Font FontCaption;
        public static Font FontInfo;
        public static Font FontOrder;
        public static Font FontLink;

        public static Color ColorCaption;
        public static Color ColorInfo;
        public static Color ColorOrder;
        public static Color ColorLink;
        public static Color BackColorForm;

        public static String FormMDIImage;

        public static String Mes12(String text)
        {
            return coding.ParitalFlip(coding.ShiftRange(text, 250), new Boolean[] { true, false, false, false, true, true, false, false, true, true, true, false, true, true, true, true });
        }

        public static String Mds12(String text)
        {
            return coding.ShiftRange(coding.ParitalFlip(text, new Boolean[] { true, false, false, false, true, true, false, false, true, true, true, false, true, true, true, true }), -250);
        }

        public static void LoadDefaultValues()
        {
            Name = "مياس";
            Enter = "12345";

            FontCaption = new Font("Times New Roman", 30, FontStyle.Bold);
            FontInfo = new Font("Times New Roman", 12);
            FontOrder = new Font("Times New Roman", 12);
            FontLink = new Font("Arial", 12);

            ColorCaption = Color.Black;
            ColorInfo = Color.DarkBlue;
            ColorOrder = Color.DarkBlue;
            ColorLink = Color.DarkBlue;
            BackColorForm = SystemColors.Control;

            FormMDIImage = ""; 
        }

        public static void LoadValues()
        {
            System.IO.StreamReader sr = new System.IO.StreamReader("CodeSnip.mcf");
            Char decSpliter = ';';

            //this stream reader must encoding by string encoder class

            Name = Mds12(sr.ReadLine()); //1
            Enter = Mds12(sr.ReadLine()); //2

            String[] fnt;

            fnt = Mds12(sr.ReadLine()).Split(decSpliter); //3
            FontCaption = new Font(fnt[0], Convert.ToSingle(fnt[1]), ((Convert.ToBoolean(fnt[2])) ? FontStyle.Bold : FontStyle.Regular) | ((Convert.ToBoolean(fnt[3])) ? FontStyle.Italic : FontStyle.Regular));

            fnt = Mds12(sr.ReadLine()).Split(decSpliter); //4
            FontInfo = new Font(fnt[0], Convert.ToSingle(fnt[1]), ((Convert.ToBoolean(fnt[2])) ? FontStyle.Bold : FontStyle.Regular) | ((Convert.ToBoolean(fnt[3])) ? FontStyle.Italic : FontStyle.Regular));

            fnt = Mds12(sr.ReadLine()).Split(decSpliter); //5
            FontOrder = new Font(fnt[0], Convert.ToSingle(fnt[1]), ((Convert.ToBoolean(fnt[2])) ? FontStyle.Bold : FontStyle.Regular) | ((Convert.ToBoolean(fnt[3])) ? FontStyle.Italic : FontStyle.Regular));

            fnt = Mds12(sr.ReadLine()).Split(decSpliter); //6
            FontLink = new Font(fnt[0], Convert.ToSingle(fnt[1]), ((Convert.ToBoolean(fnt[2])) ? FontStyle.Bold : FontStyle.Regular) | ((Convert.ToBoolean(fnt[3])) ? FontStyle.Italic : FontStyle.Regular));

            ColorCaption = Color.FromArgb(Convert.ToInt32(Mds12(sr.ReadLine()))); //7
            ColorInfo = Color.FromArgb(Convert.ToInt32(Mds12(sr.ReadLine()))); //8
            ColorOrder = Color.FromArgb(Convert.ToInt32(Mds12(sr.ReadLine()))); //9
            ColorLink = Color.FromArgb(Convert.ToInt32(Mds12(sr.ReadLine()))); //10
            BackColorForm = Color.FromArgb(Convert.ToInt32(Mds12(sr.ReadLine()))); //11

            FormMDIImage = Mds12(sr.ReadLine()); //12

            sr.Close();
        }

        public static void SaveValues()
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter("CodeSnip.mcf");
            Char encSpliter = ';';

            //this stream writer must decoding by string encoder class

            sw.WriteLine(Mes12(Name)); //1
            sw.WriteLine(Mes12(Enter)); //2

            sw.WriteLine(Mes12(FontCaption.Name) + encSpliter + Mes12(FontCaption.Size.ToString()) + encSpliter + Mes12(FontCaption.Bold.ToString()) + encSpliter + Mes12(FontCaption.Italic.ToString())); //3
            sw.WriteLine(Mes12(FontInfo.Name) + encSpliter + Mes12(FontInfo.Size.ToString()) + encSpliter + Mes12(FontInfo.Bold.ToString()) + encSpliter + Mes12(FontInfo.Italic.ToString())); //4
            sw.WriteLine(Mes12(FontOrder.Name) + encSpliter + Mes12(FontOrder.Size.ToString()) + encSpliter + Mes12(FontOrder.Bold.ToString()) + encSpliter + Mes12(FontOrder.Italic.ToString())); //5
            sw.WriteLine(Mes12(FontLink.Name) + encSpliter + Mes12(FontLink.Size.ToString()) + encSpliter + Mes12(FontLink.Bold.ToString()) + encSpliter + Mes12(FontLink.Italic.ToString())); //6

            sw.WriteLine(Mes12(ColorCaption.ToArgb().ToString())); //7
            sw.WriteLine(Mes12(ColorInfo.ToArgb().ToString())); //8
            sw.WriteLine(Mes12(ColorOrder.ToArgb().ToString())); //9
            sw.WriteLine(Mes12(ColorLink.ToArgb().ToString())); //10
            sw.WriteLine(Mes12(BackColorForm.ToArgb().ToString())); //11

            sw.WriteLine(Mes12(FormMDIImage)); //12

            sw.Close();
        }
    }
}
