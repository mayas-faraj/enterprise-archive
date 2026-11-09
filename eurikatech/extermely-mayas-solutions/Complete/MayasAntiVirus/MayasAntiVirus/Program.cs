using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace MayasAntiVirus
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmMain());
        }
    }

    public class Shared
    {
        public const String virusPath = @"datafile\primary.vdb";
        public const Int32 EncodeValue = 127;

        public static String Encode(String str)
        {
            Int32 intCh;
            String text = null;

            if (str != null)
            {
                for (int x = 0; x < str.Length; x++)
                {
                    intCh = (Int32)str[x];
                    if (intCh < EncodeValue)
                        intCh += EncodeValue;
                    else
                        intCh -= EncodeValue;

                    text += (Char)intCh;
                }
                return text;
            }
            else
                return null;
        }
    }
}
