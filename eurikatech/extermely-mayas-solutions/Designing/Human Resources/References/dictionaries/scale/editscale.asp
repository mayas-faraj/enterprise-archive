
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
sql="select * from " & session("bookcode") &  ".scale where code=" & mcode 
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

if (document.form1.min.value=="")
{
alert ("You must fill the Minimum Salary!")
document.form1.min.focus()
return false
}
if (document.form1.max.value=="")
{
alert ("You must fill the Maximum Salary!")
document.form1.max.focus()
return false
}

var checkOK = "0123456789";

var checkStr = document.form1.min.value;
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
    alert("Please enter only numeric characters in Minimum Salary");
    document.form1.min.focus()
    return (false);
  }
  if (checkStr.length>5)
  {
	alert("Please enter only 5 numeric characters in Minimum Salary");
    document.form1.min.focus()
    return (false);
  }
  var checkStr = document.form1.max.value;
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
    alert("Please enter only numeric characters in Maximum Salary");
    document.form1.max.focus()
    return (false);
  }
  if (checkStr.length>5)
  {
	alert("Please enter only 5 numeric characters in Maximum Salary");
    document.form1.max.focus()
    return (false);
  }
}

//-->
</script>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</head>
<body>
<%call loadrec()%> <form Name="form1" METHOD="post" ACTION="editscaledb.asp?mcode=<%Response.Write cstr(mcode)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr> 
      <td HEIGHT="29" width="68%"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Edit 
          Min &amp; Max of Scale <%Response.Write rs.Fields("code")%></font></b></font></div>
      </td>
    </tr>
  </table>
  <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolorlight="#330066" height="135">
    <tr></tr>
    <tr> 
      <td width="44%" height="45"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Minimum 
        Salary</font></td>
      <td width="56%" height="45"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="min" maxlength="50" size="25" value="<%Response.Write rs.Fields("minsal")%>">
        </font> 
    </tr>
    <tr> 
      <td width="44%" height="45"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Maximum 
        Salary </font></td>
      <td width="56%" height="45"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="max" maxlength="50" size="25" value="<%Response.Write rs.Fields("maxsal")%>">
        </font> 
    </tr>
    <tr> 
      <td width="44%" height="45">Managerial</td>
      <td width="56%" height="45"> <% if cint(rs.Fields ("mcheck"))=-1 then %> 
        <input type="checkbox" name="mcheck" checked >
        <% else %> 
        <input type="checkbox" name="mcheck" >
        <% end if %> 
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="64" WIDTH="54%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%">
        <div ALIGN="CENTER">
          <input type="reset" name="Submit2" value="Clear Update">
        </div>
      </td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
