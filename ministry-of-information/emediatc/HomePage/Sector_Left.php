<?php
$Blk_Cache = 'Main'; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    if (file_exists($cachefile) && $Cahing==1) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
	else {
    ob_start();
?>

<div id="slidshow">
	<?php include("mainnews/slide_news.php");?>
</div>


<?php rand_paner("other","middel","685","60");?>

<div id="block">
    <div class="right">
        <?php include("HomePage/main_sub_news.php");?>
    </div>
    <div class="left">
        <?php include("HomePage/Tabs1/MainTabs.php");?>
    </div>
	<div class="ClearAll"></div>
</div>

<?php rand_paner("other","midde2","685","60");?>

<?php /*?><div id="advert">
   <?php include("HomePage/Tabs2/MainTabs.php");?>
</div><?php */?>

<?php rand_paner("other","midde3","685","60");?>

<div id="block">
    <div class="news_right">
         <?php include("HomePage/main_block_1.php");?>
    </div>
    <div class="block_left">
        <?php include("Sites/FriendlySites.php");?>
    </div>
    <div class="block_left">
        <?php include("Sites/FriendlySites_Logos.php");?>
    </div>
    <div class="ClearAll"></div>
</div>

<?php rand_paner("other","midde4","685","60");

include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing
?>

<?php /*?><div id="videos"><?php include("Vedio/index.php");?></div><?php */?>

<div class="ClearAll"></div>