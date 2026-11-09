<%@ Language=VBScript %>

<script language="Javascript">

function advid() {

var no=0;
no=window.prompt("Enter the Advance Receipt No","0");
if (no!=0 && no!=null) window.navigate("advance/viewadvance.asp?id="+no);

}

function billno() {

var no=0;
no=window.prompt("Enter the Bill No","0");
if (no!=0 && no!=null) window.navigate("bill/patientduescollection.asp?billno="+no);

}

function viewbill() {

var no=0;
no=window.prompt("Enter the Bill No","0");
if (no!=0 && no!=null) window.navigate("bill/billview.asp?billno="+no);

}

</script>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>OPD Billing</title></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#99FFFF">
<!--#Include File="include/top.htm" --> 
<table border="1" cellspacing="0" cellpadding="1" align="CENTER" width="50%" height="50%" bgcolor="#006666" bordercolor="#999900">
  <tr> 
    <td width="100%"> 
      <div align="CENTER"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="dictionaries/dictionaries.asp"><font color="#99FFFF">Dictionaries</font></a></font></div>
    </td>
  </tr>
  <tr>
    <td>
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#99FFFF">Advance</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <a href="advance/advance.asp"><font color="#99FFFF">(New)</font></a> <a href="javascript:advid()"><font color="#99FFFF">(View)</font></a></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#99FFFF">Bill</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <a href="bill/newaddbill.asp"><font color="#99FFFF">(New)</font></a> <a href="javascript:viewbill()"><font color="#99FFFF">(View)</font></a></font></div>
    </td>
  </tr>
  <tr> 
    <td width="100%"> 
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#99FFFF">Dues 
        Collection</font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
        <a href="javascript:billno()"><font color="#99FFFF">(Patient)</font></a> 
        <a href="bill/panelduescollectiondatecriteria.asp"><font color="#99FFFF">(Panel)</font></a></font></div>
    </td>
  </tr>
  <tr> 
    <td width="100%">
      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="reports/reports.asp"><font color="#99FFFF">Reports</font></a></font></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>

</body>
</html>
