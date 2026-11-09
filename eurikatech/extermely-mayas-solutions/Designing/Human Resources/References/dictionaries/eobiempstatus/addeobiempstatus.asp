<%@ Language=VBScript %>
<%
Option Explicit
%>
<!--#Include File="..\..\include\usercheck.htm" -->
<!--#Include virtual="/hris/include/connect.asp" -->


<%
on error resume next 
call connect()
dim rsfill
set rsfill=server.CreateObject("ADODB.Recordset")

sub fillcombo()

dim sql
sql="select * from " & session("bookcode") &  ".employeestatus order by name"
rsfill.Open sql,cn
do while not rsfill.EOF
	Response.Write "<OPTION VALUE=" & rsfill.Fields("code") & ">" & rsfill.Fields("name") & "</OPTION>"	
	rsfill.MoveNext
loop
rsfill.Close
end sub
%>

<script LANGUAGE="JavaScript">
<!--



//-->
</script>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Add New Allowances</title></head>
<body>
<form Name="form1" METHOD="post" ACTION="addeobiempstatusdb.asp" >
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="28" BGCOLOR="#660000">
    <tr><td HEIGHT="29">
        <div ALIGN="CENTER"><b><font COLOR="#FFFFFF">Add Employee Status</font></b></div>
      </td></tr></table>
  <table WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLORLIGHT="#000066">
    <tr> 
      <td WIDTH="44%" HEIGHT="61">Employee Status</td>
      <td WIDTH="56%" HEIGHT="61"> 
        <select name="code">
          <%fillcombo()%> 
        </select>
      </td>
    </tr>
  </table>
  <table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="38"><tr><td HEIGHT="54" WIDTH="44%"><div ALIGN="CENTER"><input TYPE="submit" NAME="Submit" VALUE="Add"></div></td><td HEIGHT="54" WIDTH="56%"><div ALIGN="CENTER"><input TYPE="reset" NAME="Submit2" VALUE="Clear"></div></td></tr></table></form><p>&nbsp;</p>

</body>
</html>
