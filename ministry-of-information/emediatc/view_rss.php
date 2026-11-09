<div class="ContentTeaser">
<div class="ContentTeaser_details">

<div class="Div_Track">
    <div class="data">
       <p> <a href="?" class="track"> <?php echo $frmad['Home'];?> </a> <font class="msg"> &raquo; </font> 
	   <a href="#" class="track">RSS خدمة ال </a></p>
    </div>
</div>
<div class="ClearAll"></div>


<div class="pageTxt_continer">


    <div class="font_text">
	  <b class="font_text">ما هي خدمة ال RSS ؟</b><br>
	  <br>
	خدمة RSS هي عبارة عن وسيلة سهلة تمكنك من الحصول على آخر الأخبار فور ورودها على مواقعك المفضلة على شبكة الإنترنت. فبدلاً من فتح صفحات المواقع والبحث عن المواضيع الجديدة، فإن خدمة RSS تخطرك بما يستجد من أخبار ومواضيع على تلك المواقع فور نشرها. <br />
      <br>
	يجب عليك في البداية الحصول على برنامج يطلق عليه اسم News Reader . <br />
	ويعرض هذا البرنامج على شاشة جهاز الكمبيوتر المعلومات التي توفرها خدمة RSS من المواقع التي تختارها . <br />
	<br>
	وبعد الحصول على برنامج News Reader لا يتبقى سوى تحديد المواقع والصفحات التي تريد الحصول منها على خدمة RSS .<br /> 
	  <br>
      <br>	
    
	<table width="500" border="0" align="center" cellpadding="8" cellspacing="8" style="margin: 10px 10px" dir="ltr">
	<tr>
	<?php
	$query = 'SELECT * FROM categories_titles WHERE p_id=0 AND kind=1 AND appear=1 ORDER BY numeric_cat ';
	$sql = mysql_query($query);
	$num_roos = mysql_num_rows($sql);

	$count=0;
	  while ($row_category = mysql_fetch_assoc($sql)) { ?>
    
      
        <td width="130" height="2" align="right" nowrap="nowrap"><a target="_blank" href="http://<?=$_SERVER["HTTP_HOST"];?>/rss/rss_<?=ProtectHTML(intval($row_category["category_id"]));?>.xml" class="rss"><?=ProtectHTML($row_category["category_name[$lang]"]);?>
        </a></td>
        <td width="36" height="2" align="right" valign="middle"><a target="_blank" href="http://<?=$_SERVER["HTTP_HOST"];?>/rss/rss_<?=ProtectHTML(intval($row_category["category_id"]));?>.xml"><img src="images/rss.gif" width="36" height="14" border="0" /></a></td>
      
	  <?php 
	  $count++;
	  if($count==2) {echo "</tr><tr>"; $count=0;} ?>

    
<?php }//end while ?>	
</table>
<br />
<br />
<br />

</div>


</div>
</div>
</div>