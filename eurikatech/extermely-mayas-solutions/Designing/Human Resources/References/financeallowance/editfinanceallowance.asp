
<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%

dim rs
dim mcode
dim rsfill
dim sql
call connect()

sub loadrec()
mcode=Request.QueryString("mcode")
set rs=server.CreateObject("ADODB.Recordset")
sql="select * from " & session("bookcode") &  ".qryinit_allow where id='" &mcode&"'" 

rs.Open sql,cn
end sub


	
sub fillcomboded(srchfield)
set rsfill=server.CreateObject("ADODB.Recordset")
sql="select * from "& session("bookcode") & ".deduction order by code"
rsfill.open sql,cn
do while not rsfill.eof
	
	if cint(rsfill.Fields ("code"))=cint(srchfield) then
		Response.Write "<option value=" & rsfill.fields ("code") & " Selected>" & rsfill.fields ("name") & "</option>"
	else
		Response.Write "<option value=" & rsfill.fields ("code") & ">" & rsfill.fields ("name") & "</option>"
	end if
	rsfill.movenext
loop
rsfill.close
end sub			

sub closerec()
rs.Close
set rs=nothing
cn.close
set cn=nothing
end sub


%>

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.name.value=="")
{
alert ("You must fill the department Name!")
document.form1.name.focus()
return false
}
}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</head>
<body>
<%call loadrec()%> 
<form Name="form1" METHOD="post" ACTION="editfinanceallowancedb.asp?mcode=<%Response.Write cstr(mcode)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr bgcolor="#666666"> 
      <td HEIGHT="29"> 
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Edit 
          Employee Allowance</font></b></font></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#330066">
    <tr></tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="61"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Employee 
        Name </font></td>
      <td WIDTH="56%" HEIGHT="61"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"> 
        <%Response.Write rs.Fields("empname")%></font> 
    </tr>
    <tr>
      <td WIDTH="44%" HEIGHT="61">Period</td>
      <td WIDTH="56%" HEIGHT="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%Response.Write rs.Fields("period")%></font>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="61">Allowance</td>
      <td WIDTH="56%" HEIGHT="61"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%Response.Write rs.Fields("name")%></font> 
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="61">Amount</td>
      <td WIDTH="56%" HEIGHT="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="amount" maxlength="50" size="25" value="<%Response.Write rs.Fields("amount")%>">
        </font> 
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear Update"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
