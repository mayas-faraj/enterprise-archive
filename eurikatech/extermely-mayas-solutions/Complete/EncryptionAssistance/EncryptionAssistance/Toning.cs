using System;
using System.Collections.Generic;
using System.Text;

namespace EncryptionAssistance
{
    public static class Toning
    {
        static Toning()
        {
            coding = new StringEncoder.Coding();
            coding.BitsNumber = 16;

            partialFilpKey = new Boolean[0];
            shiftRangeLocation = 0;
        }

        public static String SA11(String statement)
        {
            partialFilpKey = new Boolean[] { false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true };
            shiftRangeLocation = 20;

            return coding.ParitalFlip(coding.ShiftRange(statement, shiftRangeLocation), partialFilpKey);
        }

        public static String SA11Reverse(String statement)
        {
            partialFilpKey = new Boolean[] { false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true };
            shiftRangeLocation = 20;
            return coding.ShiftRange(coding.ParitalFlip(statement, partialFilpKey), -shiftRangeLocation);
        }

        private static StringEncoder.Coding coding;
        private static Boolean[] partialFilpKey;
        private static Int32 shiftRangeLocation;

    }
}
