<%@ Language=VBScript %>
<%
option explicit
%>
<!--#Include virtual="/payroll/include/usercheck.htm" -->
<!--#include virtual="/payroll/include/connect.asp"-->
<%
call connect()
dim rs
dim sql
set rs=server.CreateObject ("ADODB.Recordset")

sub fillperiod()
dim abc

sql="select * from " & session("bookcode") &  ".period order by code desc"
rs.Open sql,cn
'Response.Write "<OPTION VALUE= > </OPTION>"
do while not rs.EOF
'	if rs.Fields ("code")="'&mperiod&'" then
'		Response.Write "<OPTION VALUE=" & rs.Fields("code") & " Selected>" & rs.Fields ("name") & "</OPTION>"
'	else
		Response.Write "<OPTION VALUE=" & rs.Fields("code") & ">" & rs.Fields ("name") & "</OPTION>"
'	end if
	rs.MoveNext
loop
rs.Close

end sub
%>
<script LANGUAGE="JavaScript">
<!--
function paycon() {

var ans;
ans=window.confirm("Are you Sure to Update");
abc=25
if (ans==true) {
	document.form1.action="update.asp"
	document.form1.submit();   
	//window.open("update.asp","Update","height=300,width=400,status=yes,toolbar=no,menubar=no,location=no");
}	
}
//-->
</script>
<html>
<head>
<title>Update Payroll</title>

</head>

<body>
<!--#include virtual="/payroll/include/top.htm" --> <!--#include virtual="/payroll/include/navigation.htm" --> 

<table width="100%" border="1" cellpadding="4" bordercolor="#330000" cellspacing="0">

  <tr bgcolor="#330000"> 
    <td> 
      <div align="center"><font size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif" color="#CCCCCC">UPDATE 
        PAYROLL</font></b></font></div>
    </td>
  </tr>
</table>
<form name="form1" method="post" action="">
  <table width="57%" border="1" vspace="0" hspace="0" height="200" cellpadding="4" bordercolor="#660000" cellspacing="0" align="center">
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="77"> 
        <div align="center"><b>Select the Period 
          <select name="period" >
            <% fillperiod() %> 
          </select>
          </b></div>
      </td>
    </tr>
    <tr bgcolor="#cccccc" bordercolor="#666666"> 
      <td height="77"> 
        <div align="center"><b> 
          <input type="button" name="Process" value="Process" onClick="javascript:paycon()">
          </b></div>
      </td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
