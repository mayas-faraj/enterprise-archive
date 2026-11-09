<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub Insert()

on  error resume next

dim mcode
dim mmasterid
dim mamount

dim sql
mcode=Request.Form("allowance")
mmasterid=Request.QueryString ("masterid")
mamount=clng(Request.Form("amount"))

sql="insert into " & session("bookcode") &  ".salarytransad"
sql=sql & " (masterid,allowancecode,amount)"
sql=sql & " values (" & mmasterid & "," & mcode & "," & mamount & ")"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Individual Employee cannot added to database because there is error in data, please check out"
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
