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
dim rs2, rs3
dim mcode
dim mperiod
dim mdays
dim mname, mpf
dim sql
dim sql1
dim sql2
dim ecode, pfcode, pfamount
dim mmasterid


call connect()
set rs=server.CreateObject("ADODB.Recordset")
set rs1=server.CreateObject("ADODB.Recordset")
set rs2=server.CreateObject("ADODB.Recordset")
set rs3=server.CreateObject("ADODB.Recordset")
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
sql="select distinct empcode, pf from " & session("bookcode") &  ".qrypayrollsalary where empcode=" &mcode
rs.Open sql,cn
sql="select *  from " & session("bookcode") &  ".deduction where pfcheck=-1" 
rs3.Open sql,cn
pfcode=rs3.Fields ("code")
rs3.Close() 

do while  not rs.EOF 
	if isnull(rs.Fields ("pf")) then
			mpf=0
	else
		if not cint(rs.Fields ("pf"))=-1 then	
			mpf=0
		else
			mpf=-1
		end if 
	end if			
	sql2="select * from " & session("bookcode") &  ".qrypfamount where empcode='"& mcode &"'" 
	rs3.Open sql2,cn
	pfamount=0
	do while not rs3.EOF 
		pfamount=pfamount+clng(rs3.Fields ("amount"))
		rs3.MoveNext
	loop
	rs3.Close 
	sql1="insert into " & session("bookcode") &  ".salarymasterpay"
	sql1=sql1 & " (empcode,periodcode,entryid,days)"
	sql1=sql1 & " values ('" & rs.Fields ("empcode") & "'," & mperiod & ", " & session ("bookcode") & ".snopayroll.nextval, " & mdays & ")"
	cn.execute sql1
	ecode=rs.Fields ("empcode")
	sql2="select * from " & session("bookcode") &  ".qrypayrollsalary where empcode='"& ecode &"'" 
	rs2.Open sql2,cn
	if err.number=0 then
		
	do while not rs2.EOF 
		sql1="insert into " & session("bookcode") &  ".salarytransad"
		sql1=sql1 & " (masterid,allowancecode,amount)"
		sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & rs2.Fields ("amount") &")"
		cn.execute sql1
		rs2.MoveNext 	
	loop
	rs2.Close
	sql2="select * from " & session("bookcode") &  ".empdeduction where empcode='"& ecode &"'" 
	rs2.Open sql2,cn
	do while not rs2.EOF 
		sql1="insert into " & session("bookcode") &  ".salarytransdd"
		sql1=sql1 & " (masterid,deductioncode,amount)"
		sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("dedcode") &"," & rs2.Fields ("amount") &")"
		cn.execute sql1
		rs2.MoveNext 	
	loop
	rs2.Close 
	if mpf=-1 then
		sql1="insert into " & session("bookcode") &  ".salarytransdd"
		sql1=sql1 & " (masterid,deductioncode,amount)"
		sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval,"& pfcode &",round((" &pfamount&"*8.33)/100,0))"
		cn.execute sql1
	end if	
	end if
	rs.MoveNext 	
loop


if err.number<>0 then
	Response.Write err.description
	Response.Write "First you should Delete the Record then try Again"
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
