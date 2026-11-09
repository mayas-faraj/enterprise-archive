<?php
session_start();
$timezone = "Asia/Damascus";
if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone);
define(MYPATH,"");
require_once(MYPATH.'connections/fpack.php'); 
require_once(MYPATH."class/config_transaction.php");
$params['conn']=$fpack;
$config_cat = new config_catalog($params);
require_once(MYPATH."class/function.php");
$Cahing = Get_Value("Cashing");
 ################## For Arabic Date
	//error_reporting(E_STRICT);
    $time_start = microtime(true);
    date_default_timezone_set('UTC');
    $time = time();
    include('js/Class_Arabicdate/Arabic.php');
    $Arabic = new Arabic('ArDate');
	$Arabic->setMode(1);
	$Hij = $Arabic->date('l dS F Y', $time);
	$Arabic->setMode(3);
	$Mil = $Arabic->date('dS F Y', $time);
 ################## For Arabic Date
 
foreach ($_GET as $key=>$value) $_GET[$key]= ProtectHTML($value);
//foreach ($_POST as $key=>$value) $_POST[$key]= ProtectHTML($value);
//foreach ($_POST as $key=>$value) $_POST[$key]= ProtectHTML($value);
foreach ($_COOKIE as $key=>$value) 				$_COOKIE[$key]= ProtectHTML($value);	
foreach ($_GET as $key=>$value) 				$_GET[$key]= ProtectHTML($value);
//foreach ($HTTP_COOKIE_VARS as $key=>$value) 	$HTTP_COOKIE_VARS[$key]= ProtectHTML($value);
//foreach ($HTTP_SESSION_VARS as $key=>$value) 	$HTTP_SESSION_VARS[$key]= ProtectHTML($value);
foreach ($_SESSION as $key=>$value) 			$_SESSION[$key]= ProtectHTML($value);

////////////////////////////////////////////////////////
$Day_Today = date("Y-m-d");
//include_once(MYPATH."lang.php");  // ايقافها لتخفيق الضغط على السيرفر وتثبيت اللغة 
$lang="ar"; 
include_once(MYPATH."lang/words.php");
require_once(MYPATH."class/send_form.php");
ob_clean();

$lang = ProtectHTML($lang);

$dir="rtl";

if ($dir=='rtl') {
   $_left="right";
   $_right="left";
   $_just = "justify";
} else {
   $_left="left";
   $_right="right";
   $_just = "left";   
}


$dir_2="ltr";

if ($dir_2=='ltr') {
   $_left_2="right";
   $_right_2="left";
} else {
   $_left_2="left";
   $_right_2="right";
}


$other_lang=($lang=="ar")?"en":"ar";
//output_add_rewrite_var('lang', ProtectHTML($lang));
//echo $lang;

$ar_en=$_SERVER['QUERY_STRING'];

function GRP () {

$the_char = array("1","2","3","4","5","6","7","8","9","0");

$max_elements = count($the_char) - 1;

srand((double)microtime()*1000000);
$c1 = $the_char[rand(0,$max_elements)];
$c2 = $the_char[rand(0,$max_elements)];
$c3 = $the_char[rand(0,$max_elements)];
$c4 = $the_char[rand(0,$max_elements)];
$c5 = $the_char[rand(0,$max_elements)];

$pass= "$c1$c2$c3$c4$c5";

return $pass; }

if(!isset($_COOKIE['session'])) { $ses= GRP (); SETCOOKIE("session",$ses,Time()+1440000); }

//////////////////////////////////////////////

$category_id = "0";
if (isset($_GET['category_id']) && ($_GET['category_id']!= "")) {
  $category_id = (get_magic_quotes_gpc()) ? $_GET['category_id'] : addslashes($_GET['category_id']);
  $category_id = ProtectHTML(intval($category_id));
}
if (isset($_POST['category_id']) && ($_POST['category_id']!= "")) {
  $category_id = (get_magic_quotes_gpc()) ? $_POST['category_id'] : addslashes($_POST['category_id']);
  $category_id = ProtectHTML(intval($category_id));
}

$select_page = "0";
if (isset($_GET['select_page']) && ($_GET['select_page']!= "")) {
  $category_id = (get_magic_quotes_gpc()) ? $_GET['select_page'] : addslashes($_GET['select_page']);
  $category_id = ProtectHTML(intval($category_id));
}

$CatId = "0";
if (isset($_GET['CatId']) && ($_GET['CatId']!= "")) {
  $CatId = (get_magic_quotes_gpc()) ? $_GET['CatId'] : addslashes($_GET['CatId']);
  $CatId = ProtectHTML(intval($CatId));
}

$page = "";
if (isset($_GET['page']) && ($_GET['page']!= "")) {
  $page = (get_magic_quotes_gpc()) ? $_GET['page'] : addslashes($_GET['page']);
  $page = ProtectHTML($page);
}

$gallery_id = "0";
if (isset($_GET['gallery_id']) && ($_GET['gallery_id']!= "")) {
  $gallery_id = (get_magic_quotes_gpc()) ? $_GET['gallery_id'] : addslashes($_GET['gallery_id']);
  $gallery_id = ProtectHTML(intval($gallery_id));
}

$num_page = 1;
if(isset($_GET['num_page']) && $_GET['num_page']!=""){
  $num_page = (get_magic_quotes_gpc()) ? $_GET['num_page'] : addslashes($_GET['num_page']);	
  $num_page = ProtectHTML(intval($_GET['num_page']));
}

$id=0;
if (isset($_GET['id']) && ($_GET['id']!= "")) {
   $id = (get_magic_quotes_gpc()) ? $_GET['id'] : addslashes($_GET['id']);
   $id = ProtectHTML(intval($id));
}

$pager=1;
if (isset($_GET['pager']) && ($_GET['pager']!= "")) {
   $pager = (get_magic_quotes_gpc()) ? $_GET['pager'] : addslashes($_GET['pager']);
   $pager = ProtectHTML(intval($pager));
}

#######################################################
function print_data($key,$txt) {
 if(!empty($key)) {
	$txt_keyword = ereg_replace($key, "<font color='#ff0000' style='color:#ff0000 ; background-color: #d5d5d5'>".$key."</font>", $txt);
	print $txt_keyword; }
 else { print $txt; }
}
///////////////////////////////////////////////////////
$table = "categories_titles";
$hold_name = array();
$items = "categories_details";

    global $category;
        //$parent =0;
 function menu_show($parent,$level = -1){
        global $hold_name, $table, $lang;
        
        $level++;
        $query = "SELECT * FROM $table WHERE category_id = $parent ";
    
        $sql = mysql_query($query);
        while($row = mysql_fetch_assoc($sql))
        {
    	     $hold_name[] = array(ProtectHTML($row['category_id']),ProtectHTML($row['p_id']), ProtectHTML($row["category_name[$lang]"]));
			 if ($row['p_id'] != 0) {
			 menu_show(ProtectHTML($row['p_id']),$level); }
        }// End While
		mysql_free_res($sql);
        return $hold_name;
  }
///////////////////////////////////////////////////////////
        $Options = "";
function view_data($hold_name) {
		if(is_array($hold_name))
        {
          sort($hold_name);
		  for($i = 0; $i < sizeof($hold_name); $i++)
          {
            $TextValue = $hold_name[$i][0];
            $IdValue = $hold_name[$i][1];
			$Text = $hold_name[$i][2];
			  if (is_array($hold_name)) {
			      if($_GET["page"] !='search') {$start_link ="<a href='?page=category&category_id=".ProtectHTML($TextValue)."' class='track'>"; $end_link = "</a>";} else {$start_link =""; $end_link ="";}
		         $Options .= "<font color='#b92120' size='2'> &raquo; </font>".$start_link . $Text . $end_link;
              } 
		  }
	    }
mysql_free_res($sql);		
return $Options;
}

//////////////////////////////////////////////////////
        $Options = "";
function view_data_in_title($hold_name) {
		if(is_array($hold_name))
        {
          sort($hold_name);
		  for($i = 0; $i < sizeof($hold_name); $i++)
          {
            $TextValue = $hold_name[$i][0];
            $IdValue = $hold_name[$i][1];
			$Text = $hold_name[$i][2];
			  if (is_array($hold_name)) {
			       
		         $Options .= " &raquo; ". $Text;
              } 
		  }
	    }
mysql_free_res($sql);		
return $Options;
}

//////////////////////////////////////////////////////   

 function menu_show_page_search($parent){
        global $lang;
        
        
        $query2 = "SELECT * FROM gallary_titles WHERE category_id = $parent ";
        $sql2  = mysql_query($query2);
        if ($parent != "") $total = mysql_num_rows($sql2);
        if ($total > 0) {
			while($row_det = mysql_fetch_assoc($sql2))
			{
				 echo'<div class="name_category">'.ProtectHTML($row_det["category_name[$lang]"]).'</div>';
			}// End While
		}//end if
  
  mysql_free_res($sql2);
  }
  
  
///////////////////////////////////////////////////////////
?> 