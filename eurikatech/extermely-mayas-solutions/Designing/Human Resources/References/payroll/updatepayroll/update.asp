<%@ Language=VBScript %>


<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%
sub update()

'on error resume next
dim rs
dim rs1
dim rs2
dim rs3
dim rs4
dim rs5
dim mcode
dim mdays, mtdays 
dim mname, msdate, medate, mamount

dim sql
dim sql1
dim sql2
dim ecode
dim pfcode
dim pfamount, mpf
dim curdate
call connect()
set rs=server.CreateObject("ADODB.Recordset")
set rs1=server.CreateObject("ADODB.Recordset")
set rs2=server.CreateObject("ADODB.Recordset")
set rs3=server.CreateObject("ADODB.Recordset")
set rs4=server.CreateObject("ADODB.Recordset")
set rs5=server.CreateObject("ADODB.Recordset")
rs3.CursorLocation= 3
rs4.CursorLocation= 3
rs5.CursorLocation= 3
mcode=Request.Form("period")

sql2="select * from " & session("bookcode") &  ".period where code="& mcode  
rs.Open sql2,cn
sql="select code from " & session("bookcode") &  ".qrydaysdepall "
rs4.Open sql,cn


mdays=rs.Fields ("days")
mname=rs.Fields ("name")
msdate=rs.Fields ("Startdate")
medate=rs.Fields ("enddate")
rs.Close 
cn.begintrans
if cdate(msdate)<=date() and cdate(medate)>=date() then
	sql="select distinct empcode, pf from " & session("bookcode") &  ".qrypayrollsalary" 
	rs.Open sql,cn
	sql="select *  from " & session("bookcode") &  ".deduction where pfcheck=-1" 
	rs3.Open sql,cn
	pfcode=rs3.Fields ("code")
	rs3.Close() 
	sql="select * from " & session("bookcode") &  ".init_days where periodcode="& mcode  
	rs5.Open sql,cn
			
	do while  not rs.EOF 
		ecode=rs.Fields ("empcode")
		if isnull(rs.Fields ("pf")) then
			mpf=0
		else
			if not cint(rs.Fields ("pf"))=-1 then	
				mpf=0
			else
				mpf=-1
			end if 
		end if			
		if not (rs5.EOF and rs5.BOF)  then
			rs5.MoveFirst
		
'rsemp.Find "allowancecode='" & mcode & "'"
			rs5.Find "empcode= '" & ecode & "'"
			if not rs5.EOF then
				mtdays= cint(mdays)-(cint(rs5.Fields("days")))
				'Response.Write mtdays
				'Response.End 
			else
				mtdays=cint(mdays)
				'Response.Write "abc"
				'Response.End 
			end if
		else
			mtdays=mdays
			
		end if	
		'rs3.Close 
		sql1="insert into " & session("bookcode") &  ".salarymasterpay"
		sql1=sql1 & " (empcode,periodcode,entryid,days)"
		sql1=sql1 & " values ('" & rs.Fields ("empcode") & "'," & mcode & ", " & session ("bookcode") & ".snopayroll.nextval," & mtdays & ")"
		cn.execute sql1
		sql2="select * from " & session("bookcode") &  ".qrypayrollsalary where empcode='"& ecode &"'" 
		rs2.Open sql2,cn
		sql2="select * from " & session("bookcode") &  ".pfallowance " 
		'sql2="select * from " & session("bookcode") &  ".qrypfamount where empcode='"& ecode &"'" 
		rs3.Open sql2,cn
		pfamount=0
		'do while not rs3.EOF 
		'	pfamount=pfamount+clng(rs3.Fields ("amount"))
		'	rs3.MoveNext
		'loop
			
		do while not rs2.EOF 
			if cint(mtdays)=cint(mdays) then
				mamount=rs2.Fields ("amount")
				'sql1="insert into " & session("bookcode") &  ".salarytransad"
				'sql1=sql1 & " (masterid,allowancecode,amount)"
				'sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & rs2.Fields ("amount") &")"
			else
				rs4.MoveFirst 
				rs4.Find "code="& rs2.Fields ("allowancecode")
				if rs4.EOF 	then
					mamount=rs2.Fields ("amount")
					'sql1="insert into " & session("bookcode") &  ".salarytransad"
					'sql1=sql1 & " (masterid,allowancecode,amount)"
					'sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & rs2.Fields ("amount") &")"
					
				else	
					mamount= round((clng(rs2.Fields ("amount"))/cint(mdays)) * cint(mtdays),0)
					'sql1="insert into " & session("bookcode") &  ".salarytransad"
					'sql1=sql1 & " (masterid,allowancecode,amount)"
					'sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & mamount &")"
					
					
				end if	
			end if
			sql1="insert into " & session("bookcode") &  ".salarytransad"
			sql1=sql1 & " (masterid,allowancecode,amount)"
			sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & mamount &")"
			cn.execute sql1	
			if not (rs3.EOF and rs3.BOF)  then
				rs3.MoveFirst 
				rs3.Find "code="& rs2.Fields ("allowancecode")
				if not rs3.EOF then
					pfamount=pfamount+clng(mamount)
				end if	
			end if	
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
		sql2="select * from " & session("bookcode") &  ".init_allow where empcode='"& ecode &"' and periodcode="&mcode 
		rs2.Open sql2,cn
		do while not rs2.EOF 
			sql1="insert into " & session("bookcode") &  ".salarytransad"
			sql1=sql1 & " (masterid,allowancecode,amount)"
			sql1=sql1 & " values (" & session ("bookcode") & ".snopayroll.currval," & rs2.Fields ("allowancecode") &"," & rs2.Fields ("amount") &")"
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
		rs.MoveNext 
		rs3.Close	
	loop

	if err.number<>0 then
		Response.Write err.description
		Response.Write "Payroll cannot update to database because there is error in data, please check out"
	else
		sql="update " & session("bookcode") &  ".periodcheck set "
		sql=sql & "checkcode=0"
		cn.execute sql
		sql1="insert into " & session("bookcode") &  ".periodcheck"
		sql1=sql1 & " (code,checkcode)"
		sql1=sql1 & " values (" & mcode & ",-1)"
		cn.execute sql1
		sql1="delete from " & session("bookcode") &  ".Init_allow where periodcode=" &mcode
		cn.execute sql1
		sql1="delete from " & session("bookcode") &  ".Init_days"
		cn.execute sql1
		Response.Write "Payroll Updated for the month of " & mname 
		cn.commit
		'cn.close
	end if	
else
	Response.Write "Payroll not allowed for This month"
end if
'cn.commit
'cn.close
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
