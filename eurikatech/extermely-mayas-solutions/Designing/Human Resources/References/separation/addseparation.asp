<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%
dim mempno
mempno=Request.QueryString("empcode")
call connect()
dim rsfill
set rsfill=server.CreateObject("ADODB.Recordset")
sub fillcombo(tablename)
dim sql
sql="select * from "&session("bookcode")&"." & tablename & " order by name"
rsfill.Open sql,cn
Response.Write "<OPTION VALUE= > </OPTION>"
do while not rsfill.EOF
	Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & ">" & rsfill.Fields("name") & "</OPTION>"
	rsfill.MoveNext
loop
rsfill.Close

end sub

%>
<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.separation.value=="")
{
alert ("You must fill the Separation Reason Status!")
document.form1.separation.focus()
return false
}


if (document.form1.leavingdate.value=="")
{
alert ("You must fill the Separation Date!")
document.form1.leavingdate.focus()
return false
}
//----------------------
var val=document.form1.leavingdate.value
var sep1 = parseInt(val.indexOf("/"));
var sep2 = parseInt(val.indexOf("/",sep1+1));
var len = parseInt(val.length);
var mm = parseInt(val.substr(0,sep1));
var dd = parseInt(val.substr(sep1+1,sep2-sep1-1));
var yy = parseInt(val.substr(sep2+1,len-sep2-1));
if (yy<1900) yy+=2000;
	var leap = ((yy == (parseInt(yy/4) * 4)) && !(yy == (parseInt(yy/100) * 100)));
	if (!((mm >= 1) && (mm <= 12))) 
		{
		alert("Invalid Separation Date");
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid Separation Date");
		return false;
		}
//--------------------

var checkOK = "0123456789/";
var checkStr = document.form1.leavingdate.value;
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
    alert("Please enter only Date in Separation.");
    document.form1.separation.focus()
    return (false);
  }

}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Add Education</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addseparationdb.asp?empno=<%Response.Write mempno%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add Separation</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="34"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Separation 
        Reason </font></td>
      <td WIDTH="56%" HEIGHT="34"> 
        <select name="separation">&quot;
          <%fillcombo("leavereason")%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td WIDTH="44%" HEIGHT="54">Separation Date [dd/mm/yyyy]</td>
      <td WIDTH="56%" HEIGHT="54"> 
        <input type="text" name="leavingdate">
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="66%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
