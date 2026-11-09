
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
sql="select name from " & session("bookcode") &  ".religion where code=" & mcode 
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
<%call loadrec()%> <form Name="form1" METHOD="post" ACTION="editreligiondb.asp?mcode=<%Response.Write cstr(mcode)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><b><font COLOR="#FFFFFF">Edit 
          Religion</font></b></font></div>
      </td></tr></table><table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#330066"><tr></tr><tr>
      <td WIDTH="44%" HEIGHT="61"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Religion 
         </font></td>
      <td WIDTH="56%" HEIGHT="61"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">
        <input TYPE="text" NAME="name" MAXLENGTH="50" SIZE="25" value="<%Response.Write rs.Fields("name")%>">
        </font></tr></table><table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear Update"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
