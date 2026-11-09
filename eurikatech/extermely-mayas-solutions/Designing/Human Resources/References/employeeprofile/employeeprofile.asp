<script language="Javascript">

function empnoep() {

var eno="";
eno=window.prompt("Enter the Employee No","");
if (eno!=0 && eno!=null) window.navigate("editemployee.asp?empno="+eno);

}

</script>

<html>
<title>Untitled Document</title>
<!--#Include File="../include/top.htm" --> <!--#Include File="../include/navigation.htm" --> 
<body bgcolor="#FFCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">
  <tr bgcolor="#330000"> 
    <td> 
      <div align="left"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFCCCC">Employee 
        Profile </font></b></font></div>
    </td>
  </tr>
</table>
<table width="39%" border="1" vspace="0" hspace="0" height="231" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center">
  <tr> 
    <td height="30"> 
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="newemployee.asp">New 
        Employee</a> </font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td height="30"> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="javascript:empnoep()">Edit 
        Employee</a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td height="30"> 
      <div align="center"> 
        <p><b><a href="employeelist.asp"></a></b><b><a href="employeelist.asp"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Present 
          Employee List</font></a></b></p>
      </div>
    </td>
  </tr>
  <tr> 
    <td height="30"> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="exemployeelist.asp">Ex-Employee 
        List</a></font><a href="exemployeelist.asp"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        </font></a></b></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
