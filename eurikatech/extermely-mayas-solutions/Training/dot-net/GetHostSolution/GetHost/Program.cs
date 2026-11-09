using System;

namespace GetHost
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Host Name : {0}.", System.Net.Dns.GetHostName());

            System.Net.IPAddress[] addresses = System.Net.Dns.GetHostAddresses(System.Net.Dns.GetHostName());

            foreach (System.Net.IPAddress add in addresses)
                Console.WriteLine("address : {0}", add);

            Console.ReadKey();
        }
    }
}
