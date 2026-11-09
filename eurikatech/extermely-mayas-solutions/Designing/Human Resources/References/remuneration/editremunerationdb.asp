<%@ Language=VBScript %>

<%
Option Explicit
dim id,startdate,enddate
id=Request.QueryString("id")
startdate=Request.Form("startdate")
enddate=Request.Form("enddate")

%>
<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%

'*******************************************************************************************
'Description : Update Data to Salary Master and Transactions using transaction of connection 
'Data Tables : salarymaster, salarytrans
'Parameters Passes : html form from editremunerationdb.asp, id of salarymaster through querystring
'Parameters Return : Nil
'Methods used : Connect() for db connection
'*******************************************************************************************
sub update()

on error resume next

call connect()
dim rs,rsemp,sql,mamount,mcode,codeforname
sql="update " & session("bookcode") &  ".salarymaster set "
sql=sql & "startdate=to_date('" & startdate & "','mm dd yy')"
if isdate(enddate) then
	sql=sql & ",enddate=to_date('" & enddate & "','mm dd yy')"
else
	sql=sql & ",enddate=null" 
end if
sql=sql & " where entryid=" & id
cn.BeginTrans
cn.execute sql
set rs=server.CreateObject("ADODB.Recordset")
set rsemp=server.CreateObject("adodb.recordset")
sql="Select * from "&session("bookcode")&".salarytrans where masterid=" & id 
rsemp.CursorLocation=3
rsemp.Open sql,cn
rs.CursorLocation=3
rs.Open "select * from "& session ("bookcode") & ".allowance",cn
do while not rs.eof
	codeforname="allowance" & rs.Fields("code")
	mcode=rs.Fields("code")
	mamount=0
	if isnumeric(Request.Form(codeforname)) then
		mamount=Request.Form(codeforname)
	else
		mamount=0
	end if
	rsemp.MoveFirst
	rsemp.Find "allowancecode='" & mcode & "'"
	if rsemp.EOF then
		if mamount<>0 then
			sql="insert into "& session ("bookcode") & ".salarytrans (masterid,allowancecode,amount)"
			sql=sql & " values (" & id 
			sql=sql & "," & mcode & "," & mamount & ")"
			cn.execute sql
		end if
	else
		if mamount=0 then
			sql="delete from "& session ("bookcode") & ".salarytrans"
			sql=sql & " where allowancecode=" & mcode
			sql=sql & " and masterid=" & id
			cn.execute sql
		else
			sql="update "& session ("bookcode") & ".salarytrans set "
			sql=sql & "amount=" & mamount 
			sql=sql & " where allowancecode=" & mcode
			sql=sql & " and masterid=" & id
			cn.execute sql
		end if
	end if
	rs.MoveNext
loop
cn.committrans
rsemp.Close
set rsemp=nothing
rs.Close
set rs=nothing	
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
<P><A href="javascript:window.history.back()">Back to Edit Remuneration</A></P>

</BODY>
</HTML>
