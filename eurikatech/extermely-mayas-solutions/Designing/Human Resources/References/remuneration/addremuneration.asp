<%@ Language=VBScript %>

<%
Option Explicit
dim mempno
mempno=Request.QueryString("empcode")
%>
<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%

sub loadallowance()


call connect()
dim rs
set rs=server.CreateObject("ADODB.Recordset")
rs.Open "select * from "& session ("bookcode") & ".allowance",cn
do while not rs.eof
	with response
		.Write "<tr><td WIDTH=44% HEIGHT=40>" & rs.Fields("name") &  "</td>"
        .Write "<td WIDTH=56% HEIGHT=40><input type=text name=allowance" & rs.Fields("code") & "></td></tr>"		
	end with
	
    rs.MoveNext
loop   
rs.Close
set rs=nothing	
cn.close
set cn=nothing

end sub
%>
<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.startdate.value=="")
{
alert ("You must fill the StartDate Status!")
document.form1.startdate.focus()
return false
}

//----------------------
var val=document.form1.startdate.value
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
		alert("Invalid Start Date");
		document.form1.startdate.focus();
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid Start Date");
		document.form1.startdate.focus();
		return false;
		}
//--------------------

var checkOK = "0123456789/";
var checkStr = document.form1.startdate.value;
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
   alert("Please enter only numeric characters in Start Date.");
   document.form1.startdate.focus()
    return (false);
  }


//----------------------
var val=document.form1.enddate.value
if (val.length==0){
	return true;
}
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
		alert("Invalid End Date");
		document.form1.enddate.focus();
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid End Date");
		document.form1.enddate.focus();
		return false;
		}
//--------------------
//--------------------

var checkOK = "0123456789/";
var checkStr = document.form1.enddate.value;
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
   alert("Please enter only numeric characters in End Date.");
   document.form1.enddate.focus()
    return (false);
  }


//----------------------
if (document.form1.startdate.value>document.form1.enddate.value)
{
alert ("Start date cannot geater then End date!")
document.form1.startdate.focus()
return false
}

}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Add New Remuneration</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addremunerationdb.asp?empno=<%Response.Write mempno%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add New Remuneration</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="40">Stat Date [mm/dd/yyyy]</td>
      <td WIDTH="56%" HEIGHT="40"> 
        <input type="text" name="startdate">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">End Date [mm/dd/yyyy]</td>
      <td width="56%" height="40"> 
        <input type="text" name="enddate">
      </td>
    </tr>
    <%call loadallowance()%>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" BORDERCOLORLIGHT="#000066">
    <tr>	  
        <td HEIGHT="54" WIDTH="66%"> 
        <div ALIGN="CENTER"> 
          <input TYPE="submit" NAME="Submit" VALUE="Add">
        </div>
      </td>
      <td HEIGHT="54" WIDTH="56%"> 
        <div ALIGN="CENTER"> 
          <input TYPE="reset" NAME="Submit2" VALUE="Clear">
        </div>
      </td>
    </tr>
  </table>
</form><p>&nbsp;</p>

</body>
</html>
