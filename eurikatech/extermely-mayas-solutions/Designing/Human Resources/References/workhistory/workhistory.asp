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

dim rs1
sql="select * from " & session("bookcode") &  ".qryempprofile where empcode='" & empcode & "'"
set rs1=Server.CreateObject("ADODB.Recordset")
rs1.Open sql,cn
if rs1.EOF and rs1.BOF then
	Response.Write "Unable to find the employee profile or invalid employee code"
	Response.Write "Click back button of browser to go back"
	rs1.Close
	set rs1=nothing
	Response.End
end if
mname=rs1.Fields("empname")
rs1.Close
set rs1=nothing

end sub

sub loadrec()

empcode=Request.QueryString("empno")
sql="select * from " & session("bookcode") &  ".qryworkhistory where empcode='" & empcode & "'"
set rs=Server.CreateObject("ADODB.Recordset")
rs.Open sql,cn

end sub



sub display()
dim abc, edate
abc=" "
do while not rs.EOF
Response.Write "<TR><TD>" & rs.Fields("employeesstatusname") & "</TD>"
Response.Write "<TD>" & rs.Fields("designationname") & "</TD>"
Response.Write "<TD>  "&formatdatetime(rs.Fields("startdate"),1 )& "</TD>"
if isdate(rs.Fields ("enddate")) then
	Response.Write "<TD> "&formatdatetime(rs.Fields("enddate"),1)& "</TD>"
else
	Response.Write "<TD>"&abc& "</TD>"
end if

sql="javascript:edit('id=" & rs.fields("entryid") & "')"
sql1="javascript:deleterec('id=" & rs.fields("entryid") & "')"
Response.Write "<TD><A href=" & sql & ">Edit" &  "</A></TD>"	
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
window.open("addworkhistory.asp?"+ic,"addworkhistory","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("editworkhistory.asp?"+ic,"editworkhistory","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteworkhistory.asp?"+ic,"deleteworkhistory","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
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
          Work History</b></font></div>
      </td></tr></table>    
  <table><tr><td>Employee Name :- <%Response.Write mname%>  </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <tr BGCOLOR="#000066" BORDERCOLOR="#663300"> 
      <td WIDTH="23%" bgcolor="#660000" bordercolor="#663300"> 
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Employee 
          Status </font></b></font></div>
      </td>
      <td WIDTH="23%" bgcolor="#660000"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Designation 
          </font></b></font></div>
      </td>
      <td WIDTH="17%" bgcolor="#660000"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Start 
          Date</font> </b></font></div>
      </td>
      <td WIDTH="19%" bgcolor="#660000"> 
        <div align="center"><font color="#FFFFFF"><b>End Date</b></font></div>
      </td>
      <td WIDTH="7%" bgcolor="#660000">&nbsp;</td>
      <td WIDTH="11%" bgcolor="#660000">&nbsp;</td>
    </tr>
	<%call display()%>       
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><tr><td HEIGHT="63"><div ALIGN="CENTER">
          <input TYPE="button" NAME="Button" VALUE="Add New Employee Designation" onclick="javascript:add('empcode=<%Response.Write empcode%>')">
        </div></td></tr></table></form>
</body>
</html>
