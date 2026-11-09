<?php require_once('include.php');?>
<link href="css/<?=$lang;?>style.css" rel="stylesheet" type="text/css">
<?php
$where = sprintf(" WHERE p_id='%s' ",ProtectHTML(intval($category_id)));
$query_company = $config_cat->select_db("categories_details",$where);
$totalRows_prod = mysql_num_rows($query_company);


include("track_category.php");?><br>


<div style="width:95%; float:<?=$_left;?>; padding-<?=$_left;?>: 15px" align="center">
  <?php
while ($row_company = mysql_fetch_array($query_company)) {
	?>
  <div style="width:100%" align="justify" dir="<?=$dir?>" class="font_text">
    <?=$row_company["full_text[$lang]"];;?>
  </div>

  <?php 
}//end while 

mysql_free_res($query_company);
?>

</div>