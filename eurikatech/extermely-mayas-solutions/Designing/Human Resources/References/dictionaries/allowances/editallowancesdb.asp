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
dim mgtag
dim mshortn
dim sql
mcode=Request.QueryString("mcode")
mname=Request.Form("name") 
mgtag=Request.form("gtag")
mshortn=Request.Form ("shortn")
'Response.Write mgtag
'Response.End 
if trim(mgtag)="on" then
	mgtag=-1
else
	mgtag=0
end if		

sql="update " & session("bookcode") &  ".allowance set "
sql=sql & "name='" & mname & "',"
sql=sql & "shortn='" & mshortn & "',"
sql=sql & "gtag=" & mgtag & ""
sql=sql & " where code=" & mcode

call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Allowances cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Allowances</A></P>

</BODY>
</HTML>
