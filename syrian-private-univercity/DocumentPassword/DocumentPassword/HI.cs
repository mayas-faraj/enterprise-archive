using System;
using System.Text;
using System.Management;

namespace DocumentPassword
{
    public class PcInformation
    {
        //public member functions & events
        public PcInformation()
        {
            //key values for Management Object Searcher ,first key is name of group , others is names of properties for selected group
            processorKeys = new String[] { "Win32_Processor", "Name", "Description", "Manufacturer", "ProcessorId", "L2CacheSize" };
            diskDriveKeys = new String[] { "Win32_DiskDrive", "Name", "Caption", "Manufacturer", "", "Size" };
            physicalMemoryKeys = new String[] { "Win32_PhysicalMemory", "Name", "BankLabel", "Manufacturer", "SerialNumber", "Capacity" };
            baseBoardKeys = new String[] { "Win32_BaseBoard", "Name", "Caption", "Manufacturer", "SerialNumber", "Product" };
            vedioControllerKeys = new String[] { "Win32_VideoController", "Name", "Caption", "VideoProcessor", "PNPDeviceID", "AdapterRam" };
            soundDeviceKeys = new String[] { "Win32_SoundDevice", "Name", "Caption", "Manufacturer", "DeviceID", "" };
            biosKeys = new String[] { "Win32_BIOS", "Name", "Version", "Manufacturer", "SerialNumber", "" };
        }

        public PcInformation(Boolean loadValues)
            : this()
        {
            //load defaults values in constructure , save access time system information
            if (loadValues)
            {
                processor = fillHardwareInformation(processorKeys);
                diskDrive = fillHardwareInformationArray(diskDriveKeys);
                physicalMemory = fillHardwareInformationArray(physicalMemoryKeys);
                baseBoard = fillHardwareInformation(baseBoardKeys);
                vedioController = fillHardwareInformation(vedioControllerKeys);
                soundDevice = fillHardwareInformation(soundDeviceKeys);
                bios = fillHardwareInformation(biosKeys);
            }
        }

        //public properties
        public HardwareInformation Processor
        {
            get
            {
                if (processor == null)
                    processor = fillHardwareInformation(processorKeys);

                return processor;
            }
        }

        public HardwareInformation[] DiskDrive
        {
            get
            {
                if (diskDrive == null)
                    diskDrive = fillHardwareInformationArray(diskDriveKeys);

                return diskDrive;
            }
        }

        public HardwareInformation[] PhysicalMemory
        {
            get
            {
                if (physicalMemory == null)
                    physicalMemory = fillHardwareInformationArray(physicalMemoryKeys);

                return physicalMemory;
            }
        }

        public HardwareInformation BaseBoard
        {
            get
            {
                if (baseBoard == null)
                    baseBoard = fillHardwareInformation(baseBoardKeys);

                return baseBoard;
            }
        }

        public HardwareInformation VedioController
        {
            get
            {
                if (vedioController == null)
                    vedioController = fillHardwareInformation(vedioControllerKeys);

                return vedioController;
            }
        }

        public HardwareInformation SoundDevice
        {
            get
            {
                if (soundDevice == null)
                    soundDevice = fillHardwareInformation(soundDeviceKeys);

                return soundDevice;
            }
        }

        public HardwareInformation Bios
        {
            get
            {
                if (bios == null)
                    bios = fillHardwareInformation(biosKeys);

                return bios;
            }
        }

        /// <summary>
        /// Get one value from system informaiton depinding on tableName nad key
        /// </summary>
        /// <returns>if one of arguments are empty string or null ,return empty string \nand if an error occur , return null , else return string value from system information. </returns>
        public String GetHardwareInformationString(String tableName, String key)
        {
            if (tableName != null && tableName.Trim() != "" && key != null && key.Trim() != "")
            {
                ManagementObjectSearcher mos = new ManagementObjectSearcher("select " + key + " from " + tableName);

                try
                {
                    foreach (ManagementObject mo in mos.Get())
                    {
                        return mo.Properties[key].Value.ToString();
                    }
                }
                catch (Exception ex)
                {
                    return null;
                }
            }

            return "";

        }

        //priavate memeber functions
        private HardwareInformation[] fillHardwareInformationArray(String[] keys)
        {
            //precondtion : keys values is valid management properites name
            HardwareInformation[] hardware;

            //keys length must at least 6 by default values
            if (keys != null && keys.Length >= 6 && keys[0] != "" && keys[0] != null)
            {
                //build quert string in syntax : select key1,key2,... from gourbName
                StringBuilder query = new StringBuilder("select ");

                for (Int32 i = 1; i < keys.Length - 1; i++)
                {
                    if (keys[i] != null && keys[i].Trim() != "")
                    {
                        query.Append(keys[i]);

                        if (i != keys.Length - 2 || (keys[i + 1] != null && keys[i + 1].Trim() != ""))
                            query.Append(',');
                    }
                }

                query.Append(keys[keys.Length - 1]);
                query.Append(" from ");
                query.Append(keys[0]);

                try
                {
                    //query information by management object searcher
                    ManagementObjectSearcher mos = new System.Management.ManagementObjectSearcher(query.ToString());
                    Int32 i = 0;
                    hardware = new HardwareInformation[mos.Get().Count];

                    foreach (ManagementObject mo in mos.Get())
                    {
                        hardware[i] = new HardwareInformation();

                        //critical operations
                        hardware[i].Name = getStringInfoByKey(mo, keys[1]);
                        hardware[i].Caption = getStringInfoByKey(mo, keys[2]);
                        hardware[i].Manufacturer = getStringInfoByKey(mo, keys[3]);
                        hardware[i].SerialNumber = getStringInfoByKey(mo, keys[4]);
                        hardware[i].Capacity = getStringInfoByKey(mo, keys[5]);

                        i++;
                    }

                    return hardware;
                }
                catch (Exception ex)
                {
                    //one empty element in array
                    return new HardwareInformation[0];
                }
            }
            else
                //one empty element in array
                return new HardwareInformation[0];
            //postcondition : return the hardware array filled with keys values from information system
        }

        private HardwareInformation fillHardwareInformation(String[] keys)
        {
            //precondtion : keys values is valid management properites name
            HardwareInformation hardware = new HardwareInformation();

            //keys length must at least 6 by default values
            if (keys != null && keys.Length >= 6 && keys[0] != "" && keys[0] != null)
            {
                //build quert string in syntax : select key1,key2,... from gourbName
                StringBuilder query = new StringBuilder("select ");

                for (Int32 i = 1; i < keys.Length - 1; i++)
                {
                    if (keys[i] != null && keys[i].Trim() != "")
                    {
                        query.Append(keys[i]);

                        if (i != keys.Length - 2 || (keys[i + 1] != null && keys[i + 1].Trim() != ""))
                            query.Append(',');
                    }
                }

                query.Append(keys[keys.Length - 1]);
                query.Append(" from ");
                query.Append(keys[0]);

                try
                {
                    //query information by management object searcher
                    ManagementObjectSearcher mos = new System.Management.ManagementObjectSearcher(query.ToString());

                    foreach (ManagementObject mo in mos.Get())
                    {
                        //critical operations
                        hardware.Name = getStringInfoByKey(mo, keys[1]);
                        hardware.Caption = getStringInfoByKey(mo, keys[2]);
                        hardware.Manufacturer = getStringInfoByKey(mo, keys[3]);
                        hardware.SerialNumber = getStringInfoByKey(mo, keys[4]);
                        hardware.Capacity = getStringInfoByKey(mo, keys[5]);
                    }

                    return hardware;
                }
                catch (Exception ex)
                {
                    //element filled with only valid informations
                    return hardware;
                }
            }
            //empty element
            return hardware;
            //postcondition : return the hardware object filled with keys values from computer
        }

        private String getStringInfoByKey(ManagementObject mo, String key)
        {
            if (key != null && key.Trim() != "")
            {
                Object result = mo.Properties[key].Value;

                if (result != null)
                    return result.ToString();
                else
                    return "";
            }
            else
                return "";
        }


        //private variable
        private HardwareInformation processor;
        private HardwareInformation[] diskDrive;
        private HardwareInformation[] physicalMemory;
        private HardwareInformation baseBoard;
        private HardwareInformation vedioController;
        private HardwareInformation soundDevice;
        private HardwareInformation bios;

        private String[] processorKeys;
        private String[] diskDriveKeys;
        private String[] physicalMemoryKeys;
        private String[] baseBoardKeys;
        private String[] vedioControllerKeys;
        private String[] soundDeviceKeys;
        private String[] biosKeys;
    }

    public class HardwareInformation
    {
        //public properties
        public String Name
        {
            get { return name; }
            set { name = value; }
        }

        public String Caption
        {
            get { return caption; }
            set { caption = value; }
        }

        public String Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public String SerialNumber
        {
            get { return serialNumber; }
            set { serialNumber = value; }
        }

        public String Capacity
        {
            get { return capacity; }
            set { capacity = value; }
        }


        //private properties
        private String name;
        private String caption;
        private String manufacturer;
        private String serialNumber;
        private String capacity;
    }

    public class Coding
    {
        private System.Byte bitsNumber;

        public System.Int32 pow(System.Int32 n, System.Int32 x)
        {
            System.Int32 result = 1;

            for (System.Int32 i = 0; i < x; i++)
                result = result * n;

            return result;
        }

        private System.Char generate(ref System.Boolean[] key)
        {
            System.Byte r = (System.Convert.ToByte(key.Length) >= bitsNumber) ? bitsNumber : System.Convert.ToByte(key.Length);
            System.Int32 charCode = 0;

            for (System.Int32 i = 0; i < r; i++)
                if (key[i])
                    charCode += pow(2, i);

            return (System.Char)charCode;
        }

        public Coding()
        {
            bitsNumber = 16;
        }

        public System.Byte BitsNumber
        {
            get
            {
                return bitsNumber;
            }
            set
            {
                bitsNumber = value;
            }
        }

        public System.String ParitalFlip(System.String str, System.Boolean[] key)
        {
            //precondition : none
            System.Text.StringBuilder chrArray = new System.Text.StringBuilder(str);
            System.Char generatedChar = generate(ref key);

            for (System.Int32 i = 0; i < chrArray.Length; i++)
                chrArray[i] = System.Convert.ToChar(chrArray[i] ^ generatedChar);
            return chrArray.ToString();
        }

        public System.String ShiftRange(System.String str, System.Int32 location)
        {
            //precondition : none
            System.Text.StringBuilder charArray = new System.Text.StringBuilder(str);

            for (System.Int32 i = 0; i < charArray.Length; i++)
            {
                //loop invariant : for all chars , shift them by location value
                //critical operation
                System.Int32 num = (charArray[i] + location) % pow(2, bitsNumber);

                if (num >= 0)
                    charArray[i] = System.Convert.ToChar(num);
                else
                    charArray[i] = System.Convert.ToChar(pow(2, bitsNumber) + num);
            }

            //post condition : chars on charArray rotated by location step
            return charArray.ToString();
        }
    }
}


