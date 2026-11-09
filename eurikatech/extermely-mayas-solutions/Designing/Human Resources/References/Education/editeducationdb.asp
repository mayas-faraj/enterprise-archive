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
dim mempcode,mqualification,mcourse,minsititution,msource,mcost,mremarks
dim mstartdate,menddate
dim sql
id=server.URLEncode (Request.QueryString("id"))
mqualification=cint(Request.Form("qualification"))
mcourse=Request.Form("course")
minsititution=Request.Form("insititution")
msource=Request.Form("source")
mcost=Request.Form("cost")
mremarks=Request.Form("remarks")
mstartdate=Request.Form("startdate") 
menddate=Request.Form("enddate") 
sql="update " & session("bookcode") &  ".empeducation set "
sql=sql & "qualificationcode=" & mqualification & ","
sql=sql & "coursename='" & mcourse & "',"
sql=sql & "institutionname='" & minsititution & "',"
sql=sql & "trainingsource='" & msource & "',"
sql=sql & "trainingcost=" & mcost & ","
sql=sql & "remarks='" & mremarks & "',"
sql=sql & "startdate=to_date('" & mstartdate & "','mm dd yy'),"
sql=sql & "enddate=to_date('" & menddate & "','mm dd yy')"
sql=sql & " where rowid=" &"'"& id & "'" 
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Education cannot update to database because there is error in data, please check out"
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
<P><A href="javascript:window.history.back()">Back to Edit Education</A></P>

</BODY>
</HTML>
