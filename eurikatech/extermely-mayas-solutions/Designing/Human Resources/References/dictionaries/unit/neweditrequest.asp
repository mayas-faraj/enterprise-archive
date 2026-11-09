<%@ Language=VBScript %>

<%
Option Explicit
%>

<!--#Include virtual="/inventory/include/usercheck.htm" -->
<!--#Include virtual="inventory\include\connect.asp" -->

<%

dim mitemcode
dim mid
dim rsprtranstmp
call connect()

sub loadrec()

dim sql

mid=clng(Request.QueryString("mid"))

sql="select * from " & session("bookcode") &  ".qryprtranstmp where id=" & mid
set rsprtranstmp=server.CreateObject("ADODB.Recordset")
rsprtranstmp.Open sql,cn
mitemcode=rsprtranstmp.Fields("itemcode")

end sub

sub fillitem()

dim rs
dim sql

sql="select * from itemcode order by itemname"
set rs=server.CreateObject("ADODB.Recordset")

rs.Open sql,cn
do while not rs.EOF
	if mitemcode=rs.Fields("itemcode") then
		Response.Write "<OPTION VALUE=" & rs.Fields("itemcode") & " Selected >" & rs.Fields("itemname") & "</OPTION>"	
	else		
		Response.Write "<OPTION VALUE=" & rs.Fields("itemcode") & ">" & rs.Fields("itemname") & "</OPTION>"
	end if		
	rs.MoveNext
loop
rs.Close
set rs=nothing

end sub

sub closerec()

rsprtranstmp.Close
set rsprtranstmp=nothing
cn.close
set cn=nothing

end sub


%>


<script LANGUAGE="JavaScript">
<!--

function validate() {

// check if no drop down has been selected
if (document.form1.itemcode.selectedIndex < 0)
  {
    alert("Please select one of the item.");
    document.form1.itemcode.focus();
    return (false);
  }

if (document.form1.qty.value == "")
  {
    alert("Please enter Qty value");
    document.form1.qty.focus();
    return (false);
  }

var checkOK = "0123456789.";
var checkStr = document.form1.qty.value
var allValid = true;
var allNum = "";
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
    if (ch != ",")
      allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only numeric characters in the Qty");
    document.form1.qty.focus();
    return (false);
  }


if (document.form1.rate.value == "")
  {
    alert("Please enter rate value");
    document.form1.rate.focus();
    return (false);
  }



var checkStr = document.form1.rate.value
var allValid = true;
var allNum = "";
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
    if (ch != ",")
      allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only numeric characters in the Rate");
    document.form1.rate.focus();
    return (false);
  }


var val=document.form1.date.value
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
		alert("Invalid Date");
		return false;
	}
if ((mm == 2) && (leap)) dom = 29;
if ((mm == 2) && !(leap)) dom = 28;
if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
if (dd > dom) 
	{
	alert("Invalid Date");
	return false;
	}
}

function cal()	{
	document.form1.amount.value=document.form1.rate.value*document.form1.qty.value
}	

//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Edit Request Entry</TITLE></head>
<body>
<%call loadrec()%> <form Name="form1" METHOD="post" ACTION="neweditrequestdb.asp?mid=<%Response.Write mid%>" onsubmit="return validate()"><table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BORDERCOLOR="#003333" BGCOLOR="#000066"><tr><td HEIGHT="29"><div ALIGN="CENTER"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2"><B><FONT COLOR="#FFFFFF">Edit 
Request Entry</FONT></B></FONT></div></td></tr></table><table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066"><tr><td WIDTH="44%" HEIGHT="44"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Item 
Name </FONT></td><td WIDTH="56%" HEIGHT="44"><select NAME="itemcode"><%call fillitem()%></select></td></tr><tr><td WIDTH="44%" HEIGHT="41"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Quantity 
</FONT></td><td WIDTH="56%" HEIGHT="41"><input TYPE="text" NAME="qty" value="<%Response.Write rsprtranstmp.Fields("qty")%>"></td></tr><tr><td WIDTH="44%" HEIGHT="37"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Rate 
</FONT></td><td WIDTH="56%" HEIGHT="37"><input TYPE="text" NAME="rate" MAXLENGTH="10" SIZE="10" value="<%Response.Write rsprtranstmp.Fields("rate")%>"></td></tr><tr><td WIDTH="44%" HEIGHT="47"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Amount 
</FONT></td><td WIDTH="56%" HEIGHT="47"><input TYPE="text" NAME="amount" value="<%Response.Write rsprtranstmp.Fields("amount")%>" onfocus="cal()"></td></tr><tr><td WIDTH="44%" HEIGHT="47"><FONT FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="2">Required 
Date (mm/dd/yy)</FONT></td><td WIDTH="56%" HEIGHT="47"><input TYPE="text" NAME="date" MAXLENGTH="15" SIZE="15" value="<%Response.Write rsprtranstmp.Fields("reqdate")%>"></td></tr></table><table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
