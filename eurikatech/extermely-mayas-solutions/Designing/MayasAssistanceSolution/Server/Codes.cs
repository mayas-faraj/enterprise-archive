using System;
using System.Collections.Generic;
using System.Web;

namespace Server
{
    internal static class Log
    {
        public static void ErrorWrite(String file, String id, Exception ex)
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter(file, true);

            String data = "";
            String line;

            if (ex != null && ex.Data != null)
                foreach (String s in ex.Data)
                    data += "[" + s + "]";

            line = id + Consts.CSV_SPERATE + DateTime.Now.ToString() + Consts.CSV_SPERATE + ex.Source + Consts.CSV_SPERATE + ex.Message + Consts.CSV_SPERATE + data;
            sw.WriteLine(line);
            sw.Close();
        }

        public static void LogWrite(String file, String log)
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter(file, true);

            String line;

            line = DateTime.Now.ToString() + Consts.CSV_SPERATE + log;
            sw.WriteLine(line);
            sw.Close();
        }
    }
}
