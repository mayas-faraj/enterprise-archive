<?php
global $bookingultrapro, $bup_reminders;

?>

<form method="post" action="">
<input type="hidden" name="update_settings" />
<input type="hidden" name="update_bup_reminders" id="update_bup_reminders" value="bup_reminders" />



<div class="bup-ultra-sect ">



<div class="bup-sect  ">
  <h3><?php _e("Evening reminder to customer about next day appointment (requires cron setup)",'bookingup'); ?> <span class="bup-main-close-open-tab"><a href="#" title="<?php _e('Close','bookingup'); ?>" class="bup-widget-home-colapsable" widget-id="1"><i class="fa fa-sort-asc" id="bup-close-open-icon-1"></i></a></span></h3>
  
<div class="bup-sect bp-messaging-hidden" id="bup-main-cont-home-1" style="display:inline">  

  <table class="form-table">
<?php 

	$bookingultrapro->buupadmin->create_plugin_setting(
                'checkbox',
                'notifications_sms_reminder_1',
                __('Send SMS Reminder To Customer','bookingup'),
                '1',
                __('Click to activate the SMS Reminders','bookingup'),
                __('Click to activate the SMS Reminders','bookingup')
        ); 
		
		
		$data_time = array(
		 				'0' => '00:00',
                        '1' =>'01:00',
                        '2' => '02:00',
                        '3' => '03:00',
                        '4' => '04:00',
                        '5' =>'05:00',                       
                        '6' =>'06:00',
						 '7' =>'07:00',
						  '8' =>'08:00',
						   '9' =>'09:00',
						    '10' =>'10:00',
							 '11' =>'11:00',
							  '12' =>'12:00',
							   '13' =>'13:00',
							    '14' =>'14:00',
								 '15' =>'15:00',
								  '16' =>'16:00',
								   '17' =>'17:00',
								    '18' =>'18:00',
									'19' =>'19:00',
									'20' =>'20:00',
									'21' =>'21:00',
									'22' =>'22:00',
									'23' =>'23:00'
									
					
                       
      );
					
	  
	$bookingultrapro->buupadmin->create_plugin_setting(
            'select',
            'notifications_sms_reminder_at',
            __('Sending time:','bookingup'),
            $data_time,
            __('Set the time you want the notification to be sent.','bookingup'),
            __('Set the time you want the notification to be sent.','bookingup')
    );
	
		
?>
</table>    
   <table class="form-table">

<?php 

$bookingultrapro->buupadmin->create_plugin_setting(
        'textarea',
        'email_sms_body_reminder_customer_1',
        __('Message','bookingup'),array(),
        __('Note: for long messages that are greater than 160 characters (80 for Unicode), they will be sent as multiple message segments and reassembled at the other end so the user sees them as a single message. Each message segment will be charged as a unique message.','bookingup'),
        __('Here you can set your custom messsage. PLEASE NOTE: HTML format is not avaialbe for SMS messages.','bookingup')
);


?>

<tr>

<th></th>
<td><input type="button" value="<?php _e('RESTORE DEFAULT TEMPLATE','bookingup'); ?>" class="bup_restore_template button" b-template-id='email_sms_body_reminder_customer_1'></td>

</tr>	

</table> 


</div>

</div>  
   

             

</div>

<p class="submit">
	<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php _e('Save Changes','bookingup'); ?>"  />
	
</p>

</form>



</form>





