
<div id="header">

<div id="baner">
  <div id="logo">
 
    <a href="?"><img src="images/logo_1.png" border="0" /></a>
    
  </div> 
  <!--<div class="logo_left"><a href="?"><img src="images/logo_2.png" border="0" /></a></div>-->

    
  <div id="search"> 
  <div>
    <?php include("includes/search.php");

    $Arabic->setMode(2);
    GetLastUpdate();
	date_default_timezone_set("Asia/Damascus");

    $LastDateUpdate = $Arabic->date('l dS F Y ', $LastUpdate);
    ?>
         <div class="LastUpdate">آخر تحديث  : <?=$LastDateUpdate;?> &nbsp; الساعة <?=date('H:i:s', $LastUpdate);?></div>
         <div class="slogen_header">موقع سياسي إقتصادي إجتماعي شامل</div>
  </div> </div>  
</div>

<?php
$Blk_Cache = 'Buttoms_Top'; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    if (file_exists($cachefile) && $Cahing==1) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
  else {
    ob_start();
?>
  <div id="menu">
    <?php include("menu_top/menu.php");?>
  </div>
<?php /*?>  <script> 
$(document).ready(function(){
  $("#flip_1").click(function(){
    $("#panel_1").slideToggle("slow");
  });
});
</script>
<div class="HotNewsBird">
     <div class="score"><?php echo Get_Num_News_uptodate();?></div>
     <div class="birdy"><img src="images/dicky.png"/></div>
     
     <div id="flip_1"></div>
        <div id="panel_1">
            <?php include("News_ThisMoment/index.php");?>
        </div>
</div><?php */?>
<?php
include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing

$Blk_Cache = 'HotNews'; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    if (file_exists($cachefile) && $Cahing==1) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
  else {
    ob_start();
?>
  <div id="breaking_news">
      <?php include("NewsBar/hotnews_another_effect.php");?>
  </div>
<?php
include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing



$Blk_Cache = 'Header'; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    if (file_exists($cachefile) && $Cahing==1) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
  else {
    ob_start();
?>
  <div id="manchet">
    <?php include("SlideHeader/index.php");?>
  </div>
<?php
include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing
?>


</div>
