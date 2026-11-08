using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HomeWorkCoding
{
    class Program
    {
        static void Main(string[] args)
        {
            //متحول يمثل محرف بداية مجال المحارف المشفرة وفق نظام يونيكود
            const Int16 A = 65;
            //متحول يمثل محرف نهاية مجال المحارف المشفرة وفق نظام يونيكود
            const Int16 Z = 90;
            //محرف يمثل المسافة لإنهاء إدخال السلسلة المشفرة
            const Int16 space = 32;
            //متحول مؤقت يمثل شيفرة محرف  وفق نظام اليونيكود
            Int16 chr = 0;

            //متحولان يمثلان السلسلة النصية الأصلية والمشفرة على الترتيب
            String S = "";
            String SC = "";

            //عبارة إدخال النص المشفر من قبل المستخدم
            Console.WriteLine("wait to process decoded string by press space from user :");

            //طالما المستخدم لم يضغط زر المسافة
            while (chr != space)
            {
                //قراءة المحرف المدخل من المستخدم وتخزينه على شكل شيفرة مكافئة وفق نظام اليونيكود
                chr = (Int16)Console.ReadKey().KeyChar;
                //إضافة المحرف للسلسلة المشفرة
                SC = SC + (Char)chr;

                //إذا كان المحرف المدخل ضمن مجال المحارف المشفرة - المحارف اللاتينية الكبيرة
                if (chr >= A && chr <= Z)
                {
                    //إذا كان تدوير المحرف يقع ضمن مجال المحارف اللاتينية الكبيرة
                    if (chr >= A + 2)
                        //فك تشفير المحرف
                        chr = (Int16)(chr - 2);
                    //تدوير المحرف
                    else
                        chr = (Int16)(chr + (Z - A) - 1);
                }

                //إضافة المحرف بعد فك التشفير للسلسلة النصية المفكك تشفيرها
                S = S + (Char)chr;
            }

            //طباعة نتائج الخرج على الشاشة
            Console.WriteLine("\nResult :");
            Console.WriteLine("user value (coded) : " + SC);
            Console.WriteLine("orginal value (encoded) : " + S);

            //إنتظار المستخدم لإدخال أمر إنهاء البرنامج - ضغط أي زر
            Console.ReadKey();
        }
    }
}
