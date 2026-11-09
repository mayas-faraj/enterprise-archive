<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include File="..\include\usercheck.htm" -->
<!--#Include File="..\include\connect.asp" -->

<%
'on error resume next 
call connect()
dim rsfill
dim rs
dim mempno
set rsfill=server.CreateObject("ADODB.Recordset")

sub fillcombo(tablename,srchfield)


dim sql
sql="select * from " & session("bookcode") &  "."& tablename &" order by name"
Response.Write tablename
rsfill.Open sql,cn
do while not rsfill.EOF
	if cint(rsfill.Fields("code"))=cint(srchfield)  then
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & " Selected>" & rsfill.Fields("name") & "</OPTION>"	
	else		
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & ">" & rsfill.Fields("name") & "</OPTION>"
	end if		
	
	rsfill.MoveNext
loop
rsfill.Close

end sub

sub fillmaritalstatus()

Response.Write "<option value= ></option>"
if rs.Fields("maritalstatus")="m" then
	Response.Write "<option value=m Selected>Married</option>"
else	
    Response.Write "<option value=m>Married</option>"
end if   
if rs.Fields("maritalstatus")="s" then
	Response.Write "<option value=s Selected>Single</option>"
else	
    Response.Write "<option value=s>Single</option>"
end if 
if rs.Fields("maritalstatus")="w" then
	Response.Write "<option value=w Selected>Widow</option>"
else	
    Response.Write "<option value=w>Widow</option>"
end if   
if rs.Fields("maritalstatus")="d" then
	Response.Write "<option value=d Selected>Divorced</option>"
else	
    Response.Write "<option value=d>Divorced</option>"
end if
     
end sub

sub fillsex()

Response.Write "<option value= ></option>"
if rs.Fields("sex")="m" then
	Response.Write "<option value=m Selected>Male</option>"
else	
    Response.Write "<option value=m>Male</option>"
end if   
if rs.Fields("sex")="f" then
	Response.Write "<option value=f Selected>Female</option>"
else	
    Response.Write "<option value=f>Female</option>"
end if 
if rs.Fields("sex")="o" then
	Response.Write "<option value=o Selected>Other</option>"
else	
    Response.Write "<option value=o>Other</option>"
end if   

end sub

mempno=Request.QueryString("empno")

sub loadrec()

dim sql
sql="select * from " & session("bookcode") &  ".empprofile where empcode='" & mempno & "'"
set rs=server.CreateObject("ADODB.Recordset")
rs.Open sql,cn
'Response.Write rs.Fields("dateofbirth")
'Response.Write rs.Fields("appointmentdate")
'Response.End
if rs.EOF and rs.BOF then
	Response.Write "Unable to find the employee profile or invalid employee code"
	Response.Write "Click back button of browser to go back"
	rs.Close
	set rs=nothing
	Response.End
end if

end sub

sub closecn()

set rs=nothing
cn.close
set cn=nothing

end sub

%>

<script LANGUAGE="JavaScript">
<!--

function deleterec(empno) {

var ans;
ans=window.confirm("Are you Sure to Delete");
	if (ans==true) {
		window.open("employeedelete.asp?"+empno,"employeedelete","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no");
	}
}

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
//--------------------

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
<form name="form2" >
</form>
<%call loadrec() %>
<!--#Include File="../include/top.htm" --> <!--#Include File="../include/navigation.htm" --> 
<form method="post" name="form1" action="editemployeedb.asp?mempno=<%Response.Write cstr(mempno)%>" OnSubmit="return validate()">
  <table width="100%" border="0" cellpadding="4" bgcolor="#330000" cellspacing="0">
    <tr> 
      <td>
        <div align="center"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Employee 
          Information</font></b></font></div>
      </td>
    </tr>
  </table>
  <table width="82%" cellpadding="4" cellspacing="1" align="center" bgcolor="#000000">
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Unit</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="unit">
          <%fillcombo "units",rs.Fields("unitcode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Funding 
        Source </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="fundingsource">
          <%fillcombo "fundingsource", rs.fields("fundingsourcecode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">First 
        Name </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="firstname" value="<%Response.Write rs.Fields("firstname")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Middle 
        Name </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="middlename" value="<%Response.Write rs.Fields("middlename")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Last 
        Name </font></td>
      <td width="68%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="lastname" value="<%Response.Write rs.Fields("lastname")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Religion</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="religion">
          <%fillcombo "religion",rs.Fields("religioncode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Sect</font></td>
      <td width="68%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="sect">
          <%fillcombo "sectarion",rs.Fields("sectarioncode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nationality</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="nationality">
          <%fillcombo "nationality",rs.Fields("nationalitycode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Domicile</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="domicile">
          <%fillcombo"domicile",rs.Fields("domicilecode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date 
        of Birth [dd/mm/yyyy] </font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="dateofbirth" value="<%Response.Write rs.Fields("dateofbirth")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Place 
        of Birth</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="placeofbirth"value="<%Response.Write rs.Fields("placeofbirth")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Mother 
        Tongue</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="mothertongue"value="<%Response.Write rs.Fields("mothertongue")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="32%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Phone</font></td>
      <td width="68%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="phone" value="<%Response.Write rs.Fields("phone")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Gender 
        </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="empsex" size="1">
          <% call fillsex() %> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Martial 
        Status </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="maritalstatus" size="1">
          <%call fillmaritalstatus()%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Res.Address</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="resaddress" size="50" value="<%Response.Write rs.Fields("resaddress")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Mail. 
        Address </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="mailaddress" size="50" value="<%Response.Write rs.Fields("mailaddress")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">NIC 
        NO </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="nicno" value="<%Response.Write rs.Fields("nicno")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EOBI 
        No</font></td>
      <td width="46%" height="39"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="eobino" value="<%Response.Write rs.Fields("eobino")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Nominee 
        Info. </font></td>
      <td width="46%" height="28"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="nomineeinfo" size="50" value="<%Response.Write rs.Fields("nomineeinfo")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Date 
        of Appoint. [dd/mm/yyyy]</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text" name="dateappoint"value="<%Response.Write rs.Fields("appointmentdate")%>">
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Blood 
        Group </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="bloodgroup">
          <%fillcombo "bloodgroup",rs.Fields("bloodgroupcode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Department</font></td>
      <td width="46%" bordercolor="#660000"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <select name="department">
          <%fillcombo "department",rs.Fields("departmentcode")%> 
        </select>
        </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%">Pf Policy Accepted</td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <% if rs.Fields ("pf")="-1" then %> 
        <input type="checkbox" name="pf" checked >
        <% else %> 
        <input type="checkbox" name="pf"  >
        <%end if %> </font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000"> 
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Stop 
        Salary </font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><% if rs.Fields ("stopsalary")="-1" then %> 
        <input type="checkbox" name="stopsalary" checked >
        <% else %> 
        <input type="checkbox" name="stopsalary"  >
        <%end if %></font></td>
    </tr>
    <tr bgcolor="#FFCCCC" bordercolor="#660000">
      <td width="16%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Email 
        Address</font></td>
      <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
        <input type="text" name="emailaddress"value=<%Response.Write rs.Fields("email")%>
        >
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
      <td height="82" width="50">
        <input type="button" name="Submit3" VALUE="Delete" onclick="javascript:deleterec('empcode=<%Response.Write mempno%>')">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>
</body>
</html>
