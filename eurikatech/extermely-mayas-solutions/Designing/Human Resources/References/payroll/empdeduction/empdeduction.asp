<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include virtual="\payroll\include\usercheck.htm" -->
<!--#Include virtual="\payroll\include\connect.asp" -->

<%

sub display()

dim rs
dim sql
dim sql1
dim sql2
sql="select distinct empcode, empname from " & session("bookcode") &  ".qrysalaryinfo order by empcode"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()
rs.Open sql,cn
do while not rs.EOF

Response.Write "<TR><TD>" & rs.Fields("empcode") & "</TD>"
'Response.Write "<TD>" & rs.Fields("empname") & "</TD>"
sql="javascript:edit('mcode=" & rs.fields("empcode") & "')"
'sql1="javascript:deleterec('mcode=" & rs.fields("empcode") & "')"
'sql2="javascript:add('mcode=" & rs.fields("empcode") & "')"
'if isnull(rs.Fields ("name")) and isnull(rs.Fields ("accountno")) and isnull(rs.Fields ("pfaccountno")) then
'	Response.Write "<TD><A href=" & sql2 & ">Add" &  "</A></TD></TR>"		
	
'else
Response.Write "<TD><A href=empdeduction1.asp?code=" & rs.Fields("empcode") & ">" & rs.Fields("empname") & "</A></TD></TR>"
'	Response.Write "<TD><A href=" & sql & ">" &rs.Fields ("empname")&" </A></TD>"	
'	Response.Write "<TD><A href=" & sql1 & ">Delete" &  "</A></TD></TR>"	
'end if	

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

window.open("addsalaryinfo.asp?"+ic,"addSalaryinfo","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("empdeduction1.asp?"+ic,"empdeduction","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteSalaryinfo.asp?"+ic,"deleteSalaryinfo","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Employee Information</TITLE></HEAD>
<BODY>
<!--#Include virtual="/PAYROLL/include/top.htm" --> <!--#Include virtual="/PAYROLL/include/navigation.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR bgcolor="#CCCCCC"> 
      <TD HEIGHT="28"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Employee 
          Fixed Deduction</B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#666666" BORDERCOLOR="#663300"> 
      <TD WIDTH="22%"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Employee 
          Code </FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="78%"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Employee 
          Name </FONT></B></FONT></DIV>
      </TD>
    </TR>
    <% call display %>
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR>
      <TD HEIGHT="21"> 
        <DIV ALIGN="CENTER"> </DIV>
      </TD></TR></TABLE></FORM>
</BODY>
</HTML>
