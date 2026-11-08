using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HWDecoding
{
    class Program
    {
        static void Main(string[] args)
        {
            const Char stopKey = ' ';
            Char currentChar;
            String S = "";
            String SC = "";

            Console.WriteLine("Enter String Value to Decode :");

            do
            {
                currentChar = Console.ReadKey().KeyChar;

                S += currentChar;

                if (currentChar < 'A' || currentChar > 'Z')
                    SC += currentChar;
                else
                {
                    if (Convert.ToChar(Convert.ToInt16(currentChar) + 2) <= 'Z')
                        currentChar = Convert.ToChar(Convert.ToInt16(currentChar) + 2);
                    else
                        currentChar = Convert.ToChar((Convert.ToInt16(currentChar) + 2) % (Convert.ToInt16('Z') + 1) + Convert.ToInt16('A'));
                    SC += currentChar;
                }
                
            } while (currentChar != stopKey);

            Console.WriteLine();
            Console.WriteLine("Input String : " + S);
            Console.WriteLine("Output String : " + SC);

            Console.ReadKey();
        }
        }
    }
}
