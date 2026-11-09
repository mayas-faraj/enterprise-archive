<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include file="../include/usercheck.htm" -->
<!--#Include file="../include/connect.asp" -->

<%
sub Insert()
on error resume next
dim mempcode,mqualification,mcourse,minsititution,msource,mcost,mremarks
dim mstartdate,menddate
dim sql
mempcode=Request.QueryString("empno")
mqualification=cint(Request.Form("qualification"))
mcourse=Request.Form("course")
minsititution=Request.Form("insititution")
msource=Request.Form("source")
mcost=Request.Form("cost")
mremarks=Request.Form("remarks")
mstartdate=Request.Form("startdate") 
menddate=Request.Form("enddate") 
sql="insert into " & session("bookcode") &  ".empeducation"
sql=sql & " (empcode,qualificationcode,coursename,"
sql=sql & " institutionname,trainingsource,trainingcost,"
sql=sql & " remarks,startdate,enddate)"
sql=sql & " values ('" & mempcode & "'," & mqualification & ",'" & mcourse & "','" & minsititution & "','"
sql=sql & msource & "'," & mcost & ",'" & mremarks & "',to_date('" & mstartdate & "','mm dd yy'),to_date('" & menddate & "','mm dd yy'))"
call connect()
Response.Write sql

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Education cannot added to database because there is error in data, please check out"
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
