
<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#Include virtual="/payroll/include/connect.asp" -->

<%

dim rs
dim mcode
dim mall
dim mamount
dim mname
sub loadrec()

dim sql
mcode=Request.QueryString("mcode")
mall=Request.QueryString ("ALCODE")
mamount=Request.QueryString ("mamount")
mname=Request.QueryString ("mname")


end sub

sub closerec()

'rs.Close
'set rs=nothing
'cn.close

'set cn=nothing


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
<% call loadrec()%>
<form Name="form1" METHOD="post" ACTION="editinddeddb.asp?mcode=<% Response.Write mcode%> &mall=<% Response.Write mall %>  " onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    
    <tr bgcolor="#666666"> 
      <td HEIGHT="29"> 
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Edit 
          Deduction: <%response.write mname%></font></b></font></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#330066">
    <tr> 
      <td WIDTH="44%" HEIGHT="61">
        <div align="center"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Amount 
          <input type="text" name="amount" maxlength="50" size="25" value="<%Response.Write mamount%>">
          </font></div>
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear Update"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
