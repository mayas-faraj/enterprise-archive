<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub update()

on error resume next
dim mcode
dim mall
dim mamount
dim sql
mcode=Request.QueryString("mcode")
mall=Request.querystring("mall") 
mamount=Request.Form ("amount")

sql="update " & session("bookcode") &  ".salarytransdd set "
sql=sql & "amount="& mamount
sql=sql&"where masterid=" & mcode &" and deductioncode="& mall 
call connect()
'Response.Write sql
'Response.End 
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Individual Eployee cannot update to database because there is error in data, please check out"
else
	Response.Write "Record Updated Successfully"
end if	
cn.close
set cn=nothing

end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<P><%call update()%></P>
<P><A href="javascript:window.history.back()">Back to Edit Bank</A></P>

</BODY>
</HTML>
