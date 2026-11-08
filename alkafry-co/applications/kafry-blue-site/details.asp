<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<html dir="rtl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>شركة الكفري - تفاصيل العقار</title>
<link href="style\style.css" rel="stylesheet" type="text/css">
<%
pa=request.QueryString("pa")
bytname=request.QueryString("bytname")
bytbl=request.QueryString("bytbl")
bytct=request.QueryString("bytct")
strect=request.querystring("strect")
language=request.cookies("language")
dim ADO,RS
set ADO=server.CreateObject("ADODB.Connection")
ADO.connectionstring="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.MapPath("details\primary.mdb")
ADO.open
selectSQL="select * from details where nameid=" & bytname & " and bytbl=" & bytbl & " and bytct=" & bytct
set RS=ADO.execute(selectSQL)
images=rs("images")
espaceprice=rs("espaceprice")
select case bytbl
case 0
	strbl="ش"
	strebl="Flat"
case 1
	strbl="م"
	strebl="Store"
case 2
	strbl="ض"
	strebl="Land"
case 3
	strbl="ع"
	strebl="Building"
case 4
	strbl="ف"
	strebl="Villa"
case 5
	strbl="ي"
	strebl="Project"
end select
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
	con_preview="معاينة"
	con_address="العنوان"
	con_space="المساحة"
	con_price="السعر"
	con_details="الوصف"
	imgsrc="images/botton_back.gif"
	db_address=rs("fulladdress")
	db_details=rs("details")
	director="rtl"
else
	thism=strem
	thissp=(rs("price") / 50)
	if thissp=>1000 and thissp<1000000 then strprice=left(thissp,len(thissp)-3) & "," & right(thissp,3)
	if thissp=>1000000 then strprice=left(thissp,len(thissp)-6) & "," & mid(thissp,2,3) & "," & right(thissp,3)
	thissp=strprice & " $ " & stresp
	if rs("price")=0 then thissp="???"
	con_preview="Preview"
	con_address="Address"
	con_space="Survey"
	con_price="Price"
	con_details="Details"
	strbl=""
	imgsrc="images/botton_back_eng.gif"
	db_address=rs("engaddress")
	db_details="This is a " & strebl & " in " & strect & " city , Please see the Pictures of this " & strebl & " ."
	director="ltr"
end if
%>
</head>
<body>
	<div align="center" style="height:475px; width:1005px">
	&nbsp;<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table8" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center"><b><%response.write con_preview & " " & rs("nameid") & "/" & bytct & " " & strbl %></b></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
	<br>
<div align="right">
	<table border="0" width="100%" id="table2" height="406">
		<tr>
			<td height="353" valign="top" width="35%">
			<div align="center">
			<table dir=<%response.write director%> border="2" width="100%" id="table5" height="300" cellspacing="0" cellpadding="2" bordercolor="#0066CC" style="border-collapse: collapse">
				<tr>
					<td width="100%" height="25"><b>
					<font face="Arial" color="#FF00FF"><%response.write con_address & " :"%></font><%response.write db_address%></b></td>
				</tr>
				<tr>
					<td width="403" height="25"><b>
					<font face="Arial" color="#FF00FF"><%response.write con_space & " :"%></font><%response.write rs("espace") & " " & thism%></b></td>
				</tr>
				<tr>
					<td width="403" height="25"><b>
					<font face="Arial" color="#FF00FF"><%response.write con_price & " :"%></font><%response.write thissp%></b></td>
				</tr>
				<tr>
					<td dir=align="right" valign="top" width="350" height="200"><div dir=<%response.write director%> style="height:200;overflow:auto">
					<b><font face="Arial" color="#FF00FF"><%response.write con_details & " :"%></font><%response.write db_details%>
					</b>
					</div></td>
				</tr>
				<%if not rs("description")="" and language=0 then%>
				<tr>
					<td width="403" height="25"><b>
					<font face="Arial" color="#FF00FF">ملاحظات :</font> <%response.write rs("description")%></b></td>
				</tr>
				<%end if%>
			</table>
			<br>
			<table border="0" width="100%" cellspacing="0" cellpadding="0" height="30" id="table9" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="left">
			<img border="0" src=<%response.write imgsrc%> width="70" height="20" onclick="history.go(-1)" style="cursor: hand;"></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
			</div>
			</td>
			<td width="31" rowspan="2">&nbsp;</td>
			<td width="521" rowspan="2" valign="top" height="402">
			<div style="height:390px;overflow:auto">
			<table border="2" bordercolor="#0066CC" width="500" id="table7" style="border-collapse: collapse" cellspacing="0" cellpadding="0">
			<%for rep=0 to images-2 step 2%>
			<tr>
				<td>	<img border=0` width="250" height="200" alt="<%response.write rep%>" src="picture/c%20(<%response.write bytct%>)/b%20(<%response.write bytbl%>)/i%20(<%response.write bytname%>)/img%20(<%response.write rep%>).jpg" width="300" height="240"></td>
				<td>	<img border=0 width="250" height="200" alt="<%response.write rep+1%>" src="picture/c%20(<%response.write bytct%>)/b%20(<%response.write bytbl%>)/i%20(<%response.write bytname%>)/img%20(<%response.write rep+1%>).jpg" width="300" height="240"></td>
			</tr>
			<%next%>
		</table>
			</div>
			</tr>
		<tr>
			<td>
			&nbsp;</td>
		</tr>
	</table>
</div>
</body>
</html>