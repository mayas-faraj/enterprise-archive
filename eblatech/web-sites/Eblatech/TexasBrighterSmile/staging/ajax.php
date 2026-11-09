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
				$err = array();
				
				if(empty($name)) $err['name'] = 'Enter name';
				if(empty($email))
				{
					$err['email'] = 'Enter email';
				}
				else if(!checkEmail($email))
				{
					$err['email'] = 'Wrong email';
				}
				if(empty($mobile))
				{
					$err['mobile'] = 'Enter mobile';
				}
				else if(strlen($mobile) < 7)
				{
					$err['mobile'] = 'Wrong mobile';
				}
				if(empty($message)) $err['message'] = 'Enter message';		
				
				//if(!empty($name) && !empty($email) && !empty($mobile) && !empty($message))
				if (empty($err))
				{
					$to = 'mas4it@gmail.com';
					//$to = 'info@malbraychemicals.comm';
					$subject = 'Email contact us: '.$email;
					$from = $email;

					$date = date('Y-m-d h:i');
					$html_msg = '';
					$html_msg .= '<table width="700" border="1" align="center" dir="ltr">';
					$html_msg .= '<tr>';
					$html_msg .= '<td colspan="2" bgcolor="#CCCCCC"><div align="center">Contact us</div></td>';
					$html_msg .= '</tr>';
					
					$html_msg .= '<tr>';
					$html_msg .= '<td width="178" align="right" style="text-align:left"  valign="top">Date</td>';
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
					//echo $html_msg;
					
					if(send_mail($to, $from, $subject, $html_msg))
					{
						echo 'We got your message, we will contact you shortly';
					}
					else
					{
						echo '<span class="error">Please try again</span>';
					}
				}
				else
				{
					//$err_msg = current($err);
					echo '<span class="error">'.current($err).'</span>';
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


function checkEmail($email) {
   if ( strpos($email, '@') !== false ) {
      $split = explode('@', $email);
      return (strpos($split['1'], '.') !== false ? true : false);
   }
   else {
      return false;
   }
}
	
	
?>