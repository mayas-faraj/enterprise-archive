<%@ Language=VBScript %>


<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub update()

on error resume next
dim rs
dim rs1
dim rs2
dim mcode
dim mperiod
dim mdays
dim mname
dim sql
dim sql1
dim sql2
dim ecode
dim mmasterid

call connect()
set rs=server.CreateObject("ADODB.Recordset")
set rs1=server.CreateObject("ADODB.Recordset")
set rs2=server.CreateObject("ADODB.Recordset")
mcode=Request.Form("empcode")

sql="select * from " & session("bookcode")& ".periodcheck where checkcode=-1"
rs.Open sql,cn
if not rs.EOF then 
	mperiod=rs.Fields ("code")
else 
	Response.Write "Payroll not Generated, First you will generate payroll then try again"	
	Response.End 
end if 	
rs.Close 


'mperiod=Request.Form ("Period")
' delete the old record
sql="select * from "& session ("bookcode") & ".qrysalarymasterpay where empcode='" & mcode &"' and periodcode="& mperiod 
rs1.Open sql,cn
'dim abc
'do while not rs1.EOF 
'	abc=cint(abc)+1
'	rs1.MoveNext 
'loop
'Response.Write abc	

'Response.End 
if not rs1.EOF  then
	mmasterid= rs1.Fields ("entryid")
'Response.Write mmasterid
'Response.End 
	sql="delete from " & session("bookcode") &  ".salarytransad where masterid=" & mmasterid 
	cn.execute sql
	sql="delete from " & session("bookcode") &  ".salarytransdd where masterid=" & mmasterid 
	cn.execute sql
	sql="delete from " & session("bookcode") &  ".salarymasterpay where entryid=" & mmasterid 
	cn.execute sql

	if err.number<>0 then
		Response.Write err.description
		Response.Write "Allowance cannot deleted from database because there is error in data, please check out"
		Response.End 
	else 
		Response.Write "Record Deleted for Employee No :" & mcode &" Period Code : " & mperiod
	end if
else
Response.Write "Record Not Available for Deletion"
end if

rs1.Close 



end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
<!--#include virtual="/payroll/include/top.htm" --> <!--#include virtual="/payroll/include/navigation.htm" --> 
<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">
  <tr bgcolor="#330000"> 
    <td> 
  
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#CCCCCC">UPDATE 
        PAYROLL</font></b></font></div>
    </td>
  </tr>
</table>
<form method="post" action="">
  <table width="57%" border="1" vspace="0" hspace="0" height="120" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center">
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="134"> 
        <div align="center"><% call update()%></div>
      </td>
    </tr>
  </table>
</form>
<P>&nbsp; </P>
</BODY>
</HTML>
