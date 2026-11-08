<html dir="rtl">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1256"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>شركة الكفري للتسويق العقاري عبر الأنترنت</title>
<link type="text/css" rel="stylesheet" href="style/style.css">
<link type="text/css" rel="stylesheet" href="style/input.css">
<script language="vbs">
function producer
msgbox "Desingning and programming by Mayass Faraj , thank you",0,"Copyright"
end function
</script>
<%
language=request.cookies("language")
if language=0 then
	con_damas="دمشق"
	con_swidaa="السويداء"
	con_daraa="درعا"
	con_latakia="اللاذقية"
	con_tartos="طرطوس"
	con_homs="حمص"
	con_aleppo="حلب"
	con_edlib="حماة"
	con_hama="إدلب"
	con_raqa="الرقة"
	con_derzor="دير الزور"
	con_hasaka="الحسكة"
	con_flat="شقق"
	con_store="محلات"
	con_ground="أراضي"
	con_build="عقارات"
	con_vela="فيلات"
	con_project="مشاريع"
	con_caption="الرجاء إدخال تفاصيل العقار الذي تريد البحث عنه : "
	con_city="المحافظة :"
	con_kind="نوع العقار"
	con_price="سعر العقار :"
	con_space="مساحة العقار :"
	con_from="من"
	con_to="إلى"
	con_tooltip=" إضغط" & " Ctrl " & "لإختيار متعدد"
	con_sp=" ل.س."
	director="rtl"
	imgsrc="images/botton_search.gif"
	
else
	con_damas="Damascus"
	con_swidaa="Swidaa"
	con_daraa="Daraa"
	con_latakia="Latakia"
	con_tartos="Tartos"
	con_homs="Homs"
	con_aleppo="Aleppo"
	con_edlib="Edlib"
	con_hama="Hama"
	con_raqa="Raqa"
	con_derzor="Der Alzor"
	con_hasaka="Hasaka"
	con_flat="Flats"
	con_store="Stores"
	con_ground="Lands"
	con_build="Buildings"
	con_vela="Villas"
	con_project="Projects"
	con_caption="Please Enter Details of the Real Estate that you want :"
	con_city="City : "
	con_kind="Esate Kind :"
	con_price="Estate Price :"
	con_space="Estate Survey :"
	con_from="from"
	con_to="to"
	con_tooltip="Press Ctrl for Multi Select"
	con_sp=" $"
	director="ltr"
	imgsrc="images/botton_search_eng.gif"
end if
%>
</head>
<body>
<div align="center">
&nbsp;<table border="0" width="600" cellspacing="0" cellpadding="0" height="30" id="table1" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p dir=<%response.write director%> align="center"><b><%response.write con_caption%></b></td>
			<td width="30" height="30" background="images/tableleft.gif" ondblclick="producer()">&nbsp;</td>
		</tr>
	</table><br>
&nbsp;</div>
<div align="center">
<table border="0" width="600" id="table2" cellspacing="0" cellpadding="0" height="229" bgcolor="#99CCFF">
	<tr>
		<td background="images/bcorner.gif" width="11" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="580"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr>
		<td width="11" background="images/r_border.gif">&nbsp;</td>
		<td width="583" bgcolor="#99CCFF" valign="top" align="right">
		<form action="search_results.asp" method="post">
		<br>
		<div align="center">
		<table dir=<%response.write director%> border="1" width="97%" id="table3" bordercolor="#000099" style="border-collapse: collapse" cellpadding="5">
			<tr>
				<td width="11%" rowspan="3" valign="top"><font color="#000099"><b><%response.write con_city%></b></font></td>
				<td width="13%" rowspan="3" valign="top">
				<select size="12" name="txtcity" tabindex="0" multiple style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
						<option selected value="11"><%response.write con_damas%></option>
						<option value="16"><%response.write con_swidaa%></option>
						<option value="15"><%response.write con_daraa%></option>
						<option value="41"><%response.write con_latakia%></option>
						<option value="43"><%response.write con_tartos%></option>
						<option value="31"><%response.write con_homs%></option>
						<option value="21"><%response.write con_aleppo%></option>
						<option value="33"><%response.write con_edlib%></option>
						<option value="23"><%response.write con_hama%></option>
						<option value="22"><%response.write con_raqa%></option>
						<option value="51"><%response.write con_derzor%></option>
						<option value="52"><%response.write con_hasaka%></option>
				</select></td>
				<td width="21%" valign="top" height="127"><font color="#000099"><b><%response.write con_kind%></b></font><p align="center">&nbsp;</td>
				<td width="49%" valign="top" height="127">
				<select size="7" name="txtbuild" multiple  style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
				<option selected value="0"><%response.write con_flat%></option>
				<option value="1"><%response.write con_store%></option>
				<option value="2"><%response.write con_ground%></option>
				<option value="3"><%response.write con_build%></option>
				<option value="4"><%response.write con_vela%></option>
				<option value="5"><%response.write con_project%></option>
				</select></td>
			</tr>
			<tr>
				<td width="21%" valign="top" height="24" align="center"><font color="#000099"><b><%response.write con_space%></b></font></td>
				<td width="49%" valign="top" height="24"><font color="#000099"><b><%response.write con_from%></b> 
				</font> 
				<select size="1" name="txtfromspace" style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
				<option selected value="10">10</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100">100</option>
				<option value="120">120</option>
				<option value="150">150</option>
				<option value="170">170</option>
				<option value="200">200</option>
				<option value="250">250</option>
				<option value="300">300</option>
				<option value="400">400</option>
				<option value="500">500</option>
				</select><font color="#000099"><b><%response.write con_to%></b>
				</font>
				<select size="1" name="txttospace" style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
				<option value="10">10</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100" selected>100</option>
				<option value="120">120</option>
				<option value="150">150</option>
				<option value="170">170</option>
				<option value="200">200</option>
				<option value="250">250</option>
				<option value="300">300</option>
				<option value="400">400</option>
				<option value="500">500</option>
				</select></td>
			</tr>
			<tr>
				<td width="21%" valign="top" align="center"><font color="#000099"><b><%response.write con_price%></b></font></td>
				<td width="49%" valign="top"><font color="#000099"><b><%response.write con_from%></b> 
				</font> 
				<select size="1" name="txtfromprice" style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
				<option value="100000" selected>100,000</option>
				<option value="150000">150,000</option>
				<option value="200000">200,000</option>
				<option value="300000">300,000</option>
				<option value="400000">400,000</option>
				<option value="500000">500,000</option>
				<option value="600000">600,000</option>
				<option value="700000">700,000</option>
				<option value="800000">800,000</option>
				<option value="900000">900,000</option>
				<option value="1000000">1,000,000</option>
				<option value="1200000">1,200,000</option>
				<option value="1500000">1,500,000</option>
				<option value="2000000">2,000,000</option>
				<option value="3000000">3,000,000</option>
				<option value="5000000">5,000,000</option>
				<option value="7000000">7,000,000</option>
				<option value="10000000">10,000,000</option>
				</select><font color="#000099"><b><%response.write con_to%></b> 
				</font> 
				<select size="1" name="txttoprice" style="border:3px solid #000099; font-weight: bold; font-family:Arial; color:#000099; letter-spacing:1pt">
				<option value="100000">100,000</option>
				<option value="150000">150,000</option>
				<option value="200000">200,000</option>
				<option value="300000">300,000</option>
				<option value="400000">400,000</option>
				<option value="500000">500,000</option>
				<option value="600000">600,000</option>
				<option value="700000" selected>700,000</option>
				<option value="800000">800,000</option>
				<option value="900000">900,000</option>
				<option value="1000000">1,000,000</option>
				<option value="1200000">1,200,000</option>
				<option value="1500000">1,500,000</option>
				<option value="2000000">2,000,000</option>
				<option value="3000000">3,000,000</option>
				<option value="5000000">5,000,000</option>
				<option value="7000000">7,000,000</option>
				<option value="10000000">10,000,000</option>
				<option value="50000000">50,000,000</option>
				</select><font color="#000099"><b><%response.write con_sp%></b></font></td>
			</tr>
			<tr>
				<td width="11%" height="23">&nbsp;</td>
				<td colspan="3" height="23"><i><small><%response.write con_tooltip%></small></i></td>
			</tr>
			<tr>
				<td colspan="4">
				<p align="center">
				<input type="image" src=<%response.write imgsrc%> value="بحث" name="cmdenter"></td>
			</tr>
			</table>
		</div>
		</form>
		</td>
		<td background="images/l_border.gif" width="10" height="210">&nbsp;</td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="11" height="10"></td>
		<td background="images/b_border.gif" height="9"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table>
</div>
</body>
</html>