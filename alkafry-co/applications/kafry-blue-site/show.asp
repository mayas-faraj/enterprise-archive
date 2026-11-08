<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<html dir="rtl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<link type="text/css" href="style/style.css" rel="stylesheet">
<title>شركة الكفري للتسويق العقاري عبر الأنترنت</title>
<%
pa=request.QueryString("pa")
bytbl=request.QueryString("bytbl")
bytct=request.QueryString("bytct")
tblnum=request.QueryString("tblnum")
language=request.cookies("language")
dim arrpage(20),caption(1),direct(1)
arrpage(1)="الأولى"
arrpage(2)="الثانية"
arrpage(3)="الثالثة"
arrpage(4)="الرابعة"
arrpage(5)="الخامسة"
arrpage(6)="السادسة"
arrpage(7)="السابعة"
arrpage(8)="الثامنة"
arrpage(9)="التاسعة"
arrpage(10)="العاشرة"
arrpage(11)="first"
arrpage(12)="second"
arrpage(13)="third"
arrpage(14)="fourth"
arrpage(15)="fifth"
arrpage(16)="sixth"
arrpage(17)="seventh"
arrpage(18)="eighth"
arrpage(19)="ninth"
arrpage(20)="tenth"
direct(0)="rtl"
direct(1)="ltr"
select case bytbl
case 0
	strbl="ش"
	strblname="شقق"
	streblname="flats"
case 1
	strbl="م"
	strblname="محلات"
	streblname="stores"
case 2
	strbl="ض"
	strblname="أراضي"
	streblname="lands"
case 3
	strbl="ع"
	strblname="عقارات"
	streblname="buildings"
case 4
	strbl="ف"
	strblname="فيلات"
	streblname="villas"
case 5
	strbl="ي"
	strblname="مشاريع"
	streblname="projects"
end select
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
		strect="Edlib"
	case 22
		strct="الرقة"
		strect="Raqa"
	case 51
		strct="دير الزور"
		strect="Der alZor"
	case 52
		strct="الحسكة"
		strect="Hasakah"
end select
if language=0 then
	thisbuild=strblname
	thiscity=strct
	button_calc="images/botton_calc.gif"
	button_back="images/botton_back.gif"
	con_numberid="رقم التعامل"
	con_address="العنوان"
	con_espace="المساحة"
	con_price="السعر"
	con_details="الوصف"
	con_preview="المعاينة"
else
	thisbuild=streblname
	thiscity=strect
	strbl=""
	button_calc="images/botton_calc_eng.gif"
	button_back="images/botton_back_eng.gif"
	con_numberid="Name ID"
	con_address="Address"
	con_espace="Space"
	con_price="Price"
	con_details="Details"
	con_preview="Preview"
end if
dim ADO,RS,Rep,tblnum,tblpa
set ADO=server.CreateObject("ADODB.Connection")
ADO.connectionstring="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.MapPath("details\primary.mdb")
ADO.open
selectSQL="select * from details where bytbl=" & bytbl & " and bytct=" & bytct & ""
set RS=ADO.execute(selectSQL)
if RS.eof and RS.bof then response.Redirect("build.asp?errdes=emptypa&bytct=" & bytct & "&bytbl=" & bytbl)
if pa="" then
pa=1
do while not RS.eof
tblpa=tblpa+1
RS.movenext
loop
Rep=0
do until Rep=100
if tblpa > Rep-10 and tblpa <= Rep then tblnum = Rep/10
Rep=Rep+10
loop
end if
RS.movefirst
caption(0)=thisbuild & " " & thiscity & " " &  " الصفحة " & arrpage(pa+(language * 10))
caption(1)=thiscity & " " & thisbuild & " " & arrpage(pa+(language * 10)) & " page . "
%>
</head>
<body bgcolor="#99CCFF">
<div align="center" style="height:525;">
&nbsp;<table border="0" width="700" id="table3" bordercolor="#0066CC" cellspacing="0" cellpadding="0" height="28">
		<tr dir=<%response.write direct(language)%>>
			<td width="30" background="images/tableright.gif" height="30">&nbsp;</td>
			<td background="images/tablebody.gif" width="81">
<table border="1" id="table4" cellspacing="0" cellpadding="0" bordercolor="#0066CC" style="border-collapse: collapse">
<tr dir=<%response.write direct(language)%> align="center" bgcolor="#99CCFF" bordercolor="#000099"><%for rep=1 to tblnum%><td width="30" bordercolorlight="#0066CC" bordercolordark="#0066CC" bordercolor="#0066CC"><a href="show.asp?pa=<%=rep%>&bytct=<%=bytct%>&bytbl=<%=bytbl%>&tblnum=<%=tblnum%>" target="content"><%response.Write(rep)%></a></td><%next%></tr>
</table>
			</td>
			<td background="images/tablebody.gif" width="262">
			&nbsp;</td>
			<td background="images/tablebody.gif"><i><font color="#000099">&nbsp;<b><%response.write caption(language)%></b></font></i></td>
			<td width="30" height="28" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
	<br>
<table dir=<%response.write direct(language)%> border="2" width="700" cols="5" bordercolor="#0066CC" style="border-collapse: collapse" id="table2">
<tr align="center" bgcolor="#FF99FF"><td width="97"><b><%response.write con_numberid%></b></td>
	<td width="169">
	<b><%response.write con_address%></b></td><td width="143"><b><%response.write con_espace%></b></td><td width="175"><b><%response.write con_price%></b></td><td width="100">
	<b><%response.write con_details%></b></td></tr>
<%
for Rep=1 to (pa*10)-10
RS.movenext
next
for rep=1 to 10
if not RS.EOF then
espaceprice=rs("espaceprice")
select case left(espaceprice,1)
case "d"
	strm="دنم"
	strem="Donom"
case "m"
	strm="م²"
	strem="M²"
case "k"
	strm="قصبة"
	strem="Kasaba"
case "n"
	strm="???"
	strem="???"
case "t"
	strm="+ 13 غرفة"
	strem="+ 13 room"
end select
if strm="" then strm="م²"
if strem="" then strem="M²"
select case right(espaceprice,1)
case "d"
	strsp="للدنم"
	stresp="for Donom"
case "m"
	strsp="لكل م²"
	stresp="for M²"
case "k"
	strsp="للقصبة"
	stresp="for Kasaba"
case "a",""
	strsp=""
	stresp=""	
end select
if language=0 then
	if (rs("price"))=>1000 and (rs("price"))<1000000 then strprice=left(rs("price"),len(rs("price"))-3) & "," & right(rs("price"),3)
	if (rs("price"))=>1000000 then strprice=left(rs("price"),len(rs("price"))-6) & "," & mid(rs("price"),2,3) & "," & right(rs("price"),3)
	thism=strm
	thissp=strprice & " ل.س. " & strsp
	if rs("price")=0 then thissp="سعر مغري"
	thisaddress=rs("address")
else
	thism=strem
	thissp=(rs("price") / 50)
	if thissp=>1000 and thissp<1000000 then strprice=left(thissp,len(thissp)-3) & "," & right(thissp,3)
	if thissp=>1000000 then strprice=left(thissp,len(thissp)-6) & "," & mid(thissp,2,3) & "," & right(thissp,3)
	thissp=strprice & " $ " & stresp
	if rs("price")=0 then thissp="???"
	thisaddress=rs("engaddress")
end if
%>
<tr align="center" onmouseover="bgColor='D9ECFF'" onMouseOut="bgColor=''">
	<td bgcolor="#FF99FF" width="97"><%response.write(RS("nameid") & " / " & bytct & " " & strbl)%></td>
	<td width="169"><a target="content" href="details.asp?bytname=<%=RS("nameid")%>&pa=<%=pa%>&bytct=<%=bytct%>&bytbl=<%=bytbl%>&strect=<%=strect%>"><%response.write thisaddress%></a></td><td width="143"><%response.write RS("espace") & " " & thism%></td>
<td width="175"><%response.write thissp%></td><td width="100">
	<a target="content" href="details.asp?bytname=<%=RS("nameid")%>&pa=<%=pa%>&bytct=<%=bytct%>&bytbl=<%=bytbl%>&strect=<%=strect%>"><%response.write con_preview%></a></td></tr>
<%
RS.movenext
else
%>
<tr align="center"><td bgcolor="#FF99FF">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<%
end if
next
ADO.close
set ADO=nothing
%>
</table>
<br>
	<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table5" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td width="71">
			<img border="0" src=<%response.write button_calc%> width="70" height="20" style="cursor: hand;" onclick="window.open('ecalc.asp', 'calculator', 'toolbars=0, scrollbars=0, location=0, statusbars=0, menubars=0, resizable=1, width=240, height=365, left = 0, top = 0');"></td>
			<td>&nbsp;</td>
			<td width="59" align="center">
			<a href="build.asp?bytbl=<%=bytbl%>&bytct=<%=bytct%>">
			<img border="0" src=<%response.write button_back%> width="70" height="20" hspace="0"></a></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
</div>
</html>