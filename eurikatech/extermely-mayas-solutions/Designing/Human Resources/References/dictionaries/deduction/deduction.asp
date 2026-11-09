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
sql="select * from " & session("bookcode") &  ".deduction order by code"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()

rs.Open sql,cn
do while not rs.EOF

Response.Write "<TR><TD>" & rs.Fields("code") & "</TD>"
Response.Write "<TD>" & rs.Fields("name") & "</TD>"
if isnull(rs.Fields ("pfcheck")) then
	Response.Write "<TD>"& "No"& "</TD>"	
else
	if clng(rs.Fields ("pfcheck"))=-1 then
		Response.Write "<TD>"& "Yes"& "</TD>"	
	else
		Response.Write "<TD>"& "No"& "</TD>"	
	end if	
end if 	

sql="javascript:edit('mcode=" & rs.fields("code") & "')"
sql1="javascript:deleterec('mcode=" & rs.fields("code") & "')"
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

function add() {
window.open("adddeduction.asp","adddeduction","height=250,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("editdeduction.asp?"+ic,"editdeduction","height=200,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deletededuction.asp?"+ic,"deletededuction","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Deduction</TITLE></HEAD>
<BODY>
<!--#Include virtual="/PAYROLL/include/top.htm" --> <!--#Include virtual="/PAYROLL/include/navigation.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR bgcolor="#CCCCCC"> 
      <TD HEIGHT="28"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Deduction 
          </B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#666666" BORDERCOLOR="#663300"> 
      <TD WIDTH="12%"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Code</FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="48%"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Name 
          </FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="17%"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Inc. 
          PF Ded </font></b></font></div>
      </TD>
      <TD WIDTH="11%">&nbsp;</TD>
      <TD WIDTH="12%">&nbsp;</TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63"><DIV ALIGN="CENTER">
          <INPUT TYPE="button" NAME="Button" VALUE="Add New Deduction" onclick="add()">
        </DIV></TD></TR></TABLE></FORM>
</BODY>
</HTML>
