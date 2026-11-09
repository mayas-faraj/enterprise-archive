<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include virtual="\hris\include\usercheck.htm" -->
<!--#Include virtual="\hris\include\connect.asp" -->


<%

call connect()
dim rs
set rs=server.CreateObject("ADODB.Recordset")

sub fillcombo(tablename)

dim sql
sql="select * from " & session("bookcode") &  "." & tablename & " order by name"
rs.Open sql,cn
Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
	Response.Write "<OPTION VALUE=" & rs.Fields("code") & ">" & rs.Fields("name") & "</OPTION>"
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


<!--#Include virtual="/hris/include/usercheck.htm" -->

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.code.value=="")
{
alert ("You must fill the Unit Code!")
document.form1.code.focus()
return false
}

if (document.form1.name.value=="")
{
alert ("You must fill the Unit Name!")
document.form1.name.focus()
return false
}

if (document.form1.area.value=="")
{
alert ("You must fill the Area Name!")
document.form1.area.focus()
return false
}

if (document.form1.sector.value=="")
{
alert ("You must fill the Sector Name!")
document.form1.sector.focus()
return false
}

if (document.form1.region.value=="")
{
alert ("You must fill the Region Name!")
document.form1.region.focus()
return false
}

if (document.form1.structure.value=="")
{
alert ("You must fill the Sturcture Name!")
document.form1.structure.focus()
return false
}

if (document.form1.overall.value=="")
{
alert ("You must fill the Overall!")
document.form1.overall.focus()
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

if (document.form1.area.selectedIndex < 0)
  {
    alert("Please select one of the Area.");
    document.form1.area.focus();
    return (false);
  }


if (document.form1.sector.selectedIndex < 0)
  {
    alert("Please select one of the Sector.");
    document.form1.sector.focus();
    return (false);
  }


if (document.form1.region.selectedIndex < 0)
  {
    alert("Please select one of the region.");
    document.form1.region.focus();
    return (false);
  }

if (document.form1.structure.selectedIndex < 0)
  {
    alert("Please select one of the Structure.");
    document.form1.structure.focus();
    return (false);
  }

if (document.form1.overall.selectedIndex < 0)
  {
    alert("Please select one of the Overall.");
    document.form1.overall.focus();
    return (false);
  }
}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Add New Region</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addunitdb.asp" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add New Unit</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="40"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Code 
        </font></td>
      <td WIDTH="56%" HEIGHT="40"> 
        <input TYPE="text" NAME="code" MAXLENGTH="20" SIZE="20">
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Unit</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <input TYPE="TEXT" NAME="name" SIZE="25" MAXLENGTH="50">
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Area</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <select name="area"><%fillcombo("area")%>
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Sector</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <select name="sector"><%fillcombo("sector")%>
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Region</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <select name="region"><%fillcombo("region")%>
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Structure</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <select name="structure"><%fillcombo("structure")%>
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Overall</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <select name="overall"><%fillcombo("overall")%>
        </select>
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>
<%call closecn()%>
</body>
</html>
