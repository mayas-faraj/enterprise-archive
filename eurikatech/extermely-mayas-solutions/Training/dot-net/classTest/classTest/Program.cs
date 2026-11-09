using System;

namespace Maniyat
{
    public class Program
    {
        public static void Main()
        {
            class1 c1 = new class1();

            c1.func();
            //c1.abst();
            Console.WriteLine(class1.intStatic);
            Console.WriteLine(class2.intStatic);
        }
    }

    internal class class1
    {
        public Int32 int1;
        public static Int32 intStatic;
        private Int16 int2;


        public class1()
        {
            Console.WriteLine("class 1 constructre");
            Console.WriteLine("static is {0}", intStatic);
        }

        static class1()
        {
            Console.WriteLine("class 1 static construture");
            intStatic = 10;
        }

        ~class1()
        {
            Console.WriteLine("class 1 destruture");
        }

        public virtual void func()
        {
            Console.WriteLine("class 1 func");
        }
    }

    internal class class2 : class1
    {
        public class2()
        {
            Console.WriteLine("class 2 constructre");
            Console.WriteLine("static is {0}", intStatic);
        }

        static class2()
        {
            Console.WriteLine("class 2 static construture");
            intStatic = 20;
        }

        public void abst()
        {
            Console.WriteLine("abst function class 2");
        }

        public new void func()
        {
            Console.WriteLine("class 2 func");
        }

        ~class2()
        {
            Console.WriteLine("class 2 destrucute");
        }
    }
}