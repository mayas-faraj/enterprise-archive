<?php
global $bookingultrapro, $bup_reminders;

?>

<form method="post" action="">
<input type="hidden" name="update_settings" />
<input type="hidden" name="update_bup_reminders" id="update_bup_reminders" value="bup_reminders" />



<div class="bup-ultra-sect ">



<div class="bup-sect  ">
  <h3><?php _e("SMS Settings",'bookingup'); ?> <span class="bup-main-close-open-tab"><a href="#" title="<?php _e('Close','bookingup'); ?>" class="bup-widget-home-colapsable" widget-id="1"><i class="fa fa-sort-asc" id="bup-close-open-icon-1"></i></a></span></h3>
  <p><?php _e("You can learn how to setup your SMS Reminders module by clicking on the following link.",'bookingup'); ?> <a href="http://doc.bookingultrapro.com/how-to-set-up-sms-on-your-account/"><?php _e('Click here','bookingup'); ?></a></p>
<div class="bup-sect bp-messaging-hidden" id="bup-main-cont-home-1" style="display:inline">  

  <table class="form-table">
<?php 
 
	    $bookingultrapro->buupadmin->create_plugin_setting(
        'input',
        'sms_bup_account_id',
        __('Your BUP Account ID:','bookingup'),array(), 
        __('Input your BUP account number.','bookingup'),
        __('Input your BUP account number.','bookingup')
);


 $bookingultrapro->buupadmin->create_plugin_setting(
        'input',
        'sms_bup_token_id',
        __('Your SMS Token:','bookingup'),array(), 
        __("This can be found on your Booking Ultra Pro Account.",'bookingup'),
        __('This can be found on your Booking Ultra Pro Account.','bookingup')
);	
		
?>
</table>    
 

</div>

</div>  
   

             

</div>

<p class="submit">
	<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php _e('Save Changes','bookingup'); ?>"  />
	
</p>

</form>



</form>





