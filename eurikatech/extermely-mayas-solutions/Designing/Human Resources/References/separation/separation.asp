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
sql="select name,leavingdate,rowid as rid, empcode, leavingreasoncode,empname from "&session("bookcode")&".qrysepration where empcode='" & empcode & "'"
set rs=Server.CreateObject("ADODB.Recordset")
rs.Open sql,cn

end sub



sub display()

do while not rs.EOF

Response.Write "<TR><TD>" & rs.Fields("name") & "</TD>"
Response.Write "<TD>" &formatdatetime(rs.Fields("leavingdate"),1) & "</TD>"
sql="javascript:edit('id=" & rs.fields("rid") & "')"
sql1="javascript:deleterec('id=" & rs.fields("rid") & "')"
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
window.open("addseparation.asp?"+ic,"addseparation","height=200,width=350,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("editseparation.asp?"+ic,"editseparation","height=200,width=350,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteseparation.asp?"+ic,"deleteseparation","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Employee Designation</title></head>
<%call loadename()%>
<%call loadrec()%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include file="../include/top.htm" --> <!--#Include file="../include/navigation.htm" --> 
<form METHOD="post" >
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <tr><td HEIGHT="28">
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><b>Employee 
          Separation</b></font></div>
      </td></tr></table>    
  <table><tr><td>Employee Name :- <%Response.Write mname%>  </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="29%" bgcolor="#660000" bordercolor="#663300"> 
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Separation 
          Reason</font></b></font></div>
      </td>
      <td WIDTH="36%" bgcolor="#660000" bordercolor="#663300"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Separation 
          Date</font></b></font></div>
      </td>
      <td WIDTH="17%" bgcolor="#660000"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b> 
          </b></font></div>
      </td>
      <td WIDTH="18%" bgcolor="#660000"> 
        <div align="center"><font color="#FFFFFF"></font></div>
      </td>
    </tr>
    <%call display()%> 
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><tr><td HEIGHT="63"><div ALIGN="CENTER">
          <input TYPE="button" NAME="Button" VALUE="Add Separation" onclick="javascript:add('empcode=<%Response.Write empcode%>')">
        </div></td></tr></table></form>
</body>
</html>
