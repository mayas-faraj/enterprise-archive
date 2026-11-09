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
sql="select * from "& session("bookcode")&"."& tablename & " order by name"
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

sub fillsource()

'Response.Write "<option value= ></option>"
if rs.Fields("trainingsource")="s" then
	Response.Write "<option value=s Selected>Self</option>"
else	
    Response.Write "<option value=s>Self</option>"
end if   
if rs.Fields("trainingsource")="c" then
	Response.Write "<option value=c Selected>Company</option>"
else	
    Response.Write "<option value=c>Company</option>"
end if 
end sub

sub loadrec()

dim sql
id=Request.QueryString("id")
sql="select rowid as rid,empcode,name,coursename,institutionname,startdate,enddate,qualificationcode,trainingsource,trainingcost,remarks from "&session("bookcode")&".qryeducation where  rowid=" & "'"& id & "'" 
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

if (document.form1.qualification.value=="")
{
alert ("You must fill the Qualification Status!")
document.form1.qualification.focus()
return false
}

if (document.form1.course.value=="")
{
alert ("You must fill the Course Name!")
document.form1.course.focus()
return false
}
if (document.form1.insititution.value=="")
{
alert ("You must fill the Insititution Name!")
document.form1.insititution.focus()
return false
}

if (document.form1.source.value=="")
{
alert ("You must fill the Education Source!")
document.form1.source.focus()
return false
}

if (document.form1.cost.value=="")
{
alert ("You must fill the Education Cost!")
document.form1.cost.focus()
return false
}

if (document.form1.startdate.value=="")
{
alert ("You must fill the Start Date!")
document.form1.startdate.focus()
return false
}

if (document.form1.enddate.value=="")
{
alert ("You must fill the End Date!")
document.form1.enddate.focus()
return false
}

if (document.form1.remarks.value=="")
{
alert ("You must fill the End Date!")
document.form1.remarks.focus()
return false
}
if (document.form1.startdate.value>document.form1.enddate.value)
{
alert ("Start date cannot greater then End date!")
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
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid Start Date");
		return false;
		}
//--------------------

//----------------------
var val=document.form1.enddate.value
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
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid End Date");
		return false;
		}
//--------------------

var checkOK = "0123456789";
var checkStr = document.form1.cost.value;
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
    alert("Please enter only numeric characters in Cost.");
    document.form1.cost.focus()
    return (false);
  }

}
//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Edit Education</title></head>
<body>
<%call loadrec() %>
<form Name="form1" METHOD="post" ACTION="editeducationdb.asp?id=<%Response.Write cstr(id)%>" onsubmit="return validate()">
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Edit Education</font></b></div>
      </td></tr></table>
  <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000066">
    <tr> 
      <td width="44%" height="34"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Qualification 
        / Training</font></td>
      <td width="56%" height="34"> 
        <select name="qualification">&quot;
         <%fillcombo"qualification",cint(rs.Fields("qualificationcode"))%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="36">Course Name</td>
      <td width="56%" height="36"> 
        <input type="text" name="course" value="<%Response.Write rs.Fields("coursename")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="41">Insititution Name</td>
      <td width="56%" height="41"> 
        <input type="text" name="insititution" value="<%Response.Write rs.Fields("institutionname")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="41">Education Finance</td>
      <td width="56%" height="41"> 
        <select name="source" size="1">
           <% call fillsource() %>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="34">Education Cost</td>
      <td width="56%" height="34"> 
        <input type="text" name="cost" value="<%Response.Write rs.Fields("trainingcost")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Remaks</td>
      <td width="56%" height="40"> 
        <input type="text" name="remarks" size="50" maxlength="50" value="<%Response.Write rs.Fields("remarks")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="28">Stat Date [dd/mm/yyyy]</td>
      <td width="56%" height="28"> 
        <input type="text" name="startdate" value="<%Response.Write rs.Fields("startdate")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="54">End Date [dd/mm/yyyy]</td>
      <td width="56%" height="54"> 
        <input type="text" name="enddate" value="<%Response.Write rs.Fields("enddate")%>">
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
