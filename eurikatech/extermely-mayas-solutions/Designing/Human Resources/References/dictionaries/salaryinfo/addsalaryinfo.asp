<%@ Language=VBScript %>
<%
option explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#include virtual="/payroll/include/connect.asp"-->
<%
call connect()
dim rs
dim rs1
dim mcode
dim sql
set rs=server.CreateObject ("ADODB.Recordset")
mcode=Request.QueryString("mcode")
set rs1=server.CreateObject("ADODB.Recordset")
sql="select * from " & session("bookcode") &  ".qrySalaryinfo where empcode=" & mcode 
rs1.Open sql,cn


sub fillcomboded()
dim abc
dim sql

sql="select * from " & session("bookcode") &  ".bank"
rs.Open sql,cn
Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	
	Response.Write "<OPTION VALUE=" & rs.Fields("code") & ">" & rs.Fields ("name")& "</OPTION>"
	rs.MoveNext
loop
rs.Close

end sub

sub closecn()

set rs=nothing
cn.close
set cn=nothing

end sub
%>
<script LANGUAGE="JavaScript">
<!--
		


function validate() {

if (document.form1.empcode.value=="")
{
alert ("You must fill the Empployee Code!")
document.form1.empcode.focus()
return false
}

if (document.form1.dedcode.value=="")
{
alert ("You must fill the Deduction Code!")
document.form1.dedcode.focus()
return false
}

var checkOK = "0123456789";
var checkStr = document.form1.code.value;
  var allValid = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    alert("Please enter only numeric characters in Code.");
    document.form1.code.focus()
    return (false);
  }

}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Add New Salaryinfo</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addSalaryinfodb.asp?mcode=<%Response.Write cstr(mcode)%>" >
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr bgcolor="#666666"> 
      <td HEIGHT="29"> 
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add New Salary Information</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="44"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Employee 
        Name </font></td>
      <td WIDTH="56%" HEIGHT="44"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%Response.Write rs1.Fields("empname")%></font></td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="60"> Bank </td>
      <td WIDTH="56%" HEIGHT="60"> 
        <select name="bank">
          <%fillcomboded()%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="60">Bank Account No.</td>
      <td WIDTH="56%" HEIGHT="60"> 
        <input type="text" name="accountno">
      </td>
    </tr>
    <tr>
      <td WIDTH="44%" HEIGHT="60">Provident Fund Account No.</td>
      <td WIDTH="56%" HEIGHT="60">
        <input type="text" name="Pfaccountno">
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
