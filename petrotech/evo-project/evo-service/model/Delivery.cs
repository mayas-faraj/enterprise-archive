using System;

namespace Petrotech
{
    class Delivery
    {
        public int TankId
        {
            get { return tankId; }
            set { tankId = value; }
        }
        public DateTime BeginTime
        {
            get { return beginTime; }
            set { beginTime = value; }
        }
        public double BeginProductLevel
        {
            get { return beginProductLevel; }
            set { beginProductLevel = value; }
        }
        public double BeginWaterLevel
        {
            get { return beginWaterLevel; }
            set { beginWaterLevel = value; }
        }
        public double BeginTemprature
        {
            get { return beginTemprature; }
            set { beginTemprature = value; }
        }
        public double BeginGrossProductVolume
        {
            get { return beginGrossProductVolume; }
            set { beginGrossProductVolume = value; }
        }
        public double BeginNetProductVolume
        {
            get { return beginNetProductVolume; }
            set { beginNetProductVolume = value; }
        }

        public double BeginWaterVolume
        {
            get { return beginWaterVolume; }
            set { beginWaterVolume = value; }
        }
        public double BeginUllageVolume
        {
            get { return beginUllageVolume; }
            set { beginUllageVolume = value; }
        }
        public double BeginProductDensity
        {
            get { return beginProductDensity; }
            set { beginProductDensity = value; }
        }
        public double BeginNetDensity
        {
            get { return beginNetDensity; }
            set { beginNetDensity = value; }
        }
        public double BeginProductMass
        {
            get { return beginProductMass; }
            set { beginProductMass = value; }
        }
        public DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }
        public double EndProductLevel
        {
            get { return endProductLevel; }
            set { endProductLevel = value; }
        }
        public double EndWaterLevel
        {
            get { return endWaterLevel; }
            set { endWaterLevel = value; }
        }
        public double EndTemprature
        {
            get { return endTemprature; }
            set { endTemprature = value; }
        }
        public double EndGrossProductVolume
        {
            get { return endGrossProductVolume; }
            set { endGrossProductVolume = value; }
        }

         public double EndWaterVolume
        {
            get { return endWaterVolume; }
            set { endWaterVolume = value; }
        }

        public double EndNetProductVolume
        {
            get { return endNetProductVolume; }
            set { endNetProductVolume = value; }
        }
        public double EndUllageVolume
        {
            get { return endUllageVolume; }
            set { endUllageVolume = value; }
        }
        public double EndProductDensity
        {
            get { return endProductDensity; }
            set { endProductDensity = value; }
        }
        public double EndNetDensity
        {
            get { return endNetDensity; }
            set { endNetDensity = value; }
        }
        public double EndProductMass
        {
            get { return endProductMass; }
            set { endProductMass = value; }
        }
        public double GrossVolumeDelivered
        {
            get { return grossVolumeDelivered; }
            set { grossVolumeDelivered = value; }
        }
        public double NetVolumeDelivered
        {
            get { return netVolumeDelivered; }
            set { netVolumeDelivered = value; }
        }
        public double MassDelivered
        {
            get { return massDelivered; }
            set { massDelivered = value; }
        }
        public double GrossDensityDelivered
        {
            get { return grossDensityDelivered; }
            set { grossDensityDelivered = value; }
        }
        public double NetDensityDelivered
        {
            get { return netDensityDelivered; }
            set { netDensityDelivered = value; }
        }
        public string TotalDispensedError
        {
            get { return totalDispensedError; }
            set { totalDispensedError = value; }
        }
        public string DispensedDuringDeliveryError
        {
            get { return dispensedDuringDeliveryError; }
            set { dispensedDuringDeliveryError = value; }
        }
        public string BeginReferenceGrossProductVolumeError
        {
            get { return beginReferenceGrossProductVolumeError; }
            set { beginReferenceGrossProductVolumeError = value; }
        }
        public string BeginReferenceNetProductVolumeError
        {
            get { return beginReferenceNetProductVolumeError; }
            set { beginReferenceNetProductVolumeError = value; }
        }
        public DateTime BeginReferenceTime
        {
            get { return beginReferenceTime; }
            set { beginReferenceTime = value; }
        }
        public string EndReferenceGrossProductVolumeError
        {
            get { return endReferenceGrossProductVolumeError; }
            set { endReferenceGrossProductVolumeError = value; }
        }
        public string EndReferenceNetProductVolumeError
        {
            get { return endReferenceNetProductVolumeError; }
            set { endReferenceNetProductVolumeError = value; }
        }
        public DateTime EndReferenceTime
        {
            get { return endReferenceTime; }
            set { endReferenceTime = value; }
        }

        private int tankId;
        private DateTime beginTime;
        private double beginProductLevel;
        private double beginWaterLevel;
        private double beginTemprature;
        private double beginGrossProductVolume;
        private double beginNetProductVolume;
        private double beginWaterVolume;
        private double beginUllageVolume;
        private double beginProductDensity;
        private double beginNetDensity;
        private double beginProductMass;
        private DateTime endTime;
        private double endProductLevel;
        private double endWaterLevel;
        private double endTemprature;
        private double endGrossProductVolume;
        private double endNetProductVolume;
        private double endWaterVolume;
        private double endUllageVolume;
        private double endProductDensity;
        private double endNetDensity;
        private double endProductMass;
        private double grossVolumeDelivered;
        private double netVolumeDelivered;
        private double massDelivered;
        private double grossDensityDelivered;
        private double netDensityDelivered;
        private string totalDispensedError;
        private string dispensedDuringDeliveryError;
        private string beginReferenceGrossProductVolumeError;
        private string beginReferenceNetProductVolumeError;
        private DateTime beginReferenceTime;
        private string endReferenceGrossProductVolumeError;
        private string endReferenceNetProductVolumeError;
        private DateTime endReferenceTime;
    }
}