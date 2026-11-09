<?php
session_start();
$sid = session_id();
//echo $sid;
$mail_skey = md5($sid);

$skey =  (!isset($_POST['skey'])) ? ''  : $_POST['skey'];


if($skey != $mail_skey) 
{
	//header("Location:index.php");
}

$captcha = '';
if(isset($_POST['g-recaptcha-response']))
{
	$captcha=$_POST['g-recaptcha-response'];
}

if(!$captcha){
	//echo '<h2>Please check the the captcha form.</h2>';
	header("Location:index.php?formError#contactForm");	
    exit;
}
$response=json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=6Ld_hi4UAAAAAMZn7eCyw6fujUJzuyJaVf92y_ob&response=".$captcha."&remoteip=".$_SERVER['REMOTE_ADDR']), true);
if($response['success'] == false)
{
  echo '<h2>You are spammer ! Get out of here</h2>';
  exit;
}
else
{
  //echo '<h2>Thanks for posting comment.</h2>';
}


$fullname = (!isset($_POST['fullname'])) ? ''  : $_POST['fullname'];
$email = (!isset($_POST['email'])) ? '' : $_POST['email'];
$phone = (!isset($_POST['v'])) ? ''  : $_POST['phone'];
$message = (!isset($_POST['message'])) ? ''  : $_POST['message'];

//echo "fullname : $fullname <br>";

if(empty($fullname) || empty($message) )
{
	header("Location:index.php?formError#contactForm");	
    exit;
}


require_once "phpmailer/PHPMailerAutoload.php";

$mail = new PHPMailer;

//email information
$senderEmail = "ENTER SENDER EMAIL HERE";
$senderName = "ENTER SENDER NAME HERE";
$recipientEmail = "info@ctlmed.com";
//$recipientEmail = "mas4it@gmail.com";
$recipienteName = "CTL Medical office";

$subject = "CTL Medical website contact form ";

if(isset($_POST['btnSubmit']))
{
    $fullname = $_POST['fullname'];
//    $lastName = $_POST['lastname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
	$senderEmail = $email;
	$senderName = $fullname;
    $message = $_POST['message'];
 
	
	 
	
	$html = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CTL Mediacal</title>
</head>
<body>
<table style="width:100%; font-family: Arial;" cellpadding="0" cellspacing="0">
  <thead >
    <tr>
      <th style="padding: 10px;"><img src="http://ctlmed.com/newctl/img/ctl-logo2.png" style="vertical-align: middle;"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 10px; border: 1px solid black; background: #ffc91b;"><strong>Name</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black;">' . $fullname . '</td>    	
    </tr>
     
    <tr>
      <td style="padding: 10px; border: 1px solid black; background: #ffc91b;"><strong>Phone Number</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black;">' . $phone . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black; background: #ffc91b;"><strong>Email</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black;">' . $email . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black; background: #ffc91b;"><strong>Question/Comments</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid black;">' . $message . '</td>    	
    </tr> 
  </tbody>
</table>
</body>
</html>';

$mail->setFrom($senderEmail, $senderName);
	 
//$mail->addAddress("samehSirri@gmail.com", "Sameh");
//$mail->addAddress("Qannos@Gmail.com", "Ramez");

$mail->addAddress($recipientEmail, $recipienteName);
$mail->Subject = $subject;
$mail->msgHTML($html);
}

if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    header("Location: thankyou.html");
}
?>