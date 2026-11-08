
<html dir="rtl">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>شركة الكفري للتسويق العقاري عبر الأنترنت</title>
<link type="text/css" rel="stylesheet" href="style/style.css">
<%
txtcity=request.form("txtcity")
txtbuild=request.form("txtbuild")
txtfromprice=request.form("txtfromprice")
txttoprice=request.form("txttoprice")
txtfromspace=request.form("txtfromspace")
txttospace=request.form("txttospace")
language=request.cookies("language")
if language=0 then
	con_caption="نتائج البحث :"
	con_numresult=":عدد النتائج التي تم العثور عليها"
	con_empty="لم يتم العثور على أي عقار حسب المواصفات التي طلبتها" & "<br>" & "إضغط زر عودة لتغيير إعدادات البحث"
	con_nameid="رقم التعامل"
	con_city="المحافظة"
	con_kind="النوع"
	con_address="العنوان"
	con_survey="المساحة"
	con_price="السعر"
	con_details="التفاصيل"
	con_preview="المعاينة"
else
	con_caption="Search Results :"
	con_numresult="Results Number :"
	con_nameid="Name ID"
	con_city="City"
	con_kind="Kind"
	con_address="Address"
	con_survey="Survey"
	con_price="Price"
	con_details="Details"
	con_preview="Preview"
end if
if txtcity="" or txtbuild="" then response.redirect "search.asp"
selectbuildnum=(int(len(txtbuild)+2)) / 3
selectcitynum=(int(len(txtcity)+2)) / 4
dim ADO,RS,Rep,mas,stror
mas=0
sqlstringbl=""
sqlstringct=""
stror=" or "
for rep=1 to selectbuildnum
if rep=selectbuildnum then stror=""
sqlstringbl=sqlstringbl & "bytbl=" & mid(txtbuild,1+mas,1) & stror
mas=mas+3
next
stror=" or "
mas=0
for rep=1 to selectcitynum
if rep=selectcitynum then stror=""
sqlstringct=sqlstringct & "bytct=" & mid(txtcity,1+mas,2) & stror
mas=mas+4
next
set ADO=server.CreateObject("ADODB.Connection")
ADO.connectionstring="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.MapPath("details\primary.mdb")
ADO.open
selectSQL="select * from details where (" & sqlstringbl & ") and (" & sqlstringct & ") and ( espace >= " & txtfromspace & " ) and ( espace <= " & txttospace & ") and ( price >= " & txtfromprice & " ) and ( price <= " & txttoprice & ")"                                                    
set RS=ADO.execute(selectSQL)
num_result=0
do while not rs.eof
num_result=num_result+1
rs.movenext
loop
%>
</head>
<body><br>
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
<%if rs.eof and rs.bof then%>
<p align=center>
<font color="#FF0000"><b><%response.write con_empty%></b></font>
</p>
<%
else
rs.movefirst
%>
<table border="0" width="400" cellspacing="0" cellpadding="0" height="30" id="table3" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center"><b><%response.write con_numresult & num_result%></b></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
<p>
<table border="2" width="650" cols="5" bordercolor="#0066CC" style="border-collapse: collapse" id="table2">
<tr align="center" bgcolor="#FF99FF"><td width="77" height="6"><b><%response.write con_nameid%></b></td>
	<td width="74" height="6">
	<b><%response.write con_city%></b></td><td width="63" height="6">
	<b><%response.write con_kind%></b></td><td width="119" height="6">
	<b><%response.write con_address%></b></td><td width="119" height="6"><b><%response.write con_survey%></b></td>
	<td width="130" height="6"><b><%response.write con_price%></b></td>
	<td width="54" height="6">
	<b><%response.write con_details%></b></td></tr>
	<%
	do while not rs.eof
		intprice=rs("price")
		if intprice=>1000 and intprice<1000000 then strprice=left(intprice,len(intprice)-3) & "," & right(intprice,3)
		if intprice=>1000000 then strprice=left(intprice,len(intprice)-6) & "," & mid(intprice,2,3) & "," & right(intprice,3)
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
		select case rs("bytbl")
			case 0
				strbl="ش"
				strblname="شقة"
				streblname="Flat"
			case 1
				strbl="م"
				strblname="محل"
				streblname="Store"
			case 2
				strbl="ض"
				strblname="أرض"
				streblname="Land"
			case 3
				strbl="ع"
				strblname="عقار"
				streblname="Building"
			case 4
				strbl="ف"
				strblname="فيلا"
				streblname="Villa"
			case 5
				strbl="ي"
				strblname="مشروع"
				streblname="Project"
		end select
		select case rs("bytct")
				case 11
				strct="دمشق"
				strect="Damascus"
				case 16
				strct="السويداء"
				strect="Swidaa"
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
				strect="Der Alzor"
				case 52
				strct="الحسكة"
				strect="Hasaka"
		end select
		if language=0 then
			thisaddress=rs("address")
			thisbuild=strblname
			thiscity=strct
			thism=strm
			strsp="ل.س."
		else
			thisaddress=rs("engaddress")
			thisbuild=streblname
			thiscity=strect
			strbl=""
			strsp="S.P."
			thism=strem
		end if
	%>
<tr align="center" onmouseover="bgColor='D9ECFF'" onMouseOut="bgColor=''">
	<td bgcolor="#FF99FF" width="77"><%response.write(RS("nameid") & " / " & rs("bytct") & " " & strbl)%></td>
	<td width="74"><%response.write thiscity%></td><td width="63"><%response.write thisbuild%>
	</td><td width="119"><%response.write thisaddress%></td>
	<td width="119"><%response.write RS("espace") & " " & thism%></td>
<td width="130"><%response.write strprice & " " & strsp%></td><td width="54">
	<a target="content" href="details.asp?bytname=<%=RS("nameid")%>&bytct=<%=rs("bytct")%>&bytbl=<%=rs("bytbl")%>"><%response.write con_preview%></a></td></tr>
	<%rs.movenext
	num=num+1
	loop
	%>
	</table>
<%end if%>

</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>