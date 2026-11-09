using System;
using System.Text;
using System.Security.Cryptography;

namespace key_generator
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Server Name:");
            string server=Console.ReadLine();
            Console.WriteLine("User Name ?");
            string user=Console.ReadLine();
            Console.WriteLine("Password?");
            string password=Console.ReadLine();

            string key=encrypt(String.Format("{0}?{1}:{2}", server, user, password), "E-11m3kg-1s-2");
            Console.WriteLine("---------Key is:-------");
            Console.WriteLine(key);
            Console.WriteLine("-----------------------");
            Console.ReadLine();
        }

        static string encrypt(string password, string salt)
        {
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] saltBytes = Encoding.UTF8.GetBytes(salt);
            byte[] cipherBytes = ProtectedData.Protect(passwordBytes, null, DataProtectionScope.LocalMachine);
            return Convert.ToBase64String(cipherBytes);
        }
    }
}
