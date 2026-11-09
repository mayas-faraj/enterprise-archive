<div class="ContentTeaser">
<div class="ContentTeaser_details">


<div class="Div_Track">
    <div class="data">
       <p> <a href="?" class="track"> <?php echo $frmad['Home'];?> </a> <font class="msg"> &raquo; </font> 
	   <a href="#" class="track"> نتائج البحث </a></p>
    </div>
</div>
<div class="ClearAll"></div>


<?php
 $num_page = 0;
if(isset($_GET['num_page']) && $_GET['num_page']!=""){
	$num_page = $_GET['num_page'];
	$num_page = ProtectHTML(intval($num_page));
}


 $num_page_ar = 0;
if(isset($_GET['num_page_ar']) && $_GET['num_page_ar']!=""){
	$num_page_ar = $_GET['num_page_ar'];
	$num_page_ar = ProtectHTML(intval($num_page_ar));
}



 $kind_page = 0;
if(isset($_POST['kind_page']) && $_POST['kind_page']!=""){
	 $kind_page = $_POST['kind_page'];
	 $num_page = ProtectHTML(intval($num_page));
}

if(isset($_GET['kind_page']) && $_GET['kind_page']!=""){
	 $kind_page = $_GET['kind_page'];
	 $kind_page = ProtectHTML(intval($kind_page));
}



$word_search = "0";// this is the keyword the we want to search  form it.
if (isset($_POST['word']) && ($_POST['word']!="")) {
 $word_search = (get_magic_quotes_gpc()) ? $_POST['word'] : addslashes($_POST['word']);
 $word_search = ProtectHTML($word_search);
 $word_search = urldecode($word_search);
}//end if


if (isset($_GET['word']) && ($_GET['word']!="")) {
 $word_search = (get_magic_quotes_gpc()) ? $_GET['word'] : addslashes($_GET['word']);
 $word_search = ProtectHTML($word_search);
 $word_search = urldecode($word_search);
}//end if

/*******************************************************/



if ((!empty($word_search) || $word_search!=0) && strlen($word_search) > 2 && strlen($word_search) < 30 ) {

for ($j=0;$j<2;$j++){



 $control=0;



$name_table = array("categories_details","archive_news");
$name_page = array("نتائج البحث في الموقع عن : ","نتائج البحث في الأرشيف عن : ");
$name_url = array("Details","Details");



$row_total = mysql_query("SELECT count(id) FROM ".$name_table[$j]." WHERE appear='1' AND (BINARY `full_text[$lang]` LIKE '%$word_search%'  OR  BINARY `title[$lang]` LIKE '%$word_search%' OR  BINARY `title2[$lang]` LIKE '%$word_search%' OR  BINARY `small_title[$lang]` LIKE '%$word_search%' OR  BINARY `auther[$lang]` LIKE '%$word_search%')  ") or die(mysql_error());
$total = mysql_fetch_array($row_total);
$total_rows_new = $total[0];



$length_rec=30;
  if($j==0) { $start_rec=$length_rec * $num_page; }
  else      { $start_rec=$length_rec * $num_page_ar; }



$sql_det = "SELECT * FROM ".$name_table[$j]." 
        WHERE appear='1' AND (BINARY `full_text[$lang]` LIKE '%$word_search%'  OR  BINARY `title[$lang]` LIKE '%$word_search%' OR  BINARY `title2[$lang]` LIKE '%$word_search%' OR  BINARY `small_title[$lang]` LIKE '%$word_search%' OR  BINARY `auther[$lang]` LIKE '%$word_search%') order by det_date desc , p_id LIMIT $start_rec,$length_rec";
  $row_det = mysql_query($sql_det) or die(mysql_error());
  $total_det = mysql_num_rows($row_det);//total 

//////////////////////////////////////////////////////////
?>

	<table width="98%" height="23" border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="6" align="right" valign="middle" nowrap="nowrap" class="search" style="padding-right: 10px"><?=$name_page[$j] ."&nbsp;<font class='search_word'>".$word_search."</font>";?></td>
      </tr>
</table>

	<div style="border: #CECECE 1px solid ; width: 95%; height:auto; padding: 8px">

<?php
if ($total_det==0) {

	echo "<br><p align='center' class='form_name'>... عفواً <br> لا يوجد نتائج  </p><br>";}

else  {  ?>

	<table width="99%" border="0" align="center" cellpadding="3" cellspacing="0">

    <tr align="right" valign="middle">
    <td height="31" colspan="3" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    
    <tr valign="bottom">
    
    <td height="20" align="left" valign="middle" nowrap dir="ltr" >الصفحة رقم . <font size="1" class="number"><b><?=$_GET["num_page"]+1;?></b></font></td>
    
    <td width="112" height="20" align="right" valign="middle" nowrap >نتائج البحث <b><font size="1" class="number"><?=$total_det;?></font></b> سجل </td>
    
    </tr>
    
    </table>
    </td>
    </tr>

<tr>
    <td width="20%" class="table_search">القسم</td>
    <td width="15%" class="table_search">التاريخ</td>
    <td height="30" class="table_search" style="padding-right: 8px; text-align:right">العنوان</td>
    </tr> 

<?php  
while ($row_data= mysql_fetch_assoc($row_det)){
	Get_Cat_Name(ProtectHTML($row_data["p_id"]));
	$Id_News = ($name_table[$j] == "categories_details")?$row_data["id"]:$row_data["old_id"];
?>

<tr> 

<td align="center" valign="top" nowrap dir="rtl"><?=stripslashes($Cat_Name);?></td>

<td align="center" valign="bottom" nowrap class="date_news" dir="ltr" style="padding-top: 5px"><?php $get_date=explode(" ",ProtectHTML($row_data["det_date"])); echo $get_date[0];?></td>

<td align="right" valign="top" dir="rtl"><a href="?page=<?=$name_url[$j];?>&category_id=<?=ProtectHTML($row_data["p_id"]);?>&id=<?=$Id_News;?>"> <img src="images/bullmain.gif" border="0" align="absmiddle" /> <?=ProtectHTML($row_data["title[$lang]"]);?></a></td>

</tr>

<?php

} //end while

?>

</table>

<?php  } //end else

  



if ($total_rows_new > $length_rec){

?> 

<br>
<table border="0" cellpadding="0" cellspacing="0" width="1%" height="1" align="left" dir="rtl" style="margin-top: 10px"><tr nowrap="nowrap" align="center" valign="middle">

  <?php 

  if($j==0) { $mm = 'num_page=0'; }

  else { $mm = 'num_page_ar=0'; }

		$pages='<td dir="rtl" align="center" valign="middle"><div style="background-color:#dbdbdb; width:15px; height: 15px"><a href="?page=search&word='.urlencode($word_search).'&kind_page='.$kind_page.'&'.$mm.'" class="num_page">1</a></div></td>';	

		$total = $total_rows_new - $length_rec;

		$control = 1;

		
		while($total > 0){
  if($j==0) { $mm = 'num_page='.$control; }
  else { $mm = 'num_page_ar='.$control; }
			
			$i = $control+1;

			$pages .= '<td align="center" valign="middle" dir="rtl"><font face="tahoma" size="1" color="#ffffff"> _ </font></td><td><div style="background-color:#dbdbdb; width:15px; height: 15px"><a href="?page=search&word='.urlencode($word_search).'&kind_page='.$kind_page.'&'.$mm.'" class="num_page"> '.$i.'</a></div></td>';

			$control++;

			$total =$total - $length_rec;

		}

		echo $pages;

	?>

</tr>
</table>

<?php }//end if?>

  </div>

  <br />

<?php

mysql_free_res($row_det);

}

}

else { echo "<br><p align='center' class='form_name'>... عفواً <br>
يرجى ادخال كلمة البحث بطريقة صحيحة وأن لا تقل عدد الحروف عن 3 أو لا تزيد عن 30 حرف </p>"; } 

?>

</div></div>