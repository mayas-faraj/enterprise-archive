using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Grades
{
    class Program
    {
        static void Main(string[] args)
        {
            //عدد المتسابقين - ثابت عدد صحيح
            const Int32 GAMES_NUMBER = 4;

            //أسماء الاعبين
            String S1, S2, S3;
            //متحولات حقيقية لتخزين المتوسطات الحسابية
            Single Av1 = 0, Av2 = 0, Av3 = 0;
            //متحول مؤقت
            Single tmpGrade;

            //إدخال أسماء الاعبين الثلاثة وتخزينها
            Console.WriteLine("Grades Project 1");
            Console.WriteLine("==============\n");

            Console.WriteLine("Enter the name of the first competitor?");
            S1 = Console.ReadLine();

            Console.WriteLine("Enter the name of the second competitor?");
            S2 = Console.ReadLine();

            Console.WriteLine("Enter the name of the third competitor?");
            S3 = Console.ReadLine();

            //من أجل كل لعبة
            // رماز التحقق من أن قيم كل درجة هي قيمة رقمية من نوع عدد صحيح بدقة مفردة
            //ومحصورة بين 0 و 20 درجة

            //المبدأ هو إستخدام متحول من نوع منطقي
            //تم إنشاء حلقة يتم تنفيذها مرة واحدة على الأقل لإدخال الدرجة
            //في حال قيمة المتحول isvalid
            //هي محققة بالتالي القيم المدخلة صحيحة ويتم الخروج من الحلقة

            //من أجل اللاعب الأول
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

                //تم أستخدام المتحول كمراكم - نوجد أولاً مجموع الدرجات
                Av1 += tmpGrade;
            }

            //نقسم على عدد الألعاب بالتالي نحصل على المتوسط الحسابي
            Av1 = Av1 / GAMES_NUMBER;

            //من أجل اللاعب الثاني
            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                Boolean isValid = false;

                do
                {

                    Console.WriteLine("please enter grade 0->20 to game number (" + (i + 1).ToString() + ") to competitor " + S2);

                    isValid = Single.TryParse(Console.ReadLine(), out tmpGrade);
                    isValid = isValid && (tmpGrade >= 0 && tmpGrade <= 20);

                } while (!isValid);

                Av2 += tmpGrade;
            }

            Av2 = Av2 / GAMES_NUMBER;

            //من أجل اللاعب الثالث
            for (Int32 i = 0; i < GAMES_NUMBER; i++)
            {
                Boolean isValid = false;

                do
                {
                    Console.WriteLine("please enter grade 0->20 to game number (" + (i + 1).ToString() + ") to competitor " + S3);

                    isValid = Single.TryParse(Console.ReadLine(), out tmpGrade);
                    isValid = isValid && (tmpGrade >= 0 && tmpGrade <= 20);

                } while (!isValid);

                Av3 += tmpGrade;
            }

            Av3 = Av3 / GAMES_NUMBER;

            //طباعة النتائج السابقة
            Console.WriteLine("\n\nResult of Races");
            Console.WriteLine("================");

            Console.WriteLine("name\taverage");
            Console.WriteLine("-----------------");
            Console.WriteLine(S1 + "\t" + Av1);
            Console.WriteLine(S2 + "\t" + Av2);
            Console.WriteLine(S3 + "\t" + Av3);

            //للإنهاء عند الضغط على أي زر
            Console.ReadKey();
        }
    }
}
