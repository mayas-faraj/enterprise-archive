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
dim mdays
dim msdate
dim medate
dim sql
mcode=Request.QueryString("mcode")
mname=Request.Form("name") 
mdays=Request.Form("days") 
msdate=Request.Form ("startdate")
medate=Request.Form ("enddate")
mdays=cint(mdays)
sql="update " & session("bookcode") &  ".Period set "
sql=sql & "name='" & mname & "'"
sql=sql & ",startdate=to_date('" & msdate & "','mm dd yy'),"
sql=sql & "enddate=to_date('" & medate & "','mm dd yy')"
sql=sql & ",days=" & mdays & ""
sql=sql & " where code=" & mcode
call connect()
'Response.Write sql
'Response.End

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Period cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Period</A></P>

</BODY>
</HTML>
