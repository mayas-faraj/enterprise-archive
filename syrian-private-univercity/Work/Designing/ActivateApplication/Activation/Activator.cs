using System;
using System.Text;

namespace Maniyat
{
    public class Activator
    {
        public event Maniyat.ExceptionEventHandler ExceptionRaised;

        /// <summary>
        /// splite source string into tow strings depinding on depth value , encoding value like multi and shift
        /// </summary>
        /// <param name="string1">string values splite from souce string , if an error happened , it has null value</param>
        /// <param name="string2">string values splite from souce string , if an error happened , it has null value</param>
        /// <param name="source">source string that the splite operation requested</param>
        /// <param name="depth">depth of merge , must be the suitable value with crach function in PcCode Class</param>
        /// <param name="multi">multi factor , must be the suitable value with crach function in PcCode Class</param>
        /// <param name="shift">shift factor , must be the suitable value with crach function in PcCode Class</param>
        public void UnCrash(out String string1, out String string2, String source, Int32 depth, Int32 multi, Int32 shift)
        {
            //precondition : arguemnts of uncrash the same with crash arguments

            if (source == null || source.Trim() == "")
            {
                string1 = string2 = null;
            }
            else
            {
                //getting inital values

                //first value indicate length one of crashed tow strings
                String strT = source.Substring(0, source.IndexOf(SPERATOR));
                //length of less length and greater length strings
                Int32 lengthL = Int32.Parse(strT);
                Int32 lengthG;

                //remove first value
                source = source.Substring(source.IndexOf(SPERATOR) + 1);
                lengthL = (lengthL - shift) / multi;
                lengthG = source.Length - lengthL;

                if (lengthL > lengthG)
                {
                    Int32 tmp = lengthL;
                    lengthL = lengthG;
                    lengthG = tmp;
                }


                //process
                StringBuilder strL = new StringBuilder(lengthL);
                StringBuilder strG = new StringBuilder(lengthG);
                Int32 pos = 0;

                if (lengthL == 0)
                    strG.Append(source);
                else
                    if (lengthG == 0)
                        strL.Append(source);
                    else
                    {
                        depth = depth % lengthG;

                        if (depth <= 0)
                        {
                            strL.Append(source.Substring(0, lengthL));
                            strG.Append(source.Substring(lengthL));
                        }
                        else
                        {
                            while (pos < source.Length)
                            {
                                //if less length string not fulled with value ,add one
                                if (strL.Length < lengthL)
                                    strL.Append(source[pos++]);

                                //if greater length string not fulled with value , add values depinding on depth parameter
                                if (strG.Length < lengthG - depth)
                                {
                                    strG.Append(source.Substring(pos, depth));
                                    pos += depth;
                                }
                                else
                                {
                                    Int32 t = lengthG - strG.Length;
                                    strG.Append(source.Substring(pos, lengthG - strG.Length));
                                    pos += t;
                                }
                            }
                        }
                    }
                string1 = strL.ToString();
                string2 = strG.ToString();
            }
            //postcondition : string1,string2 splites from the base string
        }

        public String UnToning(String tone, Int32 depth, Boolean[] key)
        {
            //precondition : depth and key parameters the same with Toning fuction parameters


            StringBuilder result = new StringBuilder(tone.Length);
            StringBuilder chrResult = new StringBuilder(Convert.ToInt32(tone.Length / 5));

            //convert string value that represent numberiacal values of string chars to string chars
            for (Int32 i = 0; i < chrResult.Capacity; i++)
                chrResult.Append(Convert.ToChar(Convert.ToUInt16(tone.Substring(i * 5, 5))));


            String firstStr, secondStr;
            Char generatedChar = generate(ref key);

            //remove random string that generate in Toning function 0 secondStr
            UnCrash(out firstStr, out secondStr, chrResult.ToString(), depth, depth + tone2, (depth + tone1) * tone3);

            //decoding algorithm : parthilF
            for (Int32 i = 0; i < firstStr.Length; i++)
                result.Append(Convert.ToChar(firstStr[i] ^ generatedChar));

            return result.ToString();
            //postcondition : restoring orginal string that toned in toning function
        }

        public void RestoreHDLTone(out String code1, out String code2, String HDLTone, Int32 depth, Int32 multi, Int32 shift, Boolean[] keys)
        {
            //precondintion : parameters must be the same with GetHDLTone fuction parameter in PcCode Class
            try
            {
                //1--untoning pc informations
                String str = UnToning(HDLTone, depth, keys);

                //2--unmerge pc information
                UnCrash(out code1, out code2, str, depth, multi, shift);
            }
            catch (Exception ex)
            {
                ExceptionRaised(this, new Maniyat.ExceptionEventArgs(ex, DateTime.Now, "restoring code operation error"));
                code1 = null;
                code2 = null;
            }
            //postcondition : if an error happened ,return null , else return orginal value that exhibts pc information
        }

        public String GenerateActivationTone(String externalKey, String internalkey)
        {
            //precondition : externalKey generate by GetHDLTone pcCode Member Function
            StringBuilder result = new StringBuilder();

            result.Append(internalkey.GetHashCode().ToString());
            result.Append(externalKey.GetHashCode().ToString());

            result.Replace('-', 'n');
            result.Replace('+', 'p');
            result.Replace('2', 'a');
            result.Replace('4', 'd');
            result.Replace('6', 'h');
            result.Replace('8', 'k');

            return result.ToString();
            //postcondition : return unique code for selected pc depinding on input keys
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

        private const Char SPERATOR = '-';
        private const Byte bitsNumber = 16;
        private const Int32 tone1 = 2;
        private const Int32 tone2 = 3;
        private const Int32 tone3 = 5;
    }
}
