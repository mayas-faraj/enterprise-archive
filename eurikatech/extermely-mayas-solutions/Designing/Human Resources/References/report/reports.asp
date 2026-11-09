<script language="Javascript">
function cutdate(aspfile) {

var mcutdate="";
mcutdate=window.prompt("Enter the Cut off Date for Gratuity (MM/DD/YYYY)"," ");
if (mcutdate!=0 && mcutdate!=null) window.navigate(aspfile+mcutdate);

}
function empnoep() {

var eno="";
eno=window.prompt("Enter the Employee No","Employee No");
if (eno!="" && eno!=null) window.navigate("editemployee.asp?empno="+eno);

}
function add() {
window.open("gratuity.asp","Gratuity Schedule","height=260,width=400,status=yes,toolbar=no,menubar=no,location=no")
}
</script>

<html>
<title>Reports</title>
<!--#Include File="../include/top.htm" --> <!--#Include File="../include/navigation.htm" --> 
<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">
  <tr bgcolor="#330000"> 
    <td> 
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFCCCC">Reports 
        </font></b></font></div>
    </td>
  </tr>
</table>
<table width="57%" border="1" vspace="0" hspace="0" height="444" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center" bgcolor="#FFCCCC">
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Employee 
        Profile </font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="designationsummary.asp">Designation 
        Summary </a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"> 
        <p><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Employee 
          Status Summary</font></b></p>
        <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="empstatussummary.asp">Unitwise</a> 
          / <a href="empstatusregionsummary.asp">Regionwise</a></font></b></p>
      </div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="unitsummary.asp">Unit 
        Summary </a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="structuresummary.asp"> 
        </a></font><a href="areasummary.asp"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"></font></a><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="areasummary.asp">Area 
        Summary</a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="sectorsummary.asp">Sector 
        Summary </a></font><a href="areasummary.asp"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"></font></a></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="regionsummary.asp">Region 
        Summary </a></font><a href="areasummary.asp"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"></font></a></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="structuresummary.asp">Structure 
        Summary</a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="overallsummary.asp">Overall 
        Community/Clinical Summary</a></font><a href="areasummary.asp"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"></font></a></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="empcontactdir.asp">Employee 
        Contact Directory</a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="groupinsurance.asp">Group 
        Insurance</a></font></b></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="eobi list.asp">EOBI 
        Contribution </a></font></b></div>
    </td>
  </tr>
  <tr>
    <td>
      <div ALIGN="CENTER"><b><font size"2" face="Verdana, Arial, Helvetica, sans-serif"><a href="Javascript:cutdate
      ('../reports/gratuity.asp?cutdate=')"><font size="2">Gratuity Schedule</font> 
        </a></font></b></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
