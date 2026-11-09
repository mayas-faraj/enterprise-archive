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
sql="select * from " & session("bookcode") &  ".Period order by code"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()

rs.Open sql,cn
do while not rs.EOF

Response.Write "<TR><TD>" & rs.Fields("code") & "</TD>"
Response.Write "<TD>" & rs.Fields("name") & "</TD>"
Response.Write "<TD>" & rs.Fields("days") & "</TD>"
Response.Write "<TD>" & rs.Fields("startdate") & "</TD>"
Response.Write "<TD>" & rs.Fields("enddate") & "</TD>"
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
window.open("addperiod.asp","addperiod","height=400,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("editperiod.asp?"+ic,"editperiod","height=350,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deleteperiod.asp?"+ic,"deleteperiod","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Period</TITLE></HEAD>
<BODY>
<!--#Include virtual="/PAYROLL/include/top.htm" --> <!--#Include virtual="/PAYROLL/include/navigation.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR bgcolor="#CCCCCC"> 
      <TD HEIGHT="28"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Period 
          </B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#666666" BORDERCOLOR="#663300"> 
      <TD WIDTH="7%" height="47"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Code</FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="34%" height="47"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Name 
          </FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="13%" height="47"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Days</font></b></font></div>
      </TD>
      <TD WIDTH="15%" height="47"> 
        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b></b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Start 
          Date</font></b></font></div>
      </TD>
      <TD WIDTH="16%" height="47"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">End 
          Date</font></b></font></div>
      </TD>
      <TD WIDTH="8%" height="47">&nbsp;</TD>
      <TD WIDTH="7%" height="47">&nbsp;</TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63"><DIV ALIGN="CENTER">
          <INPUT TYPE="button" NAME="Button" VALUE="Add New Period" onclick="add()">
        </DIV></TD></TR></TABLE></FORM>
</BODY>
</HTML>
