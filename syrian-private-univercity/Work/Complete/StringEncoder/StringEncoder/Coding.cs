
namespace StringEncoder
{
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
            //precondition : key length equal bitsNumber
            System.Byte r = (System.Convert.ToByte(key.Length) >= bitsNumber) ? bitsNumber : System.Convert.ToByte(key.Length);
            System.Int32 charCode = 0;

            for (System.Int32 i = 0; i < r; i++)
                //loop invariant : i=0..r-1 , charcode = 0Si 2^i
                if (key[i])
                    //critical operation
                    //must change pow function
                    charCode += pow(2, i);

            return (System.Char)charCode;
            //O(r)
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

        public System.String ParitalFlip(System.String str,System.Boolean[] key)
        {
            //precondition : none
            System.Text.StringBuilder chrArray = new System.Text.StringBuilder(str);
            System.Char generatedChar = generate(ref key);

            for (System.Int32 i = 0; i < chrArray.Length; i++)
                //loop invariant : every char from char array filp them value if key on that bis = 1 logic
                //critical operation
                chrArray[i] = System.Convert.ToChar(chrArray[i] ^ generatedChar);

            //post condition : string encoder by function between input and output by key
            return chrArray.ToString();
            //O(N) ; N is the length of an array
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

        public System.String RotateRight(System.String str, System.Int32 shift)
        {
            //precondition : none 
            if (shift == 0 || shift % bitsNumber == 0 || str == null)
                return str;
            else
            {
                System.Text.StringBuilder chars = new System.Text.StringBuilder(str);
                System.Int32 cut = 0;
                System.Int32 sv;

                shift = shift % bitsNumber;

                for (System.Int32 i = 0; i < shift; i++)
                    cut = cut + pow(2, i);

                for (System.Int32 i = 0; i < chars.Length; i++)
                {
                    //loop invariant : i pass all chars in array
                    sv = (System.Char)cut & chars[i];
                    //critical operation
                    chars[i] = (System.Char)(chars[i] >> shift);
                    sv = sv << bitsNumber - shift;
                    chars[i] = (System.Char)(chars[i] | sv);
                }

                //post condition : string encoder by rotated input string
                return chars.ToString();
                //O(N) ; N is the length of an array
            }
        }

        public System.String RotateLeft(System.String str, System.Int32 shift)
        {
            //precondition : none 
            if (shift == 0 || shift % bitsNumber == 0 || str == null)
                return str;
            else
            {
                System.Text.StringBuilder chars = new System.Text.StringBuilder(str);
                System.Int32 cut = 0;
                System.Int32 sv;

                shift = shift % bitsNumber;

                for (System.Int32 i = bitsNumber - shift; i < bitsNumber; i++)
                    cut = cut + pow(2, i);

                for (System.Int32 i = 0; i < chars.Length; i++)
                {
                    //loop invariant : i pass all chars in array
                    sv = (System.Char)cut & chars[i];
                    chars[i] = (System.Char)(chars[i] << shift);
                    sv = sv >> bitsNumber - shift;
                    chars[i] = (System.Char)(chars[i] | sv);
                }

                //post condition : string encoder by rotated input string
                return chars.ToString();
                //O(N) ; N is the length of an array
            }
        }
    }
}
