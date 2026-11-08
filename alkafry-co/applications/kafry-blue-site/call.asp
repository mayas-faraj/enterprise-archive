<html dir="rtl">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>شركة الكفري للتسويق العقاري عبر الأنترنت</title>
<link type="text/css" href="style/style.css" rel="stylesheet">
<%
language=request.cookies("language")
if language=0 then
	con_caption="هواتف الوكلاء المعتمدون في المحافظات"
	con_dear="عزيزي الزائر"
	con_youcancall="بإمكانك الاتصال بنا على الأرقام التالية :"
	con_phone="هاتف"
	con_mobile="جوال"
	con_email="بريد إلكنروني :"
	con_site="موقعنا على الأنترنت :"
	con_theAdd="العنوان"
	con_address="عنوان الشركة : دمشق - أول طريق السيدة زينب - حي القزاز - بعد جامع التوحيد - طابق أول"
	con_procurator="أرقام هواتف الوكلاء المعتمدون في المحافظات :"
	con_city="المحافظة"
	con_name="إسم المعتمد"
	director="rtl"
else
	con_caption="Procurator Phone on the city"
	con_dear="Dear Visitor"
	con_youcancall="You can call our company on this phone number :"
	con_phone="phone"
	con_mobile="mobil"
	con_email="email :"
	con_site="our web site :"
	con_address="company address : Damascus - Kazaz - near the Touhed mosque - ALKAFRY COMPANY"
	con_procurator="Procurator phone number on the city :"
	con_theAdd="Address"
	con_city="city"
	con_name="procurator name"
	director="ltr"
end if
dim ADO,rs
set ADO=server.CreateObject("ADODB.Connection")
ADO.connectionstring="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.MapPath("details\procurator.mdb")
ADO.open
selectSQL="select * from procurator"
set RS=ADO.execute(selectSQL)
%>
</head>
<body scroll=yes>
<br>
<div align="center">
	<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table1" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center"><b><%response.write con_caption%></b></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
	<br>
	</div>
<div align="center">
<table border="0" width="752" id="table2" cellspacing="0" cellpadding="0" height="229">
	<tr>
		<td background="images/bcorner.gif" width="10" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="732" colspan="3"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr>
		<td width="10" background="images/r_border.gif">&nbsp;</td>
		<td width="9" bgcolor="#FFFFFF" valign="top">&nbsp;</td>
		<td width="717" bgcolor="#FFFFFF" valign="top" dir=<%response.write director%>><br>
		<b><%response.write con_dear%><br>
		<br>
		<%response.write con_youcancall%><br>
		<br><%response.write con_phone & " :"%>
		5415305/ 011 - 5418627/011 - 5415304/011<br>
		<%response.write con_mobile & " :"%>
		655042/093 - 904413/094<br>
		<%response.write con_email%>alkafry@alkafry.com<br>
		<%response.write con_site%>www.alkafry.com<br><%response.write con_address%>
		</b><p>&nbsp;</td>
		<td width="6" bgcolor="#FFFFFF" valign="top" align="left" dir=<%response.write director%>>&nbsp;</td>
		<td background="images/l_border.gif" width="10" height="210">&nbsp;</td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="10" height="10"></td>
		<td background="images/b_border.gif" height="9" colspan="3"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table>
<br>
</div>
<div align="center">
<table border="0" width="752" id="table3" cellspacing="0" cellpadding="0" height="229">
	<tr>
		<td background="images/bcorner.gif" width="10" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="732" colspan="3"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr>
		<td width="10" background="images/r_border.gif">&nbsp;</td>
		<td width="9" bgcolor="#FFFFFF" valign="top" align="right">&nbsp;</td>
		<td width="716" bgcolor="#FFFFFF" valign="baseline" dir=<%response.write director%> height="20"><br>
		<b><%response.write con_procurator%><br><br>
</b>
		<div align="center">
			<table border="1" width="95%" id="table6" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#0066CC">
				<tr>
					<td bgcolor="#FF99FF" valign="baseline" width="132"><b><center><%response.write con_city%></center></b></td>
					<td bgcolor="#FF99FF" valign="baseline" width="123"><b><center><%response.write con_name%></center></b></td>
					<td bgcolor="#FF99FF" valign="baseline" width="122"><b><center><%response.write con_phone%></center></b></td>
					<td bgcolor="#FF99FF" valign="baseline"><b><center><%response.write con_mobile%></center></b></td>
					<td bgcolor="#FF99FF" valign="baseline" width="172"><b><center><%response.write con_theadd%></center></b></td>
				</tr>
				<%if language=0 then%>
				<%do while not rs.eof%>
				<tr>
					<td bgcolor="#FF99FF" width="132"><b><center><%response.write rs("dbcity")%></center></b></td>
					<td width="123"><b><center><%response.write rs("dbname")%></center></b></td>
					<td width="122"><b><center><%response.write rs("dbphone")%></center></b></td>
					<td><b><center><%response.write rs("dbmobile")%></center></b></td>
					<td width="172"><b><center><%response.write rs("dbaddress")%></center></b></td>
				</tr>
				<%rs.movenext%>
				<%loop%>
				<%else%>
				<%do while not rs.eof%>
				<tr>
					<td bgcolor="#FF99FF" width="132"><b><center><%response.write rs("dbecity")%></center></b></td>
					<td width="123"><b><center><small><%response.write rs("dbename")%></small></center></b></td>
					<td width="122"><b><center><small><%response.write rs("dbphone")%></small></center></b></td>
					<td><b><center><small><%response.write rs("dbmobile")%></small></center></b></td>
					<td width="172"><b><center><small><%response.write rs("dbeaddress")%></small></center></b></td>
				</tr>
				<%rs.movenext%>
				<%loop%>
				<%end if%>
			</table>
			<p>&nbsp;</div>
		</td>
		<td width="8" bgcolor="#FFFFFF" valign="top" dir=<%response.write director%>>&nbsp;</td>
		<td background="images/l_border.gif" width="10" height="210">&nbsp;</td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="10" height="10"></td>
		<td background="images/b_border.gif" height="9" colspan="3"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table>
		</div><br>
	<div align="center">
	<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table5" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center">&nbsp;</td>
			<td width="70">
			<p align="left">
			<%if language=0 then%>
			<a target="_self" href="main.asp">
			<img border="0" src="images/botton_back.gif" width="70" height="20" align="middle"></a></td>
			<%else%>
			<a target="_self" href="main_en.asp">
			<img border="0" src="images/botton_back_eng.gif" width="70" height="20" align="middle"></a></td>
			<%end if%>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
</div>
<p>&nbsp;</p>
</body>
</html>