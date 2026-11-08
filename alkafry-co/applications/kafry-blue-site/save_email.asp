<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<%
txtdate=now()
txtname=request.form("txtname")
txtkind=request.form("txtkind")
txtbuild=request.form("txtbuild")
txtspace=request.form("txtspace")
txtprice=request.form("txtprice")
txtcity=request.form("txtcity")
txtaddress=request.form("txtaddress")
txtphone=request.form("txtphone")
txtemail=request.form("txtemail")
txtdescription=request.form("txtdescription")
language=request.cookies("language")
if language=0 then
	if txtname="" then response.redirect("mail.asp?report=emna")
	if txtphone="" then response.redirect("mail.asp?report=emph")
else
	if txtname="" then response.redirect("mail_en.asp?report=emna")
	if txtphone="" then response.redirect("mail_en.asp?report=emph")
end if
dim ADO
set ADO=server.CreateObject("ADODB.connection")
ADO.connectionstring="provider=Microsoft.Jet.OLEDB.4.0;" & "Data Source=" & server.MapPath("database\email.mdb")
ADO.open
tsql="insert into email (rdate,rname,rkind,rbuild,rspace,rprice,rcity,raddress,rphone,remail,rdescription) values ('"&txtdate&"','"&txtname&"','"&txtkind&"','"&txtbuild&"','"&txtspace&"','"&txtprice&"','"&txtcity&"','"&txtaddress&"','"&txtphone&"','"&txtemail&"','"&txtdescription&"')"
set rs=ADO.execute(tsql)
ADO.close
set ADO=nothing
if language=0 then response.redirect("mail.asp?report=ok") else response.redirect("mail_en.asp?report=ok")
%>
</head>

<body>

</body>
</html>
