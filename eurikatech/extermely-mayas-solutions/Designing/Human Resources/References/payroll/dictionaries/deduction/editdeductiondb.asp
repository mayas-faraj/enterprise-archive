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
dim mname
dim mpfcheck
dim sql
mcode=Request.QueryString("mcode")
mname=Request.Form("name") 
mpfcheck=Request.Form("pfcheck") 
if mpfcheck="on" then
	mpfcheck=-1
else
	mpfcheck=0
end if	
sql="update " & session("bookcode") &  ".deduction set "
sql=sql & "name='" & mname & "',"
sql=sql & "pfcheck=" & mpfcheck & ""
sql=sql & " where code=" & mcode
call connect()
'Response.Write sql
'Response.End 
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "deduction cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit deduction</A></P>

</BODY>
</HTML>
