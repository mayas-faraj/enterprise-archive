<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include virtual="\hris\include\usercheck.htm" -->
<!--#Include virtual="\hris\include\connect.asp" -->

<%

sub display()

dim rs
dim sql
dim sql1
sql="select * from " & session("bookcode") &  ".scale"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()
rs.Open sql,cn
do while not rs.EOF

Response.Write "<TR><TD><div align=center>" & rs.Fields("code") & "</TD>"
Response.Write "<TD>" & rs.Fields("Minsal") & "</TD>"
Response.Write "<TD>" & rs.Fields("Maxsal") & "</TD>"
if cint(rs.Fields ("mcheck"))=-1 then
	Response.Write "<TD>" & "Yes" & "</TD>"
else
	Response.Write "<TD>" & "No" & "</TD>"
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
window.open("addscale.asp","addscale","height=260,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function edit(ic) {
window.open("editscale.asp?"+ic,"editscale","height=220,width=400,status=yes,toolbar=no,menubar=no,location=no")
}

function deleterec(ic) {

var ans
ans=window.confirm("Are you Sure to Delete")
if (ans==true) {
	window.open("deletescale.asp?"+ic,"deletescale","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no")
}	
}
</script>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Allowances</TITLE></HEAD>
<BODY>
<!--#Include virtual="/hris/include/top.htm" --> <!--#Include virtual="/hris/include/navigation.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR><TD HEIGHT="28">
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Scales 
          </B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#000066" BORDERCOLOR="#663300"> 
      <TD WIDTH="17%" bgcolor="#660000"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Scale</FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="24%" bgcolor="#660033"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Min 
          Salary </font></b></font></div>
      </TD>
      <TD WIDTH="21%" bgcolor="#660033"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Max 
          Salary </FONT></B></FONT></DIV>
      </TD>
      <TD WIDTH="20%" bgcolor="#660000">
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Managerial 
          </font></b></font></div>
      </TD>
      <TD WIDTH="8%" bgcolor="#660000">&nbsp;</TD>
      <TD WIDTH="10%" bgcolor="#660000">&nbsp;</TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63"><DIV ALIGN="CENTER">
          <INPUT TYPE="button" NAME="Button" VALUE="Add New Scales" onclick="add()">
        </DIV></TD></TR></TABLE></FORM>
</BODY>
</HTML>
