using System;

namespace Petrotech
{
    class Setting
    {
        public string SensorName
        {
            get
            {
                return sensorName;
            }
            set
            {
                sensorName = value;
            }
        }
        public int SensorWriteInterval
        {
            get
            {
                return sensorWriteInterval;
            }
            set
            {
                sensorWriteInterval = value;
            }
        }
        public int SensorReadInterval

        {
            get
            {
                return sensorReadInterval;
            }
            set
            {
                sensorReadInterval = value;
            }
        }
        public string IpAddress

        {
            get
            {
                return ipAddress;
            }
            set
            {
                ipAddress = value;
            }
        }
        public int ScheduleHour
        {
            get
            {
                return scheduleHour;
            }
            set
            {
                scheduleHour = value;
            }
        }
        private string sensorName;
        private int sensorWriteInterval;
        private int sensorReadInterval;
        private string ipAddress;
        private int scheduleHour;
    }
}