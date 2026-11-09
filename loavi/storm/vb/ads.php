<?php

/*======================================================================*\
|| #################################################################### ||
|| #                ãäÙã ÇáÅÚáÇäÇÊ ÇáÔÇãá ÇáÅÕÏÇÑ 3,0,1                  # ||
|| # ---------------------------------------------------------------- # ||
|| #                ÈÑãÌÉ ÓÚíÏ ÇáÚØæí / ÇáãÑßÒ ÇáÓÚæÏí                  # ||
|| # --------------------- áÏÚã Çáİäí æÇáØáÈÇÊ ----------------------- # ||
|| # http://www.1f1f.net/vb/index.php  | bbo7@bbo7.com | 0553571503   # ||
|| #################################################################### ||
\*======================================================================*/
// ####################### SET PHP ENVIRONMENT ###########################
error_reporting(E_ALL & ~E_NOTICE);

// #################### DEFINE IMPORTANT CONSTANTS #######################
define('THIS_SCRIPT', 'ads');
// ################### PRE-CACHE TEMPLATES AND DATA ######################
// get special phrase groups
$phrasegroups = array();

// get special data templates from the datastore
$specialtemplates = array();

// pre-cache templates used by all actions
$globaltemplates = array(
	'ads_saeed_log',
	'ads_saeed_stats',
	'ads_saeed_stats2',
);

// pre-cache templates used by specific actions
$actiontemplates = array();

// ######################### REQUIRE BACK-END ############################
require_once('./global.php');

if (empty($_REQUEST['do']))
{

	$_REQUEST['do'] = 'log';
}
if (!$vbulletin->options['ads_forum_activate']){
eval(standard_error("ÚİæÇó ŞÇãÊ ÇáÅÏÇÑÉ ÈÊÚØíá ãäÙã ÇáÅÚáÇäÇÊ"));
}

$navbits = construct_navbits(array('' => 'ÅÍÕÇÆíÇÊ ÇáÅÚáÇäÇÊ'));
eval('$navbar = "' . fetch_template('navbar') . '";');

// ######################## adv SCRIPT #########################
if ($vbulletin->options['ads_forum_activate_bnr'])
{
if($_REQUEST['do'] == 'adv'){
$id = intval($_GET['id']);
if (!$my["ads_{$id}"]){
?>document.write('<?php echo "ÇáÅÚáÇä ÇáãÍÏÏ ÎÇØÆ"; ?>')<?
}else{ 
define('SKIP_SESSIONCREATE', 1);
?>document.write('<?php echo $my["ads_{$id}"]; ?>')<?
}


}
if($_REQUEST['do'] == 'cat'){
$id = intval($_GET['id']);
if (!$my["ca_{$id}"]){
?>document.write('<?php echo "ÇáÅÚáÇä ÇáãÍÏÏ ÎÇØÆ"; ?>')<?
}else{
define('SKIP_SESSIONCREATE', 1);
?>document.write('<?php echo $my["ca_{$id}"]; ?>')<?
}
}
}

// ######################## ÈÏÇíÉ ÚÑÖ ÇáÅÍÕÇÆíÇÊ #########################
				if ($_REQUEST['do'] == 'stats')
			{
	$vbulletin->input->clean_array_gpc('p', array(
		'email'        => TYPE_STR,
		'bas'        => TYPE_STR,
	));
				if (!$vbulletin->options['ads_forum_Pageads']){
eval(standard_error("ÚİæÇó ŞÇãÊ ÇáÅÏÇÑÉ ÈÊÚØíá ÕİÍÉ ãÔÇåÏÉ ÅÍÕÇÆíÇÊ ÇáÅÚáÇäÇÊ"));
}
if (!$vbulletin->GPC['email'] or !$vbulletin->GPC['bas'])
{
eval(standard_error("ÚİæÇó ÇáãÚáæãÇÊ ÇáãÏÎáå ÎÇØÆå íÑÌì ãÑÇÓáÉ ãÓÄá ÇáÅÚáÇäÇÊ ÍÊì íÊã ÊÒæíÏßã ÈßáãÉ ãÑæÑ ÕÍíÍå"));
}
function my_ads($ads_id,$ads_alt,$ads_ima,$ads_link,$ads_hiah,$ads_width,$ads_height){ 
global $vbulletin ,$vboptions;
$ads_zearah = vb_number_format($ads_zearah);
if($ads_link){   
$ads_a1 = "<a rel=\"nofollow\" href=\"$ads_link\" target=\"_blank\">";
$ads_a2 = "</a>";
$ads_a_txt = "<a title=\"$ads_alt\" rel=\"nofollow\" href=\"$ads_link\" target=\"_blank\">";
$ads_a_flash = "$ads_ima?{$vbulletin->options[ads_forum_flash]}=$ads_link";
}
switch ($ads_hiah)
{
case 0:
$adsbnrstats="$ads_a1<img src=\"$ads_ima\" alt=\"$ads_alt\" border=\"0\" width=\"$ads_width\" height=\"$ads_height\" $ads_fong2 />$ads_a2";
break;
case 1:
$adsbnrstats="<object type=\"application/x-shockwave-flash\" data=\"$ads_a_flash\" width=\"$ads_width\" height=\"$ads_height\" ><param name=\"movie\" value=\"$ads_a_flash\" /><img src=\"images/misc/no_flash.gif\" alt=\"ãÊÕİÍß áÇíÏÚã ÇáİáÇÔ\" width=\"$ads_width\" height=\"$ads_height\" /></object>";
break;
case 2:
$adsbnrstats="$ads_a_txt<font class=\"smallfont\">$ads_width$ads_ima$ads_height</font>$ads_a2";
break;
}
return $adsbnrstats;   
}


	$ads_stats = $vbulletin->db->query_read("
SELECT * FROM " . TABLE_PREFIX . "ads_bnr
					WHERE bas = '" . $db->escape_string($vbulletin->GPC['bas']) . "' AND  email = '" . $db->escape_string($vbulletin->GPC['email']) . "' ORDER BY displayorder");
while ($ads_bnr_stats = $vbulletin->db->fetch_array($ads_stats))
{
$ads_bnr3d +=  1;

$ads_zearah = vb_number_format($ads_bnr_stats['zearah']);
$ads_star = vbdate($vbulletin->options['dateformat'], $ads_bnr_stats['star'], 1);
$ads_end = vbdate($vbulletin->options['dateformat'], $ads_bnr_stats['end'], 1);
		if ($ads_bnr_stats['active'] == '0')
		{
		$lhb = 'ãÚØá';
		}
		if ($ads_bnr_stats['dem'] == '4' AND $ads_bnr_stats['active'] == '1')
		{
		$lhb = 'ÏÇÆã';
		}
		if ($ads_bnr_stats['dem'] !== '4' AND $ads_bnr_stats['star'] > TIMENOW AND $ads_bnr_stats['active'] == '1')
		{
		$lhb = 'áã íÈÏÇÁ';
		}
		if ($ads_bnr_stats['dem'] !== '4' AND TIMENOW > $ads_bnr_stats['end'] AND $ads_bnr_stats['active'] == '1')
		{
		$lhb = 'ÅäÊåì';
		}
		if ($ads_bnr_stats['dem'] !== '4' AND TIMENOW < $ads_bnr_stats['end'] AND $ads_bnr_stats['star'] < TIMENOW AND $ads_bnr_stats['active'] == '1')
		{
		$lhb = 'íÚãá';
		}
$my_bnr_st=my_ads($ads_bnr_stats[id],$ads_bnr_stats[alt],$ads_bnr_stats[ima],$ads_bnr_stats[link],$ads_bnr_stats[hiah],$ads_bnr_stats[width],$ads_bnr_stats[height]);

eval('$ads_bnrs_stats2 .= " ' . fetch_template('ads_saeed_stats2') . '";');

}

				
if (!$ads_bnr3d)
{
eval(standard_error("ÚİæÇó ÇáãÚáæãÇÊ ÇáãÏÎáå ÎÇØÆå íÑÌì ãÑÇÓáÉ ãÓÄá ÇáÅÚáÇäÇÊ ÍÊì íÊã ÊÒæíÏßã ÈßáãÉ ãÑæÑ ÕÍíÍå"));
}
eval('print_output("' . fetch_template('ads_saeed_stats') . '");');
}
// ######################## ÈÏÇíÉ ÊÓÌíá ÇáÏÎæá & ÊÍæíá ÇáÒÇÆÑ #########################

if ($_REQUEST['do'] == 'log')
{
define('SKIP_SESSIONCREATE', 1);
	if(isset($_GET['id'])){
	$id = intval($_GET['id']);
	$ads_bnr = $db->query_first("SELECT * FROM " . TABLE_PREFIX . "ads_bnr WHERE id = '" . $db->escape_string($id) . "'");
    $db->query_write("UPDATE " . TABLE_PREFIX . "ads_bnr SET zearah = zearah + 1 WHERE id = '" . $db->escape_string($id) . "'");
    if(!$ads_bnr[link]){eval(standard_error("ÚİæÇğ ÇáÅÚáÇä ÇáãÍÏÏ ÎÇØÆ"));}
	exec_header_redirect($ads_bnr[link]);
    }else{ 
eval('print_output("' . fetch_template('ads_saeed_log') . '");');
}
}
// ######################## äåÇíÉ ÊÓÌíá ÇáÏÎæá & ÊÍæíá ÇáÒÇÆÑ #########################
?>