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
dim mname
dim mscale
dim sql
mcode=cint(Request.Form("code"))
mname=Request.Form("name") 
mscale=cint(Request.Form("scalecode"))
sql="insert into " & session("bookcode") &  ".designation"
sql=sql & " (code,name,scalecode)"
sql=sql & " values (" & mcode & ",'" & mname & "'," & mscale & " )"
'Response.Write sql
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Designation cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Designation </A></P>

</BODY>
</HTML>
