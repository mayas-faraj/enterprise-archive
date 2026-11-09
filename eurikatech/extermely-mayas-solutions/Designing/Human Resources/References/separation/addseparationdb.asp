<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include file="../include/usercheck.htm" -->
<!--#Include file="../include/connect.asp" -->

<%
sub Insert()
on error resume next
dim mseparation,mleavingdate,mempcode
dim sql
mempcode=Request.QueryString("empno")
mseparation=cint(Request.Form("separation"))
mleavingdate=Request.Form("leavingdate") 
sql="insert into " & session("bookcode") &  ".separation"
sql=sql & " (empcode,leavingreasoncode,leavingdate)"
sql=sql & " values ('" & mempcode & "'," & mseparation & ",to_date('" & mleavingdate & "','mm dd yy'))"
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Separation cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Add Work History </A></P>

</BODY>
</HTML>
