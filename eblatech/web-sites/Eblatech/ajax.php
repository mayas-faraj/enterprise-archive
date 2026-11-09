<?php
	
	$op = addslashes($_REQUEST['op']);
	if(!empty($op))
	{
		switch($op)
		{
			case 'send-mail':
				$name = (!isset($_REQUEST['name'])) ? '' : $_REQUEST['name'];
				$name = trim($name);
				
				$email = (!isset($_REQUEST['email'])) ? '' : $_REQUEST['email'];
				$email = trim($email);
				
				$mobile = (!isset($_REQUEST['mobile'])) ? '' : $_REQUEST['mobile'];
				$mobile = trim($mobile);
				
				$message = (!isset($_REQUEST['message'])) ? '' : $_REQUEST['message'];
				$message = trim($message);
				
				
				if(!empty($name) && !empty($email) && !empty($mobile) && !empty($message))
				{
					$captcha;
					if(isset($_GET['g-recaptcha-response'])){
					$captcha=$_GET['g-recaptcha-response'];
					}
					else
					{
						echo 'validation error!';
						exit;
					}
					
					if(!$captcha){
					echo 'Please check the captcha form.';
					exit;
					}

					$secretKey = "6LfVUzsUAAAAALqzkMW-JYvBrYkLMoihvtLgsD-3";
					$ip = $_SERVER['REMOTE_ADDR'];
					$response=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".$secretKey."&response=".$captcha."&remoteip=".$ip);
					$responseKeys = json_decode($response,true);
					if(intval($responseKeys["success"]) !== 1) {
					echo 'You are spammer ! Get out';
					} else {
						//$to = 'mas4it@gmail.com';
						$to = 'info@ebla-tech.com';
						$subject = 'Email contact us: '.$email;
						$from = $email;

						$date = date('Y-m-d h:i');
						$html_msg = '';
						$html_msg .= '<table width="700" border="1" align="center" dir="ltr">';
						$html_msg .= '<tr>';
						$html_msg .= '<td colspan="2" bgcolor="#CCCCCC"><div align="center">Contact us</div></td>';
						$html_msg .= '</tr>';
						
						$html_msg .= '<tr>';
						$html_msg .= '<td width="178" align="right" style="text-align:left"  valign="top">date</td>';
						$html_msg .= '<td width="506" align="right" style="text-align:left" valign="top">'.$date.'</td>';
						$html_msg .= '</tr>';
						
						$html_msg .= '<tr>';
						$html_msg .= '<td align="right" style="text-align:left" valign="top">Name</td>';
						$html_msg .= '<td align="right" style="text-align:left" valign="top">'.$name.'</td>';
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
						
						
						if(send_mail($to, $from, $subject, $html_msg))
						{
							echo 'Your message sent';
						}
						else
						{
							echo 'please try again';
						}
					}
				}
				else
				{
					echo 'please check fields';
				}
				
				
				break;
				
		}
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