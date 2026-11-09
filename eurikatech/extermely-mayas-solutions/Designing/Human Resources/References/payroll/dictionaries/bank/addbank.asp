<%@ Language=VBScript %>

<!--#Include virtual="/hris/include/usercheck.htm" -->

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.code.value=="")
{
alert ("You must fill the Area Code!")
document.form1.code.focus()
return false
}

if (document.form1.name.value=="")
{
alert ("You must fill the Name!")
document.form1.name.focus()
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
<title>Add New Bank</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addbankdb.asp" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr bgcolor="#666666"> 
      <td HEIGHT="29"> 
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add New Bank</font></b></div>
      </td></tr></table><table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066"><tr>
      <td WIDTH="44%" HEIGHT="44"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Code 
        </font></td>
      <td WIDTH="56%" HEIGHT="44">
        <input TYPE="text" NAME="code" MAXLENGTH="20" SIZE="20">
      </td></tr><tr>
      <td WIDTH="44%" HEIGHT="61">Bank</td>
      <td WIDTH="56%" HEIGHT="61">
        <input TYPE="TEXT" NAME="name" SIZE="30" MAXLENGTH="100">
      </td></tr></table><table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
