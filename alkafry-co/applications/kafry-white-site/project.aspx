<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="VB" %>
<html dir="rtl" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256" />
<title>Untitled 1</title>
<style type="text/css">
.title-right {
	width:15px;height:54px;
	background-image:url('images/title_right.gif');
	background-repeat:no-repeat; 
}
.style1 {
	height: 54px;
	background-image: url('images/title_body.gif');
	background-repeat: repeat-x;
	font-weight: bold;
	font-size: 22px;
	color: #008000;
}
.title-left {
	width:15px;height:54px;
	background-image:url('images/title_left.gif');
	background-repeat:no-repeat; 
}
.title-body {
	height:54px;
	background-image:url('images/title_body.gif');
	background-repeat:repeat-x; 
}
.style2 {
	font-size: medium;
	color: green;
	font-weight: bold;
	text-align: center;
	text-decoration:none;
}
.style3 {
	border-collapse: collapse;
}
.style4 {
	background-image: url('images/proj_box.gif');
}
.style5 {
	background-image: url('images/proj_pp_body.gif');
}
.style6 {
	background-image: url('images/proj_gold.gif');
}
.style7 {
	background-image: url('images/proj_base.gif');
}
.style8 {
	font-size: large;
	font-family: "Times New Roman", Times, serif;
}
</style>
<link rel="stylesheet" type="text/css" href="style/tables.css"/>
</head>

<body style="font-size:1px;">

<form id="form1" runat="server">
<%
	dim Connect as new data.oledb.oledbconnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & me.mappath("data\dataweb.accdb") & ";Jet OLEDB:Database password='*kafry655042*' ")
	dim scmd as new data.oledb.oledbcommand("SELECT project_name from tproject",Connect)
	dim dr as data.oledb.oledbdatareader
	
	Connect.open
	dr=scmd.executereader
%>

<center>
<table style="width: 80%; height: 750px">
	<tr>
		<td style="height: 100px"><table style="width: 300px; height: 54px" cellspacing="0" cellpadding="0">
	<tr>
		<td class="title-right" >&nbsp;</td>
		<td class="style1"><span lang="ar-sy">المشاريع السكنية</span></td>
		<td class="title-left">&nbsp;</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td style="height: 550px">
		<table style="width: 80%; height: 500px" cellpadding="0" class="style3">
			<tr>
				<td class="corner2">&nbsp;</td>
				<td class="border_up">&nbsp;</td>
				<td class="corner1">&nbsp;</td>
			</tr>
			<tr>
				<td class="border_rt">&nbsp;</td>
				<td style="height: 472px">
				<table style="width: 100%; height: 472px" cellpadding="0" class="style3">
					<tr>
						<td style="width: 52px; height: 46px" class="style4">&nbsp;</td>
						<td style="height: 46px">
						<img src="images/proj_right.gif" width="45" height="41" style="float: right" /><img src="images/proj_left.gif" width="45" height="41" style="float: left" /><img src="images/proj_title.gif" width="227" height="36" /></td>
						<td style="width: 52px; height: 46px" class="style4">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 52px; height: 30px" class="style5">&nbsp;</td>
						<td style="height: 30px">&nbsp;</td>
						<td style="width: 52px; height: 30px" class="style5">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 52px" class="style5">&nbsp;</td>
						<td style="height: 332px">
						<table style="width: 80%" class="style3">
						<%
						do while dr.read()
						%>
							<tr>
								<td class=""><span lang="ar-sy">
								<span class="style8"><strong><%response.write(dr.item(0))%></strong></span></span></td>
							</tr>
						<%
						loop
						dr.close
						connect.close
						%>
						</table>
						</td>
						<td style="width: 52px" class="style5">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 52px; height: 30px" class="style5">&nbsp;</td>
						<td style="height: 30px">&nbsp;</td>
						<td style="width: 52px; height: 30px" class="style5">&nbsp;</td>
					</tr>
					<tr>
						<td style="width: 52px; height: 10px" class="style6">
						</td>
						<td style="height: 11px"></td>
						<td style="height: 10px; width: 52px" class="style6">
						</td>
					</tr>
					<tr>
						<td style="width: 52px; height: 24px" class="style7">&nbsp;</td>
						<td style="height: 24px">&nbsp;</td>
						<td style="width: 52px; height: 24px" class="style7">&nbsp;</td>
					</tr>
				</table>
				</td>
				<td class="border_lf">&nbsp;</td>
			</tr>
			<tr>
				<td class="corner3">&nbsp;</td>
				<td class="border_dn">&nbsp;</td>
				<td class="corner4">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td style="height: 100px">
		<table style="width: 100px; height: 54px" cellspacing="0" cellpadding="0">
	<tr>
		<td class="title-right" >&nbsp;</td>
		<td class="title-body">
		<a href="main.aspx" class="style2" lang="ar-sy">&#1593;&#1608;&#1583;&#1577;</a></td>
		<td class="title-left">&nbsp;</td>
	</tr>
</table>

		</td>
	</tr>
</table>
</center>
</form>

</body>

</html>
