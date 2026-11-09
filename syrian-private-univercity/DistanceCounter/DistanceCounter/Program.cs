using System;

namespace DistanceCounter
{
    class Test
    {
        static void Main(string[] args)
        {
            //test the program
            DistanceCounter dc1 = new DistanceCounter(100, 100);
            DistanceCounter dc2 = new DistanceCounter(330, 140);
            DistanceCounter dc3 = new DistanceCounter();

            DistanceCounter dc4 = dc1 - dc2;
            DistanceCounter dc5 = dc1 + dc2;
            Console.WriteLine("The subtraction of two distance counters are: {0} ", dc4);

            Console.WriteLine(dc3.GetDistance(3500));
        }

        class DistanceCounter
        {
            //attribut for distance counter
            private Single Meter, Kilometer;

            public DistanceCounter()
            {
                //initial values
                Meter = Kilometer = 0;
            }

            public DistanceCounter(Single inMeter, Single inKM)
            {
                //distance only must positive
                if (inMeter >= 0)
                    Meter = inMeter;
                else
                    //if negative - multi by -1
                    Meter = -inMeter;

                //distance only must positive
                if (inKM >= 0)
                    Kilometer = inKM;
                else
                    //if negative - multi by -1
                    Kilometer = -inKM;
            }

            public override string ToString()
            {
                return "KM " + Kilometer + " : M " + Meter;
            }

            public static DistanceCounter operator +(DistanceCounter d1, DistanceCounter d2)
            {
                DistanceCounter tmp = new DistanceCounter(d1.Meter + d2.Meter, d1.Kilometer + d2.Kilometer);
                return tmp;
            }

            public static DistanceCounter operator -(DistanceCounter d1, DistanceCounter d2)
            {
                //absoulute value is positive
                Single m = System.Math.Abs(d1.Meter - d2.Meter);
                Single k = System.Math.Abs(d1.Kilometer - d2.Kilometer);

                DistanceCounter tmp = new DistanceCounter(m, k);
                return tmp;
            }

            public DistanceCounter GetDistance(Int32 distance)
            {
                //get killometers
                Kilometer = Convert.ToInt32(distance / 1000);

                //sub km from total distance
                Meter = distance - (Kilometer * 1000);
                return this;
            }
        }
    }
}
