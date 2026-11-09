<?php

require_once "phpmailer/PHPMailerAutoload.php";

$mail = new PHPMailer;

//email information
$senderEmail = "ENTER SENDER EMAIL HERE";
$senderName = "ENTER SENDER NAME HERE";
$recipientEmail = "info@custerdental.com";
$recipienteName = "Custer Dental Secretery";

$subject = "Custer Family Dental Book an Appointment Form Inquiry";

if(isset($_POST['btnSubmit']))
{
    $firstName = $_POST['firstname'];
    $lastName = $_POST['lastname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
	$senderEmail = $email;
	$senderName = $firstName." ".$lastName;
    $message = $_POST['message'];
	$preferedDay = $_POST['day']; //Appointment day preference
	$preferedTime =  $_POST['time'];//Appointment time preference
	
	$ServiceFor = $_POST['service_for'];
	$ServiceForOthers = $_POST['serfice_for_others'];
	$serviceForString ="";
	$ReasonList= $_POST['reason_list'];
	$ReasonfOthers = $_POST['reason_others'];
	$ReasonString="";
	if (!empty($_POST['service_for']))	
	{
		foreach($_POST['service_for'] as $check){
			if ($check!="other")
				$serviceForString.= $check. ", ";
			else
				$serviceForString.=$_POST['service_for_others'];
		}		
	}
	if (!empty($_POST['reason_list']))	
	{
		foreach($_POST['reason_list'] as $reason){
			if ($reason!="other")
				$ReasonString.= $reason . ", ";
			else
				$ReasonString.=$_POST['reason_others'];
		}		
	}
	
	$html = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dentologist</title>
</head>
<body>
<table style="width:100%; font-family: Arial;" cellpadding="0" cellspacing="0">
  <thead style="background-color: #3498db;">
    <tr>
      <th style="padding: 10px;"><img src="http://custerdental.com/beta/comming_soon/images/logo.png" style="vertical-align: middle;"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>First Name</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $firstName . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Last Name</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $lastName . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Phone Number</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $phone . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Email</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $email . '</td>    	
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Question/Comments</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $message . '</td>    	
    </tr>
	 <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Service for</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $serviceForString . '</td>    	
    </tr>
	 <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Service Reason</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $ReasonString . '</td>    	
    </tr>
	 <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Preferred Day</strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $preferedDay . '</td>    	
    </tr>
	 <tr>
      <td style="padding: 10px; border: 1px solid #3498db; background: #E5E5E5;"><strong>Preferred Time </strong></td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #3498db;">' . $preferedTime . '</td>    	
    </tr>
  </tbody>
</table>
</body>
</html>';

$mail->setFrom($senderEmail, $senderName);
	 
//$mail->addAddress("samehSirri@gmail.com", "Sameh");
//$mail->addAddress("Qannos@Gmail.com", "Ramez");
//$mail->addAddress("Moh.IBRAHIM.se@gmail.com", "Moh.IBRAHIM.se@gmail.com");

$mail->addAddress($recipientEmail, $recipienteName);
$mail->Subject = $subject;
$mail->msgHTML($html);
}

if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    header("Location: thankyou.php");
}
?>