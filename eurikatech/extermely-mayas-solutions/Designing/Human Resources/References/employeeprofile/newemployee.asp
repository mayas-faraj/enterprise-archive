<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

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

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.empsex.selectedIndex < 0)
	{
	alert("Please select Sex.");
    document.form1.empsex.focus();
    return (false);
	}

if (document.form1.empsex.value=="")
	{
	alert("Please Select Sex");
    document.form1.empsex.focus();
    return (false);
	}

if (document.form1.empcode.value=="")
	{
	alert ("You must fill the Employee Code!")
	document.form1.empcode.focus()
	return false
	}
	
if (document.form1.unit.selectedIndex < 0)
	{
	alert("Please Select Unit Name");
    document.form1.unit.focus();
    return (false);
	}

if (document.form1.unit.value=="")
	{
	alert("Please Select Unit Name");
    document.form1.unit.focus();
    return (false);
	}

if (document.form1.fundingsource.selectedIndex < 0)
	{
	alert("Please select Funding Source.");
    document.form1.fundingsource.focus();
    return (false);
	}

if (document.form1.fundingsource.value=="")
	{
	alert("Please select Funding Source.");
    document.form1.fundingsource.focus();
    return (false);
	}

if (document.form1.firstname.value=="")
	{
	alert ("You must enter First Name!")
	document.form1.firstname.focus()
	return false
	}

if (document.form1.middlename.value=="")
	{
	alert ("You must enter Middle Name!")
	document.form1.middlename.focus()
	return false
	}

if (document.form1.lastname.value=="")
	{
	alert ("You must enter Last Name!")
	document.form1.lastname.focus()
	return false
	}

if (document.form1.religion.selectedIndex < 0)
	{
	alert("Please select Religion.");
    document.form1.religion.focus();
    return (false);
	}

if (document.form1.religion.value=="")
	{
	alert("Please select Religion.");
    document.form1.religion.focus();
    return (false);
	}

if (document.form1.sect.selectedIndex < 0)
	{
	alert("Please select Sect.");
    document.form1.sect.focus();
    return (false);
	}

if (document.form1.sect.value=="")
	{
	alert("Please select Sect.");
    document.form1.sect.focus();
    return (false);
	}

if (document.form1.nationality.selectedIndex < 0)
	{
	alert("Please select Nationality.");
    document.form1.nationality.focus();
    return (false);
	}

if (document.form1.nationality.value=="")
	{
	alert("Please select Nationality.");
    document.form1.nationality.focus();
    return (false);
	}

if (document.form1.domicile.selectedIndex < 0)
	{
	alert("Please select Domicile.");
    document.form1.domicile.focus();
    return (false);
	}

if (document.form1.domicile.value=="")
	{
	alert("Please select Domicile.");
    document.form1.domicile.focus();
    return (false);
	}

if (document.form1.dateofbirth.value=="")
	{
	alert("Please select Date of Birth.");
    document.form1.dateofbirth.focus();
    return (false);
	}

//----------------------
var val=document.form1.dateofbirth.value
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
		alert("Invalid Date Of Birth");
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid Date Of Birth");
		return false;
		}

var checkOK = "0123456789/";
var checkStr = document.form1.dateofbirth.value;
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
   alert("Please enter only numeric characters in Date of Birth.");
   document.form1.dateofbirth.focus()
    return (false);
  }



if (document.form1.placeofbirth.value=="")
	{
	alert ("You must fill the Place of Birth!")
	document.form1.placeofbirth.focus()
	return false
	}

if (document.form1.mothertongue.value=="")
	{
	alert ("You must enter the Mother Tongue!")
	document.form1.mothertongue.focus()
	return false
	}

if (document.form1.phone.value=="")
	{
	alert ("You must fill the Phone No!")
	document.form1.phone.focus()
	return false
	}


if (document.form1.maritalstatus.selectedIndex < 0)
	{
	alert("Please select Marital Status.");
    document.form1.maritalstatus.focus();
    return (false);
	}

if (document.form1.maritalstatus.value=="")
	{
	alert("Please select Marital Status.");
    document.form1.maritalstatus.focus();
    return (false);
	}
	
if (document.form1.resaddress.value=="")
	{
	alert("Please select Residual Address.");
    document.form1.resaddress.focus();
    return (false);
	}

if (document.form1.mailaddress.value=="")
	{
	alert("Please select Mail Address.");
    document.form1.mailaddress.focus();
    return (false);
	}

if (document.form1.nicno.value=="")
	{
	alert("Please select NIC No.");
    document.form1.nicno.focus();
    return (false);
	}

if (document.form1.eobino.value=="")
	{
	alert("Please select EOBI No.");
    document.form1.eobino.focus();
    return (false);
	}

if (document.form1.nomineeinfo.value=="")
	{
	alert("Please select Nominee Info.");
    document.form1.nomineeinfo.focus();
    return (false);
	}

var val=document.form1.dateappoint.value
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
		alert("Invalid Date Of Appointment");
		return false;
		}
	if ((mm == 2) && (leap)) dom = 29;
	if ((mm == 2) && !(leap)) dom = 28;
	if ((mm == 1) || (mm == 3) || (mm == 5) || (mm == 7) || (mm == 8) || (mm == 10) || (mm == 12)) dom = 31;
	if ((mm == 4) || (mm == 6) || (mm == 9) || (mm == 11)) dom = 30;
	if (dd > dom) 
		{
		alert("Invalid Date Of Appointment");
		return false;
		}

var checkOK = "0123456789/";
var checkStr = document.form1.dateappoint.value;
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
   alert("Please enter only numeric characters in Appointment Date.");
   document.form1.dateappoint.focus()
    return (false);
  }


if (document.form1.department.value=="")
	{
	alert("Please select Department.");
    document.form1.department.focus();
    return (false);
	}


}
//-->
</script>

<html>
<head>
<title>New Employee Form</title>

</head>

<body bgcolor="#FFCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include File="../include/top.htm" --> <!--#Include File="../include/navigation.htm" --> 
<form method="post" name="form1" action="addnewemployeedb.asp" OnSubmit="return validate()">
  <table width="100%" border="0" cellpadding="4" bgcolor="#330000" cellspacing="0">
    <tr> 
      <td>
        <div align="center"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Employee 
          Information</font></b></font></div>
      </td>
    </tr>
  </table>
  <table width="80%" border="0" cellpadding="4" cellspacing="1" bgcolor="#000000" align="center">
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Employee 
        Code </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="empcode">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Unit</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="unit">
          <%fillcombo("units")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Funding 
        Source </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="fundingsource">
          <%fillcombo("fundingsource")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">First 
        Name </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="firstname">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%" bgcolor="#FFCCCC"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Middle 
        Name </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="middlename">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Last 
        Name </font></td>
      <td width="68%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="lastname">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Religion</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="religion">
          <%fillcombo("religion")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Sect</font></td>
      <td width="68%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="sect">
          <%fillcombo("sectarion")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nationality</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="nationality">
          <%fillcombo("nationality")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Domicile</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="domicile">
          <%fillcombo("domicile")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date 
        of Birth [dd/mm/yyyy]</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="dateofbirth">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Place 
        of Birth</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="placeofbirth">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Mother 
        Tongue</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="mothertongue">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Phone</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="phone">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Gender 
        </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="empsex" size="1">
          <option value=" "></option>
          <option value="m">Male</option>
          <option value="f">Female</option>
          <option value="o">Other</option>
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Martial 
        Status </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="maritalstatus" size="1">
          <option value=" "></option>
          <option value="m">Married</option>
          <option value="s">Single</option>
          <option value="w">Window</option>
          <option value="d">Divorced</option>
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Res.Address</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="resaddress" size="50">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Mail. 
        Address </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="mailaddress" size="50">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIC 
        NO </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="nicno">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EOBI 
        No</font></td>
      <td width="46%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="eobino">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nominee 
        Info. </font></td>
      <td width="46%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="nomineeinfo" size="50">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date 
        of Appoint. [dd/mm/yyyy]</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="dateappoint">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Blood 
        Group </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="bloodgroup">
          <%fillcombo("bloodgroup")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Department</font></td>
      <td width="46%" bordercolor="#660000"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="department">
          <%fillcombo("department")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%">PF Policy Accepted</td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="checkbox" name="pf" value="-1">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Stop 
        Salary </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        <input type="checkbox" name="stopsalary" value="-1">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000">
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Email 
        Address</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        <input type="text" name="emailaddress">
        </font></td>
    </tr>
  </table>
  <table width="22%" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
      <td height="82" width="50"> 
        <div align="center"> 
          <input type="submit" name="Submit" value="Submit">
        </div>
      </td>
      <td height="82" width="50"> 
        <div align="center">
          <input type="reset" name="Submit2" value="Reset">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>
</body>
</html>
