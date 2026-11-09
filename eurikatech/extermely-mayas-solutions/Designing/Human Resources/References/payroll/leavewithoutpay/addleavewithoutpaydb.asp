<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub Insert()

on error resume next

dim mcode
dim mperiodcode
dim mdays
dim sql
mcode=(Request.QueryString ("mcode"))
mperiodcode=cint(Request.Form("periodcode"))
mdays=Request.Form ("days")
sql="insert into " & session("bookcode") &  ".init_days"
sql=sql & " (empcode,periodcode,days)"
sql=sql & " values ('" & mcode & "'," & mperiodcode & ", " & mdays & ")"

call connect()
'Response.Write sql
'Response.End 
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Empdeducation cannot added to database because there is error in data, please check out"
else
	Response.Write "Record Added Successfully"
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

<P><%call insert()%></P>
<P><A href="javascript:window.history.back()">Back to Add Salaryinfo </A></P>

</BODY>
</HTML>
