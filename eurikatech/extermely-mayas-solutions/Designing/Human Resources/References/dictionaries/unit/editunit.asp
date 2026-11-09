
<%@ Language=VBScript %>

<%
Option Explicit
%>
<!--#Include virtual="/hris/include/usercheck.htm" -->
<!--#Include virtual="/hris/include/connect.asp" -->

<%

dim rs
dim rsfill
dim mcode

set rsfill=server.CreateObject("adodb.recordset")

sub fillcombo(tablename,srchfield)

dim sql
sql="select * from " & session("bookcode") &  "." & tablename & " order by name"
rsfill.Open sql,cn
do while not rsfill.EOF
	if rsfill.Fields("code")=srchfield then
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & " Selected>" & rsfill.Fields("name") & "</OPTION>"	
	else		
		Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & ">" & rsfill.Fields("name") & "</OPTION>"
	end if		
	rsfill.MoveNext
loop
rsfill.Close

end sub

sub loadrec()

dim sql
mcode=cint(Request.QueryString("mcode"))
call connect()
set rs=server.CreateObject("ADODB.Recordset")
sql="select code,unitname,areacode,sectorcode,regioncode,structurecode,overallcode from " & session("bookcode") &  ".qryunits where code=" & mcode 
rs.Open sql,cn

end sub

sub closerec()

rs.Close
set rs=nothing
set rsfill=nothing
cn.close
set cn=nothing


end sub

%>

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.form1.name.value=="")
{
alert ("You must fill the Unit Name!")
document.form1.name.focus()
return false
}

if (document.form1.area.value=="")
{
alert ("You must fill the Area Name!")
document.form1.area.focus()
return false
}

if (document.form1.sector.value=="")
{
alert ("You must fill the Sector Name!")
document.form1.sector.focus()
return false
}

if (document.form1.region.value=="")
{
alert ("You must fill the Region Name!")
document.form1.region.focus()
return false
}

if (document.form1.structure.value=="")
{
alert ("You must fill the Sturcture Name!")
document.form1.structure.focus()
return false
}

if (document.form1.overall.value=="")
{
alert ("You must fill the Overall!")
document.form1.overall.focus()
return false
}

if (document.form1.sector.selectedIndex < 0)
  {
    alert("Please select one of the Sector.");
    document.form1.sector.focus();
    return (false);
  }


if (document.form1.region.selectedIndex < 0)
  {
    alert("Please select one of the region.");
    document.form1.region.focus();
    return (false);
  }

if (document.form1.structure.selectedIndex < 0)
  {
    alert("Please select one of the Structure.");
    document.form1.structure.focus();
    return (false);
  }

if (document.form1.overall.selectedIndex < 0)
  {
    alert("Please select one of the Overall.");
    document.form1.overall.focus();
    return (false);
  }
}
//-->
</script>


<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</head>
<body>
<%call loadrec()%> <form Name="form1" METHOD="post" ACTION="editunitdb.asp?mcode=<%Response.Write cstr(mcode)%>" onsubmit="return validate()">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28" bgcolor="#660000">
    <tr>
      <td height="29"> 
        <div align="CENTER"><b><font color="#FFFFFF">Edit Unit</font></b></div>
      </td>
    </tr>
  </table>
  <table width="100%" border="1" cellspacing="0" cellpadding="4" bordercolorlight="#000066">
    <tr> 
      <td width="44%" height="40">Unit</td>
      <td width="56%" height="40"> 
        <input type="TEXT" name="name" size="25" maxlength="50" value="<%Response.Write rs.Fields("unitname")%>">
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Area</td>
      <td width="56%" height="40"> 
        <select name="area">
          <%fillcombo "area",rs.Fields("areacode")%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Sector</td>
      <td width="56%" height="40"> 
        <select name="sector">
          <%fillcombo "sector",rs.Fields("sectorcode")%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Region</td>
      <td width="56%" height="40"> 
        <select name="region">
          <%fillcombo "region",rs.Fields("regioncode")%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Structure</td>
      <td width="56%" height="40"> 
        <select name="structure">
          <%fillcombo "structure",rs.Fields("structurecode")%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" height="40">Overall</td>
      <td width="56%" height="40"> 
        <select name="overall">
          <%fillcombo "overall",rs.Fields("overallcode")%> 
        </select>
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Update"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear Update"></div></td></tr></table></form><p>&nbsp;</p><%call closerec()%> 
</body>
</html>
