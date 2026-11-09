using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Maniyat
{
    public static class Consts
    {
        public const String ERROR_VERIFICATIONCODE = "شيفرة التحقق خاطئة , يرجى إعادة الإدخال";
        public const String ERROR_USERNAMEORPASSWORD = "إسم المستخدم و/أو كلمة المرور خاطئة";
        public const String ERROR_APPLICATIONERROR = "عذراً ,لقد حدث خطأ أثناء تحميل الصفحة , سيتم تسجيل الخطأ, شكراً لزيارتكم الموقع";
        public const String ERROR_PASSWORDSNOTMACH = "كلمتا المرور المدخلتان غير متطابقتان";
        public const String ERROR_OLDPASSWORD = "كلمة المرور السابقة للمستخدم خاطئة ,يرجى إعادة الإدخال";
        public const String ERROR_NAMEEXISTS = "الأسم المدخل موجود مسبقاً";
        public const String ERROR_UPLOAD = "حدث خطأ أثناء محاولة تحميل الملف!";

        public const String MESSAGE_SENTMESSAGE = "رسالتكم أرسلت ,شكراً لزيارتكم الموقع";
        public const String MESSAGE_SENTADMINMESSAGE = "تم إرسال الرسالة بنجاج";

        public const String REQUIRED_NAME = "يرجى إدخال الإسم";
        public const String REQUIRED_EMAIL = "يرجى إدخال عنوان بريد إلكتروني صحيح";

        public const String TEXT_WELCOME = "مرحباً بك";
        public const String TEXT_MUSTLOGIN = "يجب عليك تسجيل الدخول لإستعراض هذه الصفحة";
        public const String TEXT_USERADDED = "لقد تم إضافة المستخدم بنجاح";
        public const String TEXT_ADD = "إضافة";
        public const String TEXT_EDIT = "تعديل";
        public const String TEXT_DELETE = "حذف";
        public const String TEXT_NAME = "الإسم";
        public const String TEXT_COMMENT = "وصف ";
        public const String TEXT_ISBN = "معرف الكتاب ";
        public const String TEXT_AUTHOR = "أسم الكاتب ";
        public const String TEXT_PAGESNUMBER = "عدد الصفحات ";
        public const String TEXT_DETAILS = "التفاصيل ";
        public const String TEXT_VALIDDATE = "تاريخ بدء الصلاحية ";
        public const String TEXT_EXPIERDATE = "تاريخ إنتهاء الصلاحية";
        public const String TEXT_PRODUCTDATE = "تاريخ الاصدار";
        public const String TEXT_UNTITLED = "بدون عنوان";
        public const String TEXT_NEWMESSAGE = "عدد الرسائل الجديدة";
        public const String TEXT_ADDNEWGROUP = "إضافة مجموعة جديدة";
        public const String TEXT_ADDNEWPRODUCT = "إضافة منتج جديد";
        public const String TEXT_EDITGROUP = "تعديل مجموعة";
        public const String TEXT_EDITPRODUCT = "تعديل منتج";
        public const String TEXT_HIDEPRODUCT = "اخفاء منتج";
        public const String TEXT_HIDEGROUP = "اخفاء مجموعة";
        public const String TEXT_SHOWPRODUCT = "اظهار منتج";
        public const String TEXT_SHOWGROUP = "اظهار مجموعة";
        public const String TEXT_PRODUCTSIN = " تفاصيل ";
        public const String TEXT_UPLOADCOMPLETE = "تحميل الملف تم بنجاح";


        public const String DATA_DOMAINNAME = "localhost";
        public const String DATA_DEFAULTEMAIL = "default@localhost.com";
        public const Int32 DATA_PORTNUMBER = 25;
        public const String DATA_DATEFORMAT = "M/d/yyyy";
        public const String DATA_DATEUSERFORMAT = "d/M/yyyy";
        public const String DATA_PRODUCTIMAGESLOCATION = "primages";
        public const String DATA_GROUPIMAGESLOCATION = "grimages";
        public const String DATA_DEFAULTIMAGEPRODUCT = "default2.jpg";
        public const String DATA_DEFAULTIMAGEGROUP = "default1.jpg";
        public const Int32 DATA_PRODUCTTABLECOLUMNS = 3;
        public const Int32 DATA_PRODUCTIMAGEWIDTH = 80;
        public const Int32 DATA_PRODUCTIMAGEHEIGHT = 80;
        public const Int32 DATA_PRODUCTIMAGEFULLWIDTH = 200;
        public const Int32 DATA_PRODUCTIMAGEFULLHEIGHT = 200;
        public const Int32 DATA_GROUPIMAGEWIDTH = 80;
        public const Int32 DATA_GROUPIMAGEHEIGHT = 80;
        public const Int32 DATA_LIBRARYROOTID = 3;
    }
}