<div class="ClearAll"></div>
<?php include("Vedio/index.php");?>

<?php include("gallary/SlideAlbum.php");?>  
<div id="footer">
    <div class="part-1">
        <a href="?"><img src="images/logo_fotter.png" border="0" /></a><br />

        <div class="connect"><a href="https://twitter.com/alelam1" target="_blank"><img src="images/social1.png"/></a></div>
        <div class="connect"><a href="https://www.facebook.com/al.elam.arabic" target="_blank"><img src="images/social2.png"/></a></div>
        <div class="connect"><a href="?page=Rss" target="_blank"><img src="images/social3.png"/></a></div>
        <div class="connect"><a href="https://www.youtube.com/channel/UCwLE-tmLZCKwn69DvaSb-5Q" target="_blank"><img src="images/social4.png"/></a></div>
        <br>
        <div class="designed">
    <p>Copyright © All rights reserved<br/>www.al-elam.com<br><br />
     <a href="http://www.al-elam.com" target="_blank" title="" style="text-decoration:none;" class="tennet">Directorate of Electronic Information<font color="#be1522"></font></a></p>
    </div>
    </div>

<?php
$Blk_Cache = 'Buttoms_Fotter'; // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    // Show file from cache if still valid
    if (file_exists($cachefile) && $Cahing==1) {
        ob_start(); //ob_start('ob_gzhandler');
         @readfile($cachefile);
        ob_end_flush();
    }
  else {
    ob_start();

     include("menu_top/links_fotter.php");
   
include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing
   ?>
     
    <br>
</div>