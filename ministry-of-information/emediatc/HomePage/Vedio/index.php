<?php
$Blk_Cache = "AllVideo"; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    // Show file from cache if still valid
    if (file_exists($cachefile)) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
	else {
    ob_start();
	
?>

<!-- Start Wach Video -->
<script type="text/javascript" src="js/Wach_Video/js/swfobject.js"></script>
<script type="text/javascript" src="js/Wach_Video/js/jqvideobox.js"></script>
<link rel="stylesheet" href="js/Wach_Video/css/<?=$lang;?>jqvideobox.css" type="text/css" />
<!-- End Wach Video -->


<!-- Start Slider -->
<script type="text/javascript" src="js/JqSlidePhoto/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/JqSlidePhoto/<?=$lang;?>skin_video.css" />
<script type="text/javascript" src="js/JqSlidePhoto/jCarousel.js"></script>
<!-- End Slider -->



<?php
$query_company = mysql_query("select * from video_details  WHERE  appear ='1'  order by  id desc limit 0,18 ") or die ("No Select");
    $total = mysql_num_rows($query_company);
	if($total > 0) {
?>

<div class="video_block_name">
    <div class="name">فيديو</div>
    <div class="m"></div>
</div>

<div class="all">
<ul id="mycarouse1" class="jcarousel-skin-tango-1">
			<?php while($row_company = mysql_fetch_assoc($query_company)) { 
			$path = "thumb_photo/";
			$namePic = ProtectHTML($row_company["prod_img_1"]);
			$alt_pic = stripslashes($row_company["prod_name[$lang]"]);
			?>
            <li>
			  
              <a title="<?=$alt_pic;?>" class="vidbox<?=$row_company["id"];?>" href="<?=stripslashes($row_company["embade_video"]);?>">
                <img style="width: 185px; height: 140px;cursor: pointer; border:#7c47a1 1px solid; padding: 1px 1px" src="<?=$path.$namePic?>" onClick="showHint_Vedio('<?=$row_company["id"];?>')" title="<?=$Website_Name.$alt_pic;?>" alt="<?=$Website_Name.$alt_pic;?>">
                <div class="video_title"><?=$alt_pic;?></div>
              </a>
              
	</li>
            
<script>
	$(document).ready(
		function()
		{
			$(".vidbox<?=$row_company["id"];?>").jqvideobox();
		}
	);
</script>
            
    <?php }//end while?>
</ul>
 
</div>      
<?php }//end if 

include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing
?>
