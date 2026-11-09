<?php
class BookingUltraProComplement
{
	public $classes_array = array();
	
	
		
	public function __construct()
	{
		
		global $bookingultrapro;
		$this->load_core();	
		
		$this->db_module();
				
	
    }
	
	public function load_core() 
	{	
		
		/*Load Amin Classes*/		
		if (is_admin()) 
		{
			$this->set_admin_classes();
			$this->load_classes();					
		
		}else{
			
			/*Load Main classes*/
			$this->set_main_classes();
			$this->load_classes();
			
		
		}
		
				
			
	}
	
	public function plugin_init() 
	{
		global $bookingultrapro;	
		
		if(isset($bookingultrapro))
		{		
			
		
		}
		
		add_action('wp_enqueue_scripts', array(&$this, 'add_scripts'), 15);	
			
		add_action('bup_mycronjob_sms', array(&$this, 'bup_automated_reminders_status_function'),12);
		add_filter( 'cron_schedules',   array(&$this, 'bup_add_cron_recurrence_interval') );			
		add_action('wp', array(&$this, 'bup_schedule_events_activation'));	
		add_action('init', array(&$this, 'bup_schedule_events_activation'));		
			
	}
	
	public function db_module()
	{
		global $wpdb;	   
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_notifications (
				`noty_id` bigint(20) NOT NULL auto_increment,
				`noty_booking_id` int(11) NOT NULL,
				`noty_type`  varchar(60) NOT NULL,
				`noty_phone`  varchar(300) NOT NULL DEFAULT "0",		
				`noty_date` date NOT NULL,										
				PRIMARY KEY (`noty_id`)
			) COLLATE utf8_general_ci;';

		   $wpdb->query( $query );	
		
	}
	
	
	
	
	function bup_schedule_events_activation()
	{
		global $wpdb, $bookingultrapro;
		
		//is the right hour to run the cronjob
		if ( ! wp_next_scheduled( 'bup_mycronjob_sms' ) ) 
		{
			wp_schedule_event( time(), 'every_30_minutes', 'bup_mycronjob_sms' );
		}
			
	
	}
	
	function bup_add_cron_recurrence_interval( $schedules ) {
 
		$schedules['every_three_minutes'] = array(
				'interval'  => 180,
				'display'   => __( 'Every 3 Minutes', 'bookingup' )
		);
	 
		$schedules['every_fifteen_minutes'] = array(
				'interval'  => 900,
				'display'   => __( 'Every 15 Minutes', 'bookingup' )
		);  
		
		$schedules['every_30_minutes'] = array(
				'interval'  => 1800,
				'display'   => __( 'Every 30 Minutes', 'bookingup' )
		); 
		
		$schedules['every_60_minutes'] = array(
				'interval'  => 3600,
				'display'   => __( 'Every 1 Hour', 'bookingup' )
		); 
     
    	return $schedules;
	}

	
	
	//this handle the status events	for the ticket
	function bup_automated_reminders_status_function()
	{
		global $wpdb, $bookingultrapro;		
		
		$p = get_option('bup_c_key');
		$token = $bookingultrapro->get_option('sms_bup_token_id');
		$account_id = $bookingultrapro->get_option('sms_bup_account_id');	
			
				
		$domain = $_SERVER['SERVER_NAME'];		
		$server_add = $_SERVER['SERVER_ADDR'];				
		$url = bup_sms_api."index.php";							
		
		if( $bookingultrapro->get_option('notifications_sms_reminder_1')=='1' && $token!='' && $p!='' && $account_id!=''){ //is active this option
		
			$hour_to_send_notification = $bookingultrapro->get_option('notifications_sms_reminder_at');
			if($hour_to_send_notification ==''){$hour_to_send_notification =18;}
			
			//is the right hour to run the cronjob
			$current_hour = date( 'G', current_time( 'timestamp', 0 ) );
			
			if($current_hour >=$hour_to_send_notification){				
				
				$ini_date = date( 'Y-m-d ', current_time( 'timestamp', 0 ) );
				$date=  date("Y-m-d", strtotime("$ini_date + 1 day"));
				
				$sql =  'SELECT  appo.*, usu.* FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";					
				$sql .= " WHERE DATE(appo.booking_time_from) = '".$date."' AND usu.ID = appo.booking_staff_id AND  appo.booking_status = '1' ";
			    
				$sql .= " AND NOT EXISTS (".'SELECT  noty.* FROM ' . $wpdb->prefix . 'bup_notifications noty'." WHERE noty.noty_type='sms_reminder'  
				          AND noty.noty_date  = '".$date."' 
						  AND appo.booking_id = noty.noty_booking_id) ";
			
				
				$appointments = $wpdb->get_results($sql );
				
				if ( !empty( $appointments ) )
				{
					
					$send_notification_to_admin = $bookingultrapro->get_option('notifications_sms_reminder_admin');
					
					if($send_notification_to_admin=='yes'){
						
						$bookingultrapro->messaging->custom_email_message( "some appointments tomorrow", "Cronjob Called There are appointments");	
					}
					foreach ( $appointments as $appointment )
					{
											
						//get user				
						$staff_member = get_user_by( 'id', $appointment->booking_staff_id );
						$client = get_user_by( 'id', $appointment->booking_user_id );
						//service			
				   		$service = $bookingultrapro->service->get_one_service($appointment->booking_service_id );				
						
						$phone =  get_user_meta( $appointment->booking_user_id, 'reg_telephone_code', true ); 
						$phone_prefix = get_user_meta( $appointment->booking_user_id, 'reg_telephone_prefix', true );						
						$text_message = $this->get_formated_sms_reminder($staff_member, $client, $service, $appointment);
							
						$response = wp_remote_post(
							$url,
							array(
								'body' => array(
									'd'   => $domain,
									'server_ip'     => $server_add,
									'sial_key' => $p,
									'number' => $phone,
									'prefix' => $phone_prefix,
									'text' => $text_message,
									'token' => $token,
									'account_id' => $account_id,
									'action' => 'smsreminder',
									
								)
							)
						);			
						
						$response = json_decode($response["body"]);
						
						$message =$response->{'message'}; 
						$result =$response->{'result'}; 
						$expiration =$response->{'expiration'};
						$serial =$response->{'serial'};
						
						if($result=='sent')
						{
							//add as notifiedd						
							$this->add_sms_to_notification($appointment->booking_id,'sms_reminder', $phone, $date);
							
						}elseif($result=='failed'){
							
						}elseif($result=='invalid_key'){
							
						
						}
					
					} //end while
					
			
			} //end not empy there are no appointmen
				
				
			}
		
		}
		
	
	}
	
	public function add_sms_to_notification($noty_booking_id, $noty_type, $noty_phone, $noty_date)
	{
		global $wpdb;		
		
		$new_record = array(
						'noty_id'        => NULL,
						'noty_booking_id' => $noty_booking_id,
						'noty_type' => $noty_type,
						'noty_phone' => $noty_phone,
						'noty_date' => $noty_date
						
					);
					
		$wpdb->insert( $wpdb->prefix . 'bup_notifications', $new_record, array( '%d', '%s', '%s' , '%s', '%s'));
						
	}
	
	//--- Bank Payment
	public function  get_formated_sms_reminder($staff_member, $client, $service, $appointment )
	{
		
		global $bookingultrapro;
		
		
		$admin_email =get_option('admin_email'); 
		$company_name = $bookingultrapro->get_option('company_name');
		$company_phone = $bookingultrapro->get_option('company_phone');
		$company_address = $bookingultrapro->get_option('company_address');
		$currency = $bookingultrapro->get_option('currency_symbol');
		
		
		
		$time_format = $bookingultrapro->service->get_time_format();		
		$booking_time = date($time_format, strtotime($appointment->booking_time_from ))	;	
			
		$booking_day = $bookingultrapro->commmonmethods->formatDate($appointment->booking_time_from);
		
		//get templates	
		$template_client =stripslashes($bookingultrapro->get_option('email_sms_body_reminder_customer_1'));
		
		$site_url =site_url("/");		
		//get meta data		
		$phone = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'telephone');
		$special_notes = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'special_notes');
		
		//get location		
		$appointment_location = $this->get_booking_location($appointment);

		
		//client		
		$template_client = str_replace("{{bup_client_name}}", $client->display_name,  $template_client);
		$template_client = str_replace("{{bup_client_phone}}", $phone,  $template_client);
		
		$template_client = str_replace("{{bup_booking_service}}", $service->service_title,  $template_client);
		$template_client = str_replace("{{bup_booking_time}}", $booking_time,  $template_client);	
		$template_client = str_replace("{{bup_booking_date}}", $booking_day,  $template_client);
		$template_client = str_replace("{{bup_booking_staff}}", $staff_member->display_name,  $template_client);
		
		$template_client = str_replace("{{bup_booking_location}}", $appointment_location,  $template_client);	
		$template_client = str_replace("{{bup_company_address}}", $company_address,  $template_client);
		
		$template_client = str_replace("{{bup_company_name}}", $company_name,  $template_client);
		$template_client = str_replace("{{bup_company_phone}}", $company_phone,  $template_client);
		$template_client = str_replace("{{bup_company_url}}", $site_url,  $template_client);
		
		//parse custom fields
		$template_client = $bookingultrapro->messaging->parse_custom_fields($template_client, $appointment );		
		$template_client = preg_replace(array('/\r/', '/\n/'), '', $template_client);; 
								
		return strip_tags($template_client);
					
		
	}
	
	public function get_booking_location($appointment)
	{
		
		global $bookingultrapro;
		
		$filter_id = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'filter_id');					
		$filter_n = $bookingultrapro->appointment->get_booking_location($filter_id);
		$filter_name=$filter_n->filter_name;
		
		return $filter_name;
					
	
	}
	
 
	public function set_main_classes()
	{
		 $this->classes_array = array("payment" =>"bup.complement.payment.class",
		 
		 "note" =>"bup.complement.note.class",
		  "newsletter" =>"bup.complement.newslettertool",
		  "stripe" =>"bup.complement.stripe.class",
		   "aweber" =>"bup.complement.aweber.class",
		    "location" =>"bup.complement.location.class",
			 "dayoff" =>"bup.complement.dayoff.class",
			  "googlecalendar" =>"bup.complement.googlecalendar.class",
			   "authorize" =>"bup.complement.authorize.class",
			    "profile" =>"bup.complement.profile.class"); 	
	
	}
	
	public function set_admin_classes()
	{
				 
		 $this->classes_array = array("payment" =>"bup.complement.payment.class",
		 
		 "note" =>"bup.complement.note.class",
		 "newsletter" =>"bup.complement.newslettertool",
		 "stripe" =>"bup.complement.stripe.class",
		  "aweber" =>"bup.complement.aweber.class",
		  "location" =>"bup.complement.location.class",
		  "dayoff" =>"bup.complement.dayoff.class",
		   "googlecalendar" =>"bup.complement.googlecalendar.class",
		   "authorize" =>"bup.complement.authorize.class",
		   "profile" =>"bup.complement.profile.class"); 	
		 
		
	}
	
	public function add_scripts()
	{
		global  $bookingultrapro;
		
		//echo "add scripts";
		
		if($bookingultrapro->get_option('gateway_stripe_active')=='1')	
		{
						
			/*Users JS*/		
			wp_register_script( 'bupcopm_stipe_js', 'https://js.stripe.com/v2/',array('jquery'),  null);
			wp_enqueue_script('bupcopm_stipe_js');
			
			wp_register_script( 'bup_stripe_js', bookingup_comp_url.'js/bup-stripe.js', array( 
			'jquery') );
			wp_enqueue_script( 'bup_stripe_js' );
			
			$keys = $this->stripe->get_stripe_keys();
			
			wp_localize_script( 'bup_stripe_js', 'bup_stripe_vars', array(
            'publishable_key'     => $keys['publishable_key']
            
            
        		) ); 	
		
		}
		
		if($bookingultrapro->get_option('gateway_authorize_active')=='1')	
		{			
			wp_register_script( 'bup_authorize_js', bookingup_comp_url.'js/bup-authorize.js', array( 
			'jquery') );
			wp_enqueue_script( 'bup_authorize_js' );
			
		}
		 
		
	}
	
	public function get_all_locations_front_booking ()
	{
		global $wpdb;
				
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_filters ORDER BY filter_name ' ;								
		$rows = $wpdb->get_results($sql);
			
		$selected ='';

		
		$count = 0;
		
		$html = '';		
		$html .= '<select name="bup-filter-id" id="bup-filter-id">';
		$html .= '<option value="" selected="selected" >'.__('Select Location', 'bookingup').'</option>';
				
		if (!empty($rows))
		{
			
			foreach($rows as $filter) 
			{
				
		
				$html .= '<option value="'.$filter->filter_id.'" '.$selected.'>'.$filter->filter_name.'</option>';
				
				
			}
			$html .= '</select>';
					
		
		}
		
		return $html;
		
				
	}
	
	
	
	
	
	
	function load_classes() 
	{	
		
		foreach ($this->classes_array as $key => $class) 
		{
			if (file_exists(bookingup_comp_path."classes/$class.php")) 
			{
				require_once(bookingup_comp_path."classes/$class.php");
						
					
			}
				
		}	
	}
	

}
?>