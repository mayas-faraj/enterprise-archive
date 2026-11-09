using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HomeWork
{
    class Program
    {
        static void Main(string[] args)
        {

            Int32 month;
            Int32 year;

            Int32 ndTo2009;
            Int32 nbdm = 0;
            const Int32 d1y09 = 4;

            do
            {
                Console.WriteLine("enter the year (2009 -> 2011)");
                year = Convert.ToInt32(Console.ReadLine());
            } while (year != 2009 && year != 2010 && year != 2011);

            do
            {
                Console.WriteLine("enter the month (1 -> 12)");
                month = Convert.ToInt32(Console.ReadLine());
            } while (month < 1 && month > 12);
            
            Console.WriteLine();
            Console.WriteLine("\t\t{0} {1}", month, year);
            Console.WriteLine("-------------------------------------------------------");
            Console.WriteLine("sun\tmon\ttue\twed\tthu\tfri\tsat");

            ndTo2009 = ((year - 2009) * 365);
            Int32 counter = 0;

            while (counter <= month)
            {
                switch (counter-1)
                {
                    case 1:
                        nbdm = 31;
                        break;
                    case 2:
                        nbdm = 28;
                        break;
                    case 3:
                        nbdm = 31;
                        break;
                    case 4:
                        nbdm = 30;
                        break;
                    case 5:
                        nbdm = 31;
                        break;
                    case 6:
                        nbdm = 30;
                        break;
                    case 7:
                        nbdm = 31;
                        break;
                    case 8:
                        nbdm = 31;
                        break;
                    case 9:
                        nbdm = 30;
                        break;
                    case 10:
                        nbdm = 31;
                        break;
                    case 11:
                        nbdm = 30;
                        break;
                    case 12:
                        nbdm = 31;
                        break;
                }

                ndTo2009 += nbdm;
                counter++;
            }

            switch (month)
            {
                case 1:
                    nbdm = 31;
                    break;
                case 2:
                    nbdm = 28;
                    break;
                case 3:
                    nbdm = 31;
                    break;
                case 4:
                    nbdm = 30;
                    break;
                case 5:
                    nbdm = 31;
                    break;
                case 6:
                    nbdm = 30;
                    break;
                case 7:
                    nbdm = 31;
                    break;
                case 8:
                    nbdm = 31;
                    break;
                case 9:
                    nbdm = 30;
                    break;
                case 10:
                    nbdm = 31;
                    break;
                case 11:
                    nbdm = 30;
                    break;
                case 12:
                    nbdm = 31;
                    break;
            }

            Int32 dd = ndTo2009 % 7;
            Int32 d1m = (d1y09 + dd) % 7;

            for (Int32 k = 0; k < d1m; k++)
            {
                if (k % 7 == 0)
                    Console.WriteLine();
                Console.Write("\t");
            }

            for (Int32 k = d1m; k <= (nbdm + d1m) - 1; k++)
            {
                if (k % 7 == 0)
                    Console.WriteLine();
                Console.Write(((k - d1m) + 1).ToString() + "\t");
            }
            Console.WriteLine();
            Console.ReadLine();

        }
    }
}
