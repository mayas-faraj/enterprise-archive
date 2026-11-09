using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReflectionTest
{
    class Person
    {
        public Person()
        {
            Count++;
        }

        public String Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public Int32 Age { get; set; }

        public static Int32 Count;

        public String name;

        public DateTime GetBirthDate()
        {
            return DateTime.Now.Subtract(new TimeSpan((int)(Age * 364.25), 0, 0, 0, 0));
        }
    }

    class Employee : Person
    {
        public Double Salary;
    }

    class Program
    {
        static void Main(string[] args)
        {
            Type t = typeof(Employee);
            Employee e = new Employee();
            e.Age = 28;

            try
            {
                foreach (System.Reflection.FieldInfo pi in t.GetFields())
                {
                    try
                    {

                        Console.WriteLine("Name: {0}", pi.Name);
                        //Console.WriteLine("IsStatic: {0}", pi.CanRead);
                        //Console.WriteLine("IsPublic: {0}", pi.CanWrite);
                        Console.WriteLine("ReturnType: {0}", pi.DeclaringType);
                        pi.SetValue(e, 40);
                        Console.WriteLine("Get Value of e: {0}", pi.GetValue(e));
                        Console.WriteLine();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.Read();
        }
    }
}
