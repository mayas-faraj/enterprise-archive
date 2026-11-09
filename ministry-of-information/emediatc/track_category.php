<?php menu_show(intval($category_id),-1);?>

<div class="Div_Track">
    <div class="data">
       <p> <a href="?" class="track"> <?php echo $frmad['Home'];?> </a> <font class="msg"> &raquo; </font> 
	   <a href="#" class="track"><?=($_GET["page"]=="ShowArc")?" أرشيف ":"";?></a> <?=substr(view_data($hold_name),39);?> </p>
    </div>
    <?php if($Cat_Kind=="1") {?>
    <div class="Archive">
    <a href="?page=ShowArc&amp;category_id=<?=ProtectHTML(intval($category_id));?>"> <img src="images/book_date.png" border="0" align="absmiddle" /> أرشيف <?=stripslashes($Cat_Name);?></a>
    </div>
    <?php }?>
</div>
<div class="ClearAll"></div>