<?php 
if ((isset($_POST["submit"])) && ($_POST["submit"] == "form1")) { 

$tmp = $_POST;
//print_r($tmp);
	
	$Q_insert = mysql_query("insert into video_details ".INSERTARRAYINTO($tmp,"video_details",1)) or die(mysql_error());
    mysql_free_res($Q_insert);
	$no_numeric_id = mysql_insert_id();

	if(!$Q_insert) { $msg = "لم يتم الإضافة"; }
	else           { 
		
		$sel_max_numeric = mysql_query("update video_details set numeric_order = numeric_order+1 where p_id = '".$_POST["p_id"]."' AND id<>'".$no_numeric_id."'");
		
		LastUpdate(time());
		$Blk_Cache_1 = "Video";
		$Blk_Cache_2 = "Vedio".$no_numeric_id;
		$Blk_Cache_3 = "AllVideo";
		include("Make_Cache/empty_Blk_caching.php");
		
		echo "<script>window.location='control.php?addvideo=2'</script>"; 
	}
}//end submit	

//////////////////////////////////////////////
?>

<div align="center" class="a"><?php echo $msg;?></div>
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0"  style="border-width: 0px">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="4" cellspacing="2"  style="border-width: 0px" class="title">
        <!--DWLayoutTable-->
        <form name="form1" method="post" action="control.php?addvideo=2" >
          <tr>
            <td width="82%" height="40" align="right" valign="middle" dir="rtl"><input name="appear" type="checkbox" id="appear" value="1" checked="checked" /></td>
            <td width="18%" height="40" align="right" valign="middle" nowrap dir="rtl">إظهار الفيديو </td>
          </tr>
          <tr>
            <td align="right" valign="top" ><textarea name="embade_video" rows="5" class="input" id="embade_video" style="direction:ltr"></textarea></td>
            <td align="right" valign="top" >رابط  الفيديو Youtube or Facebook</td>
          </tr>
          <tr>
            <td colspan="2" align="center" valign="middle" dir="ltr"><div id="tabs" style="width:95%">
                <ul>
                  <? 
$Frame = 1;
$langqu="SELECT * FROM `languages` Order By `languages`.`id` Asc"; 
$langre=mysql_query($langqu);
while ($langro=mysql_fetch_assoc($langre)) { ?>
                  <li class="li_class"><a href="#tabs-<?=$Frame;?>">
                    <?=$langro['titleen']?>
                    </a></li>
                  <?php 
$Frame++;
}//end while?>
                </ul>
                <?  mysql_data_seek($langre,0);
       $Frame = 1;
		while ($langro=mysql_fetch_assoc($langre)) {
            $ll=$langro['key'];
            ?>
                <div id="tabs-<?=$Frame;?>">
                  <table width="90%" height="116" align="center" cellpadding="5" cellspacing="6" id="table1" class="title">
                    <tr>
                      <td width="84%" height="30" align="right" class="txt"><input name="prod_name[<?=$ll?>]" type="text" class="input" id="prod_name[<?=$ll?>]" value="" size="32" /></td>
                      <td width="16%" align="right" nowrap>: اسم الفيديو </td>
                    </tr>
                    <?php /*?><tr>
<td height="30" align="right" class="txt"><textarea name="brief[<?=$ll?>]" rows="6" class="input" id="brief[<?=$ll?>]" dir="rtl"></textarea></td>
<td align="right" nowrap class="title">: وصف مصغر عن الصورة </td>
</tr><?php */?>
                    <tr>
                      <td height="30" align="right" class="txt"><textarea name="prod_desc[<?=$ll;?>]" id="newfd<?=$Frame;?>" class="input" rows="7"></textarea></td>
                      <td height="30" align="right" nowrap="nowrap" class="txt">: وصف عن الفيديو </td>
                    </tr>

                  </table>
                </div>
                <?php 
$Frame++;
}//end while?>
              </div></td>
          </tr>
          <tr>
            <td  colspan="2" align="right" valign="top"><table border="0" cellpadding="3" cellspacing="3" align="center">
              <tr>
                <td align="center" valign="top" class="b"><?=$prod_img_1;?></td>
              </tr>
              <tr>
                <td align="center" valign="top" class="b"><input type="button" onclick="javascript:setfile1(this,'prod_img_1')" value=".. تحميل صورة الفيديو .." /></td>
              </tr>
              <tr>
                <td align="center" valign="top" ><img src="<?=($prod_img_1=="")?("images/nopic.jpg"):("../thumb_photo/".$prod_img_1)?>" name="img1" id="img1"  style=" overflow:scroll" align="center" />
                  <input type="hidden" id="prod_img_1" name="prod_img_1" value="<?=$prod_img_1;?>" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="63" colspan="2" align="center" dir="rtl"><br>
              &nbsp;
              <input type="submit" name="Submit" value="إضافة" class="button">
              &nbsp;
              <input type="reset" name="Submit2" value="مسح" class="button">
              <input type="hidden" name="submit" value="form1"></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
<br>
<!--

web Developed by : mohanad orfali
Email : phpline@hotmail.com
Mob: +96393878476
-->
