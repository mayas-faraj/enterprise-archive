using System;

namespace SortAlgorithm
{
    class second
    {
        static void Main(string[] args)
        {
            //تعريف المصفوفة وتحديد الطول الأعظمي
            const int numOfItems = 15;
            string[] list = new string[numOfItems];
            int counter = 0;

            //قراءة العناصر من المستخدم
            Console.WriteLine("Input array list values with " + numOfItems + " element");
            Console.WriteLine();
            
            while (counter < numOfItems)
            {
                Console.WriteLine();
                Console.WriteLine("Enter element number {0}.", counter + 1);
                //تحويل بين نص إلى رقم من أجل التخزين
                list[counter] = Console.ReadLine();
                counter += 1;
            }

            //عرض قيم المصفوفة
            Console.WriteLine();
            Console.WriteLine("Output Array list values");

            counter = 0;

            while (counter < numOfItems)
            {
                Console.WriteLine("element number " + (counter + 1).ToString() + "] = " + list[counter].ToString());
                counter += 1;
            }

            //خوارزمية الترتيب

            //متحولات أساسية
            string[] tempList = new string[numOfItems];
            int x, y;

            //الترتيب
            for (x = 0; x < numOfItems; x++)
            {
                int index = 0;

                //إيجاد دليل العنصر أول عنصر لا يساوي -1
                for (y = 0; y < numOfItems; y++)
                    if (list[y] != "-1")
                        index = y;
                //إيجاد دليل العنصر الأصغر
                for (y = 0; y < numOfItems; y++)
                    if (list[y].CompareTo(list[index])<0 && list[y] != "-1")
                        index = y;

                //الحشر
                tempList[x] = list[index];
                list[index] = "-1";
            }

            //عرض القيم المصفوفة
            Console.WriteLine();
            Console.WriteLine("Output Array list values");

            counter = 0;
            while (counter < numOfItems)
            {
                Console.WriteLine("list after sort element " + (counter + 1).ToString() + " = " + tempList[counter].ToString());
                counter += 1;
            }

            
            Console.ReadLine();
        }
    }
}
