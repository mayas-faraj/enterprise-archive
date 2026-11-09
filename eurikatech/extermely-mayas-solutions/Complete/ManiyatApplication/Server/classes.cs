using System;
using System.Collections.Generic;
using System.Web;

namespace Server
{
    internal static class ErrorLog
    {
        public static void Write(String file,String id,Exception ex)
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter(file, true);

            String data = "";

            foreach (String s in ex.Data)
                data += "[" + s + "]";
           
            sw.WriteLine(id + ';' + DateTime.Now.ToString() + ';' + ex.Source + ';' + ex.Message + ';' + data);
            sw.Close();
        } 
    }
}