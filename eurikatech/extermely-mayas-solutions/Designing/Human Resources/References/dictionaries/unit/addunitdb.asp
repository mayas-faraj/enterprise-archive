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
dim marea,msector,moverall,mstructure,mregion
dim sql
mcode=cint(Request.Form("code"))
mname=Request.Form("name") 
marea=cint(Request.Form("area"))
msector=cint(Request.Form("sector"))
moverall=cint(Request.Form("overall"))
mstructure=cint(Request.Form("structure"))
mregion=cint(Request.Form("region"))
sql="insert into " & session("bookcode") &  ".units"
sql=sql & " (code,name,areacode,sectorcode,overallcode,structurecode,regioncode)"
sql=sql & " values (" & mcode & ",'" & mname & "'," & marea & "," & msector & "," 
sql=sql & moverall & "," & mstructure & "," & mregion & ")"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Unit cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Unit </A></P>

</BODY>
</HTML>
