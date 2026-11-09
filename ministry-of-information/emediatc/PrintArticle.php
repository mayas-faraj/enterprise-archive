<?php require_once('include.php'); 

if (isset($_GET["id"]) && !empty($_GET["id"])) 
	{ $ID = ProtectHTML(intval($_GET["id"]));  $Where = "id='".ProtectHTML(intval($ID))."' "; }
elseif(isset($_GET["category_id"]) && !empty($_GET["category_id"])) 
	{ $ID = ProtectHTML(intval($_GET["category_id"])); $Where = "p_id='".ProtectHTML(intval($ID))."' "; }
else 
	{ $Where = "1=0"; echo "<script>windows.location='?lang=ar';</script>"; }


  $query_data=mysql_query("select * from categories_details where ".$Where." ");
  $total_row = mysql_num_rows($query_data);
  while ($row_data = mysql_fetch_assoc($query_data)) {
		
		$ID = ProtectHTML($row_data["id"]);
		$page_name = ProtectHTML($row_data["p_id"]);
		$title    = ProtectHTML($row_data["title[$lang]"]);
		$details = $row_data["full_text[$lang]"];
		$auther = $row_data["auther[$lang]"];
		$picture = ProtectHTML($row_data["prod_img_1"]);
		$det_date = ProtectHTML($row_data["det_date"]);
		}
	 mysql_free_res($query_data);

menu_show(intval($page_name),-1);
///////////////////////////////////////////////////////////////
?>
<html>
<head>
<title>
<?=Get_Value($lang."_Title_Site");?>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/<?=$lang;?>style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 3px;
	margin-right: 0px;
	margin-bottom: 3px;
	background:#FFFFFF;
}
-->
h3 {
	font-size: 11px;
	color: #000000;
	font-weight: normal;
}
table.article {
	font-size: 17px;
	color: #000000;
}
td.tit {
	font-size: 19px;
	color : #000000;
	font-weight: bold;
	text-align: center;
}
td.writer {
	font-size: 17px;
	color: #oooooo;
	font-weight: bold;
	text-align: center;
}
A.trackPage, .trackPage {
	font-size:11pt;
	color:#6e6b5d;
	text-decoration : none;
}
A.trackPage:LINK, A.trackPage:VISITED {
	color:#6e6b5d;
}
A.trackPage:HOVER {
	color:#9c060b;
}
a.trackPage {
	font-size:11pt;
	color:#6e6b5d;
	text-decoration : none;
}
</style>
</head>
<body>

<table width="99%" border="1" align="center" cellpadding="10" bordercolor="#C0C0C0" class="article" style="border-collapse: collapse">
  <tr>
    <td><table id="table1" border="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                  <td><p dir="rtl" align="center"><b>
                      <?=substr(view_data($hold_name),39);?>
                      </b></p></td>
                </tr>
                <tr>
                  <td class="tit"><p align="center" dir="rtl">
                      <?=$title?>
                    </p></td>
                </tr>
                <tr>
                  <td class="writer"><p dir="rtl" class="writer"><span style="font-weight: 400">
                      <?=$auther?></span>
                    </p></td>
                </tr>
              </table></td>
            <td width="150"><p dir="rtl" align="center"> <img border="0" src="images/logo.png" width="150" > </p></td>
          </tr>
          <tr>
            <td colspan="2"><hr color="#a7a39e" size="1"></td>
          </tr>
        </tbody>
      </table>
      <?php 
$path = "photo/";
$namePic = $picture;
$alt_pic = $title;
$scale = 300;		
?>
      <table border="0" align="<?=$_right;?>"  cellpadding="3" cellspacing="0">
        <tr>
          <td  style="padding-right: 8px "><?php format_img($path,$namePic,$alt_pic,$scale);?></td>
        </tr>
      </table>
      <div align="justify" dir="<?=$dir;?>" class="font_text"><?php echo str_replace("#@#"," ",$details); ?></div></td>
  </tr>
  <tr>
    <td><table border="0" width="100%" cellspacing="0" cellpadding="0" class="article">
        <tr>
          <td><font style="font-size: 9pt" face="Verdana"> Copyrights © <span lang="en-us">al-elam</span></font><span lang="en-us"><font face="Verdana" style="font-size: 9pt">.com</font></span></td>
          <td><p dir="rtl"><font face="Tahoma" style="font-size: 9pt">المصدر: &nbsp;
              http://<?=$_SERVER["HTTP_HOST"];?>/?page=show_det&category_id=<?=$page_name;?>&id=<?=$ID;?>
              </font></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<script> window.print();</script>