//logger is static class to write log on hard disk for degubing purpose
//there are three log levels, log - warn - error

using System.IO;
using System;
namespace Petrotech
{
    static class Logger
    {
        //logger static constructor to create ethernet.log file is it doesn't exist
        //or open the file for writing if it exists
        static Logger()
        {
        
            streamWriter = new StreamWriter("ethernet.log", true);
        }

        public static void Log(string content)
        {
            Logger.write("LOG: "+content);
        }

        public static void Warn(string content)
        {
            Logger.write("Warn: "+content);
        }

        public static void Error(string content)
        {
            Logger.write("ERROR: "+content);
        }

        public static void Error(System.Exception ex)
        {
            Logger.Error(String.Format("Source: {0}\nMessage{1}\nTarget: {2}\nStack Trace:\n{3}", ex.Source, ex.Message, ex.TargetSite, ex.StackTrace));
        }

        //write log into file
        private static void write(string content)
        {
            streamWriter.WriteLine("["+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"] "+content);
            streamWriter.WriteLine("---------------------");
        }

        private static StreamWriter streamWriter;
    }
}