<?php  //require_once('include.php'); 
include_once("include.php");
require_once("class/send_form.php");

//$print_url = "page=".$_GET["page"]."&id=".$_GET["id"];?>
<html>
<meta http-equiv='Content-Language' content='ar'>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<link href="css/<?=$lang;?>style.css" rel="stylesheet" type="text/css">
<head>
<title>
<?=$frmad['send to friend'];?>
</title>
<script language="JavaScript">
function check(f){
if (f.recipient_name.value =="" ) {
alert("من فضلك أدخل اسم صديقك");
f.recipient_name.focus();
return false;
}
if (f.to.value =="" ) {
alert("من فضلك أدخل بريد صديقك الالكتروني");
return false;
}
ReAddr=/([a-zA-Z0-9_\-])+@([a-zA-Z0-9_\-])+\.([a-zA-Z])+/g;
if(! (ReAddr.exec(f.to.value) ) ){
alert("بريد صديقك الالكتروني غير صحيح");
f.to.focus();
f.to.style.color="#EE2830";
return false;
} 
if (f.sender_name.value =="" ) {
alert("من فضلك أدخل اسمك");
f.sender_name.focus();
return false;
}

if (f.user_email.value =="" ) {
alert("من فضلك أدخل بريدك الالكتروني");
return false;
}
ReAddr=/([a-zA-Z0-9_\-])+@([a-zA-Z0-9_\-])+\.([a-zA-Z])+/g;
if(! (ReAddr.exec(f.user_email.value) ) ){
alert("بريدك الالكتروني غير صحيح");
f.user_email.focus();
f.user_email.style.color="#EE2830";
return false;
} 

if (f.txtNumber.value =="" ) {
alert("من فضلك أدخل الرقم المكتوب على الصورة");
f.txtNumber.focus();
return false;
}

}

//-->
</script>
<style>
body { background: #efefef; }
</style>
</head>
<body  bgcolor='#FFFFFF' text='#000000' link='#000000' vlink='#000000' alink='#000000' topmargin='0' leftmargin='0' marginwidth='0' marginheight='0'>
<form method='post' action='?<?php print $_SERVER['QUERY_STRING'];?>' name='form' onSubmit="return check(form)">
  <input type="hidden" value="<?php print $_SERVER['QUERY_STRING'];?>" name="link_url">
  <center>
    <font size="2" color="#CB0000"><?php print $msg;?></font>
  </center>
  <table width="99%" height="100%"  border="2" align="center" cellpadding="1" cellspacing="1" bordercolor="#6401aa" style="border-width: 0px ">
    <tr>
      <td height="20" align="center" valign="middle" bgcolor="#6401aa"  style="color:#FFFFFF"><b><?=$frmad['send to friend'];?></b></td>
    </tr>
    <tr>
      <td align="center" valign="top"><table width='1%' border='0' align='center' cellpadding="4" cellspacing="2" dir="<?=$dir_2?>" >
          <tr>
            <td width="63%" align="right" valign="middle"><input type="text" name="recipient_name" value="" class="input_search" dir="rtl"></td>
            <td width="37%" align="<?=$_left;?>" valign="middle" nowrap ><?=$frmad['friend_name'];?></td>
          </tr>
          <tr>
            <td width="63%" align="right" valign="middle"><input type="text" name="to" value="" class="input_search" dir="ltr"></td>
            <td width="37%" align="<?=$_left;?>" valign="middle" nowrap ><?=$frmad['friend_email'];?></td>
          </tr>
          <tr>
            <td width="63%" align="right" valign="middle"><input type="text" name="sender_name" value="" class="input_search" dir="rtl"></td>
            <td width="37%" align="<?=$_left;?>" valign="middle" nowrap ><?=$frmad['your_name'];?></td>
          </tr>
          <tr>
            <td width="63%" align="right" valign="middle"><input name="Email" type="text" id="user_email3" value="" class="input_search" dir="ltr">            </td>
            <td width="37%" align="<?=$_left;?>" valign="middle" nowrap ><?=$frmad['your_email'];?></td>
          </tr>
          <tr>
            <td align="right" valign="top"><textarea name="message" rows="4" class="input_search" id="message" style="height: 150px"></textarea></td>
            <td align="<?=$_left;?>" valign="top" nowrap ><?=$frmad['comment'];?></td>
          </tr>
          <tr>
            <td align="right" class="alltext"><input name="txtNumber" type="text" class="input_search" id="txtNumber" size="20" />
                <img src="class/img.php" /></td>
            <td align="<?=$_left;?>" valign="top" nowrap ><?=$frmad['Number_form'];?></td>
          </tr>
          <tr valign="top">
            <td align="<?=$_left;?>"><input  type="submit" value="<?=$frmad['Send'];?>" name="submit" class="StandardBtn SubmitBtn" >
              <input type="hidden" name="send_friend" value="submit">            </td>
            <td align="center">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
<?php 
if(isset($_POST['send_friend']) && $_POST['send_friend']=="submit"){
$number   = $_POST['txtNumber'];
if (md5(strtoupper($number)) != $_SESSION['image_random_value']) {
	//$page = str_replace('<!-- errormessages -->',$errorMessage,$page);
	$page = str_replace('{color_v}','color="#FF0000"',$page);
	//print $page;
	echo "<script>alert('".$frmad['Number_form']."');</script>";
	//exit();
}else{
	
	$header.="Content-Type: text/html; charset=utf-8\n";
	$header.="From: " .$_POST['user_email'];
	
	$message ='<table width="90%" border="0" cellspacing="3" cellpadding="1" style="border-width: 0px" align="center" bordercolor="#B7B6B6" dir="ltr">
	'; $message.='
	<tr align="center" dir="rtl">
	<td  width="20%"><font color="#000000" size="4" face="Traditional Arabic"><b>From  '.$_POST['sender_name'].' To  '.$_POST['recipient_name'].' </b></font></td>
	</tr>
	'; $message.='
	<tr align="right" dir="rtl">
	<td ><font color="#000000" size="4" face="Traditional Arabic">'.$_POST['recipient_name'].' وجدت هذا المقال على موقع مديرية الإعلام الإلكتروني  .</font></td>
	</tr>
	<tr align="right">
	<td  width="20%"><font color="#000000" size="4" face="Traditional Arabic"><pre>'.$_POST['message'].'</pre></font></td></tr>
	
	<tr align="right">
	<td dir="ltr"><font color="#000000" size="4" face="Traditional Arabic">لمشاهدة المقال <br> <a href="http://'.$_SERVER["HTTP_HOST"].'/?'.$_SERVER['QUERY_STRING'].'" target="_blank">http://'.$_SERVER["HTTP_HOST"].'/?'.$_SERVER['QUERY_STRING'].' </a></font></td>
	</tr>'; 
	$message.='<tr align="center">
	<td  width="20%" dir="rtl"><font color="#000000" size="5" face="Traditional Arabic"><br><b>مديرية الإعلام الإلكتروني<br><a href="http://'.$_SERVER["HTTP_HOST"].'" target="_blank" >http://'.$_SERVER["HTTP_HOST"].'</a></b></font></td>
	</tr>
	</table>';





# Sender Name  
$from_name  = $_POST['recipient_name'];
# Sender Email  
$from_email = $_POST['Email'];
$to_name  =   $_POST['recipient_name']."مديرية الإعلام الإلكتروني";
$to_email =   $_POST['to'];
$subject  =   'From '.$_POST['sender_name'].' To '.$_POST['recipient_name'];
# Text Portion  
# $text_message = "This is HTML email and your email client softawre ain't support HTML email.";
$text_message = ".";
# HTML Portion  
$html_message= '
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><body>
'.$message.'
</body></html>';

# Execute SendMail Function
if (sendmail ($from_name, $from_email, $to_name, $to_email, $subject, $text_message, $html_message, $at)) {
	echo"<script>alert('".$frmad['ok_send']."');</script>";
	echo"<script>window.close();</script>";
}
else  echo"<script>alert('".$frmad['No_send']."');</script>";


}//end else
}//submit


?>

