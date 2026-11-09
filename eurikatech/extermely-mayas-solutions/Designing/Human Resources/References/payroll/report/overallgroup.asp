<%@ Language=VBScript %>

<%
Option Explicit

%>

<!--#Include File="../include/usercheck.htm" -->
<!--#Include File="../include/connect.asp" -->

<%


dim rs
call connect()

sub display()

dim rs
dim sql
dim sql1
dim serial
dim eobi
' dim totaleobi

sql="select * from " & session("bookcode") &  ".qrygroup"
set rs=Server.CreateObject("ADODB.Recordset")
dim rough
rs.Open sql,cn
do while not rs.EOF
serial=serial+1
Response.Write "<TR><TD><div align=center>" & serial & "</div></TD>"
Response.Write "<TD><div align=center>" & rs.Fields("empcode") & "</div></TD>"
Response.Write "<TD>" & rs.Fields("empname") & "</TD>"
Response.Write "<TD><div align=center>" & rs.Fields("name") & "</div></TD>"
Response.Write "<TD><div align=center>" & rs.Fields("dateofbirth") & "</div></TD>"
Response.Write "<TD><div align=center>" & rs.Fields("Appointmentdate") & "</div></TD>"
Response.Write "<TD><div align=right>" & formatnumber(rs.Fields("sumofamount")) & "</div></TD>"
rough=formatnumber(rs.Fields("sumofamount"))
rough=rough*24

if rough>100000 then

	eobi=rough
else
	eobi=100000
end if		
Response.Write "<TD><div align=right>" & formatnumber(eobi) & "</div></TD>"
Response.Write "<TD><div align=center>" & rs.Fields("code") & "</div></TD>"

rem  totaleobi=totaleobi+eobi
rs.MoveNext

loop
with response	
	.Write "<tr><td> </td><td> </td><td></td>"
	.Write "<td></td><td></td>"
'	.Write "<td><div align=right>" & formatnumber(totaleobi) & "</div></td></tr>"	
	end with
rs.Close
set rs=nothing

end sub

sub closecn()

cn.close
set cn=nothing

end sub

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>EOBI Report</TITLE></HEAD>
<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="24"><TR>
    <TD height="28"> 
      <DIV ALIGN="CENTER"><b><font face="Arial, Helvetica, sans-serif"><u>Aga 
        Khan Health Service, Pakistan</u></font></b></DIV>
    </TD></TR></TABLE>
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" height="81">
  <TR>
    <TD HEIGHT="96"> 
      <DIV ALIGN="CENTER"> 
        <p><B><FONT COLOR="#000000">Group Insurance List</FONT></B></p>
        <p>As on <%response.write monthname(month(date))&" "&year(date)%></p>
        </DIV>
    </TD></TR></TABLE>
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26">
  <TR> 
    <TD WIDTH="8%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Serial 
        No </B></FONT></DIV>
    </TD>
    <TD WIDTH="10%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>EMP. 
        Code </B></FONT></DIV>
    </TD>
    <TD WIDTH="23%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Name 
        </B></FONT></DIV>
    </TD>
    <TD WIDTH="23%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Designation</B></FONT></DIV>
    </TD>
    <TD WIDTH="15%">
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Date 
        of Birth</b></font></div>
    </TD>
    <TD WIDTH="15%">
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Date 
        of Appoint</b></font></div>
    </TD>
    <TD WIDTH="15%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Gross 
        Salary </B></FONT></DIV>
    </TD>
    <TD WIDTH="13%"> 
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#333333"><b>Insured 
        Amount</b></font></div>
    </TD>
    <TD WIDTH="8%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Unit 
        Code </B></FONT></DIV>
    </TD>
  </TR>
  <%call display()%> 
</TABLE>
<%call closecn()%> 
</BODY>
</HTML>
