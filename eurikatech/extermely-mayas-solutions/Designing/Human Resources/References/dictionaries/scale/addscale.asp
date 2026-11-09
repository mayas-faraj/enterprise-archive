<%@ Language=VBScript %>

<!--#Include File="..\..\include\usercheck.htm" -->

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.code.value=="")
{
alert ("You must fill the Scale Code!")
document.form1.code.focus()
return false
}

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
<title>Add New Allowances</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addscaledb.asp" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add New Scales</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="22"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Scale 
        </font></td>
      <td WIDTH="56%" HEIGHT="22"> 
        <input TYPE="text" NAME="code" MAXLENGTH="20" SIZE="20">
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="26">Minimum</td>
      <td WIDTH="56%" HEIGHT="26"> 
        <input type="TEXT" name="min" size="25" maxlength="50">
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="25">Maximum</td>
      <td WIDTH="56%" HEIGHT="25"> 
        <input TYPE="TEXT" NAME="max" SIZE="25" MAXLENGTH="50">
      </td>
    </tr>
    <tr>
      <td WIDTH="44%" HEIGHT="37">Managerial Scale</td>
      <td WIDTH="56%" HEIGHT="37"> 
        <input type="checkbox" name="mcheck" value="-1">
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
