<?php
global $bookingultrapro, $bup_staff_profile;

?>

<form method="post" action="">
<input type="hidden" name="update_settings" />

<input type="hidden" name="update_bup_slugs" id="update_bup_slugs" value="bup_slugs" />



<div class="bup-ultra-sect ">

 <h3><?php _e('Booking Ultra Staff Profile Pages','bookingup'); ?></h3>
        
              <p><?php _e('Here you can set your custom pages for the staff profiles.','bookingup'); ?></p>
        
  <table class="form-table">
<?php 

$bookingultrapro->buupadmin->create_plugin_setting(
            'select',
            'profile_page_id',
            __('Staff Profile Page','bookingup'),
            $bookingultrapro->buupadmin->get_all_sytem_pages(),
            __('Make sure you have the <code>[bup_profile]</code> shortcode on this page.','bookingup'),
            __('This page is where users will view their own profiles, or view other user profiles from the member directory if allowed.','bookingup')
    );
	
	$bookingultrapro->buupadmin->create_plugin_setting(
            'select',
            'bup_my_account_page',
            __('My Account Page','bookingup'),
            $bookingultrapro->buupadmin->get_all_sytem_pages(),
            __('Make sure you have the <code>[bup_account]</code> shortcode on this page.','bookingup'),
            __('This page is where users and staff members will be able to manage their appointments.','bookingup')
    );
	
	$bookingultrapro->buupadmin->create_plugin_setting(
            'select',
            'bup_user_login_page',
            __('Users Login Page','bookingup'),
            $bookingultrapro->buupadmin->get_all_sytem_pages(),
            __('Make sure you have the <code>[bupro_user_login]</code> shortcode on this page.','bookingup'),
            __('This page is where users and staff members & clients will be able to recover to login to their accounts.','bookingup')
    );
	
	
		$bookingultrapro->buupadmin->create_plugin_setting(
            'select',
            'bup_password_reset_page',
            __('Password Recover Page','bookingup'),
            $bookingultrapro->buupadmin->get_all_sytem_pages(),
            __('Make sure you have the <code>[bupro_user_recover_password]</code> shortcode on this page.','bookingup'),
            __('This page is where users and staff members will be able to recover their passwords.','bookingup')
    );
	
	
			
	$bookingultrapro->buupadmin->create_plugin_setting(
	'select',
	'hide_admin_bar',
	__('Hide WP Admin Tool Bar?','bookingup'),
	array(
		0 => __('NO','bookingup'), 		
		1 => __('YES','bookingup')),
		
	__('If checked, User will not see the WP Admin Tool Bar','bookingup'),
  __('If checked, User will not see the WP Admin Tool Bar','bookingup')
       );
	   
	 $bookingultrapro->buupadmin->create_plugin_setting(
	'select',
	'allow_client_to_update_info',
	__('Allow Clients to modify Appointment Details?','bookingup'),
	array(
		1 => __('YES','bookingup'), 		
		0 => __('NO','bookingup')),
		
	__('If YES, User will be able to update the appointment details','bookingup'),
  __('If YES, User will be able to update the appointment details','bookingup')
       );
	   
	    $bookingultrapro->buupadmin->create_plugin_setting(
        'input',
        'allow_client_message_to_update',
        __('Message Displayed If NOT allowed:','bookingup'),array(), 
        __('Input the text you would like to display clients if they are not allowed to modify the appointment details.','bookingup'),
        __('Input the text you would like to display clients if they are not allowed to modify the appointment details.','bookingup')
);
	   
	   
		
?>
</table>      
   

             

</div>

<p class="submit">
	<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php _e('Save Changes','bookingup'); ?>"  />
	
</p>

</form>


<form method="post" action="">
<input type="hidden" name="update_settings" />

<div class="bup-ultra-sect ">

 <h3><?php _e('Google Map','bookingup'); ?></h3>
        
              <p><?php _e('Here you can set the Map Location which will be displayed on the staff profile. Please note, you will need to create an API Key on Google Console','bookingup'); ?></p>
        
  <table class="form-table">
<?php 

	   
	 $bookingultrapro->buupadmin->create_plugin_setting(
	'select',
	'google_map_profile_active',
	__('Allow Google Map API?','bookingup'),
	array(
		1 => __('YES','bookingup'), 		
		0 => __('NO','bookingup')),
		
	__('If checked, User will see the Google Map on the Location Tab. <strong>PLEASE NOTE:</strong> The user must to fill out Country, City and Address fields','bookingup'),
  __('If checked, User will see the Google Map on the Location Tab','bookingup')
       );
	   
	  $bookingultrapro->buupadmin->create_plugin_setting(
        'input',
        'google_api_key',
        __('Google API Key:','bookingup'),array(), 
        __('Enter your Google API Key. You can get your API by clicking <a href="https://console.developers.google.com/flows/enableapi?apiid=maps_backend,geocoding_backend,directions_backend,distance_matrix_backend,elevation_backend,places_backend&reusekey=true" target="_blank">here </a> <br><br> PLEASE NOTE: You will need a Google Developer Account.<br><br> READ INSTRUCTIONS: Find out how to get your REST API key by cliking <a href="http://doc.bookingultrapro.com/google-map-calendar-integration/" target="_blank">here </a>','bookingup'),
        __('Enter your Google API Key.','bookingup')
);



		
?>
</table>      
   

             

</div>

<p class="submit">
	<input type="submit" name="submit_d" id="submit_d" class="button button-primary" value="<?php _e('Save Changes','bookingup'); ?>"  />
	
</p>

</form>





