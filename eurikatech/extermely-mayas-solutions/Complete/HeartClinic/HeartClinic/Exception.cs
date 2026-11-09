using System;
using System.Collections.Generic;
using System.Text;

namespace HeartClinic
{
    public class PercentOutOfRangeException : Exception
    {
        public PercentOutOfRangeException()
            : base("The Percent Value must between 0 and 100")
        {
        }
    }
}
