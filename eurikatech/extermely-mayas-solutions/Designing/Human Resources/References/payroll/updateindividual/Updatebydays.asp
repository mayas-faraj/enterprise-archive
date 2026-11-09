<%@ Language=VBScript %>
<%
Option Explicit
%>

<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub delete()

'on error resume next
dim rs
dim mperiod
dim mmasterid
dim mmdays
dim madays
dim sql
dim mamount
dim mperday
dim mall
dim modays
mperiod=cint(Request.QueryString("mPeriod"))
mmasterid=cint(Request.QueryString ("masterid"))
mmdays=Request.QueryString ("mdays")
madays=Request.QueryString ("days")
modays=Request.QueryString ("odays")

sql="select * from " & session("bookcode") &  ".qryupdatebydays where masterid=" & mmasterid & "  and periodcode="& mperiod
call connect()
set rs=server.CreateObject ("ADODB.Recordset")
rs.Open sql,cn

do while not rs.EOF 
	mall=rs.Fields ("Allowancecode")
	mamount=clng(rs.Fields ("amount"))
	mperday=mamount/modays
	mamount=round(mperday*madays,0)
	sql="update " & session("bookcode") &  ".salarytransad set "
	sql=sql & "amount="& mamount
	sql=sql&"where masterid=" & mmasterid &"  and allowancecode=" &mall  
	call connect()
	cn.execute sql
	if err.number<>0 then
		Response.Write err.description
		Response.Write "Days Update cannot update to database because there is error in data, please check out"
	end if	
	rs.MoveNext() 
loop
sql="update " & session("bookcode") &  ".salarymasterpay set "
sql=sql & "days="& madays & ""
sql=sql&"where entryid=" & mmasterid &"  and periodcode=" &mperiod  
'Response.Write sql
'Response.End 
call connect()
cn.execute sql
if err.number<>0 then
	Response.Write err.description
	Response.Write "Days Update cannot update to database because there is error in data, please check out"
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
<P><%call delete()%></P><P><A href="javascript:window.close()">Close</A></P>

</BODY>
</HTML>
