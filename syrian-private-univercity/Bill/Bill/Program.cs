using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bill
{
    class Program
    {
        private const Int32 MAX = 20;

        static void Main(String[] args)
        {
            //تعريف الجدول وفق ما يلي : أسم - الأستهلاك - القيمة
            String[,] table = new string[MAX, 3];

            //تعريف متغيرات عداد, متوسط حسابي, فهرس القيمة العظمى للأستهلاك
            Int32 counter = 0;
            Single average = 0;
            Int32 maxIndex = 0;

            Console.WriteLine("(input)");

            //من أجل العداد أقل من 20
            while (counter < MAX)
            {
                //إدخال الأستهلاك
                table[counter, 1] = Console.ReadLine();

                //متغير السعر وكمية الأستهلاك
                Single prc = 0;
                Single con = System.Convert.ToSingle(table[counter, 1]);

                //قيمة سالبة للخروج
                if (con < 0)
                {
                    break;
                }

                //أدخال الأسم
                table[counter, 0] = Console.ReadLine();

                //الشريحة الثالثة
                if (con > 3000)
                {
                    prc = prc + (con - 3000) * 5;
                    con = 3000;
                }

                //الشريحة الثانية
                if (prc > 2000)
                {
                    prc = prc + (con - 2000);
                    con = 2000;
                }

                //الشريحة الأساسية
                prc = prc + Convert.ToSingle(con * .5);

                //المتوسط الحسابي
                average = average + prc;

                //حفظ سعر الأستهلاك
                table[counter, 2] = prc.ToString("#.0");

                //أختبار القيمة السعرية أكبر من القيمة العظمى السابقة
                if (Convert.ToSingle(table[maxIndex, 2]) < prc)
                    //قيمة عظمى جديدة
                    maxIndex = counter;

                //زيادة العداد بمقدار واحد
                counter++;
            }

            //المتوسط هو المجموع على عدد العناصر
            average = average / (counter);

            //جدول الخرج
            Console.WriteLine("(output)");
            Console.WriteLine("Name\tConsume\tPrice");

            //عداد حلقة الخرج
            Int32 counter2 = 0;

            //حلقة الخرج لطباعة كافة العناصر المدخلة
            while (counter2 < counter)
            {
                Console.WriteLine(table[counter2, 0] + "\t" + table[counter2, 1] + "\t" + table[counter2, 2]);
                counter2++;
            }

            //عرض القيم الأحصائية المطلوبة
            Console.WriteLine();
            Console.WriteLine("Average=" + average.ToString("#.0"));
            Console.WriteLine();
            Console.WriteLine("Max=" + table[maxIndex, 2]);
            Console.WriteLine("Consumer:" + table[maxIndex, 0]);

            //لتثبيت الشاشة
            Console.ReadLine();
        }
    }
}
