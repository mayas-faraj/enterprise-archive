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
dim mamount
dim total

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





sql2="select * from " & session("bookcode") &  ".period where code="& mperiod  
rs.Open sql2,cn
mdays=rs.Fields ("days")
mname=rs.Fields ("name")
rs.Close 

	sql1="update " & session("bookcode") &  ".salarymasterpay set "
	sql1=sql1 & "days=" &mdays
	sql1=sql1 & "where empcode='"&mcode &"' and periodcode="&mperiod
'	Response.Write sql1
'	Response.End 
	cn.execute sql1
	
	sql2="select * from " & session("bookcode") &  ".qrysalarymasterpay where empcode='"& mcode &"'and periodcode="&mperiod 
	rs2.Open sql2,cn
	if rs2.EOF then
		Response.Write "Record Not Available"
		Response.End 
	end if	
	mmasterid=rs2.Fields ("entryid")
	sql="select * from " & session("bookcode") &  ".qrypayrollsalary where empcode='" &mcode &"'"
	rs.Open sql,cn	
		do while not rs.EOF 
			mamount=rs.Fields ("amount")
			sql1="update " & session("bookcode") &  ".salarytransad set "
			sql1=sql1 & "amount=" & mamount 
			sql1=sql1 & " where allowancecode="& rs.Fields ("allowancecode") &"and masterid="&mmasterid&""
			cn.execute sql1
			rs.MoveNext 
		loop	
		
if err.number<>0 then
	Response.Write err.description
	Response.Write "Employee update cannot update to database because there is error in data, please check out"
else
	Response.Write "Payroll Updated of Employee Code : " & mcode & " Salary Month Code :" &mperiod 
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
