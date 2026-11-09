<?
    $lang='';
    if (isset($_GET['lang']) && $_GET['lang']!='') {
       $lang=$_GET['lang'];
    } /*elseif (isset($_COOKIE['lang']) && $_COOKIE['lang']!='') {
       $lang=$_COOKIE['lang'];
    }*/
    $langquery="SELECT * FROM `languages` WHERE `key`='$lang' LIMIT 1";

    $langresult=mysql_query($langquery);
    if (mysql_num_rows($langresult)>0) {
		$langrow=mysql_fetch_assoc($langresult);
        return;
    }
    $langquery="SELECT * FROM `languages` WHERE `default`='1'";
    $langresult=mysql_query($langquery);
    if (mysql_num_rows($langresult)>0) {
		$langrow=mysql_fetch_assoc($langresult);
		$lang=$langrow['key'];
        return;
    }
    $clientlang=substr($_SERVER["HTTP_ACCEPT_LANGUAGE"],0,strpos($_SERVER["HTTP_ACCEPT_LANGUAGE"],"-"));
    $langquery="SELECT * FROM `languages` WHERE `key`='$clientlang'";
    $langresult=mysql_query($langquery);
    if (mysql_num_rows($langresult)>0) {
		$langrow=mysql_fetch_assoc($langresult);
		$lang=$langrow['key'];
        return;
    }
    $langquery="SELECT * FROM `languages` LIMIT 1";
    $langresult=mysql_query($langquery);
    if (mysql_num_rows($langresult)==0) {
		$langrow=mysql_fetch_assoc($langresult);
		$lang=$langrow['key'];
        return;
    }
	die("No languages is set");
?>