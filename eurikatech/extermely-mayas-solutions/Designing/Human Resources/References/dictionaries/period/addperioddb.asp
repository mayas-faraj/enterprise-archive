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
dim mdays
dim msdate
dim medate
dim sql
mcode=cint(Request.Form("code"))
mname=Request.Form("name") 
mdays=cint(Request.Form("days"))
msdate=Request.Form("startdate") 
medate=Request.Form("enddate") 
sql="insert into " & session("bookcode") &  ".Period"
sql=sql & " (code,name,startdate,enddate,days)"
sql=sql & " values (" & mcode & ",'" & mname & "',to_date('" & msdate & "','mm dd yy'), to_date('" & medate & "','mm dd yy'),"& mdays &")"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Period cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Period </A></P>

</BODY>
</HTML>
