using System;
using System.IO;

namespace SystemWatcher
{
    public static class SystemWatcher
    {
        public static event ExceptionEventHandler DatabaseException;
        public static event ExceptionEventHandler ProgramException;
        public static event ExceptionEventHandler InterfaceException;

        public static void WriteExceptionInfo(ExceptionEventArgs args)
        {
            if (writeLogFile)
            {
                FileStream fs = new FileStream(logFileName, FileMode.Append, FileAccess.Write);
                StreamWriter sw = new StreamWriter(fs);

                sw.WriteLine(Toning(args.Date.ToString() + SPERATOR + args.Exception.Message + SPERATOR + args.Exception.Source + SPERATOR + args.SourceClassName.ToString() + SPERATOR + args.SourceMethodName + SPERATOR + args.SourceErrorValue + SPERATOR + ((captureScreen) ? args.ImageName : "")));
                sw.Close();
            }
        }

        public static String Toning(String sourceString)
        {
            return sourceString;
        }

        public static String LogFileName
        {
            get
            {
                return logFileName;
            }
            set
            {
                logFileName = value;
            }
        }

        public static Boolean WriteLogFile
        {
            get
            {
                return writeLogFile;
            }
            set
            {
                writeLogFile = value;
            }
        }

        public static Boolean CaptureScreen
        {
            get
            {
                return captureScreen;
            }
            set
            {
                captureScreen = value;
            }
        }

        private static String logFileName;
        private static Boolean writeLogFile;
        private static Boolean captureScreen;

        private const Char SPERATOR = '-';
        private const String NOIMAGE = "No Image";
    }

    public delegate void ExceptionEventHandler(Object sender,EventArgs e);

    public class ExceptionEventArgs : EventArgs
    {
        public ExceptionEventArgs(Exception exception, Object sourceClassName, String sourceMethodName, String sourceErrorValue)
        {
            this.exception = exception;
            this.date = DateTime.Now;
            this.sourceClassName = sourceClassName;
            this.sourceMethodName = sourceMethodName;
            this.sourceErrorValue = sourceErrorValue;        }

        public Exception Exception
        {
            get
            {
                return exception;
            }
            set
            {
                exception = value;
            }
        }

        public DateTime Date
        {
            get
            {
                return date;
            }
            set
            {
                date = value;
            }
        }

        public Object SourceClassName
        {
            get
            {
                return sourceClassName;
            }
            set
            {
                sourceClassName = value;
            }
        }

        public String SourceMethodName
        {
            get
            {
                return sourceMethodName;
            }
            set
            {
                sourceMethodName = value;
            }
        }

        public String SourceErrorValue
        {
            get
            {
                return sourceErrorValue;
            }
            set
            {
                sourceErrorValue = value;
            }
        }

        private Exception exception;
        private DateTime date;
        private Object sourceClassName;
        private String sourceMethodName;
        private String sourceErrorValue;
    }
}
