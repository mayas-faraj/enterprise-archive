namespace Petrotech
{
    class SensorValue
    {
        public int TankId
        {
            get
            {
                return tankId;
            }
            set
            {
                tankId = value;
            }
        }

        public float WaterLevel
        {
            get
            {
                return waterLevel;
            }
            set
            {
                waterLevel = value;
            }
        }

        public float ProductLevel
        {
            get
            {
                return productLevel;
            }
            set
            {
                productLevel = value;
            }
        }

        public float Temprature
        {
            get
            {
                return temprature;
            }
            set
            {
                temprature = value;
            }
        }

        public float GrossProductVolume
        {
            get
            {
                return grossProductVolume;
            }
            set
            {
                grossProductVolume = value;
            }
        }

        public float NetProductVolume
        {
            get
            {
                return netProductVolume;
            }
            set
            {
                netProductVolume = value;
            }
        }

        public float WaterVolume
        {
            get
            {
                return waterVolume;
            }
            set
            {
                waterVolume = value;
            }
        }

        public float UllageVolume
        {
            get
            {
                return ullageVolume;
            }
            set
            {
                ullageVolume = value;
            }
        }

        public float Density
        {
            get
            {
                return density;
            }
            set
            {
                density = value;
            }
        }

        public float NetDensity
        {
            get
            {
                return netDensity;
            }
            set
            {
                netDensity = value;
            }
        }

        public float ProductMass
        {
            get
            {
                return productMass;
            }
            set
            {
                productMass = value;
            }
        }

        public float UncompProductLevel
        {
            get
            {
                return uncompProductLevel;
            }
            set
            {
                uncompProductLevel = value;
            }
        }

        public float UncompDensityLevel
        {
            get
            {
                return uncompDensityLevel;
            }
            set
            {
                uncompDensityLevel = value;
            }
        }

        public float Distance
        {
            get
            {
                return distance;
            }
            set
            {
                distance = value;
            }
        }

        public float RefDensity
        {
            get
            {
                return refDensity;
            }
            set
            {
                refDensity = value;
            }
        }

        public bool DeliveryActive
        {
            get
            {
                return deliveryActive;
            }
            set
            {
                deliveryActive = value;
            }
        }

        public bool AlarmsActive
        {
            get
            {
                return alarmsActive;
            }
            set
            {
                alarmsActive = value;
            }
        }

        public bool StaticLeakTestActive
        {
            get
            {
                return staticLeakTestActive;
            }
            set
            {
                staticLeakTestActive = value;
            }
        }

        public string Error
        {
            get
            {
                return error;
            }
            set
            {
                error = value;
            }
        }

        private int tankId;
        private float waterLevel;
        private float productLevel;
        private float temprature;
        private float grossProductVolume;
        private float netProductVolume;
        private float waterVolume;
        private float ullageVolume;
        private float density;
        private float netDensity;
        private float productMass;
        private float uncompProductLevel;
        private float uncompDensityLevel;
        private float distance;
        private float refDensity;
        private bool deliveryActive;
        private bool alarmsActive;
        private bool staticLeakTestActive;
        private string error;
    }
}