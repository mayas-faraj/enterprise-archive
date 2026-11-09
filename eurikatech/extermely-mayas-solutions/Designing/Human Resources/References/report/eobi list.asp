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
sql="select * from " & session("bookcode") &  ".qryeobiunit"
set rs=Server.CreateObject("ADODB.Recordset")
call connect()
rs.Open sql,cn
do while not rs.EOF

'Response.Write "<TR><TD><A href=eobi.asp?code=" & rs.Fields("code") & "&fldname=unitcode&detaildesc=" & server.URLEncode(rs.Fields("name")) & ">" & rs.Fields("name") & "</A></TD>"
Response.Write "<TR><TD><A href=eobi.asp?code=" & rs.Fields("code")& "&uname=" & server.URLEncode(rs.Fields("name")) &  ">" & rs.Fields("name") & "</A></TD>"
Response.Write "<TD>" & rs.Fields("countofcode") & "</TD></TR>"
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
        <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#000000"><B>EOBI 
          Summary </B></FONT></DIV>
      </TD></TR></TABLE>
  <TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26" BORDERCOLORLIGHT="#000066">
    <TR BGCOLOR="#000066" BORDERCOLOR="#663300"> 
      <TD WIDTH="17%" bgcolor="#660000" bordercolor="#003333"> 
        <DIV ALIGN="CENTER"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Units 
          </b></font></DIV>
      </TD>
      <TD WIDTH="16%" bgcolor="#660000" bordercolor="#000033"> 
        <DIV ALIGN="CENTER"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><B># 
          of Employee </B></font></DIV>
      </TD>
    </TR>
    <%call display()%> 
  </TABLE>
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD HEIGHT="63">
        <DIV ALIGN="CENTER"> </DIV>
      </TD></TR></TABLE></FORM>
</BODY>
</HTML>
