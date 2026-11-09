using System;
//أستيراد فضاء الأسماء من أجل أسماء المتحولات
//فضاء الأسماء الخاص بالبرنامج
namespace HWCoding
{
    class Program
    {
        //الدالة الرئيسية للبرنامج
        static void Main(string[] args)
        {
            //ثابت محرفي يمثل الكلمة المراد إرسالها من المستخدم لإنهاء عملية الإدخال
            const Char stopKey = ' ';
            //متغيرات البرنامج - محرف مؤقت - السلسلة النصية الاصلية - السلسلة النصية المشفرة
            Char currentChar;
            String S = "";
            String SC = "";

            Console.WriteLine("Enter String Value to Decode :");

            //حلفة تكرارية لمتابعة كل كلمة مدخلة من قبل المستخدم طالما لم تكن هذه الكلمة هي كلمة إنهاء الإدخال
            do
            {
                currentChar = Console.ReadKey().KeyChar;
                //يتم إضافة المحرف المدخل من قبل المستخدم للسلسلة النصية الأصلية - قبل التشفير
                S += currentChar;
                //المطلوب تشفير الأحرف الاتينية الكببرة فقط بالتالي إن كان المحرف المدخل من قبل المستخدم خارج مجال الأحرف اللاتينية الكبيرة لا يتم تشفيرة
                //ويضاف بشكل مباشر إلى السلسلة المشفرة - سلسلة الخرج
                if (currentChar < 'A' || currentChar > 'Z')
                    SC += currentChar;
                else
                {
                    //هنا المحرف المدخل هو حرف لاتيني كبير بالتالي يجب تشفيره

                    //يتم إختبار إن كان المحرف المدخل بعد تحويله لرقم 2 بايت (نظام المحارف في الدوت نت هو نظام يونيكود أي 2 بايت) وإضافة رقم 2 له
                    //إن كان المحرف الجديد يقع ضمن مجال الأحرف الأبجدية الكبيرة أي أصغر من أخر حرف يتم تعديل المحرف المرسل بشكل مباشر
                    if (Convert.ToChar(Convert.ToInt16(currentChar) + 2) <= 'Z')
                        currentChar = Convert.ToChar(Convert.ToInt16(currentChar) + 2);
                    //وإلا فسوف يتم تدوير المحرف وفق المعادلة التالية
                    else
                        currentChar = Convert.ToChar((Convert.ToInt16(currentChar) + 2) % (Convert.ToInt16('Z') + 1) + Convert.ToInt16('A'));
                    //تخزين المحرف المشفر
                    SC += currentChar;
                }
                
            } while (currentChar != stopKey);

            //طباعة نتائج الخرج
            Console.WriteLine();
            Console.WriteLine("Input String : " + S);
            Console.WriteLine("Output String : " + SC);

            //إنتظار أمر من المستخدم لإغلاق التطبيق
            Console.ReadKey();
        }
    }
}