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
dim mempstatus,mdesignation,mstartdate,menddate
dim sql
id=Request.QueryString("id")
mempstatus=cint(Request.Form("empstatus"))
mdesignation=cint(Request.Form("designation"))
mstartdate=Request.Form("startdate")
menddate=Request.Form("enddate")
sql="update " & session("bookcode") &  ".workhistory set "
'if menddate="" then
'sql=sql & "employeestatuscode=" & mempstatus & ","
'sql=sql & "designationcode=" & mdesignation & ","
'sql=sql & "enddate=to_date('" & menddate & "','mm dd yy'),"
'sql=sql & "startdate=to_date('" & mstartdate & "','mm dd yy')"
'sql=sql & " where entryid=" & id 
'else
sql=sql & "employeestatuscode=" & mempstatus & ","
sql=sql & "designationcode=" & mdesignation & ","
sql=sql & "startdate=to_date('" & mstartdate & "','mm dd yy'),"
sql=sql & "enddate=to_date('" & menddate & "', 'mm dd yy')"
sql=sql & " where entryid=" & id 
'end if
call connect()

cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Work History cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Work History</A></P>

</BODY>
</HTML>
