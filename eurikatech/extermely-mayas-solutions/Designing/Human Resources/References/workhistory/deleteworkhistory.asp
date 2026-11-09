<%@ Language=VBScript %>
<%
Option Explicit
%>

<!--#Include file="../include/usercheck.htm" -->
<!--#Include file="../include/connect.asp" -->

<%
sub delete()

on error resume next

dim id
dim sql
id=Request.QueryString("id")
sql="delete from " & session("bookcode") &  ".workhistory where entryid=" & id 
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Work History cannot deleted from database because there is error in data, please check out"
else
	Response.Write "Record Deleted Successfully"
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
<P><%call delete()%></P><P><A href="javascript:window.close()">Close</A></P>

</BODY>
</HTML>
