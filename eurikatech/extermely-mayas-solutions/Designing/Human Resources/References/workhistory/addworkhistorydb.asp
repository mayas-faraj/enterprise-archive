<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include file="../include/usercheck.htm" -->
<!--#Include file="../include/connect.asp" -->

<%
sub Insert()
on error resume next
dim mempcode,mempstatus,mdesignation
dim mstartdate,menddate
dim sql
mempcode=Request.QueryString("empno")
mempstatus=cint(Request.Form("empstatus"))
mdesignation=cint(Request.Form("designation"))
mstartdate=Request.Form("startdate") 
menddate=Request.Form("enddate") 
sql="insert into " & session("bookcode") &  ".workhistory"

if menddate="" then
 	sql=sql & " (empcode,employeestatuscode,designationcode,startdate,entryid)"
 	sql=sql & " values ('" & mempcode & "'," & mempstatus & "," & mdesignation & ",to_date('" & mstartdate & "','mm dd yy')," & session("bookcode") &  ".sno.nextval)"
else
  	sql=sql & " (empcode,employeestatuscode,designationcode,startdate,enddate,entryid)"
  	sql=sql & " values ('" & mempcode & "'," & mempstatus & "," & mdesignation & ",to_date('" & mstartdate &"','mm dd yy'),to_date('" & menddate & "','mm dd yy')," & session("bookcode") &  ".sno.nextval)"
end if

call connect()

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Work History cannot added to database because there is error in data, please check out"
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
<P><A href="javascript:window.close()">Close Window</A></P>
</BODY>
</HTML>
