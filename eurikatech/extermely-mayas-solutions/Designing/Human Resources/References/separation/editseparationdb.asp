<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="hris\include\connect.asp" -->

<%
sub update()

on error resume next

dim id
dim mempcode,mseparation,mleavingdate,menddate
dim sql
id=server.URLEncode (Request.QueryString("id"))
mseparation=cint(Request.Form("separation"))
mleavingdate=Request.Form("leavingdate") 
menddate=Request.Form("enddate") 
sql="update " & session("bookcode") &  ".separation set "
sql=sql & "leavingreasoncode=" & mseparation & ","
sql=sql & "leavingdate=to_date('" & mleavingdate & "','mm dd yy')"
sql=sql & " where rowid='"& id &"'"
call connect()
Response.Write sql


cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Separation cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Separation</A></P>

</BODY>
</HTML>
