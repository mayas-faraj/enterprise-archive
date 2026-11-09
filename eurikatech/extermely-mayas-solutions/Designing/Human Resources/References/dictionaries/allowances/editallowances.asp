
<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="/hris/include/connect.asp" -->

<%


dim rs
dim mcode

sub loadrec()

dim sql
mcode=cint(Request.QueryString("mcode"))
call connect()
set rs=server.CreateObject("ADODB.Recordset")
sql="select name,gtag,shortn from " & session("bookcode") &  ".allowance where code=" & mcode 
rs.Open sql,cn

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
<%call loadrec()%> <form Name="form1" METHOD="post" ACTION="editallowancesdb.asp?mcode=<%Response.Write cstr(mcode)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Edit 
          Allowances</font></b></font></div>
      </td></tr></table>
  <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolorlight="#330066">
    <tr></tr>
    <tr> 
      <td width="44%" height="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Allowances 
        </font></td>
      <td width="56%" height="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="name" maxlength="50" size="25" value="<%Response.Write rs.Fields("name")%>">
        </font> 
    </tr>
    <tr> 
      <td width="44%" height="61">Short Name (Max 5 Character)</td>
      <td width="56%" height="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        <input type="text" name="shortn" maxlength="5" size="25" value="<%Response.Write rs.Fields("shortn")%>">
        </font> 
    </tr>
    <tr> 
      <td width="44%" height="61">Inc. In Gross (Y / N)</td>
      <td width="56%" height="61"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
      <% if cint(rs.Fields("gtag"))=-1 then%>
		<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="checkbox" name="gtag" checked  >
      <% else %> 
        <input type="checkbox" name="gtag" >
      <% end if %></font>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear Update"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
