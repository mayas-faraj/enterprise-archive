using System;

namespace  Petrotech
{
    class Alarm
    {
        public string Device
        {
            get
            {
                return device;
            }
            set
            {
                device = value;
            }
        }
        public string Code
        {
            get
            {
                return code;
            }
            set
            {
                code = value;
            }
        }
        public string Status
        {
            get
            {
                return status;
            }
            set
            {
                status = value;
            }
        }
        public string Type
        {
            get
            {
                return type;
            }
            set
            {
                type = value;
            }
        }
        public DateTime AlarmDate
        {
            get
            {
                return alarmDate;
            }
            set
            {
                alarmDate = value;
            }
        }
        public DateTime? ClearedDate
        {
            get
            {
                return clearedDate;
            }
            set
            {
                clearedDate = value;
            }
        }
        public int Data
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
            }
        }

        private string device;
        private string code;
        private string status;
        private string type;
        private DateTime alarmDate;
        private DateTime? clearedDate;
        private int data;
    }
}