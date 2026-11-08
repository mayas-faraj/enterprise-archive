<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir=rtl>
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>شركة الكفري - إرسال التفاصيل</title>
<link type="text/css" href="style/style.css" rel="stylesheet">
<link type="text/css" href="style/input.css" rel="stylesheet">
</head>
<body bgcolor="#99CCFF">
<center><font face="Arial"><b>أدخل تفاصيل أي شيء تريد بيعه أو شرائه</b></font><br>
<%
report=request.querystring("report")
if report="emna" then 
response.write "<b><font color=red>يرجى إدخال الإسم</font></b>"	
else if report="emph" then 
response.write "<b><font color=red>يرجى إدخال رقم الهاتف</font></b>"
else if report="ok" then
response.write "<b><font color=#0066cc>تم إرسال تفاصيل العقار , شكراً لك</font></b>"
else 
response.write ""
end if
end if
end if
%></center>
<basefont face="Arial Unicode MS,arial" size="2" color="#000099">
<form method="POST" action="save_email.asp" name="frmmail">
		<div align="center">
<table width="39%" cols=2 border=1 height="400" bordercolor="#000099" style="border-collapse: collapse" cellspacing="0" cellpadding="2">
<tr><td height="23" width="114" align="center"> <font size="2">الاسم*</font></td>
	<td height="23" align="center"> 
		<p>
		<input class="mail" type="text" name="txtname" size="30" dir="rtl" tabindex="0" maxlength="30"></p>
	</td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">نوع الطلب</font></td>
	<td height="23" align="center"> 
	<select size="1" name="txtkind" tabindex="1">
	<option selected value="sell">بيع</option>
	<option value="buy">شراء</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">تفاصيل الطلب</font></td>
	<td height="23" align="center"> 
	<select size="1" name="txtbuild" tabindex="2">
	<option selected value="flat">شقة</option>
	<option value="store">محل</option>
	<option value="ground">أرض</option>
	<option value="build">عقار</option>
	<option value="vela">فيلا</option>
	<option value="tour">مشروع سياحي</option>
	<option value="tour">غير ذلك</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">المساحة</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtspace" size="30" dir="rtl" tabindex="3" maxlength="30" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">السعر</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtprice" size="30" dir="rtl" tabindex="4" maxlength="50" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">المحافظة</font></td>
	<td height="23" align="center"> 
	<select size="1" name="txtcity" tabindex="5">
	<option selected value="damas">دمشق</option>
	<option value="swida">السويداء</option>
	<option value="daraa">درعا</option>
	<option value="latakia">اللاذقية</option>
	<option value="tartous">طرطوس</option>
	<option value="homs">حمص</option>
	<option value="aleppo">حلب</option>
	<option value="hama">حماة</option>
	<option value="idleb">إدلب</option>
	<option value="raqa">الرقة</option>
	<option value="zor">دير الزور</option>
	<option value="hasaka">الحسكة</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">العنوان</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtaddress" size="30" dir="rtl" tabindex="6" maxlength="100" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"> <font size="2">الهاتف*</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtphone" size="30" dir="rtl" tabindex="7" maxlength="30" class="mail"></td></tr>
<tr>
	<td height="23" width="114" align="center"> <font size="2">البريد الإلكتروني</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtemail" size="30" dir="rtl" tabindex="8" maxlength="40" class="mail"></td>
</tr>
<tr>
	<td height="23" width="114" align="center"> <font size="2">الوصف</font></td>
	<td height="10" align="center" rowspan="2" valign="top"> 
	<textarea rows="7" name="txtdescription" cols="25" tabindex="9"></textarea></td>
</tr>
<tr>
	<td height="54" width="114" align="center">&nbsp;</td>
	</tr>
<tr><td height="23" width="114" align="center"> 
	<input type="reset" value="   مسح   " name="cmdclear" dir="rtl" tabindex="11"></td>
	<td height="23" align="center"> 
	<input type="submit" value="إرسال المعلومات" name="cmdsave" dir="rtl" tabindex="10"></td></tr>
</table>
		</div>
</form>
</body>
</html>