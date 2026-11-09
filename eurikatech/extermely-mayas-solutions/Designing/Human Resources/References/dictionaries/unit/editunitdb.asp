<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="hris\include\connect.asp" -->

<%
sub update()

on error resume next

dim mcode,mareacode,msectorcode,mregioncode,mstructurecode,moverallcode
dim munitname
dim sql
mcode=Request.QueryString("mcode")
munitname=Request.Form("name") 
mareacode=cint(Request.Form("area"))
msectorcode=cint(Request.Form("sector"))
mregioncode=cint(Request.Form("region"))
mstructurecode=cint(Request.Form("structure"))
moverallcode=cint(Request.Form("overall"))
sql="update " & session("bookcode") &  ".units set "
sql=sql & "name='" & munitname & "'"
sql=sql & ", areacode=" & mareacode
sql=sql & ", sectorcode=" & msectorcode
sql=sql & ", regioncode=" & mregioncode
sql=sql & ", structurecode=" & mstructurecode
sql=sql & ", overallcode=" & moverallcode
sql=sql & " where code=" & mcode
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Unit cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Unit</A></P>

</BODY>
</HTML>
