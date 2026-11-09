using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Grades2
{
    class Program
    {
        static void Main(string[] args)
        {
            //عدد المتسابقين - ثابت عدد صحيح
            const Int32 GAMES_NUMBER = 4;

            //أسماء الاعبين
            String S1, S2, S3;

            //جداول البيانات المطلوبة , من نوع عدد حقيقي بطول محدد بعدد الألعاب
            Single[] A1 = new Single[GAMES_NUMBER];
            Single[] A2 = new Single[GAMES_NUMBER];
            Single[] A3 = new Single[GAMES_NUMBER];

            //متحولات حقيقية لتخزين المتوسطات الحسابية
            Single Av1 = 0, Av2 = 0, Av3 = 0;

            //القيم العظمى لدرجة كل متسابق
            Single max1 = 0, max2 = 0, max3 = 0;
            
            //متحول مؤقت
            Single tmpGrade;

            //إدخال النتائج
            Console.WriteLine("Grades Project 2");
            Console.WriteLine("==============\n");

            //إدخال إسم المتسابق الأول
            Console.WriteLine("Enter the name of the first competitor?");
            S1 = Console.ReadLine();

            //نكرر حسب عدد الألعاب
            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                //متحول منطقي يدل على أن المدخلات صحيحة
                Boolean isValid = false;

                do
                {
                    Console.WriteLine("please enter grade 0->20 to game number (" + (i + 1).ToString() + ") to competitor " + S1);

                    //يكون المدخل صحيحاً إن كان عدداً حقيقياً
                    isValid = Single.TryParse(Console.ReadLine(), out tmpGrade);
                    //وأيضاً يكون المدخل صحيحاً إذا كان مجال العدد المدخل من 0 حتى 20
                    isValid = isValid && (tmpGrade >= 0 && tmpGrade <= 20);
                    //تم وضع && بين الشرطين للدلالة أن المدخلات الصحيحة تحقق الشرط الأول ---و--- الشرط الثاني

                } while (!isValid);
                //إن المدخل غير صحيح يتم التكرار

                //تخزين قيمة الدرجة في الجدول الخاص بالاعب الأول 
                A1[i] = tmpGrade;
            }

            //نفس الخوارزمية السابقة من أجل اللاعب الثاني
            Console.WriteLine("Enter the name of the second competitor?");
            S2 = Console.ReadLine();

            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                Boolean isValid = false;

                do
                {
                    Console.WriteLine("please enter grade 0->20 to game number (" + (i + 1).ToString() + ") to competitor " + S2);

                    isValid = Single.TryParse(Console.ReadLine(), out tmpGrade);
                    isValid = isValid && (tmpGrade >= 0 && tmpGrade <= 20);

                } while (!isValid);

                A2[i] = tmpGrade;
            }

            //نفس الخوارزمية السابقة من أجل اللاعب الثالث
            Console.WriteLine("Enter the name of the third competitor?");
            S3 = Console.ReadLine();

            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                Boolean isValid = false;

                do
                {
                    Console.WriteLine("please enter grade 0->20 to game number (" + (i + 1).ToString() + ") to competitor " + S3);

                    isValid = Single.TryParse(Console.ReadLine(), out tmpGrade);
                    isValid = isValid && (tmpGrade >= 0 && tmpGrade <= 20);

                } while (!isValid);

                A3[i] = tmpGrade;
            }

            //حساب القيم المطلوبة من أجل كل لعبة في الجداول الثلاث
            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                //مجموع الدرجات
                Av1 += A1[i];
                Av2 += A2[i];
                Av3 += A3[i];

                //حساب الدرجة العظمى - من أجل الدرجة الحالية في الجدول أكبر من أكبر قيمة سابقة حفظ تلك القيمة
                if (max1 < A1[i])
                    max1 = A1[i];

                if (max2 < A2[i])
                    max2 = A2[i];

                if (max3 < A3[i])
                    max3 = A3[i];
            }

            //تقسيم مجموع الدرجات على عدد الألعاب لحساب المتوسط الحسابي
            Av1 = Av1 / GAMES_NUMBER;
            Av2 = Av2 / GAMES_NUMBER;
            Av3 = Av3 / GAMES_NUMBER;

            //طباعة النتائج السابقة
            Console.WriteLine("\n\nResult of Races");
            Console.WriteLine("================");

            Console.WriteLine("name\taverage\tmax");
            Console.WriteLine("-----------------");
            Console.WriteLine(S1 + "\t" + Av1 + "\t" + max1);
            Console.WriteLine(S2 + "\t" + Av2 + "\t" + max2);
            Console.WriteLine(S3 + "\t" + Av3 + "\t" + max3);

            //للإنهاء عند الضغط على أي زر
            Console.ReadKey();
        }
    }
}
