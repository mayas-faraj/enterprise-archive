<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include virtual="\payroll\include\usercheck.htm" -->
<!--#Include virtual="\payroll\include\connect.asp" -->

<%


DIM MCODE
dim mname
dim sql
dim sql1,rs
mcode=(Request.QueryString ("code"))
sql="select empname from " & session("bookcode") &  ".qrysalaryinfo where empcode=" & mcode
set rs=Server.CreateObject("ADODB.Recordset")
call connect()
rs.Open sql,cn
mname=rs.fields("empname")
rs.close

sql="select * from " & session("bookcode") &  ".qryhrallow where empcode=" & mcode
set rs=Server.CreateObject("ADODB.Recordset")
call connect()

rs.Open sql,cn


sub display()
'dim rs
do while not rs.EOF
Response.Write "<TR><TD>" & rs.Fields("name") & "</TD>"
Response.Write "<TD>" & rs.Fields("period") & "</TD>"
Response.Write "<TD>" & rs.Fields("amount") & "</TD>"
sql="javascript:edit('mcode=" & rs.fields("id") & "')"
'sql="javascript:edit('mcode=" & rs.fields("empcode") & "')"
'sql1="javascript:deleterec('mcode=" & rs.fields("empcode") & "')"
sql1="javascript:deleterec('mcode=" & rs.fields("id") & "')"
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
window.open("addhrallowance.asp?"+ic,"addhrallowance","height=300,width=600,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("edithrallowance.asp?"+ic,"edithrallowance","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deletehrallowance.asp?"+ic,"deletehrallowance","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Employee Deduction </TITLE></HEAD>
<BODY>
<!--#Include virtual="/PAYROLL/include/top.htm" --> <!--#Include virtual="/PAYROLL/include/navigation.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR bgcolor="#CCCCCC"> 
      <TD HEIGHT="28"> 
        <%' if rs.EOF  then %> 
			
        <%' else %>	
          
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Addition 
          of Allowance of <% Response.Write mname%> </B></FONT></DIV>
       <%' end if  %>   
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#666666" BORDERCOLOR="#663300"> 
      <TD WIDTH="28%"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Allowance 
          </FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="16%"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Period</font></b></font></div>
      </TD>
      <TD WIDTH="22%">
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Amount</font></b></font></div>
      </TD>
      <TD WIDTH="18%">&nbsp;</TD>
      <TD WIDTH="16%">&nbsp;</TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63"><DIV ALIGN="CENTER">
          <INPUT TYPE="button" NAME="Button" VALUE="Add New Employee Allowance" onclick="javascript:add('empcode=<%Response.Write mcode %>')">
        </DIV></TD></TR></TABLE></FORM>
</BODY>
</HTML>
