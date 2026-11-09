using System;

namespace HWCoding
{
    class Program
    {
        //الدالة الرئيسية لفك التشفير
        static void Main(string[] args)
        {
            //الكلمة المراد إدخالها من المستخدم لإعلام البرنامج عن نهاية الإدخال
            const Char stopKey = ' ';
            //متحول يمثل المحرف المدخل من قبل المستخدم
            Char currentChar;
            //متحول يمثل السلسلة النصية المشفرة
            String SC = "";
            //متحول يتمل السلسلة النصية الأصلية
            String S = "";

            Console.WriteLine("Enter Decoded Value to generate read String :");

            do
            {
                //قراءة محرف من المستخدم وتخزينة في المحرف المؤقت
                currentChar = Console.ReadKey().KeyChar;

                //إضافة المحرف بشكل مباشر للسلسلة النصية المشفرة كون المحرف المدخل يمثل محرف مشفراً
                SC += currentChar;

                //إختبار إذا كان المحرف المدخل خارج مجال الأحرف الاتينية الكبيرة فلاداعي لفك التشفير لأنه لا يمثل محرفاً مشفراً
                if (currentChar < 'A' || currentChar > 'Z')
                    S += currentChar;
                else
                {
                    //المحرف المدخل هو حرف لاتيني كبير فالمطلوب فك التشفير
                    //إختبار إذا ماكان المحرف بعد فك تشفيره ضمن مجال الأحرف الاتينية الكبيرة
                    //عندها تعديل المتحول الممثل للمحرف المدخل من قبل المستخدم بفك تشفيرة - تحويله لرقم وطرح إثنان منه وإعادة تحويله لحرف
                    if (Convert.ToChar(Convert.ToInt16(currentChar) - 2) >= 'A')
                        currentChar = Convert.ToChar(Convert.ToInt16(currentChar) - 2);
                    else
                        //معادلة فك التشفيل عندما يكون المحرف المدخل خارج مجال الأحرف اللاتينية الكبيرة
                        currentChar = Convert.ToChar((Convert.ToInt16(currentChar) - 2) + Convert.ToInt16('Z') + 1 - Convert.ToInt16('A'));
                    //إضافة المحرف بعد فك تشفيره للسلسلة النصية الأصلية
                    S += currentChar;
                }

            } while (currentChar != stopKey);

            //عرض النتائج
            Console.WriteLine();
            Console.WriteLine("Input String : " + SC);
            Console.WriteLine("Output String : " + S);

            //إنتظار أمر من المستخدم لإنهاء البرنامج
            Console.ReadKey();
        }
    }
}