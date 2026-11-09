using System;
using System.Collections.Generic;
using System.Text;

namespace HeartClinic
{
    class Module
    {
        public static String CheckString(String input, Int32 length)
        {
            if (input.Trim().Length <= length)
                return input.Trim();
            else
                return input.Trim().Substring(0, length);
        }
    }
}