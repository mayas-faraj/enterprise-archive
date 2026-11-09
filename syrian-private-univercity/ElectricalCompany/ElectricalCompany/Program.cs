using System;

namespace ElectricalCompany
{
    class Program
    {
        static void Main(string[] args)
        {
            //main table defention
            //تعريف المتحولات الأساسية وهي جدول القيم
            //جدول القيم هي مصفوفة ثنائية البعد نوع نصي لتخزين الأسم وقيمة الأستهلاء
            //متحولين أحدهما لعدد القيم الأعظمي للمستخدمين والآخر من أجل دليل العنصر الأكبر في المصفوفة
            string[,] table = new String[2, 20];
            int num = 20;
            int max = 0;

            //inputing values
            //عملية الأدخال تتم عن طريق حلقة تكرارية بمعدل 20 مرة

            Console.WriteLine("(input)");
            //output test
            Console.WriteLine("Please Enter the customer information");
            Console.WriteLine("enter the consume and press enter then enter the name");

            for (int i = 0; i < num; i++)
            {
                //input text
                //أدخال قيمة الأستهلاك
                table[0, i] = Console.ReadLine();

                //الخروج من أجل القيم السالبة وحفظ عدد القيم المدخلة
                if (int.Parse(table[0, i]) < 0)
                {
                    num = i;
                    break;
                }

                //في حال القيمة المدخلة أكبر من قيمة سابقة يتم تخزين دليل تلك القيمة
                if (int.Parse(table[0, i]) > int.Parse(table[0, max]))
                    max = i;

                //قراءة أسم المشترك
                table[1, i] = Console.ReadLine();


            }


            Console.WriteLine();
            Console.WriteLine("End of inputting by user");

            //math the consume price
            //طباعة الجدول
            Console.WriteLine("(output)");
            Console.WriteLine("Name\tConsume\tPrice");

            //متغيرات مؤقتة لحفظ مجموع القيم للأسعار
            //وحفظ السعر الأكبر
            double sum = 0;
            double maxprice = 0;

            //من أجل كل عنصر في الجدول
            for (int i = 0; i < num; i++)
            {
                //طباعة الأسم والأستهلاك
                Console.Write(table[1, i] + "\t");
                Console.Write(table[0, i] + "\t");

                //تحويل المدخل النصي الممثل للأستهلاك لقيمة رقمية
                //ومتغير لحساب السعر
                int comsume = int.Parse(table[0, i]);
                double price = 0;

                //في حال السعر أكبر من 3000
                if (comsume > 3000)
                {
                    price += (comsume - 3000) * 5;
                    comsume = 3000;
                }

                //في حال السعر أكبر من 2000
                if (comsume > 2000)
                {
                    price += (comsume - 2000) * 1;
                    comsume = 2000;
                }

                //السعر المتبقي
                price += comsume * .5;

                //مجموع الأسعار
                sum += price;

                Console.Write(price.ToString("#.#"));
                Console.WriteLine();

                if (price > maxprice)
                    maxprice = price;
            }

            //طباعة المتوسط وهو السعر تقسيم العدد
            Console.WriteLine();
            Console.WriteLine("Average={0}", (sum / num).ToString("#.#"));

            //طباعة القيمة العظمى
            Console.WriteLine();
            Console.WriteLine("Max={0}", maxprice.ToString("#.#"));
            Console.WriteLine("Customer:{0}", table[1, max]);

            Console.ReadLine();
        }
    }
}

