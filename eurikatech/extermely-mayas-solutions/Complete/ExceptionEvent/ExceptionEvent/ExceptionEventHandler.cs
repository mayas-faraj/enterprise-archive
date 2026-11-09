using System;

namespace Maniyat
{
    public delegate void ExceptionEventHandler(object sender,ExceptionEventArgs e);

    //event argument definition
    public class ExceptionEventArgs : EventArgs
    {
        //publlic constructure region
        public ExceptionEventArgs(Exception exception)
        {
            exceptionSource = exception;
        }

        public ExceptionEventArgs(Exception exception, DateTime date,String info)
        {
            exceptionSource = exception;
            exceptionDate = date;
            exceptionInfo = info;
        }

        //public properites region
        public Exception ExceptionSource
        {
            get
            {
                return exceptionSource;
            }
            set
            {
                exceptionSource = value;
            }
        }

        public DateTime ExceptionDate
        {
            get
            {
                return exceptionDate;
            }
            set
            {
                exceptionDate = value;
            }
        }

        public String ExceptionInfo
        {
            get
            {
                return exceptionInfo;
            }
            set
            {
                exceptionInfo = value;
            }
        }

        public override String ToString()
        {
            return exceptionSource.Message + " , " + exceptionDate.ToString() + " , " + exceptionInfo;
        }

        //private region : exception properties - exception , date , other info .
        private Exception exceptionSource;
        private DateTime exceptionDate;
        private String exceptionInfo;
    }
}
