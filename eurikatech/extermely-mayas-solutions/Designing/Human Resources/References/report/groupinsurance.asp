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
'sql="select * from " & session("bookcode") &  ".qryeobiunit"
'set rs=Server.CreateObject("ADODB.Recordset")
'call connect()
'rs.Open sql,cn
'do while not rs.EOF

'Response.Write "<TR><TD><A href=eobi.asp?code=" & rs.Fields("code") & "&fldname=unitcode&detaildesc=" & server.URLEncode(rs.Fields("name")) & ">" & rs.Fields("name") & "</A></TD>"
'Response.Write "<TR><TD><A href=eobi.asp?code=" & rs.Fields("code")& "&uname=" & server.URLEncode(rs.Fields("name")) &  ">" & rs.Fields("name") & "</A></TD>"
'Response.Write "<TD>" & rs.Fields("countofcode") & "</TD></TR>"
'rs.MoveNext

'loop
'rs.Close
'set rs=nothing
'cn.close
'set cn=nothing

end sub

%>



<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Region</TITLE></HEAD>
<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include virtual="/hris/include/top.htm" -->  
<FORM METHOD="post" ACTION="">
  <TABLE WIDTH="100%" BORDER="2" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFCCCC" bordercolorlight="#000000" bordercolordark="#000000" bordercolor="#000000">
    <TR bordercolor="#333333"> 
      <TD HEIGHT="43"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b><i><font color="#000000">GROUP 
          INSURANCE LIST</font></i> </b></font></div>
      </TD>
    </TR>
    <TR bgcolor="#FFFFFF" bordercolor="#333333"> 
      <TD HEIGHT="43"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b><a href="overallgroup.asp">Overall 
          List</a></b></font></div>
      </TD>
    </TR>
    <TR bgcolor="#FFFFFF" bordercolor="#000000"> 
      <TD HEIGHT="43"> 
        <DIV ALIGN="CENTER"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b><a href="insurance%20list.asp">Unit 
          Wise List</a></b></font></DIV>
      </TD>
    </TR>
  </TABLE>
  </FORM>
</BODY>
</HTML>
