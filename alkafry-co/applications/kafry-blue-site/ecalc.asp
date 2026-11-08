<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>الحاسبة</title>
<meta name="description" content="الحاسبة عبر الأنترنت">
<link type="text/css" rel="stylesheet" href="input.css">
<%
language=request.cookies("language")
if language=0 then
	caption="الرجاء إدخال سعر العقار"
	firstpay="الدفعة الأولى"
	monthlypay="الدفعة الشهرية"
	imgsrc1="images/bot_enter.gif"
	imgsrc2="images/bot_clear.gif"
	alertempty="يرجى إدخال القيمة المراد حسابها في مربع النص"
	alerterror="القيمة المدخلة غير صحيحة , الرجاء إعادة الإدخال"
else
	caption="Please enter estate price"
	firstpay="First Pay"
	monthlypay="Monthly Pay"
	imgsrc1="images/bot_enter_eng.gif"
	imgsrc2="images/bot_clear_eng.gif"
	alertempty="Please enter a value on the text box"
	alerterror="error value , please put a long integer value"
end if
%>
<script language="vbscript">
function math()
if IsNumeric(txtprice.value)=true then
	txtfirst.value= int(txtprice.value * (35 / 100))
	txtmonth.value= int(txtprice.value * (65 / 100) / 84)
else if txtprice.value="" then
	alert "<%response.write alertempty%>"
else
	alert "<%response.write alerterror%>"
	clear()
end if
end if	
end function
function clear()
	txtprice.value=""
	txtfirst.value=""
	txtmonth.value=""
end function
</script>
</head>
<body scroll=no topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<div align="left">
<table border="0" width="203" id="table1" height="340" bgcolor="#99CCFF" style="border-style: solid; border-width: 5px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" cellspacing="0" cellpadding="0" bordercolor="#000099">
	<tr>
		<td colspan="3" height="28">
		<p align="center"><b><span style="font-size: 11pt"><%response.write caption%></span></b></td>
	</tr>
	<tr>
		<td colspan="3" height="31">
		<p align="center">
		<input type="text" name="txtprice" maxlength=30 size="33" style="background-color:#ffffcc"></td>
	</tr>
	<tr>
		<td colspan="2" height="31">
		<p align="center">
		<input type="text" name="txtfirst" maxlength=30 size="20" style="background-color:#ffffcc"></td>
		<td width="61" height="31">
		<p align="center"><font size="2"><%response.write firstpay%></font></td>
	</tr>
	<tr>
		<td colspan="2" height="31">
		<p align="center">
		<input type="text" name="txtmonth" maxlength=30 size="20" style="background-color:#ffffcc"></td>
		<td width="61" height="31">
		<p align="center"><font size="2"><%response.write monthlypay%></font></td>
	</tr>
	<tr>
		<td width="54" align="center" height="36">
		<input type="button" value="     1     " name="cmd1" onclick="txtprice.value = txtprice.value + '1'"></td>
		<td width="54" align="center" height="36">
		<input type="button" value="     2     " name="cmd2" onclick="txtprice.value = txtprice.value + '2'"></td>
		<td width="61" align="center" height="36">
		<input type="button" value="     3     " name="cmd3" onclick="txtprice.value = txtprice.value + '3'"></td>
	</tr>
	<tr>
		<td width="54" align="center" height="36">
		<input type="button" value="     4     " name="cmd4" onclick="txtprice.value = txtprice.value + '4'"></td>
		<td width="54" align="center" height="36">
		<input type="button" value="     5     " name="cmd5" onclick="txtprice.value = txtprice.value + '5'"></td>
		<td width="61" align="center" height="36">
		<input type="button" value="     6     " name="cmd6" onclick="txtprice.value = txtprice.value + '6'"></td>
	</tr>
	<tr>
		<td width="54" align="center" height="36">
		<input type="button" value="     7     " name="cmd7" onclick="txtprice.value = txtprice.value + '7'"></td>
		<td width="54" align="center" height="36">
		<input type="button" value="     8     " name="cmd8" onclick="txtprice.value = txtprice.value + '8'"></td>
		<td width="61" align="center" height="36">
		<input type="button" value="     9     " name="cmd9" onclick="txtprice.value = txtprice.value + '9'"></td>
	</tr>
	<tr>
		<td width="54" rowspan="3" align="center" valign="top">
		<img border="0" src=<%response.write imgsrc2%> width="50" height="60" onclick="clear()"></td>
		<td width="54" align="center" height="35">
		<input type="button" value="     0     " name="cmd0" onclick="txtprice.value = txtprice.value + '0'"></td>
		<td width="61" rowspan="3" align="center" valign="top">
		<img border="0" src=<%response.write imgsrc1%> width="50" height="60" onclick="math()"></td>
		</tr>
	<tr>
		<td width="54" align="center" height="36">
		<input type="button" value="    00    " name="cmd00" onclick="txtprice.value = txtprice.value + '00'"></td>
		</tr>
	<tr>
		<td width="54" align="center" height="40">&nbsp;</td>
	</tr>
</table>
</div>
</body>
</html>