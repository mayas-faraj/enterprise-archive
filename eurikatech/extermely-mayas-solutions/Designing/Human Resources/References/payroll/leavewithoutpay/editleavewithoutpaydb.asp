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
dim mdays

dim sql
mcode=Request.QueryString("mcode")
mdays=Request.Form("days") 

sql="update " & session("bookcode") &  ".init_days set "
sql=sql & "days=" & mdays & ""
sql=sql & " where empcode=" & mcode
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Salaryinfo cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Salaryinfo</A></P>

</BODY>
</HTML>
