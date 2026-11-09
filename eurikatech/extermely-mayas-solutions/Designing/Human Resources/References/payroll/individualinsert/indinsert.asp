<%@ Language=VBScript %>
<%
option explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#include virtual="/payroll/include/connect.asp"-->
<%



call connect()
dim rs
dim mperiod
dim mpname
dim sql
set rs=server.CreateObject ("ADODB.Recordset")

sub period()
sql="select * from " & session("bookcode")& ".periodcheck where checkcode=-1"
rs.Open sql,cn
if not rs.EOF then 
	mperiod=rs.Fields ("code")
	rs.Close 
	sql="select * from " & session("bookcode")& ".period where code="&mperiod
	rs.Open sql,cn
	mpname=rs.Fields ("name")
end if 	
rs.Close 
end sub


sub fillperiod()
dim abc
dim sql
sql="select * from " & session("bookcode") &  ".period order by code"
rs.Open sql,cn

Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	Response.Write "<OPTION VALUE=" & rs.Fields("code") & ">" & rs.Fields ("name") & "</OPTION>"
	rs.MoveNext
loop
rs.Close

end sub

sub fillcomboemp()
dim abc
dim sql, rstmp
sql="select table_name, privilege from user_tab_privs_recd where table_name='QRYEMPPROFILEM' and privilege='SELECT'"
set rstmp=server.CreateObject("ADODB.Recordset")
rstmp.Open sql,cn
if not rstmp.EOF and not rstmp.BOF then
	sql="select * from " & session("bookcode") &  ".qrysalaryinfo order by empname"
	rs.Open sql,cn
else
	sql="select * from " & session("bookcode") &  ".qrysalaryinfon order by empname"
	rs.Open sql,cn
end if	

Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	abc=rs.Fields ("empname")
	Response.Write "<OPTION VALUE=" & rs.Fields("empcode") & ">" & abc& "</OPTION>"
	rs.MoveNext
loop
rs.Close

end sub
%>
<html>
<head>
<title>Update Individual Employee</title>

</head>

<body>
<!--#include virtual="/payroll/include/top.htm" --> <!--#include virtual="/payroll/include/navigation.htm" --> 
<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">
  <tr bgcolor="#330000"> 
    <td> 
      <% call period()%>
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#CCCCCC">INSERT 
        INDIVIDUAL EMPLOYEE PAYROLL</font></b></font></div>
    </td>
  </tr>
</table>
<form method="post" action="individualinsert.asp">
  <table width="57%" border="1" vspace="0" hspace="0" height="200" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center">
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="91"> 
        <div align="center"><b>Employee 
          <select name="empcode">
            <% fillcomboemp()%> 
          </select>
          </b></div>
      </td>
    </tr>
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="52"> 
        <div align="center"><b>Payroll Period :<% response.write mpname%></b></div>
      </td>
    </tr>
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="54"> 
        <div align="center"><b> 
          <input type="submit" name="Process" value="Process" >
          </b></div>
      </td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
