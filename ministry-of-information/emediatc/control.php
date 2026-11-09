<?php 
session_start();
if ($_SESSION["user"] && $_SESSION["Id_User"] && $_SESSION["Activate_User"] == '1') {
include("include.php");
Get_Permission_User_Blocks($_SESSION["Id_User"]);
?>
<html>
<head>
<title>
<?=$title_ControlPanel?>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="programmer" content="Mohanad Orfali">
<link href="white.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jscalendar/ts_picker.js"></script>
<link href="js/jq.css" rel="stylesheet" type="text/css">
<!-- ################################################################# for change arabic - english - ...... -->
<link type="text/css" href="./jq/themes/base/ui.all.css" rel="stylesheet" />
<script type="text/javascript" src="./jq/jquery-1.3.2.js"></script>
<script type="text/javascript" src="./jq/ui/ui.core.js"></script>
<script type="text/javascript" src="./jq/ui/ui.tabs.js"></script>
<link type="text/css" href="./jq/demos.css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	</script>
<style>
.li_class {
	font-size:12px;
}
</style>
<!-- ################################################################# End for change arabic - english - ...... -->
<SCRIPT type=text/javascript src="js/ddaccordion.js"></SCRIPT>
<script language="javascript">
ddaccordion.init({
	headerclass: "expandable", 
	contentclass: "categoryitems", 
	revealtype: "click",
	mouseoverdelay: 200, 
	collapseprev: true,
	defaultexpanded: [0],
	onemustopen: false,
	animatedefault: false,
	persiststate: true,
	toggleclass: ["", "openheader"],
	togglehtml: ["prefix", "", ""], 
	animatespeed: "fast", 
	oninit:function(headers, expandedindices){ 
	},
	onopenclose:function(header, index, state, isuseractivated){
	}
})
</script>
<script language="javascript">
<!------------------------------------------------------for system make folder for upload------------>

function FP_getObjectByID(id,o) {//v1.0
 var c,el,els,f,m,n; if(!o)o=document; if(o.getElementById) el=o.getElementById(id);
 else if(o.layers) c=o.layers; else if(o.all) el=o.all[id]; if(el) return el;
 if(o.id==id || o.name==id) return o; if(o.childNodes) c=o.childNodes; if(c)
 for(n=0; n<c.length; n++) { el=FP_getObjectByID(id,c[n]); if(el) return el; }
 f=o.forms; if(f) for(n=0; n<f.length; n++) { els=f[n].elements;
 for(m=0; m<els.length; m++){ el=FP_getObjectByID(id,els[n]); if(el) return el; } }
 return null;
}

function getfather(obj,father) {
    m=obj;
    while (true) {
        m=m.parentElement;
        if (m== null || m=="undefined") break;
        if (m.tagName==father) {
            found=true;
            break;
        }
    }
    if (found==true) return m ;
}

function setfile1(obj,Kind) {
	 window.open("browser.php?Kind="+Kind+"","_blank","height=600,width=550,status=yes,scrollbars=1,toolbar=no,menubar=no,location=no");
}

function setfile2(obj,Kind) {
	window.open("browser.php?Kind="+Kind+"","_blank","height=600,width=550,status=yes,scrollbars=1,toolbar=no,menubar=no,location=no");
}
</script>
<!------------------------------------------------------end for system make folder for upload------------>
<script language="javascript">
///////////////////////////////////
function for_photo(v,path) {
if (v.value != "") {
w=window.open('Image','displayWin','resizeable=yes width=150 height=150');	
	w.document.write("<html>");
	w.document.write("<head>");
	w.document.write("<title></title>");
	w.document.write("</head>");
	w.document.write("<body bottommargin='0' leftmargin='0' marginheight='0' marginwidth='0' rightmargin='0' topmargin='0'>");
	w.document.write("<table width='150' border='0' cellpadding='0' cellspacing='0'>");
	w.document.write("<tr>");
	w.document.write("<td colspan='2'><img src='..//"+path+v.options[v.selectedIndex].text+"' ></td>");
	w.document.write("</tr>");
	w.document.write("</table>");
	w.document.write("</body>");
	w.document.write("</html>");
  }
} 
/////////////////////////////////////

function textCounter(field,counter,maxlimit,linecounter) {

try{
	
	// text width//
	var fieldWidth =  parseInt(field.offsetWidth);
	var charcnt = field.value.length;        

	// trim the extra text
	if (charcnt > maxlimit) { 
		field.value = field.value.substring(0, maxlimit);
	}

	else { 
	// progress bar percentage
	var percentage = parseInt(maxlimit - charcnt) ;
	document.form1.note.value=' بقي لديك '+percentage+' حرف .';
	//document.getElementById(note).style.width =  parseInt((fieldWidth*percentage)/100)+"px";
	//document.getElementById(note).innerHTML=" &nbsp; تعبئة: "+percentage+"%"
	
	// color correction on style from CCFFF -> CC0000
	//setcolor(document.getElementById(note),percentage,"background-color");
	}
	}
	catch(e)
	{
	return;
	}

}
</script>
<script type="text/javascript">
	function loadContent() {
		$("#contentArea").html('<div style="padding-top: 7px"><img src="images/loader.gif" alt="Loading ... " /><div>');
		$("#contentArea").load("ajax/GetTags_ajax.php?<?=uniqid("");?>");
		$("#contentAreaFatwa").load("ajax/GetTags_ajaxFatwa.php?<?=uniqid("");?>");
					
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="loadContent();">
<div align="center" style=" width: 100%; height:auto">
<div align="center" style=" width: 95%; height:auto; border:#dadada 1px solid">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr valign="top">
    <td colspan="2" align="center"><?php include("header.php");?></td>
  </tr>
  <tr>
    <td height="10"  valign="top" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="30%" align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" align="center"  valign="top" bgcolor="#FFFFFF">
    <table width="98%" height="19" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right" valign="top">
          <?php 
				if(isset($_GET['HomePage']) && $_GET['HomePage']==1){
					require_once("Static/index.php");
				}
				//////////////////////////	
				if($_SESSION['user']== "admin" || $_SESSION['user']== "owner" || $Fun_Blk_prm_users==1){
					if(isset($_GET['adduser']) && $_GET['adduser']==1){
						require_once("Users/insert_users.php");
					}
					if(isset($_GET['edituser']) && $_GET['edituser']==1){
						require_once("Users/edit_users.php");
					}
				}
				//////////////////////////////////////													
				if($Fun_Blk_article=="1"){
					if(isset($_GET['addpage']) && $_GET['addpage']==1){
						require_once("Pages/category.php");
						require_once("Pages/insert_det_pages.php");	  
					}
					if ($Fun_Blk_article_Publish==1) {
						if(isset($_GET['editpage']) && $_GET['editpage']==1){
							require_once("Pages/category.php");
							require_once("Pages/select_det_pages.php");
						}
					}//end if permission
				}
				//////////////////////////////////////
				if($Fun_Blk_Comments=="1"){
					if(isset($_GET['show_num_comment']) && $_GET['show_num_comment']==1 ){
						require_once("Pages/all_comments.php");
					}
					if(isset($_GET['ListComments']) && $_GET['ListComments']==1 ){
						require_once("Pages/list_comments.php");
					}
					if(isset($_GET['EditComments']) && $_GET['EditComments']==1 ){
						require_once("Pages/edit_comments.php");
					}
				}
				////////////////////////////////////
				if($Fun_Blk_article_Manage=="1"){
					if(isset($_GET['addsub']) && $_GET['addsub']==1){
						require_once("Pages/category.php");
						require_once("Pages/insert_sub.php");
					}
					if(isset($_GET['editsub']) && $_GET['editsub']==1){
						require_once("Pages/category.php");
						require_once("Pages/select_sub.php");
					}																										
					if(isset($_GET['numcat']) && $_GET['numcat']==1){
						require_once("Pages/category.php");
						require_once("Pages/edit_num_cat.php");
					}
					if(isset($_GET['editpage_archive']) && $_GET['editpage_archive']==1 ){
						require_once("Pages/category.php");
						require_once("Pages/archive_pages.php");
					}					
					if(isset($_GET['Edit_main_Numeric']) && $_GET['Edit_main_Numeric']==1 ){
						require_once("Pages/numerec_main_news.php");
					}
					if(isset($_GET['Edit_page_Numeric']) && $_GET['Edit_page_Numeric']==1 ){
						require_once("Pages/category.php");
						require_once("Pages/numerec_page_news.php");
					}
				}
				///////////////////////////////////////
				if(isset($_GET['News_No_Appear']) && $_GET['News_No_Appear']==1 ){
						require_once("Pages/all_news_not_appear.php");
					}
				///////////////////////////////////////
				if($Fun_Blk_windows=="1"){
					if(isset($_GET['Addwindow']) && $_GET['Addwindow']==1 ){
						require_once("Pages/category.php");
						require_once("Create_Windows/insert_window.php");
					}
					if(isset($_GET['Editwindow']) && $_GET['Editwindow']==1 ){
						require_once("Pages/category.php");
						require_once("Create_Windows/edit_window.php");
					}
				}
				
				if($Fun_Blk_News_ThisMoment=="1"){
					if(isset($_GET['addnews_thisMoment']) && $_GET['addnews_thisMoment']==1 ){
						require_once("News_ThisMoment/insert_news.php");
					}
				}
			     //////////////////////////	
				if($Fun_Blk_hot_news=="1"){
					if(isset($_GET['AddHotnews']) && $_GET['AddHotnews']==1){
					require_once("NewsBar/insert_important_bar.php");	  
					}
					if(isset($_GET['EditHotnews']) && $_GET['EditHotnews']==1){
					require_once("NewsBar/edit_important_bar.php");
					}
				}
				///////////////////////////////////////////////////////
				
				if($Fun_Blk_vote=="1"){
				if(isset($_GET['addvote']) && $_GET['addvote']==2 ){
					require_once("vote/a_insert_vote.php");
				}
				if(isset($_GET['addvote']) && $_GET['addvote']==3 ){
					require_once("vote/e_insert_vote.php");
				}
				
				if(isset($_GET['editvote']) && $_GET['editvote']==2 ){
					require_once("vote/a_edit_vote.php");
				}		
				if(isset($_GET['editvote']) && $_GET['editvote']==3 ){
					require_once("vote/e_edit_vote.php");
				}
				}
				//////////////////////////	
			
				if($Fun_Blk_album=="1"){
				if(isset($_GET['addcat']) && $_GET['addcat']==1){
				require_once("gallary/category_gallary.php");
				require_once("gallary/insert_cat.php");
				}
				if(isset($_GET['editcat']) && $_GET['editcat']==1){
				require_once("gallary/category_gallary.php");
				require_once("gallary/select_cat.php");
				}
				if(isset($_GET['addpro']) && $_GET['addpro']==2){
				require_once("gallary/category_gallary.php");
				require_once("gallary/insert_pro.php");	  
				}
				if(isset($_GET['editpro']) && $_GET['editpro']==2){
				require_once("gallary/category_gallary.php");
				require_once("gallary/select_pro.php");
				}
				}
				//////////////////////////	
			
				if($Fun_Blk_vedio=="1"){
				if(isset($_GET['addvideo']) && $_GET['addvideo']==2){
				require_once("gallary_video/insert_pro.php");	  
				}
				if(isset($_GET['editvideo']) && $_GET['editvideo']==2){
				require_once("gallary_video/select_pro.php");
				}
				}
				
				//////////////////////////
				if($Fun_Blk_friendly_site=="1"){
				if(isset($_GET['addcatsite']) && $_GET['addcatsite']==1){
				require_once("FriendlySites/category_gallary.php");
				require_once("FriendlySites/insert_cat.php");
				}
				if(isset($_GET['editcatsite']) && $_GET['editcatsite']==1){
				require_once("FriendlySites/category_gallary.php");
				require_once("FriendlySites/select_cat.php");
				}
				if(isset($_GET['addsites']) && $_GET['addsites']==2){
				require_once("FriendlySites/category_gallary.php");
				require_once("FriendlySites/insert_pro.php");	  
				}
				if(isset($_GET['editsites']) && $_GET['editsites']==2){
				require_once("FriendlySites/category_gallary.php");
				require_once("FriendlySites/select_pro.php");
				}
				}
				//////////////////////////	
				if($Fun_Blk_radio=="1"){
				if(isset($_GET['addcat_radio']) && $_GET['addcat_radio']==1){
				require_once("Radio/category_gallary.php");
				require_once("Radio/insert_cat.php");
				}
				if(isset($_GET['editcat_radio']) && $_GET['editcat_radio']==1){
				require_once("Radio/category_gallary.php");
				require_once("Radio/select_cat.php");
				}
				if(isset($_GET['addradio']) && $_GET['addradio']==2){
				require_once("Radio/category_gallary.php");
				require_once("Radio/insert_pro.php");	  
				}
				if(isset($_GET['editradio']) && $_GET['editradio']==2){
				require_once("Radio/category_gallary.php");
				require_once("Radio/select_pro.php");
				}
				}
				
				//////////////////////////
				if($Fun_Blk_Dalil=="1"){
				if(isset($_GET['addcat_dalil']) && $_GET['addcat_dalil']==1){
				require_once("Dalil/category.php");
				require_once("Dalil/insert_sub.php");
				}
				if(isset($_GET['editcat_dalil']) && $_GET['editcat_dalil']==1){
				require_once("Dalil/category.php");
				require_once("Dalil/select_sub.php");
				}
				if(isset($_GET['numcat_company']) && $_GET['numcat_company']==1){
				require_once("Dalil/category.php");
				require_once("Dalil/edit_num_cat.php");	  
				}
				if(isset($_GET['addcompany']) && $_GET['addcompany']==1){
				require_once("Dalil/category.php");
				require_once("Dalil/insert_det_company.php");
				}
				if(isset($_GET['editcompany']) && $_GET['editcompany']==1){
				require_once("Dalil/category.php");
				require_once("Dalil/select_det_company.php");
				}
				}
				
				//////////////////////////
				if($Fun_Blk_horoscope=="1"){
					if(isset($_GET['editabraaj']) && $_GET['editabraaj']==1){
					require_once("Horoscope/edit_abraaj.php");
					}
				}
				
				//////////////////////////
				
				if($Fun_Blk_maillist=="1"){
				if(isset($_GET['gen_maillist']) && $_GET['gen_maillist']==1){
					require_once("Maillist_generate/index.php");
				}
				}
			     
				 
				//////////////////////////
				
				if($Fun_Blk_Ads=="1"){
				if(isset($_GET['addAds']) && $_GET['addAds']==1){
					require_once("Ads/ads_list.php");
				}
				}
			     
				 
				 //////////////////////////
				if($Fun_Blk_banners=="1"){
				if(isset($_GET['addpanar_rl']) && $_GET['addpanar_rl']==1){
					require_once("Pages/category.php");
					require_once("Banner/upload_paner.php");
				}
				if(isset($_GET['editpanar_rl']) && $_GET['editpanar_rl']==1){
					require_once("Pages/category.php");
					require_once("Banner/update_paner.php");
				}	
			    if(isset($_GET['dell_img']) && $_GET['dell_img']==3){
					require_once("Pages/category.php");
					require_once("Banner/delete_img.php");
				}
				}
				//////////////////////////
			   
			   if($Fun_Blk_xml_header=="1"){
			   if(isset($_GET['addxml']) && $_GET['addxml']==1){
					require_once("Xml_Header/insert_cat.php");
				}
				if(isset($_GET['editxml']) && $_GET['editxml']==1){
					require_once("Xml_Header/select_cat.php");
				}
			   }
				//////////////////////////
			   
			   if($Fun_Blk_setting=="1"){
			   if(isset($_GET['addsett']) && $_GET['addsett']==1){
					require_once("setting.php");
				}
			   }
				//////////////////////////
			   
			   if($Fun_Blk_changepasswd=="1"){
			   if(isset($_GET['chg_pass']) && $_GET['chg_pass']==1){
					require_once("Chang_Pass/profile.php");
				}
			   }
				
				//////////////////////////
				
				
			   
			   if($Fun_Blk_backup=="1"){
			   if(isset($_GET['BackUp']) && $_GET['BackUp']==1){
					require_once("BackupSystem/backup.php");
				}
				if(isset($_GET['ShowBackUp']) && $_GET['ShowBackUp']==1){
					require_once("BackupSystem/displayBackup.php");
				}
			   }
				
				//////////////////////////
				if(isset($_GET['delcache']) && $_GET['delcache']==1){
					require_once("Make_Cache/empty_caching.php");
				}
			//////////////////////////
				 
		?></td>
        </tr>
    </table></td>
    <td width="30%" align="center" valign="top" style="padding: 0px 18px 18px 18px"><?php require_once("menu.php");?></td>
    </tr>
  <tr>
    <td colspan="2"  valign="top">
        <?php include("footer.php");?>
    </td>
  </tr>
</table>
</div>
</div>
</body>
<!--

web Developed by : mohanad orfali
Email : phpline@hotmail.com
Mob: +96393878476
-->
</html>
<?php 
mysql_close($fpack);
}

else
{
  header("location: index.php?mohanad=ok");
}
?>
