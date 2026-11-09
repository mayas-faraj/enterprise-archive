<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include file="../include/usercheck.htm" -->
<!--#Include file="../include/connect.asp" -->

<%
'*******************************************************************************************
'Description : Insert Data to Salary Master and Transactions using transaction of connection 
'Data Tables : salarymaster, salarytrans
'Parameters Passes : startdate,enddate from request.form
'					 empno from request.querystring	
'Parameters Return : Nil
'Methods used : Connect() for db connection
'*******************************************************************************************
sub Insert()

dim mempcode  'retrieve employee code from query string
dim mstartdate,menddate 'retrieve startdate and end from html form
dim sql 'sql commands
dim trec  'use to compute total records from salary master
dim mamount 'retrieve amount from html forms
dim rs 'recordset load table allowance 
dim rsmastercount 'recordset use to count the total records from salary master
dim masid
mempcode=Request.QueryString("empno")
mstartdate=Request.Form("startdate")
menddate=Request.Form("enddate")
call connect()
'set rsmastercount=server.CreateObject("adodb.recordset")
'rsmastercount.Open "select max(entryid) as trec from " & session("bookcode") &  ".salarymaster",cn
'if isnull(rsmastercount.Fields("trec")) then
'	trec=1
'else	
'	trec=rsmastercount.Fields("trec")+1
'end if
'rsmastercount.Close
'set rsmastercount=nothing
if not isdate(menddate) then
	sql="insert into " & session("bookcode") & ".salarymaster (empcode,startdate,entryid)"
	sql=sql & " values ('" & mempcode & "',to_date('" & mstartdate 
	sql=sql & "','mm dd yy')," & session("bookcode") &  ".sno.nextval)"
else
	sql="insert into " & session("bookcode") & ".salarymaster (empcode,startdate,enddate,entryid)"
	sql=sql & " values ('" & mempcode & "',to_date('" & mstartdate & "','mm dd yy'),to_date('" & menddate & "','mm dd yy')," & session("bookcode") &  ".sno.nextval)"
end if
cn.BeginTrans
cn.execute sql
dim code
set rs=server.CreateObject("adodb.recordset")
rs.Open ""& session ("bookcode") & ".allowance",cn
do while not rs.EOF		
	code="allowance"&rs.Fields("code")		
	mamount=Request.Form(code)		
	if isnumeric(mamount) then
		sql="insert into " & session ("bookcode") & ".salarytrans (masterid,allowancecode,amount)"
		sql=sql & " values (" & session("bookcode") &  ".sno.currval," &  rs.Fields("code") & "," & mamount & ")"
		cn.execute sql
	end if
	rs.MoveNext
loop
cn.CommitTrans
cn.close
set cn=nothing
if err.number<>0 then
	cn.RollbackTrans
	Response.Write err.description
	Response.Write "Salary cannot added to database because there is error in data, please check out"
else
	Response.Write "Record Added Successfully"
end if	

end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<P><%call insert()%></P>
<P><A href="javascript:window.history.back()">Back to Add Remuneration </A></P>
<P><A href="javascript:window.close()">Close Window</A></P>
</BODY>
</HTML>
