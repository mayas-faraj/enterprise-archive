<div class="ContentTeaser">

<?php
$Blk_Cache = 'Page_'.intval($category_id); // Requested page
include("Make_Cache/Begin_Caching_Blk.php"); 
    // Show file from cache if still valid
    if (file_exists($cachefile) && $Cahing==1 && !$_GET["pager"]) {
        ob_start();
         @readfile($cachefile);
        ob_end_flush();
    }
	else {
    // If we're still here, we need to generate a cache file
    ob_start(); 
	
	include("track_category.php");
	
	rand_paner("other","page_cat","620","60");

 include("Make_Cache/End_Caching_Blk.php"); 
}//end chashing



//$WHERE = " p_id='".ProtectHTML(intval($category_id))."'  AND appear='1' ";
$WHERE = " p_id='".ProtectHTML(intval($category_id))."' AND page_mainnews != '1' AND appear='1' ";
$ORDER = " order by det_date desc , numeric_title";

$rowsPerPage = "20"; 
$page_num = 1; 

if(isset($pager)) 
{ 
    $page_num = $pager; 
} 

if($page_num == "0") { 
    $page_num = "1"; 
}

$row_total = mysql_query("SELECT count(id) FROM categories_details WHERE ".$WHERE." ".$ORDER." ") or die(mysql_error());
$total = mysql_fetch_array($row_total);
$numrows = $total[0];

$numpages = $numrows/$rowsPerPage;
$numpages = ceil($numpages);


$offset = ($page_num - 1) * $rowsPerPage;

$query_company = mysql_query("SELECT * 
FROM categories_details
WHERE ".$WHERE." ".$ORDER."
LIMIT ".$offset.",".$rowsPerPage."") or die(mysql_error());
$total_show_title = mysql_num_rows($query_company);


while ($row_company = mysql_fetch_array($query_company)) { ?>
 
  
<div class="ContentTeaser_bg">
	<div class="ContentTeaser_border">


 <div align="<?=($lang=="ar")?"justify":$_left;?>" dir="<?=$dir;?>" class="ContentTeaser_inner">
        <div align="center" class="ContentTeaser_inner_img">
        <a href="?page=Details&category_id=<?=ProtectHTML($row_company["p_id"]);?>&amp;id=<?=ProtectHTML($row_company["id"]);?>&lang=<?=$lang;?>">
        <?php 
        $path = "thumb_photo/";
		$namePic = (!empty($row_company["prod_img_1"]))?ProtectHTML($row_company["prod_img_1"]):"logo.jpg";
        $alt_pic = ProtectHTML($row_company["title[$lang]"]);
        $scale = 132;
        $scale_height=92;
		if(!is_file($path.$namePic) || $namePic =="") {
      		$path    = "images/";
      		$namePic = "logo.jpg";  
    	}
        //format_img_height($path,$namePic,$alt_pic,$scale,$scale_height);
        ?>
        <img src="<?=$path.$namePic?>" width="142" height="102" title="<?=$Website_Name.$alt_pic;?>" /></a></div>

    <h3> <a href="?page=Details&category_id=<?=ProtectHTML($row_company["p_id"]);?>&amp;id=<?=ProtectHTML($row_company["id"]);?>&lang=<?=$lang;?>" ><?=stripslashes($row_company["title[$lang]"]);?></a></h3>
    
    <div class="small_text"><?=nl2br(stripslashes($row_company["small_title[$lang]"]));?></div>
    
	<div class="ClearAll"></div>
</div>

    <div align="left" style="padding-left: 5px; padding-bottom: 5px">
		<div class="more">
			<a href="?page=Details&amp;category_id=<?=ProtectHTML($row_company["p_id"]);?>&CatId=<?=intval($CatId);?>&amp;id=<?=ProtectHTML($row_company["id"]);?>&amp;lang=<?=$lang?>" title="<?=$frmad['More'];?>">المزيد</a>
		</div>
		<div class="ClearAll"></div>
	</div>


	</div>
    
</div>  
  <div class="ContentTeaser_bg_shadwo"></div>

  <?php 
 }//end while 
 mysql_free_res($query_company); 
 

 ?>

<!--for pagging-->

<?php
// how many pages we have when using paging? 
$numofpages = ceil($numrows/$rowsPerPage); 

// print the link to access each pager 
$link_url = $_SERVER['QUERY_STRING'];
$self = "?" . $link_url; 

if ($numofpages > '1' ) { 


            $range =10; 
            $range_min = ($range % 2 == 0) ? ($range / 2) - 1 : ($range - 1) / 2; 
            $range_max = ($range % 2 == 0) ? $range_min + 1 : $range_min; 
            $page_min = $page_num- $range_min; 
            $page_max = $page_num+ $range_max; 

            $page_min = ($page_min < 1) ? 1 : $page_min; 
            $page_max = ($page_max < ($page_min + $range - 1)) ? $page_min + $range - 1 : $page_max; 
            if ($page_max > $numofpages) { 
                $page_min = ($page_min > 1) ? $numofpages - $range + 1 : 1; 
                $page_max = $numofpages; 
            } 

            $page_min = ($page_min < 1) ? 1 : $page_min; 

            //$page_content .= '<p class="menuPage">'; 

            if ( ($page_num > ($range - $range_min)) && ($numofpages > $range) ) { 
                $page_pagination .= '<a title="First" href="'.$self.'&pager=1">&lt;</a> '; 
            } 

$BL = "";  $EL="";
if ($page_num != 1){ $BL = '<a title="الصفحة السابقة" href="'.$self.'&pager='.($page_num-1). '">'; $EL = '</a>';}  
$page_pagination .= $BL.' <img src="images/back.gif" width="14" height="13" border="0" title="'.$frmad['back'].'" hspace="10" align="absmiddle">  ' .$EL; 

            for ($i = $page_min;$i <= $page_max;$i++) { 
                if ($i == $page_num) 
                $page_pagination .= '<span class="num"><a href="#" class="selected">'.$i.'</a></span> '; 
                else 
                $page_pagination.= '<span class="num"><a href="'.$self.'&pager='.$i. '">'.$i.'</a></span> '; 
            } 

 $BL = "";  $EL=""; 
if ($page_num < $numofpages){ $BL = '<a title="الصفحة التالية" href="'.$self."&pager=".($page_num + 1).'">'; $EL = '</a>';} 
					$page_pagination.= $BL.' <img src="images/next.gif" width="14" height="13" border="0" title="'.$frmad['next'].'" hspace="10" align="absmiddle"> ' .$EL;


            if (($page_num< ($numofpages - $range_max)) && ($numofpages > $range)) { 
                $page_pagination .= ' <a title="Last" href="?'.$_SERVER['QUERY_STRING'].'&pager='.$numofpages. '"></a> '; 
            } 
            //$pager['PAGINATION'] ='<p id="pagination"><font style="color:#F9084D">'.$page_pagination.'</font></p>'; 
?>        

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 20px">
				<tr>
					<td width="70%" align="center" valign="middle">
						<table border="0" cellpadding="0" cellspacing="5" dir="rtl">
							<tr>
								<td style="padding-top: 6px">
			<?php if ($page_num != 1){ $BL1 = '<a title="الصفحة الأولى" href="'.$self.'&pager=1">'; $EL1 = '</a>';}?>
								<?=$BL1;?><img border="0" src="images/firstpage.gif" width="14" height="13" title="الصفحة الأولى" align="absmiddle"><?=$EL1;?>	
								</td>
								<td><?=$page_pagination;?></td>
								<td style="padding-top: 6px">
			<?php if ($page_num != $numpages){ $BL2 = '<a title="الصفحة الأخيرة" href="'.$self.'&pager='.$numpages.'">'; $EL2 = '</a>';}?>
								<?=$BL2;?><img border="0" src="images/lastpage.gif" width="14" height="13" title="الصفحة الأخيرة"><?=$EL2;?>								
								</td>
							</tr>
						</table>
					</td>
					<td class="paging">صفحة <?=(isset($_GET["pager"]))?intval($_GET["pager"]):1;?> من <?=$numpages;?></td>
				</tr>
				</table>
<br />
<br />


<?php
}//end if more than 1 pager 
 
?>
<!--for pagging-->



</div>