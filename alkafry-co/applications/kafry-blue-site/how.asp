<html dir="rtl">
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Language" content="ar-sy">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>طريقة التعامل مع الشركة</title>
<link type="text/css" href="style/style.css" rel="stylesheet">
<%
language=request.cookies("language")
if language=0 then
	con_caption="طريقة وضع إعلانك في موقع شركة الكفري"
	con_price="رسوم التسويق على شبكة الأنترنت"
	con_flat="شقة"
	con_store="محل"
	con_land="أرض"
	con_build="عقار كامل"
	con_villa="فيلا"
	con_project="منشأة سياحية"
	con_chalet="شاليه"
	con_factory="مصنع"
	con_farm_building="مزرعة مع بناء"
	con_video="تصوير فيديو" & " ( 5 CDs )"
	con_kind="نوع لعقار"
	con_market="رسوم التسويق"
	director="rtl"
else
	con_caption="Put your estate details here"
	con_price="publicity due in internet"
	con_flat="flat"
	con_store="store"
	con_land="land"
	con_build="building"
	con_villa="villa"
	con_project="tour project"
	con_chalet="chalet"
	con_factory="factory"
	con_farm_building="building & land"
	con_video="video" & " ( 5 CDs ) "
	con_kind="estate kind"
	con_market="market due"
	director="ltr"
end if
%>
</head>
<body>
<div align="center" style="height:1060;">
<br>
<div align="center">
	<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table2" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center"><b><%response.write con_caption%></b></td>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
<br>
</div>
<div align="center">
<table border="0" width="752" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td background="images/bcorner.gif" width="10" style="padding: 0"></td>
		<td background="images/u_border.gif" height="10" width="732" colspan="2"></td>
		<td background="images/acorner.gif" width="10" height="10"></td>
	</tr>
	<tr>
		<td width="10" background="images/r_border.gif" rowspan="2">&nbsp;</td>
		<td width="9" bgcolor="#FFFFFF" valign="top" align="right" rowspan="2">&nbsp;</td>
		<td width="723" bgcolor="#FFFFFF" valign="top" align="right">
		<%if language=0 then%>
		<p align="right"><b><br>
			&nbsp;عزيزي العميل :<br>
			<br>
			<font size="2" face="Arial">فقط أتصل بنا , و سيأتي إليك ممثل عن الشركة ويقوم بمعاينة العقار الذي 
		تود بيعه على الطبيعة سواء كان ( شقة – أرض – فيلا – محل – شاليه – عقار 
		كامل – مصنع – منشأة سياحية ) .ويقوم الممثل عن الشركة بكتابة مواصفات 
		عقارك 
		بدقة كما هي موجودة على أرض الواقع ويقوم أيضاً بتصوير عقارك بكاميرا ديجيتال 
		أو فيديو ( حسب الطلب ) ومن ثم تملأ مع ممثل الشركة استمارة تفويض بالتسويق 
		مختومة وموقعة من الشركة ونقوم بدورنا التسويقي بعرض المواصفات والصور على 
		شبكة الانترنت داخل وخارج سورية ونستقبل العروض التي ترد على عرضك لدينا 
		ونتصل بك ونخبرك بأي سعر يأتي على العرض ولك الحق بالرفض والقبول في حال 
		تمت الموافقة تحضر لنا عقد الملكية ونقوم بالتعاقد معك وندفع لك المبلغ 
		الذي طلبته نقدا أما المشتري فيشتري من الشركة بالقسط على سبع سنوات .<br>
			<br>
			ملاحظة : دون تقاضي أي عمولة عند البيع<br>
			<br>
			المشتري يكون عن طريق الشركة حصرا ومن طرفها وغير ذلك الشركة غير مسؤولة عن تنفيذ عملية البيع .</font><br>
&nbsp;
</b></p>
		<%else%>
				<p align="left" dir=ltr><b><br>
				&nbsp;<span lang="en-ca">Dear visitor :</span><br>
			<br>
				<span style="font-size: 11pt"><span lang="en-ca" dir=ltr>Just call us , 
				and we will send delegate of company , and he will get preview 
				to 
				your real estate , and he will write your real estate's 
				details and he will take a picture too or save a vedio ( optional 
				) , and then you will fill with hem a delegation document for 
				marketing , and then , we will show your estate's details and 
				picture on our web site .<br>
				</span></span><br>
&nbsp;
</b></p>
		<%end if%>
			</td>
		<td background="images/l_border.gif" width="10" height="300" rowspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="723" bgcolor="#FFFFFF" valign="top" align="right">
		<p align="center">
		<b><br><%response.write con_price%>
		</b></div>
		</div>
		</p>
		<div align="center">
			<table border="1" width="300" height="200" id="table3" bordercolor="#0066CC" dir=<%response.write director%>>
				<tr bgcolor="#FF99FF">
					<td width="140" align="center"><b><%response.write con_kind%></b></td>
					<td align="center"><b><%response.write con_market%></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_flat%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">4500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_store%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">3000</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_land%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">5500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_build%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">15500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_villa%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">6500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_chalet%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">4500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_factory%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">7000</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_project%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">25000</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_farm_building%></span></b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">12500</span></b></td>
				</tr>
				<tr>
					<td width="140" align="center"><b>
					<span style="font-size: 11pt"><%response.write con_video%></span>
					</b></td>
					<td align="center"><b>
					<span style="font-size: 11pt" lang="en-ca">17500</span></b></td>
				</tr>
				</div>
			</table>
			<p>&nbsp;</div>
			</td>
	</tr>
	<tr>
		<td background="images/ccorner.gif" width="10"></td>
		<td background="images/b_border.gif" height="10" colspan="2"></td>
		<td background="images/dcorner.gif" width="10" height="10"></td>
	</tr>
</table>
		</div>
<div align="center"><br>
	<table border="0" width="700" cellspacing="0" cellpadding="0" height="30" id="table4" background="images/tablebody.gif">
		<tr>
			<td width="30" height="30" background="images/tableright.gif">&nbsp;</td>
			<td>
			<p align="center">&nbsp;</td>
			<td width="70">
			<p align="left">
			<%if language=0 then%>
			<a target="_self" href="main.asp">
			<img border="0" src="images/botton_back.gif" width="70" height="20" align="middle"></a></td>
			<%else%>
			<a target="_self" href="main_en.asp">
			<img border="0" src="images/botton_back_eng.gif" width="70" height="20" align="middle"></a></td>
			<%end if%>
			<td width="30" height="30" background="images/tableleft.gif">&nbsp;</td>
		</tr>
	</table>
</div>
</div>
		</body>
		
</html>