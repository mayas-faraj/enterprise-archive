<%@ Language=VBScript %>

<!--#Include File="include/usercheck.htm" -->

<script language="Javascript">

function empno() {

var mempno="";
mempno=window.prompt("Enter the Employee No","");
if (mempno!=0 && mempno!=null) window.navigate("workhistory/workhistory.asp?empno="+mempno);

}
function empnot() {

var mempno="";
mempno=window.prompt("Enter the Employee No"," ");
if (mempno!=0 && mempno!=null) window.navigate("education/education.asp?empno="+mempno);

}

function empnos() {

var mempno="";
mempno=window.prompt("Enter the Employee No"," ");
if (mempno!=0 && mempno!=null) window.navigate("separation/separation.asp?empno="+mempno);

}
function empnor() {

var mempno="";
mempno=window.prompt("Enter the Employee No"," ");
if (mempno!=0 && mempno!=null) window.navigate("remuneration/remuneration.asp?empno="+mempno);

}

</script>



<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Human Resource Management Software</title></head>
<body BGCOLOR="#FFCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#Include File="include/top.htm" --> 
<table BORDER="1" CELLSPACING="0" CELLPADDING="4" WIDTH="61%" HEIGHT="69%" ALIGN="CENTER" BGCOLOR="#FFCCCC" BORDERCOLORLIGHT="#660000">
  <tr> 
    <td WIDTH="100%"> 
      <div ALIGN="CENTER"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2"><a href="employeeprofile/employeeprofile.asp">Profile</a></font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div ALIGN="CENTER"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="Javascript:empno()">Work 
        History</a></b></font></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="Javascript:empnor()">Remuneration</a></b></font></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div align="center"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2"><a href="Javascript:empnot()">Education</a></font></b></font></b></div>
    </td>
  </tr>
  <tr> 
    <td width="100%"> 
      <div align="center"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2"><a href="Javascript:empnos()">Separation</a></font></b></font></b></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2"><a href="dictionaries/dictionaries.asp">Dictionaries</a></font></b></font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="report/reports.asp">Reports</a></b></font></b></div>
    </td>
  </tr>
  <tr> 
    <td WIDTH="100%"> 
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2">Utilities</font></b></font></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>

</body>
</html>
