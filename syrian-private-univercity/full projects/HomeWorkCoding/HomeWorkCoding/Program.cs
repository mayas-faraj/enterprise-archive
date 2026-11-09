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
            //ثابت يمثل شيفرة الحرف وفق نظام يونيكود يمثل بداية مجال التشفير
            const Int16 A = 65;
            //ثابت يمثل شيفرة الحرف وفق نظام يونيكود يمثل نهاية مجال التشفير
            const Int16 Z = 90;
            //ثابت يمثل شيفرة الفراغ وفق نظام يونيكود لإنشاء كلمة التوقف عن إدخال السلسلسة
            const Int16 space = 32;

            //متحول مؤقت يمثل محرف
            Int16 chr = 0;

            //السلسلة النصية الأصلية
            String S = "";
            //السلسلة النصية المشفرة
            String SC = "";

            //عبارة الإدخال للمستخدم
            Console.WriteLine("wait to press space from user to process input string :");

            //حلقة تتكرر طالما لم يتم إدخال محرف التوقف أي الفراغ
            while (chr != space)
            {
                //عملية حفظ المحرف المدخل في المتحول المؤقت بعد تحويله لعدد
                chr = (Int16)Console.ReadKey().KeyChar;
                
                //إضافة العدد المدخل على السلسلة النصية الأصلية
                S = S + (Char)chr;

                //من أجل المحرف المدخل هو حرف لاتيني كبير أي يجب التشفير
                if (chr >= A && chr <= Z)
                {
                    //من أجل أن قيمة المحرف بعد التشفير يقع ضمن مجال الأحرف اللاتينية الكبيرة
                    if (chr <= Z - 2)
                        //عملية التشفير بإضافة 2 وتحويل الرقم الناتج لمحرف
                        chr = (Int16)(chr + 2);
                    //تدوير المحرف لأنه خارج نطاق الأحرف
                    else
                        chr = (Int16)(chr - (Z - A) + 1);
                }
                //إضافة المحرف المشفر للسلسلة المشفرة
                SC = SC + (Char)chr;
            }

            //طباعة الخرج على الشاشة
            Console.WriteLine("\nResult :");
            Console.WriteLine("user value : " + S);
            Console.WriteLine("coded value : " + SC);

            //الإنتظار لإنهاء البرنامج عند الضفظ على أي محرف
            Console.ReadKey();
        }
    }
}
