<%@ Language=VBScript %>
<%
Option Explicit
%>

<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub delete()

on error resume next

dim mcode
dim malcode
dim sql
mcode=Request.QueryString("mcode")
malcode=Request.QueryString ("alcode")
'sql="delete from " & session("bookcode") &  ".salarytransdd where masterid=" & mcode & "  and deductioncode="& malcode
sql="delete from " & session("bookcode") &  ".salarytransdd where rowid='"& mcode &"'"
'Response.Write sql
'Response.End 
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Area cannot deleted from database because there is error in data, please check out"
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
