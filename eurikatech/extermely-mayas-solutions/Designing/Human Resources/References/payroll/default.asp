<%@ Language=VBScript %>
<%
Option Explicit
%>
<!--#Include File="include\connect.asp" -->
<%

sub verify()

if Request.Form("Submit")="Submit" then
	session("username")=Request.Form("username")
	session("password")=Request.Form("password")		
	session("servername")=Request.Form("servername")
	session("bookcode")=Request.Form("bookcode")
	call connect()
	Response.Redirect "index.asp"
end if		

end sub

call verify()
%>

<script LANGUAGE="JavaScript">
<!--

function validate() {

if (document.login.username.value=="")
{
alert ("You must enter the username!")
document.login.username.focus()
return false
}

if (document.login.password.value=="")
{
alert ("You must enter the password!")
document.login.password.focus()
return false
}

if (document.login.servername.value=="")
{
alert ("You must enter the server name!")
document.login.servername.focus()
return false
}

if (document.login.bookcode.value=="")
{
alert ("You must enter the Book Code!")
document.login.bookcode.focus()
return false
}

//-->
}
</script>
<html>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#000066" valign="top"> 
    <td height="15" width="45%" bgcolor="#666666"> 
      <div align="left"><font size="6" color="#FFFFFF">PAYROLL Software</font><font size="5" color="#FFFFFF"> 
        </font></div>
    </td>
    <td height="52" width="55%" bgcolor="#666666"> 
      <div align="RIGHT"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><%Response.Write formatdatetime(date(),1)%></b></font></div>
    </td>
  </tr>
</table>
<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#99FF99">
  <tr>
    <td HEIGHT="15" WIDTH="45%" bgcolor="#666666"><font FACE="Verdana, Arial, Helvetica, sans-serif"><b> 
      </b> </font> </td>
    <td HEIGHT="15" VALIGN="BOTTOM" COLSPAN="2" bgcolor="#666666"> 
      <div ALIGN="right"><font FACE="Verdana, Arial, Helvetica, sans-serif" SIZE="1" COLOR="#ffffff"></font></div>
    </td></tr></table><table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" HEIGHT="20"><tr><td HEIGHT="23">&nbsp;</td></tr></table>
<form METHOD="post" ACTION="default.asp" NAME="login" OnSubmit="return validate()">
  <table WIDTH="44%" BORDER="0" CELLSPACING="1" CELLPADDING="8" ALIGN="CENTER" bgcolor="#000000">
    <tr BGCOLOR="#666666"> 
      <td HEIGHT="29" COLSPAN="2"> 
        <div ALIGN="CENTER"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#9999FF">User 
          Authentication </font></b></div>
      </td>
    </tr>
    <tr BGCOLOR="#CCCCCC"> 
      <td WIDTH="43%" HEIGHT="28" bgcolor="#CCCCCC"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000">User 
        Name</font></b></font></td>
      <td WIDTH="57%" HEIGHT="28" bgcolor="#CCCCCC"> 
        <input TYPE="text" NAME="username">
      </td>
    </tr>
    <tr BGCOLOR="#CCCCCC"> 
      <td WIDTH="43%" HEIGHT="23" bgcolor="#CCCCCC"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000">Password</font></b></font></td>
      <td WIDTH="57%" HEIGHT="23" bgcolor="#CCCCCC"> 
        <input TYPE="PASSWORD" NAME="password">
      </td>
    </tr>
    <tr BGCOLOR="#CCCCCC"> 
      <td WIDTH="43%" HEIGHT="37" bgcolor="#CCCCCC"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000">Server 
        Name</font></b></font></td>
      <td WIDTH="57%" HEIGHT="37" bgcolor="#CCCCCC"> 
        <input TYPE="text" NAME="servername">
      </td>
    </tr>
    <tr BGCOLOR="#CCCCCC"> 
      <td WIDTH="43%" HEIGHT="37" bgcolor="#CCCCCC"><font color="#FFFFFF"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000">Book 
        Code</font></b></font></td>
      <td WIDTH="57%" HEIGHT="37" bgcolor="#CCCCCC"> 
        <input TYPE="text" NAME="bookcode">
      </td>
    </tr>
    
    <tr BGCOLOR="#CCCCCC"> 
      <td COLSPAN="2" HEIGHT="17"> 
        <div ALIGN="CENTER"> 
          <input TYPE="submit" NAME="Submit" VALUE="Submit">
        </div>
      </td>
    </tr>
  </table>
</form>
</body></html>
