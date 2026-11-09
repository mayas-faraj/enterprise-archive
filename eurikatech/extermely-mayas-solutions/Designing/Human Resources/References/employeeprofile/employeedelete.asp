<%@ Language=VBScript %>
<%
Option Explicit
%>

<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%
sub delete()

on error resume next

dim mempcode
dim sql
mempcode=Request.QueryString("empcode")

sql="delete from " & session("bookcode") &  ".empprofile where empcode='" & mempcode & "'"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Entry cannot deleted from database because there is error in data, please check out"
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
