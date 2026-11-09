<div class="ContentTeaser">
<div class="ContentTeaser_details">
<?php
/*Get_Page_Member($category_id);
if ($Fun_Page_Member=="1" && !$_SESSION["User_Id"]) { 
	echo "<script>alert('You Must Be Member'); window.location='?lang=$lang';</script>"; 
	exit();
}*/


if ($totalRows_News == 0) { echo "<script>window.location='?';</script>"; exit(); }

####### عدد القراءات
if ((!isset($_POST["form_add_comment"]) && empty($_POST["form_add_comment"])) && (!$_GET["num_page"])) { 

  $query_num_read=mysql_query("update categories_details set num_read = num_read+1 where id='".ProtectHTML(intval($id))."' ");
  mysql_free_res($query_num_read);
}
####### عدد القراءات




################################################################################ for add comments
$query_total = sprintf("SELECT count(id) FROM add_comment where id_rel='%d' and appear='%d' order by id desc", ProtectHTML($id),1);
$row_total = mysql_query($query_total) or die(mysql_error());
$total = mysql_fetch_array($row_total);
$total_rows_new = $total[0];

if ((isset($_POST["form_add_comment"])) && ($_POST["form_add_comment"] == "add_comment") ) {

$number   = $_POST['txtNumber'];
if (md5(strtoupper($number)) != $_SESSION['image_random_value']) {
	$page = str_replace('{color_v}','color="#FF0000"',$page);
	echo "<script>alert('".$frmad['errorMessage']."');</script>";
}else{

//$_SESSION['Sid']=GRP();

$today = date("H:i:s , Y/m/d");     

$name_comment = ProtectHTML($_POST['name_comment']);
$country_comment = ProtectHTML($_POST['country_comment']);
$title_comment = ProtectHTML($_POST['title_comment']);
$details_comment = ProtectHTML($_POST['details_comment']);


if(!empty($name_comment) && !empty($title_comment) && !empty($details_comment) ) {

    $fields_tab=array("category","id_rel","send_date","name","country","title","details","ip_user");
	$values_tab=array( 
		 ProtectHTML($_POST['P_id']),
		 ProtectHTML($_POST['id_rel']),
		 ProtectHTML(stripslashes($today)),
		 $name_comment,
		 $country_comment,
		 $title_comment,
		 $details_comment,
		 $_SERVER['REMOTE_ADDR']."||".$_SERVER['HTTP_X_FORWARDED_FOR']);
////////////////////////////////////////////////
for ($i=0;$i<count($fields_tab);$i++) { $fields[$i] = $fields_tab[$i];}
for ($i=0;$i<count($values_tab);$i++) {$values[$i] = $values_tab[$i];}
	
$query_add_comment = $config_cat->insert_db("add_comment",$fields,$values);
		if(($config_cat->result == true)&& ($query_add_comment)){
			unset($_POST);
			$msg_comm = ' شكراً لتعليقك ... سوف تقوم إدارة التحرير بالنظر فيه وإظهاره في أسرع وقت ممكن  ';
	        //$_SESSION["Time_Add"] = time();	
		}else{
			$msg_comm = 'لم يتم الإضافة ,حاول مرة أخرى';
		}

 mysql_free_res($query_add_comment);

}//end if !empty fildes
  
  else {
     $msg_comm = "يرجى إملاء كافة الحقول";
       }

 }//end img
}//end submit	
################################################################################ for add comments
//////////////////////////////////////////////////////////////////////////
include("track_category.php");

$Link = "?page=ShowArc&category_id=".intval($category_id);
?>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="60" align="center" dir="<?=$dir?>" valign="top">
<div style="width: 100%; height: 35px">
    <div align="<?=$_left;?>" style="width: 45%; float: <?=$_left;?>" class="date_news" dir="<?=$dir;?>">
     تاريخ النشر <?php $AryDate = explode(" ",$det_date); echo  $AryDate[0]." الساعة ". $AryDate[1];?>   
     </div>

<!-- AddThis Button BEGIN -->
<div align="<?=$_right;?>" style="width: 45%; float: <?=$_right;?>" class="date_news" dir="<?=$dir;?>">



<?php /*?><input name="irCalName" id="irCalName" value="<?=stripslashes($title);?> | مديرية الإعلام الالكتروني" type="hidden">
<input name="irCalDesc" id="irCalDesc" value="<?=stripslashes($Brief);?>" type="hidden">
<input name="irCalLink" id="irCalLink" value="http://www.al-elam.com/thumb_photo/<?=(!empty($namePic_det))?ProtectHTML($namePic_det):"logo.jpg";?>" type="hidden">
<div class=" fb_reset" id="fb-root"><div style="position: absolute; top: -10000px; height: 0px; width: 0px;"><div><iframe src="http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26category_id%3D<?=$Pid;?>%26id%3D<?=$id;?>" style="border: medium none;" tab-index="-1" title="Facebook Cross Domain Communication Frame" aria-hidden="true" id="fb_xdm_frame_http" allowtransparency="true" name="fb_xdm_frame_http" frameborder="0" scrolling="no"></iframe><iframe src="http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26category_id%3D<?=$Pid;?>%26id%3D<?=$id;?>" style="border: medium none;" tab-index="-1" title="Facebook Cross Domain Communication Frame" aria-hidden="true" id="fb_xdm_frame_https" allowtransparency="true" name="fb_xdm_frame_https" frameborder="0" scrolling="no"></iframe></div></div><div style="position: absolute; top: -10000px; height: 0px; width: 0px;"><div></div></div></div><?php */?>


<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ar_AR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<table width="1%" cellspacing="5" cellpadding="3" border="0" align="left" dir="ltr">
<tbody><tr>
<td align="center">

<a href="http://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26category_id%3D<?=$Pid;?>%26id%3D<?=$id;?>&amp;t=<?=str_replace(" ","+",stripslashes($title));?>&display=popup#" target="_blank"><img width="24" height="24" title="Add to Facebook" src="images/facebook.png" style="border:none"></a></td>
<td align="center"><a href="http://twitter.com/home?status=<?=str_replace(" ","+",stripslashes($title));?>+http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26select_page%3D<?=$Pid;?>%26id%3D<?=$id;?>+via+%40al-elam" target="_blank"><img width="24" height="24" title="Add to Twitter" src="images/twitter.png" style="border:none"></a></td>
<td align="center"><a href="http://digg.com/submit?phase=2&amp;title=<?=stripslashes($title);?>&amp;url=http://www.al-elam.com/index.php?page=Details&amp;select_page=<?=$Pid;?>&amp;id=<?=$id;?>" target="_blank"><img width="24" height="24" title="Add to digg" src="images/digg.png" style="border:none"></a></td>
<td align="center"><a href="http://del.icio.us/post?title=<?=stripslashes($title);?>&amp;url=http://www.al-elam.com/index.php?page=Details&amp;select_page=<?=$Pid;?>&amp;id=<?=$id;?>" target="_blank"><img width="24" height="24" title="Add to delicious" src="images/delicious.png" style="border:none"></a></td>
<td align="center"><a href="PrintArticle.php?id=<?=ProtectHTML(intval($_GET["id"]));?>" target="_blank"> <img src="images/print_news.png" align="top" title="طباعة"/> </a></td>
<td align="center"><a href="#" onClick="MM_openBrWindow('friend_details.php?<?=$_SERVER['QUERY_STRING'];?>','','width=400,height=490')"> <img src="images/send_mail.png" align="top" title="إرسال لصديق"/></a></td>
</tr>
</tbody></table>
<?php /*?><a class="a2a_dd" href="http://www.addtoany.com/share_save">
    <img src="http://static.addtoany.com/buttons/share_save_171_16.png" border="0" alt="Share"/>
</a>

<script type="text/javascript">
a2a_config = {
    linkname: '<?=stripslashes($title);?>',
    linkurl: 'http://al-elam.com/?page=Details&amp;category_id=<?=$Pid;?>&amp;id=<?=$id;?>',
    num_services: 10,
    show_title: 1
};
</script>

<script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script><?php */?>
</div>

<div align="right" style="direction:rtl">
<div class="fb-like" data-href="http://www.al-elam.com/index.php?page=Details&amp;category_id=<?=$Pid;?>&amp;id=<?=$id;?>" data-send="false" data-width="400" data-show-faces="false" style="border:#FF0000 0px solid"></div>
</div>
<!-- AddThis Button END -->
</div>
	<div class="ClearAll"></div>

    <div class="title_text"><?=ProtectHTML($title);?></div>
        
      </td>
  </tr>
  <tr>
    <td colspan="2" align="<?=$_left;?>" dir="<?=$dir?>" valign="top" >
      <div align="justify" class="font_text" dir="<?=$dir?>" style="padding-top: 15px">

<?php 
$path = "photo/";
$namePic = $namePic_det;
$alt_pic = $title;
$scale = 400;
if(is_file($path.$namePic) && $namePic !="") { ?>      
      <div align="center" class="ContentTeaser_inner_img"> <?php format_img($path,$namePic,$alt_pic,$scale);?> </div> 
 <?php
}//end if

$pagging = explode("#@#",$full_text);
$count_page = count($pagging);
print_data($_GET["keyword"],$pagging[$num_page-1]);?>
      </div>

<div class="auther"><?=addslashes($author_News);?></div>

<div align="<?=$_right;?>" style="float: <?=$_right;?>" class="date_news" dir="<?=$dir;?>">


<!-- AddThis Button BEGIN -->
<div align="<?=$_right;?>" style="width: 45%; float: <?=$_right;?>" class="date_news" dir="<?=$dir;?>">

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ar_AR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<table width="1%" cellspacing="5" cellpadding="3" border="0" align="left" dir="ltr">
<tbody><tr>
<td align="center"><a href="http://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26select_page%3D<?=$Pid;?>%26id%3D<?=$id;?>&amp;t=<?=str_replace(" ","+",stripslashes($title));?>&display=popup#" target="_blank"><img width="24" height="24" title="Add to Facebook" src="images/facebook.png" style="border:none"></a></td>
<td align="center"><a href="http://twitter.com/home?status=<?=str_replace(" ","+",stripslashes($title));?>+http%3A%2F%2Fal-elam.com%2Findex.php%3Fpage%3DDetails%26select_page%3D<?=$Pid;?>%26id%3D<?=$id;?>+via+%40al-elam" target="_blank"><img width="24" height="24" title="Add to Twitter" src="images/twitter.png" style="border:none"></a></td>
<td align="center"><a href="http://digg.com/submit?phase=2&amp;title=<?=stripslashes($title);?>&amp;url=http://www.al-elam.com/index.php?page=Details&amp;select_page=<?=$Pid;?>&amp;id=<?=$id;?>" target="_blank"><img width="24" height="24" title="Add to digg" src="images/digg.png" style="border:none"></a></td>
<td align="center"><a href="http://del.icio.us/post?title=<?=stripslashes($title);?>&amp;url=http://www.al-elam.com/index.php?page=Details&amp;select_page=<?=$Pid;?>&amp;id=<?=$id;?>" target="_blank"><img width="24" height="24" title="Add to delicious" src="images/delicious.png" style="border:none"></a></td>
<td align="center"><a href="PrintArticle.php?id=<?=ProtectHTML(intval($_GET["id"]));?>" target="_blank"> <img src="images/print_news.png" align="top" title="طباعة"/> </a></td>
<td align="center"><a href="#" onClick="MM_openBrWindow('friend_details.php?<?=$_SERVER['QUERY_STRING'];?>','','width=400,height=490')"> <img src="images/send_mail.png" align="top" title="إرسال لصديق"/></a></td>
</tr>
</tbody></table>
</div>
<!-- AddThis Button END -->


    </div>
    
<div align="center" style="width: 100%; padding: 50px 0px 20px 0px">
<table width="100%" height="50"  border="0" align="center" cellpadding="2" cellspacing="0" dir="<?=$dir_2;?>">
        <tr>
          <td width="25%" align="center"><a href="?page=category&category_id=<?=intval($category_id);?>">العودة للقسم</a></td>
          <?php if($_GET["page"]=="Details" && $allow_comment=="1") {?>
          <td width="25%" align="center"><a href="#comment">أضف تعليقك</a></td>
          <?php }//end if($page=="Details")?>
          
          <td width="25%" align="center">عدد التعليقات : <?=$total_rows_new;?></td>
          
          <td width="25%" align="center"><?php echo $frmad["Num_Read"]." : ".$num_read;?></td>
        </tr>
    </table>
<?php rand_paner("other","page_article","620","60");?>
</div>
</td></tr>

<!--for pagging -->
  <? if($count_page > 1){?>
  <tr>
    <td colspan="2"  align="center" dir="<?=$dir?>" style="padding-top: 10px">
    <table border="0" cellpadding="0" cellspacing="0" width="1%" height="1" align="center">
        <tr nowrap="nowrap" align="center"><td>
          <?php 
$Class = "";
for($i=1;$i<=$count_page; $i++) {
if($i==$num_page) { $Class = "selected"; } 
   print '<span class="num"><a href="?page=Details&category_id='.ProtectHTML($category_id).'&id='.$id.'&num_page='.ProtectHTML($i).'" class="'.$Class.'">'.ProtectHTML($i).'</a></span>&nbsp;&nbsp;';
$Class = "";
}
?>
        </td></tr>
      </table></td>
  </tr>
  <?php }//end if($count_page > 1)?>
<!--for pagging -->

<tr>
  <td align="right">
<?php
###################################################################### For Show Files
if(!empty($nameFiles_det2)) { 
?>
      <div style="width: 100%; height:auto; border-bottom:#dbd9cd 1px solid; margin-top: 10px" class="page_title">تحميل ملفات</div>
      <div align="right" style="padding-top: 10px; padding-bottom: 15px"> 
      
<?php
$images = "images/";
$x1=strrpos($nameFiles_det2,".");
if ($x1) $ext=substr($nameFiles_det2,$x1+1);
if (is_file($images.$ext.".gif")) $imgsrc= $images.$ext.".gif"; else $imgsrc=$images."default.icon.gif";
?>
<div style="width: 130px; float:right" dir="rtl"><a href="/photo/<?=$nameFiles_det2;?>" target="_blank" class="auther">
<img border="0" src="<?=$imgsrc?>" /><br /><?php echo $EXTENTION[$ext];?><br />
<?php  $size_name = @filesize("photo/".$nameFiles_det2); 
      echo $size_name = @round($size_name/1024,2);?> كيلو بايت</a></div>


<?php
$x1=strrpos($nameFiles_det3,".");
if ($x1) $ext=substr($nameFiles_det3,$x1+1);
if (is_file($images.$ext.".gif")) $imgsrc= $images.$ext.".gif"; else $imgsrc=$images."default.icon.gif";
?>
<div style="width: 130px; float:right" dir="rtl"><a href="/photo/<?=$nameFiles_det3;?>" target="_blank" class="auther">
<img border="0" src="<?=$imgsrc?>" /><br /><?php echo $EXTENTION[$ext];?><br />
<?php $size_name = @filesize("photo/".$nameFiles_det3);
      echo $size_name = @round($size_name/1024,2);?> كيلو بايت</a></div>
</div>
      <?php
}//end if
###################################################################### For Show Files


 
	if(!empty($nameGallary_link)) {
		echo '<div align="right" style="width: 100%; height:auto; border-bottom:#dbd9cd 1px solid; margin-top: 30px" class="title_fatawa">ألبوم صور</div> ';
		$gallery_id = intval($nameGallary_link);
		include("gallary/GetPhotos.php");
	} 
###################################################################### For Vedio (Flv - Mov)
if(!empty($nameVedio_link)) { 
?>
      <div align="right" style="width: 100%; height:auto; border-bottom:#dbd9cd 1px solid; margin-top: 10px" class="title_fatawa">فيديو مصور</div>
      <div align="center" style="padding-top: 10px"> 
      <iframe name="video_dw" width="470" height="320" frameborder="0" scrolling="no" src="http://www.youtube.com/embed/<?=$nameVedio_link;?>"></iframe>
      </div>
      <?php
}//end if
###################################################################### For Vedio (Flv - Mov)

###################################################################### For Googel Map 
if(!empty($latitude) && !empty($longitude)) { 
?>
      <div align="right" style="width: 100%; height:auto; border-bottom:#dbd9cd 1px solid; margin-top: 20px" class="title_fatawa">خريطة غوغل</div>
      <div align="center" style="padding-top: 10px"> 
		<script type="text/javascript">
        $(window).load(function(){
        $("#map2").gMap({ 
            markers: [{ 
                latitude:<?php echo $latitude; ?>, 
                longitude:<?php echo $longitude; ?>}],
            maptype: google.maps.MapTypeId.TERRAIN,
            zoom: 14
            });								
        });
        </script>
		<div id="map2" class="map frame_box" style="width: 470px; height: 320px; border: 1px solid #ccc; overflow: hidden;text-align:center"> </div>
      </div>
      <?php
}//end if
###################################################################### For For Googel Map

###################################################################### For Tags 
if ( !empty($Tags))  {
 
	$ArrTags = explode(",",$Tags);
	foreach ($ArrTags as $tag) {
	$rule[] = "tags like '%".$tag."%'";
	}
	$conditional = " id != '".intval($Id)."' AND appear='1' AND (".@implode(" or ",$rule).")";
	$Query = mysql_query("SELECT DISTINCT * FROM categories_details WHERE  $conditional order by det_date limit 0,5") or die(mysql_error());
	$total_Query = mysql_num_rows($Query);
	
	if($total_Query > 0) {

?>
      <div class="Tags_Title"> <b>مقالات مرتبطة</b> &nbsp; <img src="images/echara.png" align="absmiddle" /></div>
      <div class="Tags_Details">
    <div class="Tags_Words">
	<?php 
	while($row_company = mysql_fetch_array($Query)) {
			echo '<div class="Tags_Titels"><h2> <img src="images/book_date.png" align="absmiddle" /> &nbsp; <a href="?page=Details&category_id='.ProtectHTML($row_company["p_id"]).'&amp;id='.ProtectHTML($row_company["id"]).'">'.$row_company["title[$lang]"].'</a> </h2></div>';
	}//end while
	mysql_free_res($query_company);?>
	</div>
      </div>
      <?php
}//end if ?>

    
    <div class="Tags_Title" style="margin-top: 10px"><b> (Tags) الوسوم</b> &nbsp; <img src="images/echara.png" align="absmiddle" /></div>
    <div class="Tags_Details">
    <div class="Tags_Words">
	
	<?php 
	$ArrTags = str_replace("^", "", $Tags); 
	$Query = mysql_query("select distinct * from tags where id in (".$ArrTags.")") or die(mysql_error());
	$total_Query = mysql_num_rows($Query);
		while($row_company = mysql_fetch_array($Query)) {
			 echo '<a href="?page=Tags&id='.$row_company["id"].'">'.$row_company["tag"].'</a> , ';
		}//end while
		mysql_free_res($query_company);
	
	?></div></div>

<?php }//end if
###################################################################### For Tags

mysql_free_res($query_company);
?>
    </td>
  </tr>


    <?php
######################################################################################## for show comments
$Blk_Cache = 'Comments_'.intval($id); // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    // Show file from cache if still valid
    if (file_exists($cachefile) && (time() - $cachetime < $cachefile_created) && $Cahing==1) {
        ob_start();
         @readfile($cachefile);
        ob_end_flush();
    }
	else {
    // If we're still here, we need to generate a cache file
    ob_start();
	
	
$num_page1 = 0;
if(isset($_GET['num_page1']) && $_GET['num_page1']!=""){
	$num_page1 = $_GET['num_page1'];
	$num_page1 = ProtectHTML($num_page1);
}


$length_rec=50;
$start_rec=$length_rec * $num_page1;

$query_prod = sprintf("SELECT * 
FROM add_comment
WHERE id_rel = '%d' And appear= '%d' order by id desc ",ProtectHTML($id),1);
$query_limit_prod = sprintf("%s LIMIT %d, %d",$query_prod,$start_rec,$length_rec);
$query_show_comment = mysql_query($query_limit_prod) or die(mysql_error());
$total_show_comment = mysql_num_rows($query_show_comment);


 if($total_show_comment > 0) {?>
  <tr>
    <td  align="left" valign="top" ><br />
      <div align="center" style="width: 100%; height:auto">

<div class="news_block_title address" style="width: 98%; margin-bottom: 10px;"><a name="com" id="com"></a>&nbsp;<?=$frmad['Comments'];?></div>

<?php while ($row_show_comment = mysql_fetch_assoc($query_show_comment)) {
		/*$IpUser = $row_show_comment["ip_user"];
		$ip_decimal =  ip2long($IpUser);
		$ip_decimal =  sprintf("%u",$ip_decimal);
		
		$query_country = sprintf("SELECT * FROM ips_countries  WHERE %s >= Beginning_IP_Number  AND %s <= Ending_IP_Number", $ip_decimal,$ip_decimal);
		$row_country = mysql_query($query_country) or die(mysql_error());
		
		$total_country = mysql_num_rows($row_country);
		$Row_country = mysql_fetch_array($row_country);*/
	 ?>
<table width="99%" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr>
    <td height="28" align="<?=$_right;?>" valign="middle" bgcolor="#ff7101" class="title_comment">&nbsp;&nbsp;<?=ProtectHTML($row_show_comment["send_date"]);?></td>
    <td height="28" align="<?=$_left;?>" valign="middle" bgcolor="#ff7101" class="title_comment">&nbsp;&nbsp;<?=ProtectHTML($row_show_comment["title"]);?></td>
  </tr>
  <tr>
    <td colspan="2" class="comment_req"><?=stripslashes($row_show_comment["details"]);?></td>
  </tr>
  <tr>
    <td align="<?=$_right;?>" dir="<?=$dir;?>" style="padding-bottom: 15px"><?=ProtectHTML($row_show_comment["name"]);?></td>
    <td>&nbsp;</td>
  </tr>
</table>
<?php }//end while?>

</div>

<!--for pagging -->
<?php if($total_rows_new > $length_rec) { ?>
<div align="center" dir="<?=$dir;?>" style="width: 98%; height:5px">
<table border="0" cellpadding="1" cellspacing="1" width="1%" height="1" align="right">
<tr nowrap="nowrap" align="center">
<tr>
                <?php 
$pages='<td><div align="center" style="background-color:#d2d2d2; width:15px; height: 18px"><a href="?page=Details&category_id='.$category_id.'&id='.$id.'&num_page1='.$index.'#com" class="num_page">1</a></div></td>';
$total = $total_rows_new - $length_rec;
$index= 1;
$Cout_Page=0;
while($total > 0){
$i = $index+1;
$pages .= '<td align="center"><div align="center" style="background-color:#d2d2d2; width:15px; height: 18px"><a href="?page=Details&category_id='.$category_id.'&id='.$id.'&num_page1='.$index.'#com" class="num_page"> '.$i.' </a></div></td>';
$index++;
$total =$total - $length_rec;

if($Cout_Page==20) {$pages .= "</tr><tr>"; $Cout_Page=0;}
$Cout_Page++;
}
echo $pages;
?>
</tr>
</table>
<br>
</div>
<?php }//end if
mysql_free_res($row_total);
mysql_free_res($query_show_comment);
?>
<!--for pagging --></td>
  </tr>
  <?php }//end if($total_show_comment > 0)
  
include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing  
######################################################################################## for show comments


///////////////////////////////////////////////////////////////////////////
 if($_GET["page"]=="Details" && $allow_comment=="1") {?>
  <tr>
    <td  align="center" valign="bottom" style="padding-top: 10px"><form name="form_comment" method="post" action="?page=Details&category_id=<?=intval($category_id);?>&id=<?=intval($id);?>&lang=<?=$lang;?>#comment">
        <br />
        
		<div class="news_block_title address" style="width: 98%; margin-bottom: 10px;"><a name="comment" id="comment"></a>
              <?=$frmad['Comment'];?></div>
		<table width="95%"  border="0" align="center" cellpadding="5" cellspacing="5" >
          <tr>
            <td colspan="2" align="<?=$_left;?>"><input name="name_comment" type="text" class="inputform" id="name_comment" size="20" value="<?=$_POST["name_comment"];?>"/></td>
            <td height="30" align="<?=$_left;?>" nowrap="nowrap" class="form" dir="<?=$dir;?>" ><?=$frmad['Fullname_form'];?>
              : <span class="msg">*</span></td>
          </tr>
          <tr>
            <td colspan="2" align="<?=$_left;?>"><input name="country_comment" type="text" class="inputform" id="country_comment" size="20" value="<?=$_POST["country_comment"];?>"/></td>
            <td height="30" align="<?=$_left;?>" nowrap="nowrap" class="form" dir="<?=$dir;?>"><?=$frmad['Country_form'];?>
              : </td>
          </tr>
          <tr>
            <td colspan="2" align="<?=$_left;?>"><input name="title_comment" type="text" class="inputform" id="title_comment" size="20" value="<?=$_POST["title_comment"];?>"/></td>
            <td height="30" align="<?=$_left;?>" nowrap="nowrap" class="form" dir="<?=$dir;?>"><?=$frmad['Comment_title'];?>
              :<span class="msg"> *</span></td>
          </tr>
          <tr>
            <td colspan="2" align="<?=$_left;?>"><textarea name="details_comment" cols="10" rows="7" class="textarea" id="details_comment"><?=$_POST["details_comment"];?></textarea></td>
            <td height="30" align="<?=$_left;?>" valign="top" nowrap="nowrap" class="form" dir="<?=$dir;?>"><?=$frmad['comment'];?>
              : <span class="msg">*</span></td>
          </tr>
          <tr>
            <td colspan="2" align="<?=$_left;?>"><input name="txtNumber" type="text"  class="inputform" id="txtNumber" size="30" style="direction:ltr; width: 189px; height: 17px" align="absmiddle" /> &nbsp; <img src="class/img.php" align="right" /></td>
            <td height="30" align="<?=$_left;?>" valign="top" nowrap="nowrap" class="form" dir="<?=$dir;?>"><?=$frmad['Number_form'];?>
              :<span class="msg"> *</span></td>
          </tr>
          <tr>
            <td width="72%" align="right" valign="top" >&nbsp;</td>
            <td width="1%" align="right" valign="top" nowrap style="padding-top: 8px"><input name="Form_Sid" type="hidden" id="Form_Sid" value="<?=$_SESSION['Sid']?>" />
              <input name="form_add_comment" type="hidden" id="form_add_comment" value="add_comment">
              <input name="id_rel" type="hidden" id="id_rel" value="<?=ProtectHTML(intval($id));?>">
              <input name="P_id" type="hidden" id="P_id" value="<?=ProtectHTML(intval($row_company["p_id"]));?>" />
              <input name="Submit" type="submit" class="StandardBtn SubmitBtn" value="<?=$frmad['Send'];?>" />
              <br />
              <br /></td>
            <td width="13%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="top" class="msg">
                <?=ProtectHTML($msg_comm);?></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <?php }//end if($page=="Details")
////////////////////////////////////////////////////////////////////
?>
</table>
</div>
</div>
