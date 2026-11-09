<div class="Div_Track">
    <div class="data">
      <div style="padding:4 10 0 2px"><div style="padding-top: 2px"><?=$frmad['SiteMap'];?></div></div>
    </div>
</div>
<br />

<div align="<?=$_left;?>" style="width: 95%; padding-top: 20px; float:<?=$_right;?>" class="txt_cat" dir="<?=$dir;?>">
  <?php
  $res_pag="select * from categories_titles where p_id='0' AND appear='1' AND `category_name[$lang]` <> '' order by numeric_cat";
  $query_pag=mysql_query($res_pag);
  while($row_pag=mysql_fetch_array($query_pag)){
  	 $name_cat = ProtectHTML($row_pag["category_name[$lang]"]);
	 $id_cat = ProtectHTML($row_pag["category_id"]);
	 $url_link = ProtectHTML($row_pag["url_link"]);
	 $target = ProtectHTML($row_pag["target"]);
	 
	 
if(empty($url_link) || $url_link == "http://www." ) { 
$url_link = "?page=category&category_id=".ProtectHTML(intval($id_cat))."&lang=".$lang; 
$target="_self";  }
else {  
	   if($target==0) { $target="_self";      $url_link = $url_link."&lang=".$lang;  } 
	   elseif($target==1) { $target="_blank"; $url_link = $url_link; } 
}

	$Link_Cat_B = '<a href="'.$url_link.'" target="'.$target.'" class="txt_cat2" dir="'.$dir.'">';
	$Link_Cat_E = '</a>';

	?>
  <div align="<?=$_left;?>" id="ltr">
    <div align="<?=$_left;?>" style="padding: 3 3 3 3px; margin-top: 3px"><img src="images/map.gif" width="9" height="10" border="0" align="absmiddle"/>&nbsp;&nbsp;<?=$Link_Cat_B.$name_cat.$Link_Cat_E;?>&nbsp;&nbsp; </div>
  </div>
  


  <?php
  $res_cat="select * from categories_titles where p_id='".$id_cat."'  AND appear='1' AND `category_name[$lang]` <> '' order by numeric_cat";
  $query_cat=mysql_query($res_cat);
  $total = mysql_num_rows($query_cat);
?>
  <DIV style="padding-<?=$_left;?>: 10px">
    <?php if($total > 0) { ?>
    
    <UL dir="<?=$dir;?>">
      <?
  while($row_cat=mysql_fetch_array($query_cat)){
     $name_cat = ProtectHTML($row_cat["category_name[$lang]"]);
	 $id_cat = ProtectHTML($row_cat["category_id"]);
	 $url_link = ProtectHTML($row_cat["url_link"]);
	 $target = ProtectHTML($row_cat["target"]);
	 
if(empty($url_link) || $url_link == "http://www." ) { 
$url_link = "?page=category&category_id=".ProtectHTML($id_cat)."&lang=".$lang; 
$target="_self";  }
else {  
	   if($target==0) { $target="_self";      $url_link = $url_link."&lang=".$lang; } 
	   elseif($target==1) { $target="_blank"; $url_link = $url_link; } 
}
  ?>
      <LI style="list-style:none; padding-bottom: 5px"><img src="images/map2.gif" width="4" height="4" border="0" align="absmiddle"/> <a href="<?=$url_link?>" target="<?=$target?>" class="txt_cat2"><?=$row_cat["category_name[$lang]"];?></A> </LI>
      <?
	}//end while
	
?>
    </UL>

    <?php } //if($total > 0)?>
  </DIV>
  <?php 
	}
?>

</div>
