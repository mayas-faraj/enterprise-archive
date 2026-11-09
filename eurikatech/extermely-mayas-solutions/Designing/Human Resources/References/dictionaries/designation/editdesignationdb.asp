<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="hris\include\connect.asp" -->

<%
sub update()

on error resume next

dim mcode
dim mname
dim mscale
dim sql
mcode=Request.QueryString("mcode")
mname=Request.Form("name")
mscale=Request.Form("scalecode") 
sql="update " & session("bookcode") &  ".designation set "
sql=sql & "name='" & mname & "'"
sql=sql &","& "scalecode=" & mscale & ""
sql=sql & " where code=" & mcode 
'Response.Write sql
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Designation cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Designation</A></P>

</BODY>
</HTML>
