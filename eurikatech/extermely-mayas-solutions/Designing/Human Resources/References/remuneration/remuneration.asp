<%@ Language=VBScript %>

<%
Option Explicit

%>

<!--#Include file="..\include\usercheck.htm" -->
<!--#Include file="..\include\connect.asp" -->

<%

dim rs,sql,sql1,empcode,mname
empcode=Request.QueryString("empno")
call connect()

sub loadename()
dim rstmp
dim rs1
sql="select table_name, privilege from user_tab_privs_recd where table_name='QRYEMPPROFILEM' and privilege='SELECT'"
set rstmp=server.CreateObject("ADODB.Recordset")
rstmp.Open sql,cn

if rstmp.EOF and rstmp.BOF then
	sql="select * from " & session("bookcode") &  ".qryempprofilen where empcode='" & empcode & "'"
	set rs1=Server.CreateObject("ADODB.Recordset")
	rs1.Open sql,cn
	if rs1.EOF and rs1.BOF then
		Response.Write "Unable to find the employee profile or invalid employee code"
		Response.Write "Click back button of browser to go back"
		rs1.Close
		set rs1=nothing
		Response.End
	end if
ELSE
	sql="select * from " & session("bookcode") &  ".qryempprofilem where empcode='" & empcode & "'"
	set rs1=Server.CreateObject("ADODB.Recordset")
	rs1.Open sql,cn
	if rs1.EOF and rs1.BOF then
		Response.Write "Unable to find the employee profile or invalid employee code"
		Response.Write "Click back button of browser to go back"
		rs1.Close
		set rs1=nothing
		Response.End
	end if
END IF	

mname=rs1.Fields("empname")
rs1.Close
set rs1=nothing

end sub

sub loadrec()

empcode=Request.QueryString("empno")
sql="select * from "& session ("bookcode") & ".qrysumsalary1 where empcode='" & empcode & "'"
set rs=Server.CreateObject("ADODB.Recordset")
rs.Open sql,cn

end sub


sub display()
dim abc
do while not rs.EOF
abc="  "
if isnull(rs.Fields ("sumofamount")) then
	Response.Write "<TR><TD>No Gross Allowance Matched</TD>"
else
	Response.Write "<TR><TD>" & rs.Fields("sumofamount") & "</TD>"
end if	
Response.Write "<TD>" & formatdatetime( rs.Fields("startdate"),1)&  "</TD>"
if isdate(rs.Fields ("enddate")) then
	Response.Write "<TD>" &formatdatetime(rs.Fields("enddate"),1) & "</TD>"
else
	Response.Write "<TD>" &abc& "</TD>"
end if	
if isnull(rs.Fields("enddate")) then
	sql="javascript:edit('id=" & rs.Fields("entryid") & "&startdate=" & rs.fields("startdate") & "')"
else	
	sql="javascript:edit('id=" & rs.Fields("entryid") & "&startdate=" & rs.fields("startdate") & "&enddate=" & rs.Fields("enddate") & "')"
end if
sql1="javascript:deleterec('id=" & rs.fields("entryid") & "')"
Response.Write "<TD>"
'if ccur(rs.Fields("sumofamount"))<>0 then
	Response.Write "<A href=" & sql & ">Edit" &  "</A>"	
'end if
Response.Write "</TD>"
Response.Write "<TD><A href=" & sql1 & ">Delete" &  "</A></TD></TR>"	
rs.MoveNext

loop
rs.Close
set rs=nothing
cn.close
set cn=nothing

end sub

%>


<script LANGUAGE="JavaScript">

function add(ic) {
window.open("addremuneration.asp?"+ic,"addremuneration","height=500,width=400,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes")
}

function edit(ic) {
window.open("editremuneration.asp?"+ic,"editremuneration","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes")

}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteremuneration.asp?"+ic,"deleteremuneration","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Employee Work History</title></head>
<%call loadename()%>
<%call loadrec()%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include file="../include/top.htm" --> <!--#Include file="../include/navigation.htm" --> 
<form METHOD="post" >
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <tr><td HEIGHT="28">
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><b>Employee 
          Remuneration</b></font></div>
      </td></tr></table>    
  <table><tr><td>Employee Name :- <%Response.Write mname%>  </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <tr BGCOLOR="#660000" BORDERCOLOR="#660000"> 
      <td WIDTH="23%"> 
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Gross 
          Salary </font></b></font></div>
      </td>
      <td WIDTH="23%"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Start 
          Date</font> </b></font><font color="#FFFFFF"> </font></b></font></div>
      </td>
      <td WIDTH="17%"> 
        <div align="center"><font color="#FFFFFF"><b>End Date</b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"></font></div>
      </td>
      <td WIDTH="19%"> 
        <font color="#FFFFFF"></font>
      </td>
      <td WIDTH="7%"> 
        <font color="#FFFFFF"></font>
      </td>      
    </tr>
    <%call display()%> 
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><tr><td HEIGHT="63"><div ALIGN="CENTER">
          <input TYPE="button" NAME="Button" VALUE="Add New Salary" onclick="javascript:add('empcode=<%Response.Write empcode%>')">
        </div></td></tr></table></form>
</body>
</html>
