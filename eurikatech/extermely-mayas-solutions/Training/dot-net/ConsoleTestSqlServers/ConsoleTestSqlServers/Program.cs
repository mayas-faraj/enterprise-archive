using System;
using System.Data.Sql;

class Program
{
    static void Main()
    {
        while (true)
        {
          
        }
        //while (true)
        //{
        //    Console.WriteLine("Enter Char?");
        //    Char x = Convert.ToChar(Console.ReadLine());
        //    Byte[] result;
            
        //    Console.WriteLine("Unicode");
        //    result = System.Text.Encoding.Unicode.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("ASCII");
        //    result = System.Text.Encoding.ASCII.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("Default");
        //    result = System.Text.Encoding.Default.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("BigEndianUnicode");
        //    result = System.Text.Encoding.BigEndianUnicode.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("UTF7");
        //    result = System.Text.Encoding.UTF7.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("UTF8");
        //    result = System.Text.Encoding.UTF8.GetBytes(new Char[] { x });
        //    print(result);

        //    Console.WriteLine("UTF32");
        //    result = System.Text.Encoding.UTF32.GetBytes(new Char[] { x });
        //    print(result);
        //}

        Console.Read();
    }

    static void print(Byte[] array)
    {
        for (Int32 i = 0; i < array.Length; i++)
            Console.Write("(" + array[i] + ")");

        Console.WriteLine();
    }

    static void write(Char x)
    {
        for (Int32 i = 0; i < 500; i++)
            Console.Write(x);

        //throw new Exception();
    }

    static void write()
    {
        for (Int32 i = 0; i < 500; i++)
            Console.Write('*');
    }
}

