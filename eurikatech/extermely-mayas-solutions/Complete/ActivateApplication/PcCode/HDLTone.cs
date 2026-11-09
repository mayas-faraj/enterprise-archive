using System;
using System.Text;
using System.Management;

namespace Maniyat
{
    public class HDLTone
    {
        public event Maniyat.ExceptionEventHandler ExceptionRaised;

        public String GetHDLTone(Int32 depth,Int32 multi,Int32 shift,Boolean[] keys)
        {
            //precondition:nothing

            //1--get pc informations
            ManagementObjectSearcher mos = new ManagementObjectSearcher();
            String wafer = "", flashed = "";

            try
            {
                mos.Query.QueryString = "select processorId from Win32_Processor";
                foreach (ManagementObject mo in mos.Get())
                    wafer = mo["processorId"].ToString();

                mos.Query.QueryString = "select version from Win32_BIOS";
                foreach (ManagementObject mo in mos.Get())
                    flashed = mo["version"].ToString();
            }
            catch (Exception ex)
            {
                ExceptionRaised(this, new ExceptionEventArgs(ex, DateTime.Now, "Error Get HDL Tone"));
            }

            //wafer is basic informaiton
            if (wafer == null || wafer.Trim() == "")
            {
                return null;
            }

            if (flashed == null)
                flashed = "";

            //2--merge pc informations
            String HDLToned = Crash(wafer, flashed, depth, multi, shift);

            //3--toning pc informations
            String CHDLToned = Toning(HDLToned, depth, keys);

            return CHDLToned;
            
            //postcondition : return coded pc information
        }

        /// <summary>
        /// merge tow strings value in one by depth number
        /// </summary>
        /// <param name="string1">first string to merge</param>
        /// <param name="string2">second string to merge</param>
        /// <param name="depth">merging depth</param>
        /// <param name="multi">multi factor , for coding length value</param>
        /// <param name="shift">shift factor , for coding length value </param>
        /// <returns>new string value depinding on merging tow inputs string with selected parameters</returns>
        public String Crash(String string1, String string2, Int32 depth, Int32 multi, Int32 shift)
        {
            String strT;
            //detect strT value to get length string1 or string 2
            Random rnd = new Random();

            if (rnd.Next(2) < 1)
                strT = (string1.Length * multi + shift).ToString();
            else
                strT = (string2.Length * multi + shift).ToString();

            //strTot ,returned value
            StringBuilder strTot = new StringBuilder(string1.Length + string2.Length + strT.Length + 1);

            //add length value
            strTot.Append(strT);
            strTot.Append(SPERATOR);

            if (string1.Trim() == "")
                strTot.Append(string2);
            else
                if (string2.Trim() == "")
                    strTot.Append(string1);
                else
                {
                    //strG is greate length of waver or flasher and strL is the other.
                    String strG, strL;
                    Int32 posG = 0, posL = 0;

                    if (string1.Length >= string2.Length)
                    {
                        strG = string1;
                        strL = string2;
                    }
                    else
                    {
                        strL = string1;
                        strG = string2;
                    }

                    depth = depth % strG.Length;

                    if (depth <= 0)
                    {
                        strTot.Append(strL);
                        strTot.Append(strG);
                    }
                    else
                    {
                        while (posL < strL.Length || posG < strG.Length)
                        {
                            if (posL < strL.Length)
                                strTot.Append(strL[posL++]);

                            if (posG < strG.Length - depth)
                            {
                                strTot.Append(strG.Substring(posG, depth));
                                posG += depth;
                            }
                            else
                                if (posG < strG.Length)
                                {
                                    strTot.Append(strG.Substring(posG));
                                    posG = strG.Length;
                                }
                        }
                    }
                }
            return strTot.ToString();
        }

        public String Toning(String tone, Int32 depth, Boolean[] key)
        {
            //precondition : nothing

            StringBuilder chrArray = new StringBuilder(tone);
            StringBuilder rnArray = new StringBuilder(tone + depth * tone2);
            StringBuilder numResult = new StringBuilder();
            String result;
            Random rn = new Random();
            Char generatedChar = generate(ref key);

            //toning input string-partialF algorithms
            for (Int32 i = 0; i < chrArray.Length; i++)
                chrArray[i] = Convert.ToChar(chrArray[i] ^ generatedChar);

            //generate random string
            for (Int32 i = 0; i < rnArray.Length; i++)
                rnArray[i] = Convert.ToChar(rn.Next(UInt16.MaxValue));

            //merging operation
            result = Crash(chrArray.ToString(), rnArray.ToString(), depth, depth + tone2, (depth + tone1) * tone3);

            //convert string resutl to string of numerical values depinding of chars value
            numResult.Capacity = 5 * result.Length;

            for (Int32 i = 0; i < result.Length; i++)
                numResult.Append(Convert.ToUInt16(result[i]).ToString("00000"));

            return numResult.ToString();
            //postcondition : result toned by three algorithims
        }

        private Int32 pow(System.Int32 n, System.Int32 x)
        {
            Int32 result = 1;

            for (System.Int32 i = 0; i < x; i++)
                result = result * n;

            return result;
        }

        private Char generate(ref Boolean[] key)
        {
            Byte r = (Convert.ToByte(key.Length) >= bitsNumber) ? bitsNumber : Convert.ToByte(key.Length);
            Int32 charCode = 0;

            for (System.Int32 i = 0; i < r; i++)
                if (key[i])
                    charCode += pow(2, i);

            return (Char)charCode;
        }

        public Boolean IsActivate(ref String enK, ref String reqK, ref String acK)
        {
            //precondition : externalKey generate by GetHDLTone pcCode Member Function
            StringBuilder result = new StringBuilder();

            result.Append(enK.GetHashCode().ToString());
            result.Append(reqK.GetHashCode().ToString());

            result.Replace('-', 'n');
            result.Replace('+', 'p');
            result.Replace('2', 'a');
            result.Replace('4', 'd');
            result.Replace('6', 'h');
            result.Replace('8', 'k');

            if (result.ToString() == acK)
                return true;
            else
                return false;
            //postcondition : return unique code for selected pc depinding on input keys
        }

        private const Char SPERATOR = '-';
        private const Byte bitsNumber = 16;
        private const Int32 tone1 = 2;
        private const Int32 tone2 = 3;
        private const Int32 tone3 = 5;
    }
}
