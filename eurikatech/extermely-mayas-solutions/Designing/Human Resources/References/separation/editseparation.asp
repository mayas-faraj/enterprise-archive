<%@ Language=VBScript %>
<%
Option Explicit

%>

<!--#Include file="..\include\usercheck.htm" -->
<!--#Include file="..\include\connect.asp" -->

<%

on error resume next 

call connect()
dim rsfill
dim rs
dim id
set rsfill=server.CreateObject("ADODB.Recordset")

sub fillcombo(tablename,srchfield)

dim sql
sql="select * from "&session("bookcode")&"." & tablename & " order by name"
rsfill.Open sql,cn
do while not rsfill.EOF
	if cint(rsfill.Fields("code"))=cint(srchfield) then
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & " Selected>" & rsfill.Fields("name") & "</OPTION>"	
	else		
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & ">" & rsfill.Fields("name") & "</OPTION>"
	end if		
	rsfill.MoveNext
loop
rsfill.Close

end sub

sub loadrec()

dim sql
id=server.URLEncode(Request.QueryString("id"))
sql="select * from " & session("bookcode") &  ".separation where rowid='"& id &"'"
set rs=server.CreateObject("ADODB.Recordset")
rs.Open sql,cn

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

if (document.form1.separation.value=="")
{
alert ("You must fill the Leave Reason Status!")
document.form1.separation.focus()
return false
}


if (document.form1.leavingdate.value=="")
{
alert ("You must fill the Leaving Date!")
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
    alert("Please enter only Date format in Separation Date.");
    document.form1.leavingdate.focus()
    return (false);
  }

}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Edit Separation</title></head>
<body>
<%call loadrec() %>
<form Name="form1" METHOD="post" ACTION="editseparationdb.asp?id=<%Response.Write cstr(id)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Edit Separation</font></b></div>
      </td></tr></table>
  <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000066">
    <tr> 
      <td width="44%" height="34"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Separation 
        Reason </font></td>
      <td width="56%" height="34"> 
        <select name="separation">&quot;
          <%fillcombo"leavereason",rs.Fields("leavingreasoncode")%>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="54">Separation Date [dd/mm/yyyy]</td>
      <td width="56%" height="54"> 
        <input type="text" name="leavingdate"value="<%Response.Write rs.Fields("leavingdate")%>">
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="66%">
        <div ALIGN="CENTER"> 
          <input type="submit" name="Submit" value="Update">
        </div>
      </td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
