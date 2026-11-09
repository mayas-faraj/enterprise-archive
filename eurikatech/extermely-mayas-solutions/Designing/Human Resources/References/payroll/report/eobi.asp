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
dim sql, mcode, muname
dim sql1
dim serial
dim eobi
dim totaleobi
mcode=Request.QueryString("code")
muname=Request.QueryString("uname")
'Response.Write muname & "ABC"
sql="select * from " & session("bookcode") &  ".qryeobi where  code =" & mcode
set rs=Server.CreateObject("ADODB.Recordset")

rs.Open sql,cn
do while not rs.EOF
serial=serial+1
Response.Write "<TR><TD><div align=center>" & serial & "</div></TD>"
Response.Write "<TD>" & rs.Fields("empcode") & "</TD>"
Response.Write "<TD>" & rs.Fields("empname") & "</TD>"
Response.Write "<TD><div align=center>" & rs.Fields("name") & "</div></TD>"
if cint(rs.Fields("sumofamount"))>3000 then
	Response.Write "<TD><div align=right>" & "Above 3000" & "</div></TD>"
else
	Response.Write "<TD><div align=right>" & formatnumber(rs.Fields("sumofamount")) & "</div></TD>"
end if
if cint(rs.Fields("sumofamount"))<3000 then
	eobi=round(cint(rs.fields("sumofamount"))*0.05,0)
else
	eobi=150
end if		
Response.Write "<TD><div align=right>" & formatnumber(eobi) & "</div></TD>"
totaleobi=totaleobi+eobi
rs.MoveNext

loop
with response	
	.Write "<tr><td> </td><td></td><td>Total</td>"
	.Write "<td></td><td></td>"
	.Write "<td><div align=right>" & formatnumber(totaleobi) & "</div></td></tr>"	
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
    <TD HEIGHT="50"> 
      <DIV ALIGN="CENTER"> 
        <p><i><font size="3"><%response.write Request.QueryString("uname")%></font></i></p>
        <p><B><FONT COLOR="#000000">EOBI Contribution for the month of </FONT></B><B><FONT COLOR="#000000"><%response.write monthname(month(date))&" "&year(date)%></FONT></B></p>
        </DIV>
    </TD></TR></TABLE>
<TABLE WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" HEIGHT="26">
  <TR> 
    <TD WIDTH="6%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Serial 
        No </B></FONT></DIV>
    </TD>
    <TD WIDTH="9%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>EMP. 
        Code </B></FONT></DIV>
    </TD>
    <TD WIDTH="22%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Name 
        </B></FONT></DIV>
    </TD>
    <TD WIDTH="17%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Designation</B></FONT></DIV>
    </TD>
    <TD WIDTH="16%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Gross 
        Salary </B></FONT></DIV>
    </TD>
    <TD WIDTH="10%"> 
      <DIV ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2" COLOR="#333333"><B>Contribution 
        Amount</B></FONT></DIV>
    </TD>
  </TR>
  <%call display()%> 
</TABLE>
<%call closecn()%> 
</BODY>
</HTML>
