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
sql="select * from " & session("bookcode") &  ".qryempcontactdir"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()
rs.Open sql,cn
do while not rs.EOF

Response.Write "<TR><TD>" & rs.Fields("empname") & "</TD>"
Response.Write "<TD>" & rs.Fields("resaddress") & "</TD>"
Response.Write "<TD>" & rs.Fields("phone") & "</TD>"
Response.Write "<TD>" & rs.Fields("email") & "</TD>"
Response.Write "<TD>" & rs.Fields("name") & "</TD>"
rs.MoveNext

loop
rs.Close
set rs=nothing
cn.close
set cn=nothing

end sub

%>





<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Region</TITLE></HEAD>
<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include virtual="/hris/include/top.htm" --> 
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC">
    <TR><TD HEIGHT="28">
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>Employee 
          Contact Directory </B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#000066" BORDERCOLOR="#000000"> 
      <TD WIDTH="20%" bgcolor="#660000"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><font color="#FFFFFF">Name</font></B></FONT></DIV>
      </TD>
      <TD WIDTH="26%" bgcolor="#660000"> 
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><font color="#FFFFFF"> 
          Address</font><font color="#000000"></font></B></FONT></DIV>
      </TD>
      <TD WIDTH="15%" bgcolor="#660000"> 
        <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">Telephone#</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"> 
          </font></b></div>
      </TD>
      <TD WIDTH="19%" bgcolor="#660000"> 
        <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">Email 
          Address </font></b></div>
      </TD>
      <TD WIDTH="20%" bgcolor="#660000"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Unit 
          Name </b></font></div>
      </TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63">
        <DIV ALIGN="CENTER"> </DIV>
      </TD></TR></TABLE></FORM>
</BODY>
</HTML>
