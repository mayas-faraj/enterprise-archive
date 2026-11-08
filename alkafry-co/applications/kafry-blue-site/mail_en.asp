<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir=ltr>
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Alkafry Company - Send Details</title>
<link type="text/css" href="style/style.css" rel="stylesheet">
<link type="text/css" href="style/input.css" rel="stylesheet">
</head>
<body bgcolor="#99CCFF">
<center><span lang="en-us">Enter a details of the estate that you want 
to buy or sell</span><br>
<%
report=request.querystring("report")
if report="emna" then 
response.write "<b><font color=red>Please enter your name</font></b>"	
else if report="emph" then 
response.write "<b><font color=red>Please Enter Your Phone Number</font></b>"
else if report="ok" then
response.write "<b><font color=#0066cc>Your Details has been sendet , thank you !</font></b>"
else 
response.write ""
end if
end if
end if
%></center>
<basefont face="Arial Unicode MS,arial" size="2" color="#000099">
<form method="POST" action="save_email.asp" name="frmmail">
		<div align="center">
<table width="39%" cols=2 border=1 height="370" bordercolor="#000099" style="border-collapse: collapse" cellspacing="0" cellpadding="2">
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Name</font></span><font size="2">*</font></td>
	<td height="23" align="center"> 
		<p>
		<input class="mail" type="text" name="txtname" size="30" tabindex="0" maxlength="30"></p>
	</td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Request Kind</font></span></td>
	<td height="23" align="center"> 
	<select size="1" name="txtkind" tabindex="1">
	<option selected value="sell">Sell</option>
	<option value="buy">Buy</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Request Details</font></span></td>
	<td height="23" align="center"> 
	<select size="1" name="txtbuild" tabindex="2">
	<option selected value="flat">Flat</option>
	<option value="store">Store</option>
	<option value="ground">Land</option>
	<option value="build">Building</option>
	<option value="vela">Villa</option>
	<option value="tour">Project</option>
	<option value="tour">Other</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Survey</font></span></td>
	<td height="23" align="center"> 
	<input type="text" name="txtspace" size="30" tabindex="3" maxlength="30" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Price</font></span></td>
	<td height="23" align="center"> 
	<input type="text" name="txtprice" size="30" tabindex="4" maxlength="50" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">City</font></span></td>
	<td height="23" align="center"> 
	<select size="1" name="txtcity" tabindex="5">
	<option selected value="damas">Damacus</option>
	<option value="swida">Swidaa</option>
	<option value="daraa">Daraa</option>
	<option value="latakia">Latakia</option>
	<option value="tartous">Tartos</option>
	<option value="homs">Homs</option>
	<option value="aleppo">Aleppo</option>
	<option value="hama">Hama</option>
	<option value="idleb">Edlib</option>
	<option value="raqa">Raqa</option>
	<option value="zor">Der AlZor</option>
	<option value="hasaka">Hasaka</option>
	</select></td></tr>
<tr><td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Address</font></span></td>
	<td height="23" align="center"> 
	<input type="text" name="txtaddress" size="30" tabindex="6" maxlength="100" class="mail"></td></tr>
<tr><td height="23" width="114" align="center"><span lang="en-us">
	<font size="2">Phone</font></span><font size="2">*</font></td>
	<td height="23" align="center"> 
	<input type="text" name="txtphone" size="30" tabindex="7" maxlength="30" class="mail"></td></tr>
<tr>
	<td height="23" width="114" align="center"> <span lang="en-us">
	<font size="2">Your EMail</font></span></td>
	<td height="23" align="center"> 
	<input type="text" name="txtemail" size="30" tabindex="8" maxlength="40" class="mail"></td>
</tr>
<tr>
	<td height="30" width="114" align="center"> <span lang="en-us">
	<font size="2">Details</font></span></td>
	<td height="80" align="center" rowspan="2" valign="top"> 
	<textarea rows="5" name="txtdescription" cols="25" tabindex="9"></textarea></td>
</tr>
<tr>
	<td height="54" width="114" align="center"><font size="2">&nbsp; </font> </td>
	</tr>
<tr><td height="23" width="114" align="center"> 
	<input type="reset" value="      Clear      " name="cmdclear" tabindex="11"></td>
	<td height="23" align="center"> 
	<input type="submit" value="Send Information" name="cmdsave" tabindex="10"></td></tr>
</table>
		</div>
</form>
</body>
</html>