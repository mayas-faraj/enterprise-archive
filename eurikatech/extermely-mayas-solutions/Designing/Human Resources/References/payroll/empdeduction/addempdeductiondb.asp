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
dim mdcode
dim mamount
dim sql
mcode=(Request.QueryString("code"))
mdcode=cint(Request.Form("dedcode"))
mamount=cint(Request.Form("amount"))
sql="insert into " & session("bookcode") &  ".empdeduction"
sql=sql & " (empcode,dedcode,amount)"
sql=sql & " values ('" & mcode & "'," & mdcode & "," & mamount& ")"
call connect()

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
<P><A href="javascript:window.history.back()">Back to Add empdeduction </A></P>

</BODY>
</HTML>
