<div class="ContentTeaser">
<div class="ContentTeaser_details">

<?php include("track_category.php");?>

<div class="pageTxt_continer">

<?php
###########################
//for show sub category
$query_cat_sub = mysql_query("select * from categories_titles where p_id='".ProtectHTML(intval($category_id))."' AND appear='1' AND `category_name[$lang]` != '' order by category_id ") or die ("No Select");
$total_cat_sub = mysql_num_rows($query_cat_sub);

if($total_cat_sub > 0) { ?>
  <div class="pageTxt_subpages">
    <?php while ($row1 = mysql_fetch_array($query_cat_sub)) { 
     echo '<img src="images/ovbullmain.png" border="0" align="absmiddle" /> <a href="?page=show&category_id='.$row1['category_id'].'">'.stripslashes($row1["category_name[$lang]"]).'</a><br />';
		}
		mysql_free_res($query_cat_sub);
	?>
  </div>
  <?php 
}//end if
###########################

$where = sprintf(" WHERE p_id='%s' ",ProtectHTML(intval($category_id)));
$query_company = $config_cat->select_db("categories_details",$where);
$totalRows_prod = mysql_num_rows($query_company);
while ($row_company = mysql_fetch_array($query_company)) {
	  $format_form = $row_company["content_form"]; 
	  $format_email = $row_company["email_form"];
	  $format_appear = $row_company["appear_form"];
	  $allow_print = $row_company["allow_print"];
  	  $nameVedio_det = $row_company["prod_img_2"];
	  $nameVedio_link = $row_company["link_video"];
	  $nameGallary_link = $row_company["link_gallary"];
      $name_form = explode(".",$format_form);	
	?>

  <div class="font_text">
    <?php
$pagging = explode("#@#",$row_company["full_text[$lang]"]);
$count_page = count($pagging);
print_data(urlencode($_GET["keyword"]),$pagging[$num_page-1]);?>
  </div>
  
<?php 
###################################################################### For Vedio (Flv - Mov)
if(!empty($nameVedio_link)) { 
?>
      <div class="pageTxt_vedio_title">فيديو مصور</div>
      <div class="pageTxt_vedio_content"> 
      <iframe name="video_dw" width="470" height="320" frameborder="0" scrolling="no" src="http://www.youtube.com/embed/<?=$nameVedio_link;?>"></iframe>
      </div>
      <?php
}//end if
###################################################################### For Vedio (Flv - Mov)
 
 
///////////
	if(!empty($format_form) && $format_appear==0) { ?>
  <div>
    <?php include($format_form);?>
  </div>
  <?php
	}
/////////// ?>
  <!--for pagging-->
  <? if($count_page > 1){?>
  <div class="pageTxt_pagging">
	<?php 
    for($i=1;$i<=$count_page; $i++) {
    if($i==$num_page) { $Class = "ovnumPagging"; } else { $Class = "numPagging"; }
       print '<a href="?page=category&category_id='.intval($category_id).'&CatId='.intval($CatId).'&num_page='.ProtectHTML(intval($i)).'&lang='.ProtectHTML($lang).'" class="'.$Class.'">&nbsp;'.ProtectHTML(intval($i)).'&nbsp;</a>';
    }
    ?>
  </div>
  <?php }//end if($count_page > 1)?>
  <!--for pagging-->
  
  <?php 
  
  $query_num_read=mysql_query("update categories_details set num_read=num_read+1 where id='".ProtectHTML(intval($row_company["id"]))."' ");
  mysql_free_res($query_num_read);
}//end while 

mysql_free_res($query_company);




if(!empty($nameGallary_link)) {
		echo '<div class="pageTxt_vedio_title">ألبوم صور</div> ';
		$gallery_id = intval($nameGallary_link);
		include(MYPATH."gallary/GetPhotos.php");
} 
?>

</div>
</div>
</div>