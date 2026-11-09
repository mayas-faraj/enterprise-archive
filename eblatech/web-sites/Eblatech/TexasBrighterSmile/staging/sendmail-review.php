<?php
// Who you want to receive the emails from the form.
//$sendto = 'mas4it@gmail.com';
$sendto = 'info@ebla-tech.com';
// The subject you'll see in your inbox


// Message for the user when he/she doesn't fill in the form correctly.
$errormessage = 'Looks like you are missing some info. Try again.';

//Message for the user when he/she fills in the form correctly.
$thanks = "Thanks for the email. We'll get back to you as soon as we can.";

// Message for the bot when it fills in in at all.
$honeypot = "You filled in the honeypot! If you're human, try again!";

// Various messages displayed when the fields are empty.
$emptyname =  'Entering your name?';
$emptymobile = 'Entering your mobile number?';
$emptydate = 'Entering date?';
$emptytime = 'Entering time?';

// Various messages displayed when the fields are incorrectly formatted.
$alertname =  'Entering your name using only the standard alphabet?';
$alertmobile =  'Entering your mobile number using only the standard characters?';
$alertdate = '';
$alerttime = '';

$alert = '';
$pass = 0;

function clean_var($variable) {
	$variable = strip_tags(stripslashes(trim(rtrim($variable))));
  return $variable;
}

// Doctor message
$message_doctor = '';
if ( !empty($_REQUEST['form-doctor']) ) {
	$message_doctor = "Doctor :" .clean_var($_REQUEST['form-doctor']) . "\n";
};

//form alert messages structure 
$ma_top = '
	<div class="message message-modal message-close">
	<button type="button" class="message-close-button"><i class="fa fa-close"></i></button>
	<div class="alert">
';
$ma_bot = '
	</div></div>
';

// required fileds data array
$required_fields = array(
	'1' => array(
		'name' => 'name',
		'empty' => $emptyname,
		'alert' => $alertname,
		),
	'2' => array(
		'name' => 'mobile',
		'empty' => $emptymobile,
		'alert' => $alertmobile,
		),

);

if ( empty($_REQUEST['last']) ) {
	
	foreach($required_fields as $rf){
		if ( empty($_REQUEST[''.$rf['name'].'']) ) {
			$pass = 1;
			$alert .= "<div class='message-item-list'>" . $rf['empty'] . "</div>";
		  } elseif ( preg_match( "/[][{}()*+?.\\^$|]/", $_REQUEST[''.$rf['name'].''] ) ) {
			$pass = 1;
			$alert .= "<div class='message-item-list'>" . $rf['alert'] . "</div>";
		  }
	};

  if ( $pass==1 ) {
	echo '
		<div class="message message-close message-error">
			<button type="button" class="message-close-button"><i class="fa fa-close"></i></button>
			<div class="alert alert-danger">'.$errormessage.$alert.'</div>
		</div>
	';
  
  } elseif (isset($_REQUEST['message'])) {

	$name = clean_var($_REQUEST['name']);
	$email = clean_var($_REQUEST['email']);

	$name = clean_var($_REQUEST['name']);
	$mobile = clean_var($_REQUEST['mobile']);
	$email = clean_var($_REQUEST['email']);
	$position = clean_var($_REQUEST['position']);
	
	$message = clean_var($_REQUEST['message']);
	

	
	
	$header = 'From:'. clean_var($_REQUEST['email']);
	
	
 
	$subject = 'BrighterSmile - REVIEW : '.$name;
	$created = date('d/m/Y H:i');
	$html_msg = '';
	$html_msg .= '<table width="700" border="1" align="center" dir="ltr">';
	$html_msg .= '<tr>';
	$html_msg .= '<td colspan="2" bgcolor="#CCCCCC"><div align="center">BrighterSmile - REVIEW</div></td>';
	$html_msg .= '</tr>';
	
	$html_msg .= '<tr>';
	$html_msg .= '<td width="178" align="right" style="text-align:left"  valign="top">Created</td>';
	$html_msg .= '<td width="506" align="right" style="text-align:left" valign="top">'.$created.'</td>';
	$html_msg .= '</tr>';
	
	$html_msg .= '<tr>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">Name</td>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$name.'</td>';
	$html_msg .= '</tr>';
	
	$html_msg .= '<tr>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">Position</td>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$position.'</td>';
	$html_msg .= '</tr>';

	$html_msg .= '<tr>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">Email</td>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$email.'</td>';
	$html_msg .= '</tr>';

	$html_msg .= '<tr>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">Mobile</td>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$mobile.'</td>';
	$html_msg .= '</tr>';
	
					
		
	$html_msg .= '<tr>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">Message</td>';
	$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$message.'</td>';
	$html_msg .= '</tr>';


	$html_msg .= '</table>';

	if(send_mail($sendto, $email, $subject, $html_msg))
	{
	
	//mail($sendto, $subject, $message, $header);
		echo '
			<div class="message message-close message-success">
				<button type="button" class="message-close-button"><i class="fa fa-close"></i></button>
				<div class="alert alert-success">'.$thanks.'</div>
			</div>
		';
	}
	else
	{
		echo '
			<div class="message message-close message-success">
				<button type="button" class="message-close-button"><i class="fa fa-close"></i></button>
				<div class="alert alert-error">'.$errormessage.$alert.'</div>
			</div>
		';		
	}
	die();
	echo $message;
	}

} else {
	echo $honeypot;
}


function send_mail($to, $from, $subject, $msg) 
{
	error_reporting(0);
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=UTF-8' . "\r\n";
	$headers .= 'From: '.$from.' <'.$from.'>'; 
	
	
	return mail($to,$subject, $msg,$headers );

}
?>