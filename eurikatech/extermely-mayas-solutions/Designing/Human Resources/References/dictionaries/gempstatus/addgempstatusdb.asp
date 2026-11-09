<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="/hris/include/connect.asp" -->

<%
sub Insert()

on error resume next

dim mcode

rem dim mgratuity
dim sql

mcode=cint(Request.Form("code"))

sql="insert into " & session("bookcode") &  ".gempstatus"
sql=sql & "(code)"

sql=sql & " values (" & mcode & ")"




call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Allowances cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Allowances </A></P>

</BODY>
</HTML>
