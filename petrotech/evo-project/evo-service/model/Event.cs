using System;

namespace  Petrotech
{
    class Event
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
       
        public DateTime  OccuredDate
        {
            get
            {
                return occuredDate;
            }
            set
            {
                occuredDate = value;
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
        private DateTime occuredDate;
        private int data;
    }
}