<div class="ContentTeaser">
<div class="ContentTeaser_details">
<?php
/****************************************************************************/
 $the_year = date("Y");// this is the keyword the we want to search  form it.
if (isset($_POST['the_year']) && ($_POST['the_year']!="")) {
 $the_year = (get_magic_quotes_gpc()) ? $_POST['the_year'] : addslashes($_POST['the_year']);
 $the_year = ProtectHTML(intval($the_year));
}//end if
if (isset($_GET['the_year']) && ($_GET['the_year']!="")) {
 $the_year = (get_magic_quotes_gpc()) ? $_GET['the_year'] : addslashes($_GET['the_year']);
 $the_year = ProtectHTML(intval($the_year));
}//end if

$the_month = date("n")-1;// this is the keyword the we want to search  form it.
if (isset($_POST['the_month']) && ($_POST['the_month']!="")) {
 $the_month = (get_magic_quotes_gpc()) ? $_POST['the_month'] : addslashes($_POST['the_month']);
 $the_month = ProtectHTML($the_month);
}//end if
if (isset($_GET['the_month']) && ($_GET['the_month']!="")) {
 $the_month = (get_magic_quotes_gpc()) ? $_GET['the_month'] : addslashes($_GET['the_month']);
 $the_month = ProtectHTML($the_month);
}//end if



	
  	$select_date = $the_year."-".$the_month."-";
	
	
	// how many rows to show per pager 
	$rowsPerPage = "30"; 
	// by default we show first pager 
	$page_num = 1; 
	// if $_GET['pager'] defined, use it as pager number 
	if(isset($pager)) 
	{ 
		$page_num = $pager; 
	} 
	
	if($page_num == "0") { 
		$page_num = "1"; 
	}
	
	
	$WHERE = " p_id='".intval($category_id)."' AND  det_date like '$select_date%' ";
	//echo $WHERE;
	$row_total = mysql_query("SELECT count(id) FROM archive_news where ".$WHERE." order by det_date desc")or die(mysql_error());
	$total = mysql_fetch_array($row_total);
	$numrows = $total[0];
	$offset = ($page_num - 1) * $rowsPerPage;
	
	
	$query_company = mysql_query("select * from archive_news
	WHERE ".$WHERE." order by det_date desc  
	LIMIT ".$offset.",".$rowsPerPage."") or die(mysql_error());
	$total_row = mysql_num_rows($query_company);

/****************************************************************************/
include("track_category.php");
?>



<div align="center" style="width: 100%; height:auto; margin-bottom: 20px; margin-top: 10px">
  <form name="form_archive" method="post" action="?page=ShowArc&category_id=<?=ProtectHTML($category_id);?>&submit=1">
    
    <div align="center" style="width:100%; height:30px">
<div align="center" style="width: 90%; height:auto" class="form_name">
	<div align="right" style="float:right; padding-right: 5px">
	  <select name="the_year" id="the_year" class="suggest">
		<?php for($i="2009";$i<=date("Y");$i++) { ?>
		  <option value="<?=$i;?>" <?php if($the_year==$i){echo "selected";}?> ><?=$i;?></option>
	   <?php }?>
	  </select>    
	  السنة </div>
	<div align="right" style="float:right; padding-right: 20px">
    <select name="the_month" id="the_month" class="suggest">
        <?php 
            /*$Q_set = "SELECT * FROM issues_monthes order by issue_month_id ";
            $R_set = mysql_query($Q_set)or die (mysql_error());
            while($Row = mysql_fetch_assoc($R_set)) {?>
        <option value="<?=$Row["issue_month_id"];?>" <?=($the_month==$Row["issue_month_id"])?"selected":"";?>>
        <?=$Row["issue_month"];?>
        </option>
        <?php }//end while*/ ?>
                <option value="01" <?=($the_month==01)?"selected":"";?>>كانون الثاني</option>
                <option value="02" <?=($the_month==02)?"selected":"";?>>شباط </option>
                <option value="03" <?=($the_month==03)?"selected":"";?>>آذار</option>
                <option value="04" <?=($the_month==04)?"selected":"";?>>نيسان</option>
                <option value="05" <?=($the_month==05)?"selected":"";?>>أيار</option>
                <option value="06" <?=($the_month==06)?"selected":"";?>>حزيران</option>
                <option value="07" <?=($the_month==07)?"selected":"";?>>تموز</option>
                <option value="08" <?=($the_month==08)?"selected":"";?>>آب</option>
                <option value="09" <?=($the_month==09)?"selected":"";?>>أيلول</option>
                <option value="10" <?=($the_month==10)?"selected":"";?>>تشرين الأول</option>
                <option value="11" <?=($the_month==11)?"selected":"";?>>تشرين الثاني</option>
                <option value="12" <?=($the_month==12)?"selected":"";?>>كانون الأول</option>
      </select>
      الشهر </div>
	<div align="right" style="float:right; padding-right: 20px">
    <input type="image" src="images/search.png" width="24" height="25" value=" " name="Submit" title="جلب" />
	</div>
</div>
</div>
    
  </form>
</div>

<?php
///////////////////////////////////////////////////////////////////////////////////to show results

 if ($total_row == 0) { print "<br><div align='center' class='search_result'><b>لا يوجد سجلات بهذا التاريخ</b></div><br>"; }
 else {
 

 while ($row_company = mysql_fetch_array($query_company)) {
 	$news_id = ProtectHTML(intval($row_company["old_id"])); ?>
	<div class="ContentTeaser_bg">
		<div class="ContentTeaser_border">
	
	
	 <div align="<?=($lang=="ar")?"justify":$_left;?>" dir="<?=$dir;?>" class="ContentTeaser_inner">
			<div align="center" class="ContentTeaser_inner_img">
			<a href="?page=Details&category_id=<?=ProtectHTML($row_company["p_id"]);?>&amp;id=<?=ProtectHTML($news_id);?>&lang=<?=$lang;?>">
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
	
		<h3> <a href="?page=Details&category_id=<?=ProtectHTML($row_company["p_id"]);?>&amp;id=<?=ProtectHTML($news_id);?>&lang=<?=$lang;?>" ><?=$row_company["title[$lang]"];?></a></h3>
		
		<div align="<?=($lang=="ar")?"justify":$_left;?>" dir="<?=$dir;?>"><?=nl2br(stripslashes($row_company["small_title[$lang]"]));?></div>
		
		<div class="ClearAll"></div>
	</div>
	
		<div align="left" style="padding-left: 5px; padding-bottom: 5px">
			<div class="more">
				<a href="?page=Details&amp;category_id=<?=ProtectHTML($row_company["p_id"]);?>&amp;id=<?=ProtectHTML($news_id);?>&amp;lang=<?=$lang?>" title="<?=$frmad['More'];?>">المزيد</a>
			</div>
			<div class="ClearAll"></div>
		</div>
	
	
		</div>
		
	</div>  
 	<div class="ContentTeaser_bg_shadwo"></div>
<?php 
  }//end while
mysql_free_res($query_company);
 

    }//end else (mysql_num_rows($total_row)> 0)
///////////////////////////////////////////////////////////////////////////////////to show results
mysql_free_res($row_total);
?>

<!--for pagging-->

<?php
// how many pages we have when using paging? 
$numofpages = ceil($numrows/$rowsPerPage); 
// print the link to access each pager 
$self = "?page=ShowArc&category_id=".intval($category_id)."&the_year=".intval($the_year)."&the_month=".$the_month;
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
</div>
