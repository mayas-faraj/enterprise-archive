<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myReport.aspx.cs" Inherits="myReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>Show Messages</title>
    <link type="text/css" rel="Stylesheet" href="App_Theme/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
    <table dir="ltr" width="100%" cellpadding="0" cellspacing="0" style="border-width:0;border-collapse:collapse;padding:0 0 0 0;">
    <tr>
    <td style="width:50%;background-image:url('App_Theme/oppg.gif'); background-repeat: repeat;"></td>
        <td style="width:50;height:200;"><img width="600" height="200" alt="bannar" src="App_Theme/bannar.jpg" />
            </td><td style="width:50%;background-image:url('App_Theme/oppb.gif'); background-repeat: repeat;"></td>
    </tr>
    </table>
    <font face="times new roman" size="6" color="Green">
        <br />
        <strong>My Report</strong></font><br /><br />
    <hr width="70%" size="2" color="silver" /></center>
        <div class="style1">
        <br />
        المرحلة 
        الأولى للمشروع كانت عن طريق بناء قاعدة البيانات حسب متطلبات المشروع , مخطط قاعدة 
        البيانات هو من الشكل<br />
        <br />
        <br />
    <img src="App_Theme/db.jpg" /><br />
        <br />
        لقد تم إستخدام الأوامر التالية من أجل بناء قاعدة البيانات:<br />
        <br />
        <br /></div>
        <div style="text-align: left">
        CREATE TABLE admins ( id INT IDENTITY(1,1) PRIMARY KEY, aname NVARCHAR(150) 
            unique not null, ename VARCHAR(75) unique not null, email VARCHAR(100), class 
            NVARCHAR(100) ); 
            <br />
            CREATE TABLE visitors ( id INT IDENTITY(1,1) PRIMARY KEY, name 
            NVARCHAR(150) unique not null, email VARCHAR(100), address NVARCHAR(250), ); 
            <br />
            CREATE TABLE topics ( id INT IDENTITY(1,1) PRIMARY KEY, name NVARCHAR(100) 
            unique not null ); 
            <br />
            CREATE TABLE threads ( id INT IDENTITY(1,1) PRIMARY KEY, 
            topicId INT FOREGIN KEY REFERENCES topics(id), name NVARCHAR(100) unique not 
            null );
            <br />
            CREATE TABLE messages ( id INT IDENTITY(1,1) PRIMARY KEY, threadId INT 
            FOREGIN KEY REFERENCES threads(id), subject NVARCHAR(250) not null, message 
            NTEXT, date DATETIME DEFAULT getDate(), email VARCHAR(100) ); 
            <br /></div>
            <br /><div style="text-align: right">
            لقد تم إنشاء الفهارس التالية :<br /></div><div style="text-align: left;direction:ltr;">
           CREATE INDEX idx_Name ON admins(name); 
            <br />
            CREATE INDEX idx_Visitiors ON 
            visitors(name); 
            <br />
            CREATE INDEX idx_messages ON messages(subject);<br />
            <br /></div><div style="text-align: right">
            حيث تم مراعات أن يكون الفهرس ممثلاً لحقل بيانات بياناته عادة لا تتكرر كقيمة 
            فريدة أو مفتاح رئيسيي من أجل الحصول على أفضل أداءء<br />
           لقد تم وضع الإجرائيات التالية<br /></div><div style="text-align: left;direction:ltr;">
            CREATE PROCEDURE insertNewAdmin (@iName NVARCHAR(150),@iName2,@iEmail 
            VARCHAR(100),@iClass NVARCHAR(100)) AS BEGIN INSERT INTO 
            admins(aname,ename,email,class) VALUES (@iName,@iName2,@iEmail,@iClass); END<br />
&nbsp;<br />
            CREATE PROCEDURE insertNewVisitor (@iName NVARCHAR(150),@iEmail 
            VARCHAR(100),@iAddress NVARCHAR(250)) AS BEGIN INSERT INTO<br />
&nbsp;visitors(name,email,address) VALUES (@iName,@iEmail,@iAddress); END<br />
&nbsp;<br />
            CREATE 
            PROCEDURE insertNewTopic (@iName NVARCHAR(100)) AS BEGIN INSERT INTO 
            topics(name) VALUES (@iName); END<br />
&nbsp;<br />
            CREATE PROCEDURE insertNewThreads (@iName 
            NVARCHAR(100),@iTopicId INT) AS BEGIN INSERT INTO threads(topicId,name) VALUES 
            (@iTopicId,@iName); ENDD<br />
            <br />
            CREATE PROCEDURE insertNewMessage (@iThreadId 
            INT,@iSubject NVARCHAR(250),@iEmail VARCHAR(100),@iMessage TEXT) AS BEGIN INSERT 
            INTO messages(threadId,subject,email,message) VALUES 
            (@iThreadId,@iSubject,@iEmail,@iMessage); END 
            <br /></div>
            <br /><div style="text-align: right">
            وهي إجرائيات إدخال كما هو مطلوب في المشروعع<br />
            وتم إنشاء منظر وحيد :<br /></div><div style="text-align: left;direction:ltr;">
            CREATE VIEW viewMessages AS SELECT topics.name as &#39;topic_name&#39;,threads.name as 
            &#39;threads_name&#39;,messages.subject,messages.date,messages.email FROM (messages 
            INNER JOIN threads ON messages.threadId=threads.id) INNER JOIN topics ON 
            threads.topicId=topics.id;</div><br />
            <br /><div style="text-align: right">
            لكون عرض العملية السابقة معقد بعض الشئ<br />
            <br />
            الإجرائيات المستخدمة في الموقع :<br />
            في الصفحة الرئيسية Default لم يتم إستخدام إجرائيات في الصفحة الخاصة برماز 
            البرنامج إنما تم دمج الشيفرة مع الصفحة الأساسية وكان هدف الرماز تحميل جميع 
            المواضيع وتضمينها بجدول كما طلب منا في المسألة<br />
            تم ذلك عبر كائن الإتصال بقاعدة البيانات حيث تم تأسيس الإتصال ثم الإستعلام عن 
            البيانات المتمثلة عناوين المواضيع ومعرف كل موضوع حيث أنه معرف الموضوع هو المرسل 
            بين الصفحات عن طريق عنوان الصفحة .<br />
            يمكن الوصول إلى أي موضوع عن طريق النقر علية لفتح صفحة المسارات المتعلقة بهذا 
            الموضوع حيث قمنا أولاً بالإستعلام عن معرف الموضوع وإجراء الإتصال بقاعدة البيانات 
            وتحميل جميع المسارات المتعلقة بهذا الموضوع ومعرفاتها أيضاً ليتسنى لنا إرسالها 
            للصفحة التالية الممثلة برسائل المسار المحدد.<br />
            هنالك خيار آخر متمثل في رابط يأخذنا لصفحة إنشاء مسار متعلق بموضوع.<br />
            لكل مسار رسالة واحدة على الأقل , بالتالي يتضمن نموذج إدخال رسالة جديدة ضمن 
            برنامجنا.<br />
            أولاً إسم المسار يجب أن يكون فريداً ولقد تم الأمر عن طريق الولوج لقاعدة البيانات 
            وإختيار المسار من جدول المسار الذي له الإسم المدخل ,إن تم إيجاده معناها أن الإسم 
            غير فريد وموجود مسبقاً وبالتالي يقوم كائن التحقق من إصدار رسالة خطأ للمستخدم 
            تدله على تغيير الإسم , نفس الخوارزمية أستخدمت من أجل التحقق أن إسم الموضوع فريد 
            عند إدخال موضوع جديد.<br />
            بعد ذلك تم التحقق أن الموضوع غير خالي وأن البريد المستخدم هو إسم نظامي لبريد 
            إلكتروني , والتاكد من أن الرسالة تحوي على خمس كلمات على الإقل وقد تم ذلك عن طريق 
            تقسيم نص الرسالة لمصفوفة كلمات حسب محرف المسافة ثم تم التحقق من أن عدد الكلمات 
            أكبر أو يساوي الخمسة .<br />
            تم إستخدام خوارزمية أخرى للتأكد من أن إسم الموضوع ونص الرسالة يحويان على الأقل 
            كلمة من كلمات إسم المسار , لقد تم تقسيم إسم المسار لمصفوفة من الكلمات ومن أجل كل 
            كلمة تم البحث عنها في موضوع الرسالة أو نصها ,في حال وجد واحدة على الأقل تم 
            التأشير لمتحول بولياني بالقيمة المحققة .<br />
            صفة الرسائل تم عرض الرسائل جميعاً من قاعدة البيانات وفق تاريخ الإرسال وتم وضع 
            نموذج إضافة رسالة جديدة بنفس طريقة الخوارزميات السابقة .<br />
         <br />
        </div>
        </div>
    </form>
</body>
</html>
