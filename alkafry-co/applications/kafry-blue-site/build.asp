<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<html dir="rtl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>عقارات شركة الكفري</title>
<link type="text/css" href="style/style.css" rel="stylesheet">
<%
bytct=request.QueryString("bytct")
errdes=request.QueryString("errdes")
language=request.cookies("language")
dim flat(1),store(1),ground(1),build(1),vela(1),project(1),caption(1),welcome(1),emptybuild(1),imgsrc(1)
flat(0)="شقق"
flat(1)="Flats"
store(0)="محلات"
store(1)="Stores"
ground(0)="أراضي"
ground(1)="Lands"
build(0)="عقارات"
build(1)="Buildings"
vela(0)="فيلات"
vela(1)="Villas"
project(0)="مشاريع"
project(1)="Projects"
caption(0)="الدليل العقاري لمحافظة"
caption(1)="The Estate Guide For "
imgsrc(0)="images/botton_back.gif"
imgsrc(1)="images/botton_back_eng.gif"
select case bytct
	case 11
		strct="دمشق"
		strect="Damascus"
	case 16
		strct="السويداء"
		strect="Swaidaa"
	case 15
		strct="درعا"
		strect="Daraa"
	case 41
		strct="اللاذقية"
		strect="Latakia"
	case 43
		strct="طرطوس"
		strect="Tartos"
	case 21
		strct="حلب"
		strect="Aleppo"
	case 31
		strct="حمص"
		strect="Homs"
	case 33
		strct="حماة"
		strect="Hama"
	case 23
		strct="إدلب"
		strect="Edleb"
	case 22
		strct="الرقة"
		strect="Raqa"
	case 51
		strct="دير الزور"
		strect="Der alZoor"
	case 52
		strct="الحسكة"
		strect="Hasakah"
end select
if language=0 then thiscity=strct else thiscity=strect
welcome(0)="مرحباً بك في الدليل العقاري لمحافظة " & thiscity & ", إختر نوع العقار الذي تريد لمشاهدة التفاصيل" 
welcome(1)="Welcome in the estate guide for " & thiscity & " , Choose the estate kind that you want to see the details ."
emptybuild(0)=" لا توجد أي تفاصيل عن العقار المطلوب حالياً في محافظة, , عذراً" & thiscity
emptybuild(1)="Sorry , There aren't any details for this estate up to date in " & thiscity

%>
</head>

<body bgcolor="#99CCFF">

<p align="center"><strong><%response.write caption(language) & " " & thiscity %></strong></p>
<div align="center">
<table border="0" width="752" id="table1" cellspacing="0" cellpadding="0" bgcolor="#0066CC">
	<tr>
		<td background="images/bcorner.gif" width="10" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="737" colspan="6"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr align="center">
		<td width="10" background="images/r_border.gif" rowspan="2">&nbsp;</td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=0&bytct=<%=bytct%>" target="content">
		<img border="0" src="images/build_flat.gif" width="50" height="50"></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=1&bytct=<%=bytct%>" target="content">
	<img border="0" src="images/build_store.gif" width="50" height="50"></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=2&bytct=<%=bytct%>" target="content">
		<img border="0" src="images/build_ground.gif" width="50" height="50"></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=3&bytct=<%=bytct%>" target="content">
	<img border="0" src="images/build_build.gif" width="50" height="50" align="center"></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=4&bytct=<%=bytct%>" target="content">
		<img border="0" src="images/build_vela.gif" width="50" height="50" align="center"></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=5&bytct=<%=bytct%>" target="content">
	<img border="0" src="images/build_project.gif" width="50" height="50"></a></td>
		<td background="images/l_border.gif" width="10" height="90" rowspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><a href="show.asp?bytbl=0&bytct=<%=bytct%>" target="content">
		<%response.write flat(language)%></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><div align="center">
		<div align="center"><a href="show.asp?bytbl=1&bytct=<%=bytct%>" target="content">
			<%response.write store(language)%></a></div></div></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><div align="center">
		<a href="show.asp?bytbl=2&bytct=<%=bytct%>" target="content"><%response.write ground(language)%></a></div></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center">
		<p align="center"><a href="show.asp?bytbl=3&bytct=<%=bytct%>" target="content">
		<%response.write build(language)%></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center">
		<p align="center">
		<a href="show.asp?bytbl=4&bytct=<%=bytct%>" target="content"><%response.write vela(language)%></a></td>
		<td width="122" bgcolor="#99CCFF" valign="top" align="center"><div align="center"><a href="show.asp?bytbl=5&bytct=<%=bytct%>" target="content">
			<%response.write project(language)%></a></div></td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="10"></td>
		<td background="images/b_border.gif" height="10" colspan="6"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table>
		

<p>&nbsp;</div>

		

<div align="center">
<table border="0" width="752" id="table2" cellspacing="0" cellpadding="0" bgcolor="#0066CC">
	<tr>
		<td background="images/bcorner.gif" width="10" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="737"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr align="center">
		<td width="10" background="images/r_border.gif">&nbsp;</td>
		<td width="732" bgcolor="#99CCFF" valign="top" align="center">
		<b><%response.write welcome(language)%></b><font color=red><b><br>
		<%if errdes="emptypa" then response.write emptybuild(language)%>
		</b></font>
		</td>
		<td background="images/l_border.gif" width="10" height="90">&nbsp;</td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="10"></td>
		<td background="images/b_border.gif" height="10"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table><br><a href="cities.asp" target="content">
<img src=<%response.write imgsrc(language)%> border="0"></a>
</div>

		

</html>