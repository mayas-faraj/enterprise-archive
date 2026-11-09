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
<title>Payroll Software</title></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<font color="#cccccc"><!--#Include File="include/top.htm" --> <!--#include virtual="/payroll/include/navigation.htm" --> </font> 
<table border="1" cellspacing="0" cellpadding="4" width="61%" height="22%" align="CENTER" bgcolor="#FFCCCC" bordercolorlight="#660000">
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="40"> 
      <div align="CENTER"><font size="3" face="Verdana, Arial, Helvetica, sans-serif" color="#0000FF"><b><font size="2"><a href="updatepayroll/updatepayroll.asp">Add 
        New Payroll (All Employees)</a> </font></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="48"> 
      <div align="CENTER"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#0000FF"><b><a href="updateindividual/updateindividual.asp">Edit 
        Payroll (Individual Employees)</a></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="55"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#0000FF"><b><a href="individualupdate/indupdate.asp">Update 
        Payroll (Individual Employees)</a></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="55"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#0000FF"><b><a href="individualdelete/inddelete.asp">Delete 
        Payroll (Individual Employees) </a></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="47"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#0000FF"><b><a href="individualinsert/indinsert.asp">Add 
        New Payroll (Indivdual Employees)</a></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="50"> 
      <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2" color="#0000FF"><a href="empdeduction/empdeduction.asp">Fixed 
        Employee Deduction</a></font></b></font></b></font></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc"> 
    <td width="100%" height="51"> 
      <div align="center"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><a href="dictionaries/dictionaries.asp"><font color="#0000FF">Dictionaries</font></a></b></font></b></font></b></div>
    </td>
  </tr>
  <tr bgcolor="#cccccc">
    <td width="100%" height="51">
      <div align="center"><b><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2" color="#0000FF">Reports</font></b></font></b></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>

</BODY>
</HTML>
