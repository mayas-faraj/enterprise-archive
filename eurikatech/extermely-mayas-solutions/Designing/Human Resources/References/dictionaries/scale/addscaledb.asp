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
dim mmin
dim mmax
dim mmcheck
dim sql
mcode=cint(Request.Form("code"))
mmin=ccur(Request.Form("min"))
mmax=ccur(Request.Form("max"))
mmcheck=cint(Request.Form ("mcheck"))
if isempty(mmcheck) then
	mmcheck=0
end if	
sql="insert into " & session("bookcode") &  ".scale"
sql=sql & " (code,minsal,maxsal,mcheck)"

sql = sql & " values (" & mcode & "," & mmin & "," & mmax & ","& mmcheck &")"


call connect()

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "scale cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Scales </A></P>

</BODY>
</HTML>
