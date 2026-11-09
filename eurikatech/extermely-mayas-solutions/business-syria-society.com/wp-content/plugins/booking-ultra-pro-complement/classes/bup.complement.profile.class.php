<?php
class BupComplementProfile
{
	
		
	public function __construct()
	{
		
		$this->current_page = $_SERVER['REQUEST_URI'];
		
		add_action( 'init',   array(&$this,'profile_shortcodes'));	
		add_action( 'init', array($this, 'handle_init' ) );
		add_action('wp_enqueue_scripts', array(&$this, 'add_front_end_styles'), 11);
		
		add_action( 'wp_ajax_bup_confirm_reset_password', array( $this, 'confirm_reset_password' ));		
		add_action( 'wp_ajax_nopriv_bup_confirm_reset_password', array( $this, 'confirm_reset_password' ));
		
		add_action( 'wp_ajax_bup_confirm_reset_password_user', array( $this, 'confirm_reset_password_user' ));
		add_action( 'wp_ajax_bup_confirm_update_email_user', array( $this, 'confirm_update_email_user' ));		
		add_action( 'wp_ajax_bup_update_personal_data_profile', array( $this, 'update_personal_data_profile' ));	
		
		add_action( 'wp_ajax_bup_ajax_upload_avatar_staff', array( &$this, 'bup_ajax_upload_avatar' ));
		add_action( 'wp_ajax_bup_crop_avatar_user_profile_image_staff', array( &$this, 'bup_crop_avatar_user_profile_image' ));
		
		add_action( 'wp_ajax_bup_delete_user_avatar_staff', array( &$this, 'delete_user_avatar' ));
		
		add_action( 'wp_ajax_bup_check_adm_availability_sfaff',  array( &$this, 'bup_check_adm_availability_sfaff' ));
		add_action( 'wp_ajax_bup_appo_get_selected_time_staff',  array( &$this, 'bup_appo_get_selected_time_staff' ));
		
		add_action( 'wp_ajax_bup_re_schedule_confirm_staff',  array( &$this, 're_schedule_confirm' ));
		add_action( 'wp_ajax_bup_update_business_hours_by_staff',  array( &$this, 'update_staff_business_hours' ));
		add_action( 'wp_ajax_bup_add_one_special_schedule_staff',  array( &$this, 'add_one_special_schedule' ));
		add_action( 'wp_ajax_bup_get_special_schedule_list_staff',  array( &$this, 'get_special_schedule_list' ));
		add_action( 'wp_ajax_bup_delete_spec_schedule_by_staff',  array( &$this, 'delete_special_schedule' ));
		
		add_action( 'wp_ajax_bup_get_break_add_staff',  array( &$this, 'get_break_add_frm' ));
		add_action( 'wp_ajax_bup_break_add_confirm_staff',  array( &$this, 'break_add_confirm' ));
		add_action( 'wp_ajax_bup_get_current_staff_breaks_staff',  array( &$this, 'get_current_staff_breaks' ));
		add_action( 'wp_ajax_bup_delete_break_staff',  array( &$this, 'delete_break' ));
		
		add_action( 'wp_ajax_bup_delete_appointment_staff', array( &$this, 'bp_delete_appointment_ajax' ));

		
		add_action( 'wp_ajax_bup_dayoff_add_confirm_staff', array( &$this, 'add_one_day_off' ));
		add_action( 'wp_ajax_bup_get_daysoff_by_staff', array( &$this, 'get_staff_daysoff_list' ));
		add_action( 'wp_ajax_bup_delete_dayoff_by_staff', array( &$this, 'delete_day_off' ));
		
		add_action( 'wp_ajax_bup_update_booking_info_by_staff', array( &$this, 'bup_update_booking_info' ));
		
		add_action( 'wp_ajax_bup_appointment_status_options_staff', array( &$this, 'get_appointment_status_options' ));
		add_action( 'wp_ajax_bup_update_appo_status_ed_staff', array( &$this, 'update_appointment_status_ed' ));	
		
		add_action( 'wp_ajax_bup_staff_note_confirm', array( &$this, 'bup_staff_note_confirm' ));
		add_action( 'wp_ajax_bup_get_notes_list_by_staff', array( &$this, 'appointment_get_notes_list' ));		
		add_action( 'wp_ajax_bup_delete_note_by_staff', array( &$this, 'bup_delete_note' ));
		add_action( 'wp_ajax_bup_get_note_form_by_staff', array( &$this, 'bup_get_form' ));
		
		add_action( 'wp_ajax_bup_set_default_google_calendar', array( &$this, 'set_default_google_calendar' ));
		
		add_action( 'wp_ajax_bup_disconnect_user_gcal_staff', array( &$this, 'disconnect_user_gcal' ));
		add_action( 'wp_ajax_bup_update_staff_services', array( &$this, 'update_staff_services' ));
		add_action( 'wp_ajax_bup_get_payment_form_staff', array( &$this, 'bup_get_payment_form' ));
		
		add_action( 'wp_ajax_bup_send_welcome_email_to_staff', array( &$this, 'send_welcome_email_to_staff' ));
		add_action( 'wp_ajax_bup_add_payment_to_appointment_confirm', array( &$this, 'add_payment_to_appointment_confirm' ));
		
		add_action( 'wp_ajax_bup_get_payments_list_staff', array( &$this, 'appointment_get_payments_list' ));

		
		
		
		
		
	
		/* Remove bar except for admins */
		add_action('init', array(&$this, 'remove_admin_bar'), 9);
		
	
    }
	
	function handle_init() 
	{
		
		/*Form is fired*/
		if (isset($_POST['bup-client-form-confirm'])) {
						
			/* Prepare array of fields */
			$this->prepare( $_POST );
			
			// Setting default to false;
			$this->errors = false;
			
			/* Validate, get errors, etc before we login a user */
			$this->handle();

		}
		
		/*Form reset password*/
		if (isset($_POST['bup-client-recover-pass-form-confirm'])) {						
					
			// Setting default to false;
			$this->errors = false;
			
			/* Validate, get errors, etc before we login a user */
			$this->handle_password_reset();

		}
		
				
	}
	
	function remove_admin_bar() 
	{
		
		global  $bookingultrapro;
		
		if (!current_user_can('manage_options') && !is_admin())
		{
			
			if ($bookingultrapro->get_option('hide_admin_bar')==1) 
			{
				
				show_admin_bar(false);
			}
		}
	}
	
	
	/* front styles */
	public function add_front_end_styles_profile_template()
	{
		global $wp_locale;
		
		$path = get_template_directory_uri();			
		/* Custom style */		
		wp_register_style('bup_profile_style_profile', $path.'/bupro/profile.css',null,null);
		wp_enqueue_style('bup_profile_style_profile');
		
			
	}
	
	/* front styles */
	public function add_front_end_styles_profile()
	{
		global $wp_locale;
	
		/* Custom style */		
		wp_register_style('bup_profile_style_profile', bookingup_comp_url.'templates/profile.css',null,null);
		wp_enqueue_style('bup_profile_style_profile');			
	}
	
	
	/* front styles */
	public function add_front_end_styles_staff_list_template()
	{
		global $wp_locale;
		
		$path = get_template_directory_uri();			
		/* Custom style */		
		wp_register_style('bup_profile_style_staff_list', $path.'/bupro/staff_list.css',null,null);
		wp_enqueue_style('bup_profile_style_staff_list');		
				
	}
	
	/* front styles */
	public function add_front_end_styles_staff_list()
	{
		global $wp_locale;
	
		/* Custom style */		
		wp_register_style('bup_profile_style_staff_list', bookingup_comp_url.'templates/staff_list.css',null,null);
		wp_enqueue_style('bup_profile_style_staff_list');		
		
				
	}
	
	/* front styles */
	public function add_front_end_styles()
	{
		global $wp_locale, $bookingultrapro;;
		
		$theme_path = get_template_directory();	
	
		/* Custom style */		
		wp_register_style('bup_profile_style', bookingup_comp_url.'templates/user-account-styles.css',null,null);
		wp_enqueue_style('bup_profile_style');
		
		/*Add syles - Profile */			
		if(file_exists($theme_path."/bupro/profile.php"))
		{
			$this->add_front_end_styles_profile_template();			
		
		}else{
						
			$this->add_front_end_styles_profile();			
		}
		
		/*Add syles - Staff List */			
		if(file_exists($theme_path."/bupro/staff_list.php"))
		{
			$this->add_front_end_styles_staff_list_template();			
		
		}else{
						
			$this->add_front_end_styles_staff_list();			
		}
		
		
		$date_picker_format = $bookingultrapro->get_date_picker_format();
		
		wp_register_script( 'bup_profile_js', bookingup_comp_url.'js/bup-profile.js', array( 
			'jquery'),null );
		wp_enqueue_script( 'bup_profile_js' );
		
		 wp_localize_script( 'bup_profile_js', 'bup_profile_v98', array(
            'msg_wait_cropping'  => __( 'Please wait ...', 'bookingup' ) ,
			'msg_wait'  => __( '<img src="'.bookingup_comp_url.'/templates/images/loaderB16.gif" width="16" height="16" /> &nbsp; Please wait ... ', 'bookingup' ) ,
			
			'msg_make_selection'  => __( 'You must make a selection first', 'bookingup' ) ,
			'msg_wait_reschedule'  => __( 'Please wait ...', 'bookingup' ) ,
			
			'err_message_time_slot'  => __( 'Please select a slot!', 'bookingup' ) ,
			'err_message_service'  => __( 'Please select a service', 'bookingup' ) ,
			'err_message_start_date'  => __( 'Please select a date', 'bookingup' ) ,
			'are_you_sure'     => __( 'Are you sure?',     'bookingup' ),			
			'err_message_note_title'  => __( 'Please input a title', 'bookingup' ) ,
			'err_message_note_text'  => __( 'Please write a message', 'bookingup' ),
			
			'err_message_payment_amount'  => __( 'Please input an amount', 'bookingup' ) ,
			'err_message_payment_date'  => __( 'Please set a date', 'bookingup' ),
			
			'message_delet_note_conf'  => __( 'Are you sure?', 'bookingup' ) ,
			'message_profile_display_name'  => __( 'Please type a Display Name for your Profile', 'bookingup' ),			             'bb_date_picker_format'     => $date_picker_format                
            
        ) );
		
		
		//localize our js
		$date_picker_array = array(
					'closeText'         => __( 'Done', "bookingup" ),
					'currentText'       => __( 'Today', "bookingup" ),
					'prevText' =>  __('Prev',"bookingup"),
		            'nextText' => __('Next',"bookingup"),				
					'monthNames'        => array_values( $wp_locale->month ),
					'monthNamesShort'   => array_values( $wp_locale->month_abbrev ),
					'monthStatus'       => __( 'Show a different month', "bookingup" ),
					'dayNames'          => array_values( $wp_locale->weekday ),
					'dayNamesShort'     => array_values( $wp_locale->weekday_abbrev ),
					'dayNamesMin'       => array_values( $wp_locale->weekday_initial ),					
					// get the start of week from WP general setting
					'firstDay'          => get_option( 'start_of_week' ),
					// is Right to left language? default is false
					'isRTL'             => $wp_locale->is_rtl(),
				);
				
				
		wp_localize_script('bup_profile_js', 'BUPDatePicker', $date_picker_array);
		
	}
	
	public function get_logout_url ()
	{
		
		/*$defaults = array(
		            'redirect_to' => $this->current_page
		    );
		$args = wp_parse_args( $args, $defaults );
		
		extract( $args, EXTR_SKIP );*/
		
		$redirect_to = $this->current_page;
			
		return wp_logout_url($redirect_to);
	}
	
	
	public function update_staff_services()
	{
		global $wpdb, $bookingultrapro, $bupcomplement;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$service_list = array();
		$modules = $_POST["service_list"]; 		
		
		//delete all services from this staff member
		if($staff_id!='')
		{
			$this->delete_staff_services($staff_id);
		}
		
		if($modules!="" && $staff_id!='')
		{
			$modules =rtrim($modules,"|");
			$service_list = explode("|", $modules);
			
						
			foreach($service_list as  $service)
			{
				$details = explode("-", $service);
				
			
				$service_id = $details[0];
				$service_price= $details[1];
				$service_qty= $details[2];
				
				//add in db				
				$this->assign_staff_services($staff_id, $service_id, $service_price, $service_qty);
			
			
			}
									
		}	
		
		die();
	
	}
	
	
	
	/******************************************
	Get user by ID, username
	******************************************/
	function get_user_data_by_uri() 
	{
		
		global  $bookingultrapro, $wpdb;	
		
		$u_nick = get_query_var('bup_username');
		
		if($u_nick=="") //permalink not activated
		{
			$u_nick=$this->parse_user_id_from_url();	
			
		}		
		
		
		
		$nice_url_type = 'username';	
		
		if ($nice_url_type == 'ID' || $nice_url_type == '' ) 
		{			
			$user = get_user_by('id',$u_nick);				
			
		}elseif ($nice_url_type == 'username') {			
						
			$user = get_user_by('slug',$u_nick);
		
		}elseif ($nice_url_type == 'user_nicename') {			
						
			$user = get_user_by('slug',$u_nick);
				
		}
		
		$user = get_user_by('slug',$u_nick);
		
		return $user;
	}
	
	
	function get_profile_menu_url($module, $user_id, $withlink = false)
	{
		$permalink = $this->get_user_profile_permalink($user_id);
		$permalink = $permalink.'?tab='.$module;
		
		if($withlink){
			
			$html = '<a href="'.$permalink.'">'.$this->get_tab_legend_link($module).'</a>';
		
		}else{
			
			$html =$permalink;
			
						
		}
		
				
		return $html;
	
	}
	
	function get_tab_legend_link($module)
	{
				
		$html = '';
		
		if($module=='main'){
			
			$html = __( 'OVERVIEW', 'bookingup' );
			
		}elseif($module=='services'){
			
			$html = __( 'SERVICES', 'bookingup' );
		
		}elseif($module=='schedule'){
			
			$html = __( 'SCHEDULE', 'bookingup' );
		
		}elseif($module=='appointment'){
			
			$html = __( 'MAKE AN APPOINTMENT', 'bookingup' );
		
		}elseif($module=='about'){
			
			$html = __( 'ABOUT ME', 'bookingup' );
		
		}
				
		return $html;
	
	}
	
	
	function parse_user_id_from_url()
	{
		$user_id="";
		
		if(isset($_GET["page_id"]) && $_GET["page_id"]>0)
		{
			$page_id = $_GET["page_id"];
			$user_id = $this->extract_string($page_id, '/', '/');
		
		
		}
		
		return $user_id;
	
	}
	
	function extract_string($str, $start, $end)
	{
		$str_low = $str;
		$pos_start = strpos($str_low, $start);
		$pos_end = strpos($str_low, $end, ($pos_start + strlen($start)));
		if ( ($pos_start !== false) && ($pos_end !== false) )
		{
		$pos1 = $pos_start + strlen($start);
		$pos2 = $pos_end - $pos1;
		return substr($str, $pos1, $pos2);
		}
	}
	
	
	public function delete_staff_services($staff_id)
	{
		global $wpdb;
		
		$sql = 'DELETE FROM ' . $wpdb->prefix . 'bup_service_rates  WHERE rate_staff_id="'.(int)$staff_id.'" ';
		$wpdb->query($sql);		
	}
	
	public function assign_staff_services($staff_id, $service_id, $service_price, $service_qty)
	{
		global $wpdb;
		
		
		$new_record = array(
						'rate_id'        => NULL,
						'rate_staff_id' => $staff_id,
						'rate_service_id' => $service_id, 
						'rate_price' => $service_price,
						'rate_capacity'   => $service_qty						
						
						
						
					);
					
		$wpdb->insert( $wpdb->prefix . 'bup_service_rates', $new_record, array( '%d', '%s', '%s', '%s', '%s'));
						
	}
	
	public function bup_get_form () 
	{
		global $wpdb, $bookingultrapro, $bupcomplement;
		
		$html='';	
		
		$note_id = $_POST['payment_id'];
		$appointment_id = $_POST['appointment_id'];
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{					
					
			$status_pending ='';
			$status_confirmed ='';
			
			if($note_id!='' && $appointment_id!='')		
			{
				//get note			
				$note = $bookingultrapro->order->get_order_edit( $payment_id , $appointment_id);
				
				
				$order_amount =	$order->order_amount;
				$order_txt_id =	$order->order_txt_id;			
				
			}			
				
			$html .= '<p>'.__('Title:','bookingup').'</p>' ;	
			$html .= '<p><input type="text" id="bup_note_title" value="'.$order_amount.'"></p>' ;
			$html .= '<p>'.__('Text:','bookingup').'</p>' ;	
			$html .= '<p><textarea id="bup_note_text"></textarea></p>' ;		
					
			$html .= '<input type="hidden" id="bup_note_id" value="'.$note_id .'" />' ;
		
		
		} else {
			
			$html .=__("Not Allowed ", 'bookingup');
		
		} 	
		
		
				
		echo $html;		
		die();
	
	}
	
	
	
	public function disconnect_user_gcal()
	{
		global $wpdb, $bookingultrapro, $bupcomplement;	
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		delete_user_meta($staff_id, 'google_cal_access_token');	
		delete_user_meta($staff_id, 'google_calendar_default');		
		
		die();
		
	}
	
	public function set_default_google_calendar()
	{
		
		global $wpdb, $bookingultrapro;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;			
		
		$google_calendar = $_POST['google_calendar'];		
		update_user_meta ($staff_id, 'google_calendar_default', $google_calendar);		
		
		$html =__("Your calendar has been set! ", 'bookingup');
		
		echo $html;
		
		die();
	
	}
	
	public function bup_delete_note()
	{
		
		global $wpdb, $bookingultrapro;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$note_id = $_POST['note_id'];	
		$appointment_id = $_POST['appointment_id'];	
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{		
		
			$query = "DELETE FROM " . $wpdb->prefix ."bup_appointment_notes WHERE note_appointment_id = '".$appointment_id."' AND note_id = '".$note_id."' ";
			$wpdb->query( $query );	
		
		
		} else {
			
			$html .=__("Not Allowed ", 'bookingup');
		
		} 	
		
		die();
	
	}
	
	
	public function appointment_get_notes_list () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';	
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;		
				
		$appointment_id = $_POST['appointment_id'];	
		
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{
			
			$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_appointment_notes  ' ;		
			$sql .= ' WHERE note_appointment_id = "'.$appointment_id.'" ' ;
							
			$notes = $wpdb->get_results($sql);
			
							
							
			if (!empty($notes)){
				
				
				$html .= '<div class="bup-notes-list"> ';           
				$html .= ' <ul>';
			   
				foreach($notes as $note) 
				{
					
					$html .= '<li>';
					
					$html .= '<div class="bup-notes-actions"><a href="#" title="'.__('Delete', 'bookingup').'" class="bup-note-deletion" bup-note-id="'.$note->note_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-remove"> </i> </a>
						<a href="#" title="'.__('Edit', 'bookingup').'" class="bup-note-edit" bup-note-id="'.$note->note_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-pencil"> </i> </a></div>';
						
					$html .= '<a><h3>'.$note->note_title.'</h3><p >'.$note->note_text.'</p></a>';
					$html .='</li>';
					   
				}
				
				$html .= '  </ul> ';        
				$html .= ' </div>';
						
				} else {
				
				$html .='<p>'.__('There are no notes yet.','bookingup').'</p>';
				} 
	
			$html .='     ';
	   
	   
	   } else {
			
			$html .=__("Not Allowed ", 'bookingup');
		
		} 
        
				
		echo $html;		
		die();
	
	}
	
	
	public function bup_staff_note_confirm()
	{
		
		global $wpdb, $bookingultrapro;	
		
		$html='';
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$bup_note_title = $_POST['bup_note_title'];
		$bup_note_text = $_POST['bup_note_text'];	
			
		
		$bup_booking_id = $_POST['bup_booking_id'];	
		$bup_note_id = $_POST['bup_note_id'];
		
		
		if($this->is_my_appointment($bup_booking_id, $staff_id))
		{	
		
			if($bup_booking_id!='' && $bup_note_title!='' && $bup_note_text!='' && $bup_note_id=='')		
			{
						
				$query = "INSERT INTO " . $wpdb->prefix ."bup_appointment_notes (`note_appointment_id`,`note_title`, `note_text`) VALUES ('$bup_booking_id','".$bup_note_title."','".$bup_note_text."' )";
				
				$wpdb->query( $query );
				$html ='OK';
			
			}else{
				
				//$query = "UPDATE " . $wpdb->prefix ."bup_orders  SET `order_txt_id` = '".$bup_payment_transaction."',  `order_status` = '".$bup_payment_status."' ,`order_amount` = '$bup_payment_amount' , `order_date` = '".date('Y-m-d',strtotime($bup_payment_date)) ."' WHERE  `order_booking_id` = '$bup_booking_id' AND `order_ID` = '$bup_payment_id' ";
				
				$wpdb->query( $query );
				$html ='OK';
				
				
			}
		
		}else{
			
			$html .=__("Not Allowed ", 'bookingup');
			
		}
		
		echo $html;
		die();
		
				
	
	}
	
	
	public function update_appointment_status_ed()
	{
		global $wpdb, $bookingultrapro;
		
		$status = $_POST['appointment_status'];
		$appointment_id = $_POST['appointment_id'];
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$is_client  = $this->is_client($staff_id);

		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{
			
			if(!$is_client)
			
			{
		
				$sql = $wpdb->prepare('UPDATE ' . $wpdb->prefix . 'bup_bookings SET booking_status =%d WHERE booking_id=%d AND booking_staff_id =%d ;',array($status,$appointment_id, $staff_id));		
				$results = $wpdb->query($sql);
			
			}else{
				
				$sql = $wpdb->prepare('UPDATE ' . $wpdb->prefix . 'bup_bookings SET booking_status =%d WHERE booking_id=%d AND booking_user_id =%d ;',array($status,$appointment_id, $staff_id));		
				$results = $wpdb->query($sql);
				
			}
			
			
			//change appointment status		
			$appointment = $bookingultrapro->appointment->get_one($appointment_id);		
			$staff_id = $appointment->booking_staff_id;	
			$client_id = $appointment->booking_user_id;	
			$service_id = $appointment->booking_service_id;		
					
			/*Get Service*/			
			$service = $bookingultrapro->service->get_one_service($service_id);		
			$new_status = $bookingultrapro->appointment->get_status_legend($status);					
												 
			//get user				
			$staff_member = get_user_by( 'id', $staff_id );
			$client = get_user_by( 'id', $client_id );					
												
			$bookingultrapro->messaging->send_appointment_status_changed($staff_member, $client, $service, $appointment, $new_status);	
			
			
			$appointment = $bookingultrapro->appointment->get_one($appointment_id);		
			$html = $bookingultrapro->appointment->get_status_legend($appointment->booking_status);
		
		
		}else{
			
			$html .=__("Not Allowed ", 'bookingup');
		}
		
		
		echo $html;
		die();
		
	}
	
	public function appointment_get_payments_list () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';	
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$is_client  = $this->is_client($staff_id);	
				
		//create reservation in reservation table				
		$appointment_id = $_POST['appointment_id'];	
		
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{
		
			$totals = array();	
			
			$orders = $bookingultrapro->order->get_booking_payments($appointment_id ); 		
			$currency = $bookingultrapro->get_option('currency_symbol');		
			$time_format = $bookingultrapro->service->get_time_format();
			
			$totals = $bookingultrapro->order->get_booking_payments_balance($appointment_id );
			$paid = $currency.$totals['confirmed']; 
			$pending = $currency.$totals['pending'];	
			$balance = $currency.$totals['balance'];
			$cost = $currency.$totals['cost'];
			
			if($totals['pending']==0){$class_pending = 'bupendingok'; }else{$class_pending = 'bupending';} 
			
					
			if (!empty($orders)){
				
				
				$html .= '<div class="bup-financial-list"> ';
			   
				$html .= ' <ul>';
				$html .= '<li class="bupaid"><h3>'.__('Service Cost','bookingup').'</h3><p class="bupaid">'.$cost.'</p></li>
				<li class="bupaid"><h3>'.__('Paid','bookingup').'</h3><p class="bupaid">'.$paid.'</p></li>
						  <li class="bupending"><h3>'.__('Pending','bookingup').'</h3><p class="'.$class_pending.'">'.$pending.'</p></li>
						 ';
					
			  $html .= '  </ul> ';
			
			  $html .= ' </div>';		
					
						   
			  $html .= '<table width="100%" class="wp-list-table widefat fixed posts table-generic"> ';
			   $html .= ' <thead>
					<tr>
						<th width="3%">'.__('#', 'bookingup').'</th>
						<th width="11%">'.__('Date', 'bookingup').'</th>                     
						<th width="16%">'.__('Transaction ID', 'bookingup').'</th>
						<th width="9%">'.__('Method', 'bookingup').'</th>
						 <th width="9%">'.__('Status', 'bookingup').'</th>
						<th width="9%">'.__('Amount', 'bookingup').'</th>';
				 
				 if(!$is_client){
					$html .= '	<th width="9%">'.__('Actions', 'bookingup').'</th>';
				 
				 }
				
				 $html .= '   </tr>
				</thead>';
				
			   $html .= ' <tbody>';
				
			   
					foreach($orders as $order) {
						
						$order_tr = $order->order_txt_id;
						if($order->order_txt_id==''){$order_tr = 'N/A';}
						
						if($order->order_status=='pending'){$class_pending = 'bupending'; }else{$class_pending = 'buconfirmed';}
							
								  
		
					  $html .= '   <tr>
							<td>'.$order->order_id.'</td>
							<td>'. date("m/d/Y", strtotime($order->order_date)).'</td>
							 
							<td>'. $order_tr.'</td>
							 <td>'. $order->order_method_name.'</td>
							  <td class="'.$class_pending.'">'. $order->order_status.'</td>
						   <td> '. $currency.$order->order_amount.'</td>';
						  
						
						if(!$is_client){
						 $html .= '   <td> 
						   
						   <a href="#" title="'.__('Delete', 'bookingup').'" class="bup-payment-deletion" bup-payment-id="'.$order->order_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-remove"> </i> </a>
						<a href="#" title="'.__('Edit', 'bookingup').'" class="bup-payment-edit" bup-payment-id="'.$order->order_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-pencil"> </i> </a>   '; 
						  
						$html .= '  
						   </td> ';
						   
						}
						   
						   
						$html .= '</tr>';
										
						
					   
					}
						
				} else {
				
				$html .='<p>'.__('There are no transactions yet.','bookingup').'</p>';
				} 
	
		   $html .='     </tbody>
			</table>';
		
		}else{
			
			$html .=__("Not Allowed ", 'bookingup');
		}
        
				
		echo $html;		
		die();
	
	}
	
	public function get_appointment_status_options()
	{
		
		global $wpdb, $bookingultrapro;	
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		//check if this is a staff member or client		
		$is_client  = $this->is_client($staff_id);
		
		$html = '';
		
		$appointment_id = $_POST['appointment_id'];
		
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{		
			$html .='<div class="bup-appointment-status-update">';
			$html .='<ul>';
			$html .='<li><a href="#" class="bup-adm-change-appoint-status-opt" appointment-id="'.$appointment_id.'" appointment-status="0" title="'.__('Change Status','bookingup').'"><i class="fa fa-edit"></i><span> '.__('Pending','bookingup').'</span></a></li>';
			
			$html .='<li><a href="#" class="bup-adm-change-appoint-status-opt" appointment-id="'.$appointment_id.'" appointment-status="1" title="'.__('Change Status','bookingup').'"><i class="fa fa-check"></i><span> '.__('Approved','bookingup').'</span></a></li>';
			
			$html .='<li><a href="#" class="bup-adm-change-appoint-status-opt" appointment-id="'.$appointment_id.'" appointment-status="2" title="'.__('Change Status','bookingup').'"><i class="fa fa-remove"></i><span> '.__('Cancelled','bookingup').'</span></a></li>';
			
			$html .='<li><a href="#" class="bup-adm-change-appoint-status-opt" appointment-id="'.$appointment_id.'" appointment-status="3" title="'.__('Change Status','bookingup').'"><i class="fa fa fa-eye-slash"></i><span> '.__('No-Show','bookingup').'</span></a></li>';
			
			$html .='</ul>';
			$html .='</div>';
			
		}else{
			
			$html .=__("Not Allowed ", 'bookingup');
		}
					
				
		echo $html;
		die();
	
	}
	
	public function bup_update_booking_info()
	{
		
		global $wpdb, $bookingultrapro;	
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$html='';	
			
		$bup_custom_fields = $_POST['custom_fields'];
		$booking_id = $_POST['booking_id'];	
		
		$exploded = array();
		parse_str($bup_custom_fields, $exploded);
		
		//print_r($exploded);
		
		//check if this staff membe can update the appointment
		
		if($this->is_my_appointment($booking_id, $staff_id))
		{
		
			foreach($exploded as $field => $value)
			{
				if (is_array($value))   // checkboxes
				{
					$value = implode(', ', $value);
				}	
					
							
				$bookingultrapro->appointment->update_booking_meta($booking_id, $field, $value);
			
			}
			
			$html .=__("Done! ", 'bookingup');
		
		}else{
			
			$html .=__("Not Allowed ", 'bookingup');
		}
		
		
		echo $html;
		die();
		
				
	
	}
	
	
	function bp_delete_appointment_ajax () 
	{
		global $wpdb, $bookingultrapro, $bupcomplement;	
		$appointment_id = $_POST['appointment_id'];
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		$html ='';
		
		//echo "called";
		
		if($this->is_my_appointment($appointment_id, $staff_id))
		{
			//echo "called 2";
			//delete appointment on Google Calendar		
			if(isset($bupcomplement))
			{
				$event_id = $bookingultrapro->appointment->get_booking_meta($appointment_id, 'google_event_id');
				$calendar_id = $bookingultrapro->appointment->get_booking_meta($appointment_id, 'google_calendar_id');
			
				//get appointment meta gcal event id and google calendar id			
				$bupcomplement->googlecalendar->delete_event($event_id, $calendar_id, $staff_id);
			
			}
				
			//delete meta data
			$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_bookings_meta  WHERE meta_booking_id=%d  ;',array($appointment_id));		
			$wpdb->query($sql);
			
			//delete payments
			$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_orders  WHERE order_booking_id=%d  ;',array($appointment_id));		
			$wpdb->query($sql);
			
			//delete notes
			$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_appointment_notes  WHERE note_appointment_id=%d  ;',array($appointment_id));		
			$wpdb->query($sql);
			
			//delete appointment
			$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_bookings  WHERE booking_id=%d  ;',array($appointment_id));		
			$wpdb->query($sql);
			
			//delete appointment on Google Calendar
			
			if(isset($bupcomplement))
			{
			
			}
			
			$html .=__("Deleted App: ".$appointment_id." - UI: ".$staff_id, 'bookingup');
		
		} else {
			
			$html .=__("Not Allowed ", 'bookingup');
		
		} 
		
		echo $html;		
		die();
	}
	
	public function is_my_appointment($booking_id, $staff_id)
	{
		global  $bookingultrapro , $wpdb;
		
		
		$is_client  = $this->is_client($staff_id);
		
		if(!$is_client)
		{
			
			$sql =  'SELECT appo.*, usu.*	 FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;				
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";	
			$sql .= " WHERE  appo.booking_id = '".$booking_id."' AND appo.booking_staff_id = '".$staff_id."'  ";	
		
		}else{
			
			$sql =  'SELECT appo.*, usu.*	 FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;				
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";	
			$sql .= " WHERE  appo.booking_id = '".$booking_id."' AND appo.booking_user_id = '".$staff_id."'  ";
			
		
		}
		$appointments = $wpdb->get_results($sql );	
		
		if ( !empty( $appointments ) )
		{
			
			foreach ( $appointments as  $appointment ) 
			{
				return true;
			
			}
		
		}else{
			
			return false;			
			
		}
		
	}
	
	public function delete_day_off()
	{
		global  $bookingultrapro , $wpdb;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$dayoff_id = $_POST['dayoff_id'];
		
		$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_staff_days_off  WHERE dayoff_user_id=%d AND dayoff_id = %d ;',array($staff_id,$dayoff_id));
		
		$results = $wpdb->query($sql);
		die();
	
	}	
	
	public function get_staff_daysoff_list($staff_id = null)
	{
		global  $bookingultrapro , $wpdb;
		
		$action = $_POST['action'];
		
		$time_format = $bookingultrapro->service->get_date_format_conversion();
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
						
		$html = '';		

		$sql = $wpdb->prepare('SELECT * FROM ' . $wpdb->prefix . 'bup_staff_days_off  WHERE 	dayoff_user_id=%d  ;',array($staff_id));
		
		$results = $wpdb->get_results($sql);
		
		if ( !empty( $results ))
		{
			$html .= '<ul>';	
			
			foreach ( $results as $row )
			{
				
				$html .= '<li><i class="fa fa-calendar bup-clock-remove"></i>'.date($time_format,strtotime($row->dayoff_from)).' - '.date($time_format,strtotime($row->dayoff_to));
				
				$html .= '<span class="bup-dayoff-remove" id="bup-dayoff-add-'.$row->dayoff_id.'"><a href="#" class="ubp-daysoff-delete-btn" title="'.__("Delete", 'bookingup').'" dayoff-id="'.$row->dayoff_id.'" ><i class="fa fa-remove"></i></a></span>';
				$html .= '</li>';
				
				
			}
			$html .= '</ul>';			
						
		}else{
			
			$html = __("There are no days off.", 'bookingup')	;			
		
		}
		
		echo $html;
		die();
		
		
		
	
	}
	
	
	public function add_one_day_off()
	{
		global  $bookingultrapro , $wpdb;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$from = $_POST['day_off_from'];
		$to = $_POST['day_off_to'];
		
		if ($from!='' && $to!='')
		{
			
			$date_format = $bookingultrapro->service->get_date_format_conversion();	
			$date_f = DateTime::createFromFormat($date_format, $from);
			$date_t = DateTime::createFromFormat($date_format, $to);					
	
			//get days for this service		
			$date_from=  $date_f->format('Y-m-d');	
			$date_to=  $date_t->format('Y-m-d');
			
			
		}
				
		$html = '';		
		
		if ($from!='' && $to!='')
		{
			
			if ($date_from>$date_to)
			{
				
				$html = __('Invalid Date Range!', 'bookingup')	;	
			
			}else{	
			
				$new_record = array('dayoff_id' => NULL,	
									'dayoff_user_id' => $staff_id,
									'dayoff_from' => $date_from,
									'dayoff_to' => $date_to,
									'dayoff_recurrent'   => 0);								
										
				$wpdb->insert( $wpdb->prefix . 'bup_staff_days_off', $new_record, array( '%d', '%d', '%s', '%s', '%s'));
			
			$html = __('Done!', 'bookingup')	;
			
			}
			
		}else{
			
			$html = __('ERROR. Invalid Input both dates!', 'bookingup')	;
			
		
		}
		
		echo $html;
		die();
		
		
	
	}
	
	
	public function get_current_staff_breaks()
	{
		global  $bookingultrapro , $wpdb;
		
		$action = $_POST['action'];
		
		$time_format = $bookingultrapro->service->get_time_format();		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		
		$day_id = $_POST['day_id'];	
						
		$html = '';		

		$sql = $wpdb->prepare('SELECT * FROM ' . $wpdb->prefix . 'bup_staff_availability_breaks  WHERE break_staff_id=%d AND break_staff_day = %d ;',array($staff_id,$day_id));
		
		$results = $wpdb->get_results($sql);
		
		if ( !empty( $results ))
		{
			$html .= '<ul>';	
			
			foreach ( $results as $row )
			{
				
				$html .= '<li><i class="fa fa-clock-o bup-clock-remove"></i>'.date($time_format,strtotime($row->break_time_from)).' - '.date($time_format,strtotime($row->break_time_to));
				
				$html .= '<span class="bup-breaks-remove" id="bup-break-add-'.$day_id.'"><a href="#" class="ubp-break-delete-btn" title="'.__("Delete Break", 'bookingup').'" break-id="'.$row->break_id.'" day-id="'.$day_id.'"><i class="fa fa-remove"></i></a></span>';
				$html .= '</li>';
				
				
			}
			$html .= '</ul>';			
						
		}else{
			
			$html = __("There are no breaks for this day.", 'bookingup')	;			
		
		}
		
		
		
		
		echo $html;
		die();
		
		
		
	
	}
	
	public function delete_break()
	{
		global  $bookingultrapro , $wpdb;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$break_id = $_POST['break_id'];
		
		$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_staff_availability_breaks  WHERE break_staff_id=%d AND break_id = %d ;',array($staff_id,$break_id));
		
		$results = $wpdb->query($sql);
		die();
	
	}	
	
	public function get_break_add_frm()
	{
		global  $bookingultrapro;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;		
		
		$day_id = $_POST['day_id'];
		
		
		$html = '<div class="bup-add-break-cont">';
		$html .='<input type="hidden" value="'.$day_id.'" id="bup_day_id">';
		$html .=''.$bookingultrapro->breaks->get_breaks_drop_downs($day_id,'bup-break-from-'.$day_id ,'bup_select_start', $staff_id). '<span> '.__('to', 'bookingup').' </span>' .$bookingultrapro->breaks->get_breaks_drop_downs($day_id,'bup-break-to-'.$day_id ,'bup_select_end', $staff_id).'';
		
		$html .= '<button name="bup-btn-add-break-confirm" id="bup-btn-add-break-confirm" class="bup-button-submit-breaks" day-id="'.$day_id.'">'.__('Add','bookingup').'	</button>';
		$html .= '<span id="bup-break-message-add-'.$day_id.'"></span>';
		$html .= '</div>';
		
		echo $html;
		die();
	
	}
	
	public function break_add_confirm()
	{
		global  $bookingultrapro , $wpdb;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$day_id = $_POST['day_id'];
		
		$from = $_POST['from'].':00';
		$to = $_POST['to'].':00';
				
		$html = '';		

		$sql = $wpdb->prepare('SELECT * FROM ' . $wpdb->prefix . 'bup_staff_availability_breaks  WHERE break_staff_id=%d AND break_staff_day = %d AND break_time_from=%s AND break_time_to=%s;',array($staff_id,$day_id ,$from ,$to));
		
		$results = $wpdb->get_results($sql);
		
		if ( empty( $results ))
		{				
			$new_record = array('break_id' => NULL,	
								'break_staff_id' => $staff_id,
								'break_staff_day' => $day_id,
								'break_time_from' => $from,
								'break_time_to'   => $to);								
									
			$wpdb->insert( $wpdb->prefix . 'bup_staff_availability_breaks', $new_record, array( '%d', '%d', '%d', '%s', '%s'));
			
			
			$html = __('Done!', 'bookingup')	;
			
		}else{
			
			$html = __('ERROR. Duplicated Break!', 'bookingup')	;
			
		
		}
		
		echo $html;
		die();
		
		
	
	}
	
	
	public function delete_special_schedule()
	{
		global  $bookingultrapro , $wpdb;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$schedule_id = $_POST['schedule_id'];
		
		$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_staff_availability_rules  WHERE special_schedule_staff_id=%d AND special_schedule_id = %d ;',array($staff_id,$schedule_id));
		
		$results = $wpdb->query($sql);
		die();
	
	}	
	
	
	
	public function add_one_special_schedule()
	{
		global  $bookingultrapro , $wpdb;
			
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$from = $_POST['time_from'];
		$to = $_POST['time_to'];
		$day = $_POST['day_available'];
		
			
		$html = '';		
		
		if ($from!='' && $to!='' && $day!='')
		{
			$date_format = $bookingultrapro->service->get_date_format_conversion();	
			$date_f = DateTime::createFromFormat($date_format, $day);
	
			//get days for this service		
			$day_available=  $date_f->format('Y-m-d');
			
			
			if ($date_from>$date_to)
			{
				
				$html = __('Invalid Date Range!', 'bookingup')	;	
			
			}else{	
			
				$new_record = array('special_schedule_id' => NULL,	
									'special_schedule_staff_id' => $staff_id,
									'special_schedule_time_from' => $from,
									'special_schedule_time_to' => $to,
									'special_schedule_date'   => $day_available);								
										
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability_rules', $new_record, array( '%d', '%d', '%s', '%s', '%s'));
			
			$html = __('Done!', 'bookingup')	;
			
			}
			
		}else{
			
			$html = __('ERROR. Invalid Input!', 'bookingup')	;
			
		
		}
		
		echo $html;
		die();	
	
	}
	
	public function get_special_schedule_list()
	{
		global  $bookingultrapro , $wpdb;
		
		$action = $_POST['action'];
		
		$date_format = $bookingultrapro->service->get_date_format_conversion();		
		$time_format = $bookingultrapro->service->get_time_format();
		
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
	
						
		$html = '';		

		$sql = $wpdb->prepare('SELECT * FROM ' . $wpdb->prefix . 'bup_staff_availability_rules  WHERE 	special_schedule_staff_id=%d  ;',array($staff_id));
		
		$results = $wpdb->get_results($sql);
		
		if ( !empty( $results ))
		{
			$html .= '<ul>';	
			
			foreach ( $results as $row )
			{
				
				$html .= '<li><i class="fa fa-calendar bup-clock-remove"></i>'.date($date_format,strtotime($row->special_schedule_date)).' - ( '.date($time_format,strtotime($row->special_schedule_time_from)) .' to '.date($time_format,strtotime($row->special_schedule_time_to)) .')';
				
				$html .= '<span class="bup-dayoff-remove" id="bup-dayoff-add-'.$row->special_schedule_id.'"><a href="#" class="ubp-specialschedule-delete-btn" title="'.__("Delete", 'bookingup').'" dayoff-id="'.$row->special_schedule_id.'" ><i class="fa fa-remove"></i></a></span>';
				$html .= '</li>';
				
				
			}
			$html .= '</ul>';			
						
		}else{
			
			$html = __("There are no special schedule.", 'bookingup')	;			
		
		}
		
		
		
		echo $html;
		die();
		
		
		
	
	}
	
	//used for reschedule
	public function bup_check_adm_availability_sfaff()
	{
		
		global  $bookingultrapro;
		
		$business_hours = get_option('bup_business_hours');
		$time_format = $bookingultrapro->service->get_time_format();		
		
		$slot_length= $bookingultrapro->get_option('bup_time_slot_length');
		$slot_length_minutes= $slot_length*60;
		
		$display_only_from_hour=  $bookingultrapro->get_option('display_only_from_hour');
		
		
		$time_slots = array();		
		$b_category = $_POST['b_category'];			
		$b_date = $_POST['b_date'];	
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$b_staff = $current_user->ID;
		
		
		
		$date_format = $bookingultrapro->service->get_date_format_conversion();	
		$date_f = DateTime::createFromFormat($date_format, $b_date);
		
		$html = '';
		
		//get days for this service		
		$date_from=  $date_f->format('Y-m-d');	
		$to_sum= $bookingultrapro->service->get_days_to_display();  
		$end_date=  date("Y-m-d", strtotime("$date_from + $to_sum day"));			
				
		//get random user		
		$staff_id =$bookingultrapro->service->get_prefered_staff($b_staff, $b_category);				
		
		// Schedule.
        $items_schedule = $bookingultrapro->userpanel->get_working_hours($staff_id);
		
		//staff member		
		$staff_member = $bookingultrapro->userpanel->get_staff_member($staff_id);			
		
		$cdiv = 0 ;				
		$service = $bookingultrapro->service->get_one_service($b_category);
		
		if($_POST['b_date']=='')
		{		
			$html .='<p>'.__("Please select a date.",'bookingup').'</p>';			
			echo $html;
			die();
		
		}
		
		if($_POST['b_category']=='')
		{		
			$html .='<p>'.__("Please select a service.",'bookingup').'</p>';			
			echo $html;
			die();
		
		}
		
		//Does the user offer this service?				
		if($bookingultrapro->userpanel->staff_offer_service( $staff_id, $b_category ))
		{
			$html .= '<div class="bup-selected-staff-booking-info">'; 
			$html .= '<p>'. __('Below you can find a list of available time slots for ','bookingup').'<strong>'.$service->service_title.'</strong> '.__('by ','bookingup').'<strong>'.$staff_member->display_name.'</strong>.'.'<p>';	
			$html .= '</div>';
			
			$available_previous =true;
			while (strtotime($date_from) < strtotime($end_date)) 
			{
				 $cdiv++;				 
				 $day_num_of_week = date('N', strtotime($date_from));	
				 
				 //is the staff member working on this day?			 
				  if(isset($items_schedule[$day_num_of_week]))
				  {					   
					 
					  $html .= '<h3>'.$bookingultrapro->commmonmethods->formatDate($date_from).'</h3>';	  
					  $html .= '<div class="bup-time-slots-divisor" id="bup-time-sl-div-'.$cdiv.'">';			  
					  $html .= '<ul class="bup-time-slots-available-list">';	
					  
					 //get available slots for this date				 
					 $time_slots = $bookingultrapro->service->get_time_slot_public_for_staff($day_num_of_week,  $staff_id, $b_category, $time_format);
					 
					 //check if staff member is in holiday this day					   
					  $is_in_holiday = $bookingultrapro->service->is_in_holiday($staff_id, $date_from);					  					  
					  //staff hourly						 
					  $staff_hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id, $day_num_of_week);	
					 
					 
					 $cdiv_range = 0 ;
					 					 
					 foreach($time_slots as $slot)
					 {
						 $cdiv_range++;	
						 
						 
						  $day_time_slot = date('Y-m-d', strtotime($date_from)).' '.$slot['from'].':00';
						  
						  $current_time_slot = $slot['from'].':00';
						  $increased_minutes = date('H:i:s', strtotime( $current_time_slot ) +$slot_length_minutes);
						  //$to_slot_limit = $date_from.' '. $increased_minutes;
						  $to_slot_limit = $date_from.' '. $slot['to'].':00';
						  $day_time_slot_to = $to_slot_limit;
							 
						  $staff_time_slots = array();					 
						  $staff_time_slots = $bookingultrapro->service->get_time_slots_availability_for_day($staff_id, $b_category, $day_time_slot, $day_time_slot_to);	
						  
						 //check if staff member is on break time for this day.						
						$is_in_break = $bookingultrapro->service->is_in_break($staff_id, $day_num_of_week, $slot['from'] , $slot['to']);
						
						if($staff_time_slots['available']==0 || $is_in_break || $staff_time_slots['busy']==true  ||  $is_in_holiday)
						{							
							$available_slot =false;
									
						}else{								
									
							$available_slot =true;							
						}
							
						$time_from = $slot['from'];
						$time_to = $slot['to'];
						
						//padding before?
						if($service->service_padding_before!='' && $service->service_padding_before!=0 )
						{
							//previous is not available, then we need to add padding
							if(!$available_previous)
							{
								$minutes_to_increate = $service->service_padding_before;								
								$increased_from = date('H:i:s', strtotime($time_from.':00')+$minutes_to_increate);
								$increased_from = date('H:i', strtotime($increased_from));							
								$time_from = $increased_from;
									
							}
								
						}
						
						
						//check if hour is available to book, we have to use the server time		 
						 $current_slot_time_stamp = strtotime($date_from.' '.$time_from.':00');		 
						 $current_site_time_stamp = strtotime(date( 'Y-m-d H:i:s', current_time( 'timestamp', 0 ) ));
						 
						 $is_passed = false;						 
						 if($current_site_time_stamp>$current_slot_time_stamp)
						 {							 
							 $is_passed = true;	 						
						 }
						 			 
						 
											 
						 
						 if($display_only_from_hour=='yes' || $display_only_from_hour=='' )
						 {
							  //reduced view
							 $time_to_display = '&nbsp;&nbsp;'.date($time_format, strtotime($time_from));
						 }else{
							 
							 $time_to_display = '&nbsp;&nbsp;'.date($time_format, strtotime($time_from)).' &ndash; '.date($time_format, strtotime($time_to)).'';					 			
						 
						 }
						 
						 
						 //is All Day event?						
						if($service->service_duration==86400)	
						{
							$time_from = '00:00';
						    $time_to = '23:59';						
						}	 
						
						
						if($time_to>$staff_hourly->avail_to || $time_to<$staff_hourly->avail_from)
						{
							$display_unavailable = 'no';
							$is_slot_available = false;
						}
						 
						 
						
						 $html .= '<li id="bup-time-slot-hour-range-'.$cdiv.'-'.$cdiv_range.'">';					
						 $html .= '<div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>'.$time_to_display.'</div>';
						 $html .= '<div class="bup-timeslot-count"><span class="spots-available">'.$staff_time_slots['label'].'</span></div>';
						 
						 $html .= '<span class="bup-timeslot-people">';
						 
						
						
						if($staff_time_slots['available']==0 || $is_in_break || $is_passed ||  $staff_time_slots['busy']==true ||  $is_in_holiday)
						{
							$button_class = 'bup-button-blocked ';
							$button_label = __('Unavailable','bookingup');
						
						}else{
							
							$button_class = 'bup-button bup-btn-book-app-admin ';
							$button_label = __('Select Time Slot','bookingup');
						
						}
						
						
						$html .= '<button class="new-appt '.$button_class.'" bup-data-date="'.date('Y-m-d', strtotime($date_from)).'" bup-data-timeslot="'.$time_from.'-'.$time_to.'" bup-data-service-staff="'.$b_category.'-'.$staff_id.'">'; //category-userid
						
						$html .= '<span class="button-timeslot"></span><span class="bup-button-text">'. $button_label.'</span></button>';
						
						
						
						 $html .= '</span>';						
						 $html .= '</li>';	
						 
						 $available_previous = $available_slot;
					 
					  }
					  
					  $html .='</ul>';			  			  
					  $html .= '</div>'; //end time slots divisor
				  
				  
				  } //end if working			  
				  
				 
				 //increase date
				 $date_from = date ("Y-m-d", strtotime("+1 day", strtotime($date_from))); 			 
				 
				 
			 }  //end while
			 
		}else{
			
			
			$html .='<p>'.__("This Provider doesn't offer this service.",'bookingup').'</p>';
			
			
		
		}  //end if
		 		
		
		echo $html ;		
		die();		
	
	}
	
	public function re_schedule_confirm () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';		
				
		//create reservation in reservation table	
		$booking_id = $_POST['booking_id'];			
		$day_id = $_POST['bup_booking_date'];
		$service_and_staff_id = $_POST['bup_service_staff'];
		$time_slot = $_POST['bup_time_slot'];		
		$bup_notify_client_reschedule = $_POST['notify_client'];			
		
		$arr_ser = explode("-", $service_and_staff_id);			
		$service_id = $arr_ser[0]; 
		$staff_id = $arr_ser[1];
		
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$arr_time_slot = explode("-", $time_slot);			
		$book_from = $arr_time_slot[0]; 
		$book_to = $arr_time_slot[1];	
		
		$service_details = $bookingultrapro->userpanel->get_staff_service_rate( $staff_id, $service_id ); 
		$amount= $service_details['price'];
		
		$booking_time_from = $day_id .' '.$book_from.':00';
		
		//appointment		
		$appointment = $bookingultrapro->appointment->get_one($booking_id);		
		$client_id = $appointment->booking_user_id;
		
				
		//service			
		$service = $bookingultrapro->service->get_one_service($service_id);		
		
		$currency = $bookingultrapro->get_option('currency_symbol');		
		$time_format = $bookingultrapro->service->get_time_format();		
		$booking_time = date($time_format, strtotime($booking_time_from ))	;		
		$booking_day = date('l, j F, Y', strtotime($booking_time_from));		
				
						
		$staff_member = get_user_by( 'id', $staff_id );	
		$client = get_user_by( 'id', $client_id );								
		
		
		
		$order_data = array(
				
						'booking_id' => $booking_id,					 			 
						 'amount' => $amount,
						 'service_id' => $service_id ,
						 'staff_id' => $staff_id ,						 					 
						 'day' => $day_id,
						 'time_from' => $book_from,
						 'time_to' => $book_to
						 
						 ); 
						 
		$booking_id =  $bookingultrapro->order->update_appointment($order_data);
		
		$bookingultrapro->messaging->send_reschedule_notification_on_admin($staff_member, $client, $service, $appointment,  $bup_notify_client_reschedule );
		
											
		$html .= '<div class="bup-ultra-success bup-notification"><strong>'.__('Done!. The appointment has been rescheduled. Below are the new details.','bookingup').'</strong></div>';		
		$html .= '<p>'.__('Appointment Details.','bookingup').'</p>';
		
		$html .= '<p>'.__('Service: '.$service->service_title.'','bookingup').'</p>' ;	
		$html .= '<p>'.__('Date: '.$booking_day.'','bookingup').'</p>' ;
		$html .= '<p>'.__('Time: '.$booking_time.'','bookingup').'</p>' ;
		$html .= '<p>'.__('With: '.$staff_member->display_name.'','bookingup').'</p>' ;
		$html .= '<p>'.__('Cost: '.$currency.$amount.'','bookingup').'</p>';
				
		echo $html;		
		die();
	
	}
	
	public function bup_get_staff_details($staff_id)
	{
		global  $bookingultrapro, $bupcomplement, $bupultimate;
		
		
				
		
		$html = '';
		
		$html .= '<div class="bup-sect-adm-edit">';
		$html .= '<input type="hidden" value="'.$staff_id.'" id="staff_id" name="staff_id">';
		
		$html .= '<ul class="bup-details-staff-sections">';
		
		
		
		$html .='<li class="left_widget_customizer_li">';
		$html .='<div class="bup-staff-details-header" widget-id="2" ><h3> '.__('Services','bookingup').'<h3>';
		
		$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-2"  widget-id="2" style="background-position: 0px 0px;"></span>';
		
		$html .= '</div>';
				
		$html .='<div id="bup-widget-adm-cont-id-2" class="bup-tabs-sections-staff-services bup-services-list-adm" style=" display:none">';
		$html .= $bookingultrapro->userpanel->get_staff_services_admin($staff_id);
		$html .= '</div>';
		$html .='</li>';
		
		
		$html .='<li class="left_widget_customizer_li">';
		$html .='<div class="bup-staff-details-header"  widget-id="3"><h3> '.__('Schedule','bookingup').'<h3>';
		
		$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-3"  widget-id="3" style="background-position: 0px 0px;"></span>';
		
		$html .= '</div>';
		
		$html .='<div id="bup-widget-adm-cont-id-3" class="bup-tabs-sections-staff-services" style=" display:none">';
		$html .=  $bookingultrapro->service->get_business_staff_business_hours($staff_id);
		$html .= '</div>';
		$html .='</li>';
		
		$html .='<li class="left_widget_customizer_li">';
		$html .='<div class="bup-staff-details-header" widget-id="7"><h3> '.__('Special Schedule','bookingup').'<h3>';
			
			$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-7"  widget-id="7" style="background-position: 0px 0px;"></span>';
			
			$html .= '</div>';
			
			$html .='<div id="bup-widget-adm-cont-id-7" class="bup-tabs-sections-staff-services" style=" display:none">';
			
			if(isset($bupcomplement) && class_exists('BupComplementDayOff'))
			{
				$html .= $bupcomplement->dayoff->get_staff_special_schedule($staff_id);
			
			}else{
				
				$html .= __('Please consider upgrading your plugin if you need to set special rules for your schedule. This feature allows you to set your availability on a particular day in advance.','bookingup');
				
			}
			
			$html .= '</div>';
			$html .='</li>';
		
		
		$html .='<li class="left_widget_customizer_li">';
		$html .='<div class="bup-staff-details-header" widget-id="4"><h3> '.__('Breaks','bookingup').'<h3>';
		
		$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-4"  widget-id="4" style="background-position: 0px 0px;"></span>';
		
		$html .= '</div>';
		
		$html .='<div id="bup-widget-adm-cont-id-4" class="bup-staff-break" style=" display:none">';
		
		$html .=  $bookingultrapro->breaks->get_staff_breaks($staff_id);
		$html .= '</div>';
		$html .='</li>';
		
		if(isset($bupultimate))
		{
		
			$html .='<li class="left_widget_customizer_li">';
			$html .='<div class="bup-staff-details-header" widget-id="6"><h3> '.__('Locations','bookingup').'<h3>';
			
			$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-6"  widget-id="6" style="background-position: 0px 0px;"></span>';
			
			$html .= '</div>';
			
			$html .='<div id="bup-widget-adm-cont-id-6" class="bup-tabs-sections-staff-services bup-services-list-adm" style=" display:none">';
			
			if(isset($bupcomplement))
			{
				//$html .= $bookingultrapro->userpanel->get_staff_locations_admin($staff_id);
			
			}else{
				
				$html .= __('Please consider upgrading your plugin if you need to manage multiple locations.','bookingup');
				
			}
			
			$html .= '</div>';
			$html .='</li>';
		
		}
		
		
		
			$html .='<li class="left_widget_customizer_li">';
			$html .='<div class="bup-staff-details-header" widget-id="5"><h3> '.__('Days off','bookingup').'<h3>';
			
			$html .='<span class="bup-widgets-icon-close-open" id="bup-widgets-icon-close-open-id-5"  widget-id="5" style="background-position: 0px 0px;"></span>';
			
			$html .= '</div>';
			
			$html .='<div id="bup-widget-adm-cont-id-5" class="bup-tabs-sections-staff-services" style=" display:none">';
			
			if(isset($bupcomplement) && class_exists('BupComplementDayOff'))
			{
				$html .= $bupcomplement->dayoff->get_staff_daysoff($staff_id);
			
			}else{
				
				$html .= __('Please consider upgrading your plugin if you need to add breaks.','bookingup');
				
			}
			
			$html .= '</div>';
			$html .='</li>';
		
		
		
		
		
		$html .= '</ul>';
		
		$html .= '</div>';
			
		return $html ;		
			
	
	}
	
	public function update_staff_business_hours()
	{
		global $wpdb, $bookingultrapro;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;	
		
		$bup_mon_from = $_POST['bup_mon_from'];
		$bup_mon_to = $_POST['bup_mon_to'];		
		$bup_tue_from = $_POST['bup_tue_from'];
		$bup_tue_to = $_POST['bup_tue_to'];		
		$bup_wed_from = $_POST['bup_wed_from'];
		$bup_wed_to = $_POST['bup_wed_to'];		
		$bup_thu_from = $_POST['bup_thu_from'];
		$bup_thu_to = $_POST['bup_thu_to'];
		$bup_fri_from = $_POST['bup_fri_from'];
		$bup_fri_to = $_POST['bup_fri_to'];		
		$bup_sat_from = $_POST['bup_sat_from'];
		$bup_sat_to = $_POST['bup_sat_to'];		
		$bup_sun_from = $_POST['bup_sun_from'];
		$bup_sun_to = $_POST['bup_sun_to'];
		
		$business_hours = array();
		
		if($bup_mon_from!=''){$business_hours[1] = array('from' =>$bup_mon_from, 'to' =>$bup_mon_to);}
		if($bup_tue_from!=''){$business_hours[2] = array('from' =>$bup_tue_from, 'to' =>$bup_tue_to);}
		if($bup_wed_from!=''){$business_hours[3] = array('from' =>$bup_wed_from, 'to' =>$bup_wed_to);}
		if($bup_thu_from!=''){$business_hours[4] = array('from' =>$bup_thu_from, 'to' =>$bup_thu_to);}
		if($bup_fri_from!=''){$business_hours[5] = array('from' =>$bup_fri_from, 'to' =>$bup_fri_to);}
		if($bup_sat_from!=''){$business_hours[6] = array('from' =>$bup_sat_from, 'to' =>$bup_sat_to);}
		if($bup_sun_from!=''){$business_hours[7] = array('from' =>$bup_sun_from, 'to' =>$bup_sun_to);}
		
		
		if($staff_id!='')
		{
			//clean 			
			$sql = 'DELETE FROM ' . $wpdb->prefix . 'bup_staff_availability  WHERE avail_staff_id="'.(int)$staff_id.'" ';	
			$wpdb->query($sql);		
			
			
			if($bup_mon_from!='')
			{
				
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
								'avail_day' => '1','avail_from' => $bup_mon_from,'avail_to'   => $bup_mon_to);
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));			
			}
			
			
			if($bup_tue_from!='')
			{		
			
				//2			
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '2','avail_from' => $bup_tue_from,'avail_to'   => $bup_tue_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));			
			}
			
			if($bup_wed_from!='')
			{			
				//3			
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '3','avail_from' => $bup_wed_from,'avail_to'   => $bup_wed_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));
			
			}
			
			if($bup_thu_from!='')
			{
			
				//4			
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '4','avail_from' => $bup_thu_from,'avail_to'   => $bup_thu_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));			
			}
			
			if($bup_fri_from!='')
			{
		
				//5			
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '5','avail_from' => $bup_fri_from,'avail_to'   => $bup_fri_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));
			
			}
			
			if($bup_sat_from!='')
			{
			
				//6		
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '6','avail_from' => $bup_sat_from,'avail_to'   => $bup_sat_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));
			
			}
			
			
			if($bup_sun_from!='')
			{			
			
				//7		
				$new_record = array('avail_id' => NULL,	'avail_staff_id' => $staff_id,
									'avail_day' => '7','avail_from' => $bup_sun_from,'avail_to'   => $bup_sun_to);
						
				$wpdb->insert( $wpdb->prefix . 'bup_staff_availability', $new_record, array( '%d', '%s', '%s', '%s', '%s'));
			}
			
			
		}
		
		die();
	}
	
	public function bup_appo_get_selected_time_staff () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';		
				
		//create reservation in reservation table				
		$day_id = $_POST['bup_booking_date'];
		$service_and_staff_id = $_POST['bup_service_staff'];
		$time_slot = $_POST['bup_time_slot'];		
		$bup_notify_client = $_POST['bup_notify_client'];			
		
		$arr_ser = explode("-", $service_and_staff_id);			
		$service_id = $arr_ser[0]; 
		//$staff_id = $arr_ser[1];
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$staff_id = $current_user->ID;
		
		$arr_time_slot = explode("-", $time_slot);			
		$book_from = $arr_time_slot[0]; 
		$book_to = $arr_time_slot[1];	
		
		$service_details = $bookingultrapro->userpanel->get_staff_service_rate( $staff_id, $service_id ); 
		$amount= $service_details['price'];
		
		$booking_time_from = $day_id .' '.$book_from.':00';
		
				
		//service			
		$service = $bookingultrapro->service->get_one_service($service_id);		
		
		$currency = $bookingultrapro->get_option('currency_symbol');		
		$time_format = $bookingultrapro->service->get_time_format();		
		$booking_time = date($time_format, strtotime($booking_time_from ))	;		
		$booking_day = date('l, j F, Y', strtotime($booking_time_from));		
				
						
		$staff_member = get_user_by( 'id', $staff_id );						
				
		$html .= '<p><strong>'.__('Appointment Details.','bookingup').'</strong></p>';
		
		$html .= '<p>'.__('Service: ','bookingup').$service->service_title.'</p>' ;	
		$html .= '<p>'.__('Date: ','bookingup').$booking_day.'</p>' ;
		$html .= '<p>'.__('Time: ','bookingup').$booking_time.'</p>' ;
		$html .= '<p>'.__('With: ','bookingup').$staff_member->display_name.'</p>' ;
		$html .= '<p>'.__('Cost: ','bookingup').$currency.$amount.'</p>';
				
		echo $html;		
		die();
	
	}
	
	/* delete avatar */
	function delete_user_avatar() 
	{
		global   $bookingultrapro;
		
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$user_id = $current_user->ID;	
				
		update_user_meta($user_id, 'user_pic', '');
		die();
	}
	
	function get_user_avatar_top($staff_id)
	{
		global $wpdb,  $bookingultrapro, $wp_rewrite;
		
		$html = '';
		
		$html .='<div class="bup-staff-profile-top" >
		'.$this->get_user_pic( $staff_id, 100, 'avatar', null, null, false).' <div class="bup-div-for-avatar-upload"> <a href="?module=upload_avatar"><div name="bup-button-change-avatar" id="bup-button-change-avatar" class="bup-button-change-avatar" ><i class="fa fa-camera"></i></div></a></div>
		
		</div>';
		
		return $html;
		
	}
	
	
	/******************************************
	Get permalink for user
	******************************************/
	function get_user_profile_permalink( $user_id=0) 
	{
		
		global  $bookingultrapro;
		
		$wp_rewrite = new WP_Rewrite();
		
		require_once(ABSPATH . 'wp-includes/link-template.php');			
				
		if ($user_id > 0) 
		{
		
			$user = get_userdata($user_id);
			$nice_url_type = $bookingultrapro->get_option('bup_permalink_type');
			$nice_url_type =  'username';
			
						
			if ($nice_url_type == 'ID' || $nice_url_type == '' ) 
			{
				$formated_user_login = $user_id;
			
			}elseif ($nice_url_type == 'username') {
				
				$formated_user_login = $user->user_nicename;
				$formated_user_login = str_replace(' ','-',$formated_user_login);
			
			}elseif ($nice_url_type == 'name'){
				
				$formated_user_login = $bookingultrapro->get_fname_by_userid( $user_id );
			
			}elseif ($nice_url_type == 'display_name'){
				
				$formated_user_login = get_user_meta( $user_id, 'display_name', true);					
				$formated_user_login = str_replace(' ','-',$formated_user_login);
			
			}elseif ($nice_url_type == 'custom_display_name'){
				
				$formated_user_login = get_user_meta( $user_id, 'display_name', true);					
				$formated_user_login = str_replace(' ','-',$formated_user_login);						
				
			}
			
			$formated_user_login = strtolower ($formated_user_login);
			$profile_page_id = $bookingultrapro->get_option('profile_page_id');	
			
					/* append permalink */
			if ( $nice_url_type == '' )
			{
				$link = add_query_arg( 'bup_username', $formated_user_login, get_page_link($profile_page_id) );
				
			}else{
				
				$link = trailingslashit ( trailingslashit( get_page_link($profile_page_id) ) . $formated_user_login );
				
			}
		
		} else {
			$link = get_page_link($page_id);
		}

		return $link;
	}
	
			/* Get picture by ID */
	function get_user_pic( $id, $size, $pic_type=NULL, $pic_boder_type= NULL, $size_type=NULL, $with_url=true ) 
	{
		
		 global  $bookingultrapro;
		 
		 require_once(ABSPATH . 'wp-includes/link-template.php');
	 
		
		$site_url = site_url()."/";
		
		//rand_val_cache		
		$cache_rand = time();
			 
		$avatar = "";
		$pic_size = "";
		
				
		$upload_dir = wp_upload_dir(); 
		$path =   $upload_dir['baseurl']."/".$id."/";
				
		$author_pic = get_the_author_meta('user_pic', $id);
		
		//get user url
		$user_url=$this->get_user_profile_permalink($id);
		
		if($pic_boder_type=='none'){$pic_boder_type='uultra-none';}
		
		
		if($size_type=="fixed" || $size_type=="")
		{
			$dimension = "width:";
			$dimension_2 = "height:";
		}
		
		if($size_type=="dynamic" )
		{
			$dimension = "max-width:";
		
		}
		
		if($size!="")
		{
			$pic_size = $dimension.$size."px".";".$dimension_2.$size."px";
		
		}
		
		if($bookingultrapro->get_option('bup_force_cache_issue')=='yes')
		{
			$cache_by_pass = '?rand_cache='.$cache_rand;
		
		}
		
		$user = get_user_by( 'id', $id );
		
			
		
		if ($author_pic  != '') 
			{
				$avatar_pic = $path.$author_pic;
				
				
				if($with_url)
				{
		 
					$avatar= '<a href="'.$user_url.'">'. '<img src="'.$avatar_pic.'" class="avatar '.$pic_boder_type.'" style="'.$pic_size.' "   id="bup-avatar-img-'.$id.'" title="'.$user->display_name.'" /></a>';
				
				}else{
					
					$avatar=  '<img src="'.$avatar_pic.'" class="avatar '.$pic_boder_type.'" style="'.$pic_size.' "   id="bup-avatar-img-'.$id.'" title="'.$user->display_name.'" />';
				
				}
				
				
				
			} else {
				
				$user = get_user_by( 'id', $id );		
				$avatar = get_avatar( $user->user_email, $size );
		
	    	}
		
		return $avatar;
	}
	
	public function avatar_uploader($staff_id=NULL) 
	{
		
	   // Uploading functionality trigger:
	  // (Most of the code comes from media.php and handlers.js)
	      $template_dir = get_template_directory_uri();
?>
		
		<div id="uploadContainer" style="margin-top: 10px;">
			
			
			<!-- Uploader section -->
			<div id="uploaderSection" style="position: relative;">
				<div id="plupload-upload-ui-avatar" class="hide-if-no-js">
                
					<div id="drag-drop-area-avatar">
						<div class="drag-drop-inside">
							<p class="drag-drop-info"><?php	_e('Drop '.$avatar_is_called.' here', 'bookingup') ; ?></p>
							<p><?php _ex('or', 'Uploader: Drop files here - or - Select Files'); ?></p>
							                            
                            
							<p>
                                                      
                            <button name="plupload-browse-button-avatar" id="plupload-browse-button-avatar" class="bup-button-upload-avatar" ><span><i class="fa fa-camera"></i></span> <?php	_e('Select Image', 'bookingup') ; ?>	</button>
                            </p>
                            
                            <p>
                                                      
                            <button name="plupload-browse-button-avatar" id="btn-delete-user-avatar" class="bup-button-delete-avatar" user-id="<?php echo $staff_id?>" redirect-avatar="yes"><span><i class="fa fa-times"></i></span> <?php	_e('Remove', 'bookingup') ; ?>	</button>
                            </p>
                            
                            <p>
                            <a href="?module=home" class="uultra-remove-cancel-avatar-btn"><?php	_e('Cancel', 'bookingup') ; ?></a>
                            </p>
                                                        
                           
														
						</div>
                        
                        <div id="progressbar-avatar"></div>                 
                         <div id="bup_filelist_avatar" class="cb"></div>
					</div>
				</div>
                
                 
			
			</div>
            
           
		</div>
        
         <form id="bup_frm_img_cropper" name="bup_frm_img_cropper" method="post">                
                
                	<input type="hidden" name="image_to_crop" value="" id="image_to_crop" />
                    <input type="hidden" name="crop_image" value="crop_image" id="crop_image" />
                    
                    <input type="hidden" name="site_redir" value="<?php echo $my_account_url."?module=upload_avatar"?>" id="site_redir" />                   
                
                </form>

		<?php
			
			$plupload_init = array(
				'runtimes'            => 'html5,silverlight,flash,html4',
				'browse_button'       => 'plupload-browse-button-avatar',
				'container'           => 'plupload-upload-ui-avatar',
				'drop_element'        => 'bup-drag-avatar-section',
				'file_data_name'      => 'async-upload',
				'multiple_queues'     => true,
				'multi_selection'	  => false,
				'max_file_size'       => wp_max_upload_size().'b',
				//'max_file_size'       => get_option('drag-drop-filesize').'b',
				'url'                 => admin_url('admin-ajax.php'),
				'flash_swf_url'       => includes_url('js/plupload/plupload.flash.swf'),
				'silverlight_xap_url' => includes_url('js/plupload/plupload.silverlight.xap'),
				//'filters'             => array(array('title' => __('Allowed Files', $this->text_domain), 'extensions' => "jpg,png,gif,bmp,mp4,avi")),
				'filters'             => array(array('title' => __('Allowed Files', "bookingup"), 'extensions' => "jpg,png,gif,jpeg")),
				'multipart'           => true,
				'urlstream_upload'    => true,

				// Additional parameters:
				'multipart_params'    => array(
					'_ajax_nonce' => wp_create_nonce('photo-upload'),
					'staff_id' => $staff_id,
					'action'      => 'bup_ajax_upload_avatar_staff' // The AJAX action name
					
				),
			);
			
			//print_r($plupload_init);

			// Apply filters to initiate plupload:
			$plupload_init = apply_filters('plupload_init', $plupload_init); ?>

			<script type="text/javascript">
			
				jQuery(document).ready(function($){
					
					// Create uploader and pass configuration:
					var uploader_avatar = new plupload.Uploader(<?php echo json_encode($plupload_init); ?>);

					// Check for drag'n'drop functionality:
					uploader_avatar.bind('Init', function(up){
						
						var uploaddiv_avatar = $('#plupload-upload-ui-avatar');
						
						// Add classes and bind actions:
						if(up.features.dragdrop){
							uploaddiv_avatar.addClass('drag-drop');
							
							$('#drag-drop-area-avatar')
								.bind('dragover.wp-uploader', function(){ uploaddiv_avatar.addClass('drag-over'); })
								.bind('dragleave.wp-uploader, drop.wp-uploader', function(){ uploaddiv_avatar.removeClass('drag-over'); });

						} else{
							uploaddiv_avatar.removeClass('drag-drop');
							$('#drag-drop-area').unbind('.wp-uploader');
						}

					});

					
					// Init ////////////////////////////////////////////////////
					uploader_avatar.init(); 
					
					// Selected Files //////////////////////////////////////////
					uploader_avatar.bind('FilesAdded', function(up, files) {
						
						
						var hundredmb = 100 * 1024 * 1024, max = parseInt(up.settings.max_file_size, 10);
						
						// Limit to one limit:
						if (files.length > 1){
							alert("<?php _e('You may only upload one image at a time!', 'bookingup'); ?>");
							return false;
						}
						
						// Remove extra files:
						if (up.files.length > 1){
							up.removeFile(uploader_avatar.files[0]);
							up.refresh();
						}
						
						// Loop through files:
						plupload.each(files, function(file){
							
							// Handle maximum size limit:
							if (max > hundredmb && file.size > hundredmb && up.runtime != 'html5'){
								alert("<?php _e('The file you selected exceeds the maximum filesize limit.', 'bookingup'); ?>");
								return false;
							}
						
						});
						
						jQuery.each(files, function(i, file) {
							jQuery('#bup_filelist_avatar').append('<div class="addedFile" id="' + file.id + '">' + file.name + '</div>');
						});
						
						up.refresh(); 
						uploader_avatar.start();
						
					});
					
					// A new file was uploaded:
					uploader_avatar.bind('FileUploaded', function(up, file, response){					
						
						
						
						var obj = jQuery.parseJSON(response.response);												
						var img_name = obj.image;							
						
						$("#image_to_crop").val(img_name);
						$("#bup_frm_img_cropper").submit();

						
						
						
						jQuery.ajax({
							type: 'POST',
							url: ajaxurl,
							data: {"action": "refresh_avatar"},
							
							success: function(data){
								
								//$( "#uu-upload-avatar-box" ).slideUp("slow");								
								$("#uu-backend-avatar-section").html(data);
								
								//jQuery("#uu-message-noti-id").slideDown();
								//setTimeout("hidde_noti('uu-message-noti-id')", 3000)	;
								
								
								}
						});
						
						
					
					});
					
					// Error Alert /////////////////////////////////////////////
					uploader_avatar.bind('Error', function(up, err) {
						alert("Error: " + err.code + ", Message: " + err.message + (err.file ? ", File: " + err.file.name : "") + "");
						up.refresh(); 
					});
					
					// Progress bar ////////////////////////////////////////////
					uploader_avatar.bind('UploadProgress', function(up, file) {
						
						var progressBarValue = up.total.percent;
						
						jQuery('#progressbar-avatar').fadeIn().progressbar({
							value: progressBarValue
						});
						
						jQuery('#progressbar-avatar').html('<span class="progressTooltip">' + up.total.percent + '%</span>');
					});
					
					// Close window after upload ///////////////////////////////
					uploader_avatar.bind('UploadComplete', function() {
						
						//jQuery('.uploader').fadeOut('slow');						
						jQuery('#progressbar-avatar').fadeIn().progressbar({
							value: 0
						});
						
						
					});
					
					
					
				});
				
					
			</script>
			
		<?php
	
	
	}
	
	// this returns only the totals
	public function get_appointments_total_by_status_staff($status, $staff_id)
	{
		
		global $wpdb, $bookingultrapro;
		
		// 0 pending, 1 approved, 2 cancelled
		
		$total = 0;
		
		$sql =  'SELECT count(*) as total FROM ' . $wpdb->prefix . 'bup_bookings   ' ;							
		$sql .= " WHERE  booking_status = '".$status."' AND booking_staff_id = '".$staff_id."'";	
			
		$appointments = $wpdb->get_results($sql );
		
		foreach ( $appointments as $appointment )
		{
				$total= $appointment->total;			
			
		}
					
		
		return $total;
	
	
	}
	
	function get_categories_drop_down_staff($service_id = null)
	{
		global  $bookingultrapro;
		
		$html = '';
		
		$cate_rows = $bookingultrapro->service->get_all_categories();
		
		
		$html .= '<select name="bup-category" id="bup-category">';
		$html .= '<option value="" selected="selected">'.__('Select a Service','bookingup').'</option>';
		
		foreach ( $cate_rows as $cate )
		{		
			
			$html .= '<optgroup label="'.$cate->cate_name.'" >';
			
			//get services						
			$servi_rows = $bookingultrapro->service->get_all_services($cate->cate_id);
			foreach ( $servi_rows as $serv )
			{
				$selected = '';
				
						
				if($serv->service_id==$service_id){$selected = 'selected';}
				$html .= '<option value="'.$serv->service_id.'" '.$selected.' >'.$serv->service_title.'</option>';
				
			}
			
			$html .= '</optgroup>';
			
		}
		
		$html .= '</select>';
		
		return $html;
	
	}
	
	function edit_appointment ($appointment_id, $staff_id) 
	{				
		//turn on output buffering to capture script output
        ob_start();		
		include(bookingup_comp_path."templates/edit_appointment.php");
        $content = ob_get_clean();		
		echo $content ;				
	}
	
	/*Get all approved this week*/
	public function get_all_this_week ($staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		$status = 1;
		
		$dt_min = new DateTime("last sunday");
		$dt_max = clone($dt_min);
		$dt_max->modify('+6 days');
			
		$date_from =$dt_min->format('Y-m-d');
		$date_to =$dt_max->format('Y-m-d');
		
		$is_client  = $this->is_client($staff_id);		
		
		//get all	
		
		$sql =  "SELECT appo.*, usu.*, serv.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		
		
		if($is_client){
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";	
			
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";		
		
		}
		
		
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}


			
		
		
		
		if($is_client){
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_user_id =  '".$staff_id."'  AND  appo.booking_status=  '".$status."' AND DATE(appo.booking_time_from) >= '".$date_from."' AND DATE(appo.booking_time_to) <= '".$date_to."' ";		
			
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_staff_id =  '".$staff_id."'  AND  appo.booking_status=  '".$status."' AND DATE(appo.booking_time_from) >= '".$date_from."' AND DATE(appo.booking_time_to) <= '".$date_to."' ";			
		
		}
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
		
		
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$sql .= " ORDER BY appo.booking_id DESC";   	
					
		$orders = $wpdb->get_results($sql );
		
		return $orders ;
		
	
	}
	
	/*Get all approved this day */
	public function get_all_this_day ($staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		$status = 1;		
		$date = date( 'Y-m-d ', current_time( 'timestamp', 0 ) );		 
		$is_client  = $this->is_client($staff_id);				
		
		//get all	
		
		$sql =  "SELECT appo.*, usu.*, serv.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		
		
		if($is_client){
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";			
			
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";	
		
		}
			
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}

		
		if($is_client){
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_user_id =  '".$staff_id."'  AND  appo.booking_status=  '".$status."' AND DATE(appo.booking_time_from) = '".$date."' ";			
			
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_staff_id =  '".$staff_id."'  AND  appo.booking_status=  '".$status."' AND DATE(appo.booking_time_from) = '".$date."' ";		
		
		}
		
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
		
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$sql .= " ORDER BY appo.booking_id DESC";	
					
		$orders = $wpdb->get_results($sql );		
		return $orders ;
		
	
	}
	
	
	
	/*Get all*/
	public function get_all_by_staff_status ($status, $staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		$keyword = "";
		$month = "";
		$day = "";
		$year = "";
		$howmany = "";
		$ini = "";
				
		$bup_staff_calendar = "";
		
		$special_filter='';
		
		//check if staff or client
		$is_client  = $this->is_client($staff_id);
		
		if(isset($_GET["keyword"]))
		{
			$keyword = $_GET["keyword"];		
		}
		
		if(isset($_GET["bp_month"]))
		{
			$month = $_GET["bp_month"];		
		}
		
				
		if(isset($_GET["bp_day"]))
		{
			$day = $_GET["bp_day"];		
		}
		
		if(isset($_GET["bp_year"]))
		{
			$year = $_GET["bp_year"];		
		}
		
		if(isset($_GET["howmany"]))
		{
			$howmany = $_GET["howmany"];		
		}
		
		if(isset($_GET["status"]))
		{
			$status = $_GET["status"];		
		}
		
		if(isset($_GET["special_filter"]))
		{
			$special_filter = $_GET["special_filter"];		
		}
		
		if(isset($_GET["bup-staff-calendar"]))
		{
			$bup_staff_calendar = $_GET["bup-staff-calendar"];		
		}
		
				
		$uri= $_SERVER['REQUEST_URI'] ;
		$url = explode("&ini=",$uri);
		
		if(is_array($url ))
		{
			if(isset($url["1"]))
			{
				$ini = $url["1"];
			    if($ini == ""){$ini=1;}
			
			}
		
		}		
		
		
		
		if($howmany == ""){$howmany=20;}	
		
		//get total				
				
		$sql =  "SELECT count(*) as total, usu.*, serv.* , appo.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		if($is_client){
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";			
		
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";		
		}
						
		
			
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}
		
		
			
		
		
		
		if($is_client){			
		
			$sql .= " WHERE serv.service_id = appo.booking_service_id AND appo.booking_user_id =  '".$staff_id."' ";			
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id AND appo.booking_staff_id =  '".$staff_id."' ";		
		}
		
		
		if($status!="" )
		{
			$sql .= " AND appo.booking_status= '".$status."'  ";
			
		}
		
		
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
			
		}
		
				
		
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
	
		//echo $sql;
		
		$orders = $wpdb->get_results($sql );
		$orders_total = $this->fetch_result($orders);
		$orders_total = $orders_total->total;
		$this->total_result = $orders_total ;
		
		$total_pages = $orders_total;
				
		$limit = "";
		$current_page = $ini;
		$target_page =  site_url()."/wp-admin/admin.php?page=bookingultra&tab=appointments";
		
		$how_many_per_page =  $howmany;
		
		$to = $how_many_per_page;
		
		//caluculate from
		$from = $this->calculate_from($ini,$how_many_per_page,$orders_total );
		
		//get all	
		
		$sql =  "SELECT appo.*, usu.*, serv.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		
		
		if($is_client){			
		
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";
				
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";
		}
		
			
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}


			
		
		
		if($is_client){		
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_user_id =  '".$staff_id."'  ";	
				
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_staff_id =  '".$staff_id."'  ";	
		}
		
		
		if($status!="" )
		{
			$sql .= " AND appo.booking_status= '".$status."'  ";
			
		}		
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
		
		
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
		}
		
		
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$sql .= " ORDER BY appo.booking_id DESC";		
		
	    if($from != "" && $to != ""){	$sql .= " LIMIT $from,$to"; }
	 	if($from == 0 && $to != ""){	$sql .= " LIMIT $from,$to"; }
		
					
		$orders = $wpdb->get_results($sql );
		
		//echo $sql;
		
		return $orders ;
		
	
	}
	
	/*Get all filtered*/
	public function get_all_filtered ($staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		$keyword = "";
		$month = "";
		$day = "";
		$year = "";
		$howmany = "";
		$ini = "";
		
		$bup_staff_calendar = "";
		
		$special_filter='';
		
		$is_client  = $this->is_client($staff_id);
		
		if(isset($_GET["keyword"]))
		{
			$keyword = $_GET["keyword"];		
		}
		
		if(isset($_GET["bp_month"]))
		{
			$month = $_GET["bp_month"];		
		}
		
		if(isset($_GET["bp_day"]))
		{
			$day = $_GET["bp_day"];		
		}
		
		if(isset($_GET["bp_year"]))
		{
			$year = $_GET["bp_year"];		
		}
		
		if(isset($_GET["bp_status"]))
		{
			$bp_status = $_GET["bp_status"];		
		}
		
		if(isset($_GET["howmany"]))
		{
			$howmany = $_GET["howmany"];		
		}
		
		if(isset($_GET["special_filter"]))
		{
			$special_filter = $_GET["special_filter"];		
		}
		
		if(isset($_GET["bup-staff-calendar"]))
		{
			$bup_staff_calendar = $_GET["bup-staff-calendar"];		
		}
		
		
		
		
				
		$uri= $_SERVER['REQUEST_URI'] ;
		$url = explode("&ini=",$uri);
		
		if(is_array($url ))
		{
			if(isset($url["1"]))
			{
				$ini = $url["1"];
			    if($ini == ""){$ini=1;}
			
			}
		
		}		
		
		
		
		if($howmany == ""){$howmany=20;}
		
		
		
		//get total				
				
		$sql =  "SELECT count(*) as total, usu.*, serv.* , appo.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
						
		
		
		if($is_client ){
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";
			
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";
		
		}
			
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}
			
		
		
		
		if($is_client ){			

			$sql .= " WHERE serv.service_id = appo.booking_service_id AND appo.booking_user_id =  '".$staff_id."'    ";			
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id AND appo.booking_staff_id =  '".$staff_id."'    ";
		
		}
		
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
			
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}	
		
		
		if($bp_status !="")
		{
			$sql .= " AND appo.booking_status= '".$bp_status."'  ";
			
		}
		
		
		
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		//echo $sql;
		
		$orders = $wpdb->get_results($sql );
		$orders_total = $this->fetch_result($orders);
		$orders_total = $orders_total->total;
		$this->total_result = $orders_total ;
		
		$total_pages = $orders_total;
				
		$limit = "";
		$current_page = $ini;
		$target_page =  site_url()."/wp-admin/admin.php?page=bookingultra&tab=appointments";
		
		$how_many_per_page =  $howmany;
		
		$to = $how_many_per_page;
		
		//caluculate from
		$from = $this->calculate_from($ini,$how_many_per_page,$orders_total );
		
		//get all	
		
		$sql =  "SELECT appo.*, usu.*, serv.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		
		
		if($is_client ){			

			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";	
					
		}else{
			
			$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";
		
		}
			
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}


			
		
		
		
		if($is_client ){			

			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_user_id =  '".$staff_id."'    ";		
					
		}else{
			
			$sql .= " WHERE serv.service_id = appo.booking_service_id  AND appo.booking_staff_id =  '".$staff_id."'    ";	
		
		}
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
		
		
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}
		
		
		if($bp_status !="")
		{
			$sql .= " AND appo.booking_status= '".$bp_status."'  ";
			
		}
		
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$sql .= " ORDER BY appo.booking_id DESC";		
		
	    if($from != "" && $to != ""){	$sql .= " LIMIT $from,$to"; }
	 	if($from == 0 && $to != ""){	$sql .= " LIMIT $from,$to"; }
		
					
		$orders = $wpdb->get_results($sql );
		
		//echo $sql;
		
		return $orders ;
		
	
	}
	
	public function get_all_filters_by_staff ($staff_id)
	{
		global $wpdb;
				
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_filters ORDER BY filter_name ' ;								
		$rows = $wpdb->get_results($sql);
			
		return $rows;
		
				
	}
	
	public function calculate_from($ini, $howManyPagesPerSearch, $total_items)	
	{
		if($ini == ""){$initRow = 0;}else{$initRow = $ini;}
		
		if($initRow<= 1) 
		{
			$initRow =0;
		}else{
			
			if(($howManyPagesPerSearch * $ini)-$howManyPagesPerSearch>= $total_items) {
				$initRow = $totalPages-$howManyPagesPerSearch;
			}else{
				$initRow = ($howManyPagesPerSearch * $ini)-$howManyPagesPerSearch;
			}
		}
		
		
		return $initRow;
		
		
	}
	
	public function fetch_result($results)
	{
		if ( empty( $results ) )
		{
		
		
		}else{
			
			
			foreach ( $results as $result )
			{
				return $result;			
			
			}
			
		}
		
	}
	
	function get_staff_top_book_appointment($staff_id)
	{
		global  $bookingultrapro;
		
		
		$html ='';
		$url = $this->get_profile_menu_url('appointment', $staff_id);	
	
		$html .= '<a class="bup-btn-top1-book" href="'.$url.'" title="'.__('Make an Appointment', 'bookingup').'"><span><i class="fa fa-calendar-plus-o fa-2x"></i>'.__('Make an Appointment', 'bookingup').'</span></a>';
		
		return $html;
		
	}
	
	
	function get_staff_top_profile_location($user_id)
	{
		global  $bookingultrapro;
		
		require_once(ABSPATH . 'wp-includes/user.php');
		
		$city = get_user_meta( $user_id, "city", true );
		$address = get_user_meta( $user_id, "address", true );
		$country = get_user_meta( $user_id, "country", true );
		
		$full_location = $address;
		
		if($city != ''){$full_location .= ', ' .$city;}
		if($country != ''){$full_location .= ', ' .$country;}

		
		$html =' <div class="bupcol1">                        
                            <small><i class="fa fa-map-marker fa-2x"></i> '.$full_location.' </small> 
                        
                        </div>';
		
		
		return $html;
		
	}
	
	
	function get_staff_top_right_nav_profile($staff_id)
	{
		global  $bookingultrapro;
		
		require_once(ABSPATH . 'wp-includes/user.php');

		
		$html ='';
		
		$html .='<ul>';
		
		$my_id = get_current_user_id();	
		
			 
		if ($my_id != $staff_id) { //seeing other user's profile, different nav options.
		
			$permalink_profile = $this->get_user_profile_permalink($staff_id);
		
			//$html .= '<li>';
			//$html .= '<a class="bup-btn-top1-menu" href="'.$permalink_profile.'" title="'.__('My Profile', 'bookingup').'"><span><i class="fa fa-user fa-2x"></i></span></a>';			
			//$html .= '</li>';
			
					
		}else{ //seeing my own profile
		
		
			if($staff_id!='' && $staff_id!=0)
			{				
				
				$permalink_profile = $this->get_user_profile_permalink($staff_id);
			
				$html .= '<li>';
				$html .= '<a class="bup-btn-top1-menu" href="'.$permalink_profile.'" title="'.__('My Profile', 'bookingup').'"><span><i class="fa fa-user fa-2x"></i></span></a>';			
				$html .= '</li>';
				
				$account_page_id = $bookingultrapro->get_option('bup_my_account_page');				
				$my_account_url = get_page_link($account_page_id);
						
				$html .= '<li>';
				$html .= '<a class="bup-btn-top1-menu" href="'.$my_account_url.'" title="'.__('My Account', 'bookingup').'"><span><i class="fa fa-wrench fa-2x"></i></span></a>';			
				$html .= '</li>';
				
				$account_page_id = $bookingultrapro->get_option('bup_my_account_page');				
				$my_account_url = get_page_link($account_page_id);
				
				$uri = $my_account_url."?module=displayall&bp_status=0";
				
					$html .= '<li>';
					$html .= '<a class="bup-btn-top1-menu" href="'.$uri.'" title="'.__('My Appointments', 'bookingup').'"><span><i class="fa fa-calendar fa-2x"></i></span></a>';	
						
				
					//my appointments			
					$user_id = get_current_user_id();
					
					$total = $bookingultrapro->appointment->get_appointments_total_by_status(0,$staff_id);
					if($total>0)
					{
						$html .= '<div class="bup-noti-bubble-top" title="'.__('Pending Approval', 'bookingup').'">'.$total.'</div>';			
					}		
					$html .= '</li>';
				
			}
				
				
				
				
		}			
		
		$html .='</ul>';
		
		return $html;
		
	}
	
	
	function get_me_wphtml_editor($meta, $content)
	{
		// Turn on the output buffer
		ob_start();
		
		$editor_id = $meta;				
		$editor_settings = array('media_buttons' => false , 'textarea_rows' => 15 , 'teeny' =>true); 
							
					
		wp_editor( $content, $editor_id , $editor_settings);
		
		// Store the contents of the buffer in a variable
		$editor_contents = ob_get_clean();
		
		// Return the content you want to the calling function
		return $editor_contents;

	
	
	}
	
	function get_staff_schedule_profile($staff_id)
	{
		global  $bookingultrapro;
		
		$time_format = $bookingultrapro->service->get_time_format();
		
		$html ='';	
		
		$html .= '<div class="bup-schedule-title">';
		
			$html .= '<div class="bup-col1">'.__('Day','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.__('From','bookingup').'</div>';
			$html .= '<div class="bup-col3">'.__('To','bookingup').'</div>';
					
		$html .= '</div>';
		
		//staff hourly						 
 		$staff_hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id, $day_num_of_week);
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,1);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		//day 1 Monday
				
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Monday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';		
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,2);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Tuesday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';				
		$html .= '</div>';	
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,3);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Wednesday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,4);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Thursday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,5);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Friday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,6);
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Saturday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';
		
		$hourly = $bookingultrapro->service->get_hourly_for_staf($staff_id,7);	
		
		if($hourly) //not hourly, we retreive a predefined value
		{
			$from =  date($time_format, strtotime($hourly->avail_from));
			$to =  date($time_format, strtotime($hourly->avail_to));
				
		}else{
			
			$from =  __('OFF','bookingup');
			$to =  __('OFF','bookingup');		
		}
		
		$html .= '<div class="bup-schedule-row">';		
			$html .= '<div class="bup-col1">'.__('Sunday','bookingup').'</div>';
			$html .= '<div class="bup-col2">'.$from.'</div>';
			$html .= '<div class="bup-col3">'.$to.'</div>';					
		$html .= '</div>';		
		
		return $html;
		
	
	}
	
	
	public function bup_get_payment_form () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';	
		
		$order_amount='';
		$order_txt_id='';
		
		$payment_id = '';		
		if(isset($_POST['payment_id'])){$payment_id = $_POST['payment_id'];}
		
		$appointment_id = '';		
		if(isset($_POST['appointment_id'])){$appointment_id = $_POST['appointment_id'];}
		
	
		$order_date =	date('m/d/Y');
		
		$status_pending ='';
		$status_confirmed ='';
		
		if($payment_id!='' && $appointment_id!='')		
		{
			//get payments			
			$order = $bookingultrapro->order->get_order_edit( $payment_id , $appointment_id);
			$order_date =	date('m/d/Y', strtotime($order->order_date));
			
			$order_amount =	$order->order_amount;
			$order_txt_id =	$order->order_txt_id;			
			
		}			
			
		$html .= '<p>'.__('Amount:','bookingup').'</p>' ;	
		$html .= '<p><input type="text" id="bup_payment_amount" value="'.$order_amount.'"></p>' ;
		$html .= '<p>'.__('Transaction ID:','bookingup').'</p>' ;	
		$html .= '<p><input type="text" id="bup_payment_transaction" value="'.$order_txt_id.'"></p>' ;		
		$html .= '<p>'.__('Date:','bookingup').'</p>' ;	
		
		$html .= '<p>'.'<input type="text" class="bupro-datepicker" id="bup_payment_date" value="'.$order_date .'" /></p>' ;
		
		
		$html .= '<input type="hidden" id="bup_payment_id" value="'.$payment_id .'" />' ;
		
		$html .= '<p>'.__('Status:','bookingup').'</p>' ;
		$html .= '<p><select name="bup_payment_status" id="bup_payment_status">
				  <option value="pending" >'.__('Pending','bookingup').'</option>
				  <option value="confirmed" selected>'.__('Confirmed','bookingup').'</option>
				</select>' ;
		
				
		echo $html;		
		die();
	
	}
	
	function get_staff_map_location_profile($staff_id)
	{
		global  $bookingultrapro;
		
		$html ='';
		
		$html .='<div id="bup_map_canvas" class="bup-map-staff"  style="width:100%; height:200px"></div>';
		$html .='<input type="hidden" id="bup-map-staff-country" value="'.get_user_meta( $staff_id, "country", true ).'">';	
		$html .='<input type="hidden" id="bup-map-staff-city" value="'.get_user_meta( $staff_id, "city", true ).'">';	
		$html .='<input type="hidden" id="bup-map-staff-address" value="'.get_user_meta( $staff_id, "address", true ).'">';		
		
		
		return $html;
		
	
	}
	
	function get_staff_services_profile($staff_id)
	{
		global  $bookingultrapro;
		
		$html ='';
		
		$cate_rows = $bookingultrapro->service->get_all_categories();
		
		foreach ( $cate_rows as $cate )
		{
			//is this staff member offering this?	
			if(!$bookingultrapro->userpanel->staff_offer_this_category( $staff_id, $cate->cate_id ))
			{
				//echo "not offered : " .$cate->cate_name ."<br>";
				continue;
			}
			
			
			$html .= '<div class="bup-serv-category-title">';				
						
					$html .= '<div class="bup-col1">'.$cate->cate_name.'</div>';
					$html .= '<div class="bup-col2">'.__('Price','bookingup').'</div>';
					$html .= '<div class="bup-col3">'.__('Capacity','bookingup').'</div>';
					
					
			$html .= '</div>';
					
			//get services						
			$servi_rows = $bookingultrapro->service->get_all_services($cate->cate_id);
			foreach ( $servi_rows as $serv )
			{
				if($bookingultrapro->userpanel->staff_offer_service( $staff_id, $serv->service_id ))
				{
					//get service data						
					$serv_data = $bookingultrapro->userpanel->get_staff_service_rate($staff_id, $serv->service_id);							
							
					$html .= '<div class="bup-profile-service-row">';
					
						$html .= '<div class="bup-col1">'.$serv->service_title.'</div>';
						$html .= '<div class="bup-col2">'.$bookingultrapro->get_price_format($serv->service_price).'</div>';
						$html .= '<div class="bup-col3">'.$serv_data['capacity'].'</div>';
						
					$html .= '</div>';
				}
				
			}
		
		}
		
		return $html;
		
	
	}
	
	/*Get all services this staff member offers*/
	public function get_all_services_by_staff ($staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		//get total				
				
		$sql =  "SELECT usu.*, serv.* , appo.* 	  " ;
		
				$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
						
		$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";	
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
	}
	
	/*Get all*/
	public function get_all_by_staff ($staff_id)
	{
		global $wpdb,  $bup_filter, $bookingultrapro;
		
		$keyword = "";
		$month = "";
		$day = "";
		$year = "";
		$howmany = "";
		$ini = "";
		
		$bup_staff_calendar = "";
		
		$special_filter='';
		
		if(isset($_GET["keyword"]))
		{
			$keyword = $_GET["keyword"];		
		}
		
		if(isset($_GET["month"]))
		{
			$month = $_GET["month"];		
		}
		
		if(isset($_GET["day"]))
		{
			$day = $_GET["day"];		
		}
		
		if(isset($_GET["year"]))
		{
			$year = $_GET["year"];		
		}
		
		if(isset($_GET["howmany"]))
		{
			$howmany = $_GET["howmany"];		
		}
		
		if(isset($_GET["special_filter"]))
		{
			$special_filter = $_GET["special_filter"];		
		}
		
		if(isset($_GET["bup-staff-calendar"]))
		{
			$bup_staff_calendar = $_GET["bup-staff-calendar"];		
		}
		
		
		
		
				
		$uri= $_SERVER['REQUEST_URI'] ;
		$url = explode("&ini=",$uri);
		
		if(is_array($url ))
		{
			if(isset($url["1"]))
			{
				$ini = $url["1"];
			    if($ini == ""){$ini=1;}
			
			}
		
		}		
		
		
		
		if($howmany == ""){$howmany=20;}
		
		
		
		//get total				
				
		$sql =  "SELECT count(*) as total, usu.*, serv.* , appo.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
						
		$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";	
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}
			
		$sql .= " WHERE serv.service_id = appo.booking_service_id  ";
		
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
			
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}	
		
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$orders = $wpdb->get_results($sql );
		$orders_total = $this->fetch_result($orders);
		$orders_total = $orders_total->total;
		$this->total_result = $orders_total ;
		
		$total_pages = $orders_total;
				
		$limit = "";
		$current_page = $ini;
		$target_page =  site_url()."/wp-admin/admin.php?page=bookingultra&tab=appointments";
		
		$how_many_per_page =  $howmany;
		
		$to = $how_many_per_page;
		
		//caluculate from
		$from = $this->calculate_from($ini,$how_many_per_page,$orders_total );
		
		//get all	
		
		$sql =  "SELECT appo.*, usu.*, serv.* 	  " ;
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= ", bookmeta.*, bookfilter.* ";			
		}
		
		$sql .= " FROM " . $wpdb->prefix . "bup_bookings appo ";
		
		$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";	
		$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_services serv ON (serv.service_id = appo.booking_service_id)";	
		
		if($special_filter!="" && isset($bup_filter))
		{
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_bookings_meta bookmeta ON (bookmeta.meta_booking_id = appo.booking_id)";
			$sql .= " RIGHT JOIN ". $wpdb->prefix."bup_filters bookfilter ON (bookfilter.filter_id = bookmeta.meta_booking_value)";
		}

			
		$sql .= " WHERE serv.service_id = appo.booking_service_id    ";	
		
		if($special_filter!=""){$sql .= " AND bookmeta.meta_booking_id = appo.booking_id AND bookfilter.filter_id = bookmeta.meta_booking_value AND bookmeta.meta_booking_value='$special_filter' AND bookmeta.meta_booking_name='filter_id' ";	}
		
		
			
		if($keyword!="")
		{
			$sql .= " AND (ord.order_txt_id LIKE '%".$keyword."%' OR usu.display_name LIKE '%".$keyword."%' OR usu.user_email LIKE '%".$keyword."%' OR usu.user_login LIKE '%".$keyword."%'  )  ";
		}
		
		if($bup_staff_calendar!="")
		{
			$sql .= " AND  appo.booking_staff_id = '".$bup_staff_calendar."'";
			
		}
		
		if($day!=""){$sql .= " AND DAY(appo.booking_time_from) = '$day'  ";	}
		if($month!=""){	$sql .= " AND MONTH(appo.booking_time_from) = '$month'  ";	}		
		if($year!=""){$sql .= " AND YEAR(appo.booking_time_from) = '$year'";}	
		
		$sql .= " ORDER BY appo.booking_id DESC";		
		
	    if($from != "" && $to != ""){	$sql .= " LIMIT $from,$to"; }
	 	if($from == 0 && $to != ""){	$sql .= " LIMIT $from,$to"; }
		
					
		$orders = $wpdb->get_results($sql );
		
		return $orders ;
		
	
	}
	
	
	public function get_appointments_planing_total($when, $staff_id)
	{
		
		global $wpdb, $bookingultrapro;
		
		$total = 0;
		
		$is_client  = $this->is_client($staff_id);
		
		if($when=='today')
		{
			 $date = date( 'Y-m-d ', current_time( 'timestamp', 0 ) );
			 		
		}elseif($when=='tomorrow'){
			
			$ini_date = date( 'Y-m-d ', current_time( 'timestamp', 0 ) );
			$date=  date("Y-m-d", strtotime("$ini_date + 1 day"));
		
		}					
       		
		if($when=='week')
		{
			$dt_min = new DateTime("last sunday");
			$dt_max = clone($dt_min);
			$dt_max->modify('+6 days');
			
			$date_from =$dt_min->format('Y-m-d');
			$date_to =$dt_max->format('Y-m-d');
			

			
			$sql =  'SELECT count(*) as total, appo.*, usu.* FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;
							
			if($is_client){
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";
				$sql .= " WHERE DATE(appo.booking_time_from) >= '".$date_from."' AND DATE(appo.booking_time_to) <= '".$date_to."' AND usu.ID = appo.booking_user_id AND appo.booking_status = '1' ";
				
			}else{
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";
				$sql .= " WHERE DATE(appo.booking_time_from) >= '".$date_from."' AND DATE(appo.booking_time_to) <= '".$date_to."' AND usu.ID = appo.booking_staff_id AND appo.booking_status = '1' ";			
			}							
			
			
		}elseif($when=='all'){
			
			
			$sql =  'SELECT count(*) as total, appo.*, usu.* FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;			
			
			if($is_client){
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";					
				$sql .= " WHERE  usu.ID = appo.booking_user_id   ";	
				
			}else{
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";					
				$sql .= " WHERE  usu.ID = appo.booking_staff_id   ";			
			}				
			
		}else{
			
			$sql =  'SELECT count(*) as total, appo.*, usu.* FROM ' . $wpdb->prefix . 'bup_bookings appo  ' ;
			
			if($is_client){
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_user_id)";					
				$sql .= " WHERE DATE(appo.booking_time_from) = '".$date."' AND usu.ID = appo.booking_user_id AND  appo.booking_status = '1' ";	
				
			}else{
				
				$sql .= " RIGHT JOIN ".$wpdb->users ." usu ON (usu.ID = appo.booking_staff_id)";					
				$sql .= " WHERE DATE(appo.booking_time_from) = '".$date."' AND usu.ID = appo.booking_staff_id AND  appo.booking_status = '1' ";		
			}		
		
		}
		
		
		if($is_client){
				
			$sql .= " AND  appo.booking_user_id = '".$staff_id."'  ";
				
		}else{
				
			$sql .= " AND  appo.booking_staff_id = '".$staff_id."'  ";	
		}		
		
			
		$appointments = $wpdb->get_results($sql );
		
		foreach ( $appointments as $appointment )
		{
				$total= $appointment->total;			
			
		}
					
		
		return $total;
	
	
	}
	
	
	
	//crop avatar image
	function bup_crop_avatar_user_profile_image()
	{
		global $bookingultrapro;
		global $wpdb;
		
		require_once(ABSPATH . 'wp-includes/link-template.php');
		$site_url = site_url()."/";		
	
		/// Upload file using Wordpress functions:
		$x1 = $_POST['x1'];
		$y1 = $_POST['y1'];
		
		$x2 = $_POST['x2'];
		$y2= $_POST['y2'];
		$w = $_POST['w'];
		$h = $_POST['h'];	
		
		$image_id =   $_POST['image_id'];
	
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$user_id = $current_user->ID;	
		
		if($user_id==''){echo 'error';exit();}
				
		
		$bookingultrapro->imagecrop->setDimensions($x1, $y1, $w, $h)	;
		
		$upload_dir = wp_upload_dir(); 
		$path_pics =   $upload_dir['basedir'];		
		$src = $path_pics.'/'.$user_id.'/'.$image_id;
		
		//new random image and crop procedure				
		$bookingultrapro->imagecrop->setImage($src);
		$bookingultrapro->imagecrop->createThumb();		
		$info = pathinfo($src);
        $ext = $info['extension'];
		$ext=strtolower($ext);		
		$new_i = time().".". $ext;		
		$new_name =  $path_pics.'/'.$user_id.'/'.$new_i;				
		$bookingultrapro->imagecrop->renderImage($new_name);
		//end cropping
		
		//check if there is another avatar						
		$user_pic = get_user_meta($user_id, 'user_pic', true);	
		
		//resize
		//check max width		
		$original_max_width = $bookingultrapro->get_option('media_avatar_width'); 
        $original_max_height =$bookingultrapro->get_option('media_avatar_height'); 
		
		if($original_max_width=="" || $original_max_height=="")
		{			
			$original_max_width = 80;			
			$original_max_height = 80;			
		}
														
		list( $source_width, $source_height, $source_type ) = getimagesize($new_name);
		
		if($source_width > $original_max_width) 
		{
			if ($this->image_resize($new_name, $new_name, $original_max_width, $original_max_height,0)) 
			{
				$old = umask(0);
				chmod($new_name, 0755);
				umask($old);										
			}		
		}					
						
		if ( $user_pic!="" )
		{
				
			 //there is a pending avatar - delete avatar																					
			 	
			 $path_avatar = $path_pics['baseurl']."/".$user_id."/".$image_id;					
										  
			 //delete								
			 //update meta
			  update_user_meta($user_id, 'user_pic', $new_i);		  
			  
		  }else{
			  
			  //update meta
			  update_user_meta($user_id, 'user_pic', $new_i);
								  
		  
		  }
		  
		  
		  if(file_exists($src))
		  {
			  unlink($src);
		  }
			 
	
		// Create response array:
		$uploadResponse = array('image' => $new_name);
		
		// Return response and exit:
		echo json_encode($uploadResponse);
		
		die();
		
	}
	
	function image_resize($src, $dst, $width, $height, $crop=0)
	{
		
		  if(!list($w, $h) = getimagesize($src)) return "Unsupported picture type!";
		
		  $type = strtolower(substr(strrchr($src,"."),1));
		  if($type == 'jpeg') $type = 'jpg';
		  switch($type){
			case 'bmp': $img = imagecreatefromwbmp($src); break;
			case 'gif': $img = imagecreatefromgif($src); break;
			case 'jpg': $img = imagecreatefromjpeg($src); break;
			case 'png': $img = imagecreatefrompng($src); break;
			default : return "Unsupported picture type!";
		  }
		
		  // resize
		  if($crop){
			if($w < $width or $h < $height) return "Picture is too small!";
			$ratio = max($width/$w, $height/$h);
			$h = $height / $ratio;
			$x = ($w - $width / $ratio) / 2;
			$w = $width / $ratio;
		  }
		  else{
			if($w < $width and $h < $height) return "Picture is too small!";
			$ratio = min($width/$w, $height/$h);
			$width = $w * $ratio;
			$height = $h * $ratio;
			$x = 0;
		  }
		
		  $new = imagecreatetruecolor($width, $height);
		
		  // preserve transparency
		  if($type == "gif" or $type == "png"){
			imagecolortransparent($new, imagecolorallocatealpha($new, 0, 0, 0, 127));
			imagealphablending($new, false);
			imagesavealpha($new, true);
		  }
		
		  imagecopyresampled($new, $img, 0, 0, $x, 0, $width, $height, $w, $h);
		
		  switch($type){
			case 'bmp': imagewbmp($new, $dst); break;
			case 'gif': imagegif($new, $dst); break;
			case 'jpg': imagejpeg($new, $dst,100); break;
			case 'jpeg': imagejpeg($new, $dst,100); break;
			case 'png': imagepng($new, $dst,9); break;
		  }
		  return true;
	}
	
	function display_avatar_image_to_crop($image, $user_id=NULL)	
	{
		 global $bookingultrapro;
		
		/* Custom style */		
		wp_register_style( 'bup_image_cropper_style', bookingup_url.'js/cropper/cropper.min.css');
		wp_enqueue_style('bup_image_cropper_style');	
					
		wp_enqueue_script('simple_cropper',  bookingup_url.'js/cropper/cropper.min.js' , array('jquery'), false, false);
		
	  
	    $template_dir = get_template_directory_uri();		  
				
		$site_url = site_url()."/";
		
		$html = "";
		
		$upload_dir = wp_upload_dir(); 
		$upload_folder =   $upload_dir['basedir'];		
				
		$user_pic = get_user_meta($user_id, 'user_profile_bg', true);		
		
		if($image!="")
		{
			$url_image_to_crop = $upload_dir['baseurl'].'/'.$user_id.'/'.$image;			
			$html_image = '<img src="'.$url_image_to_crop.'" id="uultra-profile-cover-horizontal" />';					
			
		}
		
		$my_account_url = $bookingultrapro->userpanel->get_my_account_direct_link 
		
		
		
		?>
        
        
      	<div id="uultra-dialog-user-bg-cropper-div" class="bup-dialog-user-bg-cropper"  >	
				<?php echo $html_image ?>                   
		</div>          
             
             
             <p>
                                                      
                            <button name="plupload-browse-button-avatar" id="uultra-confirm-avatar-cropping" class="bup-button-upload-avatar" type="link"><span><i class="fa fa-crop"></i></span> <?php	_e('Crop & Save', 'bookingup') ; ?>	</button>
                            <div class="bup-please-wait-croppingmessage" id="bup-cropping-avatar-wait-message">&nbsp;</div>
                            </p>                           
                            
                            <div class="uultra-uploader-buttons-delete-cancel" id="btn-cancel-avatar-cropping" >
                            <a href="?page=bookingultra&tab=users&ui=<?php echo $user_id?>" class="uultra-remove-cancel-avatar-btn"><?php	_e('Cancel', 'bookingup') ; ?></a>
                            </div>
            
     			<input type="hidden" name="x1" value="0" id="x1" />
				<input type="hidden" name="y1" value="0" id="y1" />				
				<input type="hidden" name="w" value="<?php echo $w?>" id="w" />
				<input type="hidden" name="h" value="<?php echo $h?>" id="h" />
                <input type="hidden" name="image_id" value="<?php echo $image?>" id="image_id" />
                <input type="hidden" name="user_id" value="<?php echo $user_id?>" id="user_id" />
                <input type="hidden" name="site_redir" value="<?php echo $my_account_url."?module=upload_avatar&"?>" id="site_redir" />
                
		
		<script type="text/javascript">
		
		
				jQuery(document).ready(function($){
					
				
					<?php
					
					
					
					$source_img = $upload_folder.'/'.$user_id.'/'.$image;	
									 
					 $r_width = $this->getWidth($source_img);
					 $r_height= $this->getHeight($source_img);
					 
					$original_max_width = $bookingultrapro->get_option('media_avatar_width'); 
					$original_max_height =$bookingultrapro->get_option('media_avatar_height'); 
					
					if($original_max_width=="" || $original_max_height=="")
					{			
						$original_max_width = 80;			
						$original_max_height = 80;
						
					}
					
					$aspectRatio = $original_max_width/$original_max_height;
					
					
					 
						 ?>
						var $image = jQuery(".bup-dialog-user-bg-cropper img"),
						$x1 = jQuery("#x1"),
						$y1 = jQuery("#y1"),
						$h = jQuery("#h"),
						$w = jQuery("#w");
					
					$image.cropper({
								  aspectRatio: <?php echo $aspectRatio?>,
								  autoCropArea: 0.6, // Center 60%
								  zoomable: false,
								  preview: ".img-preview",
								  done: function(data) {
									$x1.val(Math.round(data.x));
									$y1.val(Math.round(data.y));
									$h.val(Math.round(data.height));
									$w.val(Math.round(data.width));
								  }
								});
			
			})	
				
									
			</script>
		
		
	<?php	
		
	}
	
	//You do not need to alter these functions
	function getHeight($image) {
		$size = getimagesize($image);
		$height = $size[1];
		return $height;
	}

	//You do not need to alter these functions
	function getWidth($image) {
		$size = getimagesize($image);
		$width = $size[0];
		return $width;
	}
	
	
	// File upload handler:
	function bup_ajax_upload_avatar()
	{
		global $bookingultrapro;
		global $wpdb;
		
		require_once(ABSPATH . 'wp-includes/link-template.php');
		$site_url = site_url()."/";
		
		// Check referer, die if no ajax:
		check_ajax_referer('photo-upload');
		
		/// Upload file using Wordpress functions:
		$file = $_FILES['async-upload'];
		
		
		$original_max_width = $bookingultrapro->get_option('media_avatar_width'); 
        $original_max_height =$bookingultrapro->get_option('media_avatar_height'); 
		
		if($original_max_width=="" || $original_max_height=="")
		{			
			$original_max_width = 80;			
			$original_max_height = 80;
			
		}
		
			
	
		$current_user = $bookingultrapro->userpanel->get_user_info();
		$o_id = $current_user->ID;

		
				
		$info = pathinfo($file['name']);
		$real_name = $file['name'];
        $ext = $info['extension'];
		$ext=strtolower($ext);
		
		$rand = $this->genRandomString();
		
		$rand_name = "avatar_".$rand."_".session_id()."_".time(); 
		
	
		$upload_dir = wp_upload_dir(); 
		$path_pics =   $upload_dir['basedir'];
			
			
		if($ext == 'png' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'gif') 
		{
			if($o_id != '')
			{
				
				   if(!is_dir($path_pics."/".$o_id."")) 
				   {
						//$this->CreateDir($path_pics."/".$o_id);	
						 wp_mkdir_p( $path_pics."/".$o_id );							   
					}					
										
					$pathBig = $path_pics."/".$o_id."/".$rand_name.".".$ext;						
					
					
					if (copy($file['tmp_name'], $pathBig)) 
					{
						//check auto-rotation						
						if($bookingultrapro->get_option('avatar_rotation_fixer')=='yes')
						{
							$this->orient_image($pathBig);
						
						}
						
						$upload_folder = $bookingultrapro->get_option('media_uploading_folder');				
						$path = $site_url.$upload_folder."/".$o_id."/";
						
						//check max width												
						list( $source_width, $source_height, $source_type ) = getimagesize($pathBig);
						
						if($source_width > $original_max_width) 
						{
							//resize
						//	if ($this->createthumb($pathBig, $pathBig, $original_max_width, $original_max_height,$ext)) 
							//{
								//$old = umask(0);
								//chmod($pathBig, 0755);
								//umask($old);
														
							//}
						
						
						}
						
						
						
						$new_avatar = $rand_name.".".$ext;						
						$new_avatar_url = $path.$rand_name.".".$ext;				
						
						
						//check if there is another avatar						
						$user_pic = get_user_meta($o_id, 'user_pic', true);						
						
						if ( $user_pic!="" )
			            {
							//there is a pending avatar - delete avatar																					
							$path_avatar = $path_pics."/".$o_id."/".$user_pic;					
														
							//delete								
							if(file_exists($path_avatar))
							{
								//unlink($path_avatar);
							}
							
												
							
						}else{
							
																	
						
						}
						
						//update user meta
						
					}
									
					
			     }  		
			
        } // image type
		
		// Create response array:
		$uploadResponse = array('image' => $new_avatar);
		
		// Return response and exit:
		echo json_encode($uploadResponse);
		
		//echo $new_avatar_url;
		die();
		
	}
	
	
	
	public function orient_image($file_path) 
	{
        if (!function_exists('exif_read_data')) {
            return false;
        }
        $exif = @exif_read_data($file_path);
        if ($exif === false) {
            return false;
        }
        $orientation = intval(@$exif['Orientation']);
        if (!in_array($orientation, array(3, 6, 8))) {
            return false;
        }
        $image = @imagecreatefromjpeg($file_path);
        switch ($orientation) {
            case 3:
                $image = @imagerotate($image, 180, 0);
                break;
            case 6:
                $image = @imagerotate($image, 270, 0);
                break;
            case 8:
                $image = @imagerotate($image, 90, 0);
                break;
            default:
                return false;
        }
        $success = imagejpeg($image, $file_path);
        // Free up memory (imagedestroy does not delete files):
        @imagedestroy($image);
        return $success;
    }
	
	public function confirm_reset_password_user()
	{
		global $wpdb,  $bookingultrapro, $wp_rewrite;
		
		require_once(ABSPATH . 'wp-includes/general-template.php');
		require_once(ABSPATH . 'wp-includes/link-template.php');
		require_once(ABSPATH . 'wp-includes/user.php');
		
		$wp_rewrite = new WP_Rewrite();
		
		$user_id = get_current_user_id();		
				
		//check redir		
		$account_page_id = $bookingultrapro->get_option('login_page_id');		
		$my_account_url = get_permalink($account_page_id);		
		
		
		$PASSWORD_LENGHT =7;
		
		$password1 = $_POST['p1'];
		$password2 = $_POST['p2'];
		
		$html = '';
		$validation = '';
		
	
		if($password1!=$password2)
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Password must be identical ", 'bookingup')."</div>";
			$html = $validation;			
		}
		
		if(strlen($password1)<$PASSWORD_LENGHT)
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Password should contain at least 7 alphanumeric characters ", 'bookingup')."</div>";
			$html = $validation;		
		}
		
		
		if($validation=="" )
		{
		
			if($user_id >0 )
			{
					$user = get_userdata($user_id);
					//print_r($user);
					$user_id = $user->ID;
					$user_email = $user->user_email;
					$user_login = $user->user_login;			
					
					wp_set_password( $password1, $user_id ) ;
					
					//notify user					
					$bookingultrapro->messaging->send_new_password_to_user($user, $password1);
					
					$html = "<div class='bup-ultra-success'>".__(" Success!! The new password has been changed. Please click on the login link to get in your account.  ", 'bookingup')."</div>";
					
					// Here is the magic:
					wp_cache_delete($user_id, 'users');
					wp_cache_delete($username, 'userlogins'); // This might be an issue for how you are doing it. Presumably you'd need to run this for the ORIGINAL user login name, not the new one.
					wp_logout();
					wp_signon(array('user_login' => $user_login, 'user_password' => $password1));
					
				}else{
									
				}
					
			}
		 echo $html;
		 die();
		
	
	}
	
	public function update_personal_data_profile()
	{
		global $wpdb,  $bookingultrapro, $wp_rewrite;
		
		require_once(ABSPATH . 'wp-includes/user.php');
		
				
		$user_id = get_current_user_id();
	
	
		$display_name = $_POST['bup_display_name'];
		
		$country = $_POST['bup_country'];
		$city = $_POST['bup_city'];
		$address = $_POST['bup_address'];
		
		$description = $_POST['desc_text'];
		$summary = $_POST['summary_text'];
		$html = '';
		$validation = '';
		
		wp_update_user( array( 'ID' => $user_id, 'display_name' => $display_name ) );

		//update meta
		update_user_meta ($user_id, 'bup_description', $description);
		update_user_meta ($user_id, 'bup_summary', $summary);	
		
		update_user_meta ($user_id, 'country', $country);
		update_user_meta ($user_id, 'city', $city);
		update_user_meta ($user_id, 'address', $address);
		
	    $html = "<div class='bup-ultra-success'>".__(" Success!! Your Personal Details Were Updated  ", 'bookingup')."</div>";
		
		 echo $html;
		 die();
		
	
	}
	
	
	public function confirm_update_email_user()
	{
		global $wpdb,  $bookingultrapro, $wp_rewrite;
		
		require_once(ABSPATH . 'wp-includes/general-template.php');
		require_once(ABSPATH . 'wp-includes/link-template.php');
		require_once(ABSPATH . 'wp-includes/user.php');
		
		$wp_rewrite = new WP_Rewrite();
		
		$user_id = get_current_user_id();
	
	
		$email = $_POST['email'];
		$html = '';
		$validation = '';
		
	
		//validate if it's a valid email address	
		$ret_validate_email = $this->validate_valid_email($email);
		
		if($email=="")
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Please type your new email ", 'bookingup')."</div>";
			$html = $validation;			
		}
		
		if(!$ret_validate_email)
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Please type a valid email address ", 'bookingup')."</div>";
			$html = $validation;			
		}
		
		$current_user = get_userdata($user_id);
		//print_r($user);
		$current_user_email = $current_user->user_email;
		
		//check if already used
		
		$check_user = get_user_by('email',$email);
		$user_check_id = $check_user->ID;
		$user_check_email = $check_user->ID;
		
		if($validation=="" )
		{
		
			if($user_check_id==$user_id) //this is the same user then change email
			{
				$validation .= "<div class='bup-ultra-error'>".__(" ERROR! You haven't changed your email. ", 'bookingup')."</div>";
				$html = $validation;
				
			
			}else{ //email already used by another user
			
				if($user_check_email!="")
				{
			
					$validation .= "<div class='bup-ultra-error'>".__(" ERROR! The email is in use already ", 'bookingup')."</div>";
					$html = $validation;
				
				}else{
					
					//email available
					
				}
				
			
			}
		
		}
		
		
		
		if($validation=="" )
		{
		
			if($user_id >0 )
			{
					$user = get_userdata($user_id);
					$user_id = $user->ID;
					$user_email = $user->user_email;
					$user_login = $user->user_login;	
					
					$user_id = wp_update_user( array( 'ID' => $user_id, 'user_email' => $email ) );
					
					//update mailchimp?
					$mail_chimp = get_user_meta( $user_id, 'bup_mailchimp', true);
					
					if($mail_chimp==1) //the user has a mailchip account, then we have to sync
					{
						if($bookingultrapro->get_option('mailchimp_api'))
						{
							$list_id =  $bookingultrapro->get_option('mailchimp_list_id');					 
							//$bookingultrapro->newsletter->mailchimp_subscribe($user_id, $list_id);
						}
					}
					
					
																
										
					$html = "<div class='bup-ultra-success'>".__(" Success!! Your email account has been changed to : ".$email."  ", 'bookingup')."</div>";
					
																			
				}else{
					
									
				}
					
			}
		 echo $html;
		 die();
		
	
	}
	
	function validate_valid_email ($myString)
	{
		$ret = true;
		if (!filter_var($myString, FILTER_VALIDATE_EMAIL)) {
    		// invalid e-mail address
			$ret = false;
		}
					
		return $ret;	
	
	}
	
	//this payment is added by the staff member
	public function add_payment_to_appointment_confirm()
	{
		
		global $wpdb, $bookingultrapro;	
		
		$html='';	
		
		
		$staff_id = get_current_user_id();
		
		$bup_payment_amount = $_POST['bup_payment_amount'];
		$bup_payment_transaction = $_POST['bup_payment_transaction'];		
		$bup_payment_date = $_POST['bup_payment_date'];
		$bup_booking_id = $_POST['bup_booking_id'];	
		$bup_payment_id = $_POST['bup_payment_id'];
		$bup_payment_status = $_POST['bup_payment_status'];
		
		if($this->is_my_appointment($bup_booking_id, $staff_id))
		{	
		
			if($bup_booking_id!='' && $bup_payment_amount!='' && $bup_payment_date!='' && $bup_payment_id=='')		
			{
						
				$query = "INSERT INTO " . $wpdb->prefix ."bup_orders (`order_booking_id`,`order_txt_id`, `order_method_name`, `order_status` ,`order_amount` , `order_date`) VALUES ('$bup_booking_id','".$bup_payment_transaction."','local','".$bup_payment_status."', '$bup_payment_amount',  
				'".date('Y-m-d',strtotime($bup_payment_date)) ."')";
				
				$wpdb->query( $query );
				$html ='OK';
			
			}else{
				
				$query = "UPDATE " . $wpdb->prefix ."bup_orders  SET `order_txt_id` = '".$bup_payment_transaction."',  `order_status` = '".$bup_payment_status."' ,`order_amount` = '$bup_payment_amount' , `order_date` = '".date('Y-m-d',strtotime($bup_payment_date)) ."' WHERE  `order_booking_id` = '$bup_booking_id' AND `order_ID` = '$bup_payment_id' ";
				
				$wpdb->query( $query );
				$html ='OK';
				
				
			}
		
		}
		
		echo $html;
		die();
		
				
	
	}
	
	/**
	Get Menu Links
	******************************************/
	public function get_user_backend_menu_new($slug, $title , $icon = null)
	{
		global $bookingultrapro;
		
		$url = "";
		
		$uri = $this->build_user_menu_uri($slug);	
		
		$url = '<a class="bup-btn-u-menu" href="'.$uri.'" title="'.$title.'"><span><i class="fa '.$icon.' fa-2x"></i></span><span class="bup-user-menu-text">'.$title.'</span></a>';
		
		
		if($slug=='profile')
		{
			//check if unread replies or messages			
			$user_id = get_current_user_id();
			
			$uri = $this->get_user_profile_permalink($user_id);
			
			$url = '<a class="bup-btn-u-menu" href="'.$uri.'" title="'.$title.'"><span><i class="fa '.$icon.' fa-2x"></i></span><span class="bup-user-menu-text">'.$title.'</span></a>';	
						
		
		}	
				
		//messsages
		if($module["slug"]=='messages')
		{
			//check if unread replies or messages			
			$user_id = get_current_user_id();
			///$total = $xoouserultra->mymessage->get_unread_messages_amount($user_id);
			
			if($total>0)
			{
				$url .= '<div class="uultra-noti-bubble" title="'.__('Unread Messages', 'bookingup').'">'.$total.'</div>';			
			}			
		
		}
		
		
		return $url;	
		
	
	}
	
	function build_user_menu_uri($slug)
	{
		global $bookingultrapro;
		$uri = "";
		
				
		if(!isset($_GET["page_id"]))
		{
			$uri = '?module='.$slug;
			
		}else{
						
			$uri = '?page_id='.$_GET["page_id"].'&module='.$slug;
			
		}
		
				
		if($slug=='logout')
		{
			$uri = $this->get_logout_url();
		
		}
		
		return $uri;
	
	}
	
	
	/*Prepare user meta*/
	function prepare ($array ) 
	{
		foreach($array as $k => $v) {
			if ($k == 'bup-client-form') continue;
			$this->usermeta[$k] = $v;
		}
		return $this->usermeta;
	}
	
	
	/*Handle commons sigun ups*/
	function handle() 
	{
	    global $bookingultrapro, $blog_id;
	    
		require_once(ABSPATH . 'wp-includes/user.php');
		
		if ( empty( $GLOBALS['wp_rewrite'] ) )
		{
			 $GLOBALS['wp_rewrite'] = new WP_Rewrite();
	    }
		
		
		$noactive = false;
		foreach($this->usermeta as $key => $value) 
		{
		
			if ($key == 'user_login') 
			{
				if (sanitize_user($value) == '')
				{
					$this->errors[] = __('<strong>ERROR:</strong> The username field is empty.','bookingup');
				}
			}
			
			if ($key == 'user_pass')
			{
				if (esc_attr($value) == '') 
				{
					$this->errors[] = __('<strong>ERROR:</strong> The password field is empty.','bookingup');
				}
			}
		}	
				
	
			/* attempt to signon */
			if (!is_array($this->errors)) 
			{				
				$creds = array();
				
				// Adding support for login by email
				if(is_email($_POST['user_login']))
				{
				    $user = get_user_by( 'email', $_POST['user_login'] );
				    
				    if(isset($user->data->user_login))
					{
				        $creds['user_login'] = $user->data->user_login;
						
				    }else{
						
				        $creds['user_login'] = '';
					
					}
					
					// check if active					
					$user_id =$user->ID;				
					if(!$this->is_active($user_id))
					{
						$noactive = true;
						
					}
				
				}else{
					
					// User is trying to login using username					
					$user = get_user_by('login',$_POST['user_login']);
					
					// check if active and it's not an admin		
					if(isset($user))	
					{
						$user_id =$user->ID;	
						
					
					}else{
						
						$user_id ="";
						
					}
							
					if(!$this->is_active($user_id) && !is_super_admin($user_id))
					{
						$noactive = true;						
					}				
					
					$creds['user_login'] = sanitize_user($_POST['user_login']);			
				
				}
				
				$creds['user_password'] = $_POST['login_user_pass'];
				$creds['remember'] = $_POST['rememberme'];					
				
				
				if(!$noactive)
				{								
					$user = wp_signon( $creds, false );			
	
					if ( is_wp_error($user) ) 
					{
						
						if ($user->get_error_code() == 'invalid_username') {
							$this->errors[] = __('<strong>ERROR:</strong> Invalid Username was entered.','bookingup');
						}
						if ($user->get_error_code() == 'incorrect_password') {
							$this->errors[] = __('<strong>ERROR:</strong> Incorrect password was entered.','bookingup');
						}
						
						if ($user->get_error_code() == 'empty_password') {
							$this->errors[] = __('<strong>ERROR:</strong> Please provide Password.','bookingup');
						}
						
						
											
					}else{	
						
						
						$this->bup_auto_login($user->user_login);						
						$this->login_registration_afterlogin();
					
					}
					
				
				}else{
					
					//not active
					$this->errors[] = __('<strong>ERROR:</strong> Your account is not active.','bookingup');
				 
				}
			}
		
	}
	
	/*Send Welcome Email to Staff Member*/
	function send_welcome_email_to_staff() 
	{
	    global $bookingultrapro, $blog_id;
	    
		require_once(ABSPATH . 'wp-includes/user.php');
		
		if ( empty( $GLOBALS['wp_rewrite'] ) )
		{
			 $GLOBALS['wp_rewrite'] = new WP_Rewrite();
	    }
		
		
		$staff_id	=$_POST['staff_id'];
	
		$user = get_user_by( 'id', $staff_id );
		$user_id =$user->ID;		
		
		//generate reset link
		$unique_key =  $this->get_unique_verify_account_id();
				
		//web url
		$web_url = $this->get_password_reset_page_direct_link();				
		$pos = strpos("page_id", $web_url);  
				
		if ($pos === false) //not page_id found
		{
			  //
			  $reset_link = $web_url."?resskey=".$unique_key;
			  
		} else {
			   
			   // found then we're using seo links					 
			   $reset_link = $web_url."&resskey=".$unique_key;					  
		}
		
		//update meta
		update_user_meta ($user_id, 'bup_ultra_very_key', $unique_key);	
		
		//notify users			  
		$bookingultrapro->messaging->send_welcome_email_link($user, $reset_link);			  
		
		//send reset link to user		  			  
		 $html = "<div class='bup-ultra-success'>".__(" A reset link has been sent to the user. ", 'bookingup')."</div>";
		 
		echo $html;
		die(); 
		
    }
	
		
	
	/*Handle password reest*/
	function handle_password_reset() 
	{
	    global $bookingultrapro, $blog_id;
	    
		require_once(ABSPATH . 'wp-includes/user.php');
		
		if ( empty( $GLOBALS['wp_rewrite'] ) )
		{
			 $GLOBALS['wp_rewrite'] = new WP_Rewrite();
	    }
		
		$noactive = false;	
					 
		if( isset($_POST['user_login_reset']))
	    {
			$user_login = $_POST['user_login_reset'];
			 
		}else{
			
			$user_login ='';			 
			 
		}
		
		 
		 
		$user_login =sanitize_user($user_login);
		 
		 if( $user_login=='')
		 {			 
			 $this->errors[] = __('<strong>ERROR:</strong> The username field is empty.','bookingup');	 
		 }
		  
   		 /* attempt to get recover */
		 if (!is_array($this->errors)) 
		 {			 
			 
			 // Adding support for login by email
			 if(is_email($_POST['user_login_reset']))
			 {				 
				 $user = get_user_by( 'email', $_POST['user_login_reset'] );
				 
		 
				 // check if we have a valid username		
				 if(isset($user) && $user != false)	
				 {
					 
					$user_id =$user->ID;		
					
				 }else{
											
					$user_id ="";	
					$this->errors[] = __('<strong>ERROR:</strong> Invalid Email or Username.','bookingup');					
					
				 }
									
				 if(!$this->is_active($user_id))
				 {
					 $noactive = true;						
				 }
				
			  }else{
				  
				   					
					// User is trying to login using username					
					$user = get_user_by('login',$_POST['user_login_reset']);
					
					// check if we have a valid username		
					if(isset($user) && $user != false)	
					{
						$user_id =$user->ID;		
					
					}else{
												
						$user_id ="";	
						$this->errors[] = __('<strong>ERROR:</strong> Invalid Email or Username.','bookingup');					
					}
							
					if(!$this->is_active($user_id) && !is_super_admin($user_id))
					{
						$noactive = true;
						
					}				
					
					$user_login = sanitize_user($_POST['user_login_reset']);	
				
				 }
				
			
				
				if(!$noactive)
				{								
					
								
				}else{
					
					//not active
					$this->errors[] = __('<strong>ERROR:</strong> Your account is not active.','bookingup');
				 
				}				
				
			}else{				
				
				
			}
			
			
			//we send notification emails			
			if($user_id!="" && isset($user) && $user != false)
		  	{				
				//generate reset link
				$unique_key =  $this->get_unique_verify_account_id();
				
				//web url
				$web_url = $this->get_password_reset_page_direct_link();
				
				$pos = strpos("page_id", $web_url);
  
				
				if ($pos === false) //not page_id found
				{
					  //
					  $reset_link = $web_url."?resskey=".$unique_key;
					  
				} else {
					   
					   // found then we're using seo links					 
					   $reset_link = $web_url."&resskey=".$unique_key;					  
				}
				
				//update meta
				update_user_meta ($user_id, 'bup_ultra_very_key', $unique_key);	
				
				//notify users			  
				$bookingultrapro->messaging->send_reset_link($user, $reset_link);			  
				
				//send reset link to user		  			  
				 $html = "<div class='bup-ultra-success'>".__(" A reset link has been sent to your email. ", 'bookingup')."</div>";
				 
				 $this->get_sucess_message_reset= $html; 
			 
		  	} ///end send emails
		
    }
  
  /*---->> Check if user is active before login  ****/
	function is_active($user_id) 
	{
		global $bookingultrapro ;
		
		$checkuser = get_user_meta($user_id, 'bup_account_status', true);
		$res = '';
		if ($checkuser == 'active' || $checkuser == '') //this is a tweak for already members
		{
			$res = true; //the account is active
		
		}else{
			
			$res = false;
		
		}
		
		//check if user has access to backend		
		if($bookingultrapro->userpanel->has_account_permision($user_id, 'bup_per_backend_access'))
		{
			$res = true; //the account is active
		
		}else{
			
			$res = false;
		
		}
		
		
		return $res;		
		
   }
  
  public function get_login_page_direct_link()
  {
		global $bookingultrapro, $wp_rewrite ;
		
		$wp_rewrite = new WP_Rewrite();		
		require_once(ABSPATH . 'wp-includes/link-template.php');		
		
		$account_page_id = $bookingultrapro->get_option('bup_user_login_page');		
		$my_account_url = get_permalink($account_page_id);
		
		return $my_account_url;
	
  }
	
  public function get_password_reset_page_direct_link()
  {
		global $bookingultrapro, $wp_rewrite ;
		
		$wp_rewrite = new WP_Rewrite();		
		require_once(ABSPATH . 'wp-includes/link-template.php');		
		
		$account_page_id = $bookingultrapro->get_option('bup_password_reset_page');		
		$my_account_url = get_permalink($account_page_id);
		
		return $my_account_url;
	
	}
	
  public function get_unique_verify_account_id()
  {
	  session_start();
	  $rand = $this->genRandomString(8);
	  $key = session_id()."_".time()."_".$rand;
	  
	  return $key;
	  
	 
  }
  
  public function genRandomString($length) 
  {
		
		$characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWZYZ";
		
		$real_string_legnth = strlen($characters) ;
		//$real_string_legnth = $real_string_legnth– 1;
		$string="ID";
		
		for ($p = 0; $p < $length; $p++)
		{
			$string .= $characters[mt_rand(0, $real_string_legnth-1)];
		}
		
		return strtolower($string);
	}
	
	public function get_password_recover_page()
	{
		global $bookingultrapro, $wp_rewrite, $blog_id ; 
		
		$wp_rewrite = new WP_Rewrite();
		
		require_once(ABSPATH . 'wp-includes/link-template.php');		
		require_once(ABSPATH . 'wp-includes/load.php');		
		
		$account_page_id = $bookingultrapro->get_option('bup_password_reset_page');				
		$my_account_url = get_page_link($account_page_id);				
						
		if($account_page_id=="")
		{
			$url = "NO";						
		}else{
			
			$url = $my_account_url;		
						
		}
		
		return $url;					
				
		
	}
	
	public function get_login_page()
	{
		global $bookingultrapro, $wp_rewrite, $blog_id ; 
		
		$wp_rewrite = new WP_Rewrite();
		
		require_once(ABSPATH . 'wp-includes/link-template.php');		
		require_once(ABSPATH . 'wp-includes/load.php');		
		
		$account_page_id = $bookingultrapro->get_option('bup_user_login_page');				
		$my_account_url = get_page_link($account_page_id);				
						
		if($account_page_id=="")
		{
			$url = "NO";						
		}else{
			
			$url = $my_account_url;		
						
		}
		
		return $url;					
				
		
	}
	
	
	
	
	public function login_registration_afterlogin()
	{
		global $bookingultrapro, $wp_rewrite, $blog_id ; 
		
		$wp_rewrite = new WP_Rewrite();
		
		require_once(ABSPATH . 'wp-includes/link-template.php');		
		require_once(ABSPATH . 'wp-includes/load.php');
		
		
		if (isset($_REQUEST['redirect_to']))
		{
			$url = $_REQUEST['redirect_to'];
				
		} elseif (isset($_POST['redirect_to'])) {
		
			$url = $_POST['redirect_to'];
				
		} else {
								
					//$redirect_custom_page = $bookingultrapro->get_option('redirect_after_registration_login');				
					//$url = get_page_link($redirect_custom_page);
					
					//if($url=='' || $redirect_custom_page=='')
					//{						
						//check redir		
						$account_page_id = $bookingultrapro->get_option('bup_my_account_page');				
						$my_account_url = get_page_link($account_page_id);				
						
						if($my_account_url=="")
						{
							$url = $_SERVER['REQUEST_URI'];
						
						}else{
							
							$url = $my_account_url;				
						
						}
					
				
		}		
		
		wp_redirect( $url );
		exit();
	
	}
	
	/* Auto login user */
	function bup_auto_login( $username, $remember=true ) 
	{
		ob_start();
		if ( !is_user_logged_in() ) {
			$user = get_user_by('login', $username );
			$user_id = $user->ID;
			wp_set_current_user( $user_id, $username );
			wp_set_auth_cookie( $user_id, $remember );
			do_action( 'wp_login', $user->user_login, $user );
		} else {
			wp_logout();
			$user = get_user_by('login', $username );
			$user_id = $user->ID;
			wp_set_current_user( $user_id, $username );
			wp_set_auth_cookie( $user_id, $remember );
			do_action( 'wp_login', $user->user_login, $user );
		}
		ob_end_clean();
	}
	
		
	
	/**
	* Add the shortcodes
	*/
	function profile_shortcodes() 
	{	
		add_shortcode( 'bupro_user_login', array(&$this,'user_login') );
		add_shortcode( 'bupro_user_recover_password', array(&$this,'user_recover_password') );
		add_shortcode( 'bup_account', array(&$this,'user_account') );
		add_shortcode( 'bup_profile', array(&$this,'user_profile') );
		add_shortcode( 'bup_staff_list', array(&$this,'staff_list') );		
		
	}
	
	public function  staff_list ($atts)
	{
		global $bookingultrapro;				
		return $this->get_staff_list($atts);		
		
	}
	
	public function  user_login ($atts)
	{
		global $bookingultrapro;				
		return $this->get_client_login_form($atts);		
		
	}
	
	public function  user_recover_password ($atts)
	{
		global $bookingultrapro;				
		return $this->get_client_recover_password_form($atts);		
		
	}
	
	public function  user_account ($atts)
	{
		global $bookingultrapro;
		
		
			if (!is_user_logged_in()) 
			{				
				
				return $this->get_client_login_form( $atts );
				
			}else{				
				
				return $this->get_my_account_page( $atts );
			}	
							
			
	}
	
	public function  user_profile ($atts)
	{
		global $bookingultrapro;				
		return $this->get_my_profile_page( $atts );
			
	}

	
	
	/**
	 * Users Profile
	 */
	public function get_my_profile_page($atts )
	{
		global $wpdb, $current_user;		
		$user_id = get_current_user_id();
		
		extract( shortcode_atts( array(	
			
			'disable' => '',
			'booking_form_template_id' => '',
			'template' => ''						
			
		), $atts ) );
		
		$modules = array();
		$modules  = explode(',', $disable);			
      
        $content = $this->get_user_profile($atts);
		return  $content;
		  
	}
	
	public function is_client($user_id )
	{
		global $wpdb, $current_user,$bookingultrapro;	
		
		$is_client = $bookingultrapro->bup_get_user_meta($user_id, 'bup_is_client');
		
		if($is_client==1)
		{
			return true;
						
		}else{
						
			return false;		
		}
		  
	}
	
		
	function get_user_profile( $atts){
		
		global $bookingultrapro;		
		
		extract( shortcode_atts( array(	
			
			'disable' => '',
			'booking_form_template_id' => '',
			'template' => ''						
			
		), $atts ) );
		
		
		//get current user			
		$current_user = $this->get_user_data_by_uri();
		
		if(isset($current_user->ID))
		{
			$user_id = $current_user->ID;				
			
		}
		
		$tab = $_GET['tab'];
		
		$google_map = $bookingultrapro->get_option('google_map_profile_active');		
		
		if(!isset($_GET['tab'])) //only if we are on homepage
		{
			if($google_map=='1' || $google_map=='')	
			{
				//get API KEY			
				$google_api_key = $bookingultrapro->get_option('google_api_key');
				
				wp_register_script( 'bup_googlemap_js', bookingup_comp_url.'js/bup-gmap.js', array( 
				'jquery') );
				wp_enqueue_script( 'bup_googlemap_js' );	
							
				//include google map		
				wp_register_script( 'bupcopm_gmap_api_js', 'https://maps.google.com/maps/api/js?key='.$google_api_key.'&callback=initMapBUP',array('jquery'),  null, true);
				wp_enqueue_script('bupcopm_gmap_api_js');			
					
			}
		
		}		
		
		//turn on output buffering to capture script output
        ob_start();
		
        //include the specified file			
		$theme_path = get_template_directory();		
		
		if(file_exists($theme_path."/bupro/profile.php"))
		{
			include($theme_path."/bupro/profile.php");
		
		}else{
			
			include(bookingup_comp_path.'/templates/profile.php');
		
		}		
		//assign the file output to $content variable and clean buffer
        $content = ob_get_clean();
		return  $content;
	}
	
	
	/**
	 * Users Dashboard
	 */
	public function get_my_account_page($atts )
	{
		global $wpdb, $current_user;		
		$user_id = get_current_user_id();
		
		extract( shortcode_atts( array(	
			
			'disable' => ''						
			
		), $atts ) );
		
		$modules = array();
		$modules  = explode(',', $disable);
		
      
        $content = $this->get_staff_account();
		return  $content;
		  
	}
	
	
	function get_staff_list($atts){
		
		global $bookingultrapro;	
		
		extract( shortcode_atts( array(	
			
			'template' => 'staff_list',	
			'bgcolor' => '#f04646'						
			
		), $atts ) );		
		
		//get staff list		
		$relation = "AND";
		$args= array('keyword' => $uultra_combined_search ,  'relation' => $relation,  'sortby' => 'ID', 'order' => 'DESC');
		$users_list = $bookingultrapro->userpanel->get_staff_filtered($args);
				
		//turn on output buffering to capture script output
        ob_start();
		
        //include the specified file			
		$theme_path = get_template_directory();				
		
		if(file_exists($theme_path."/bupro/staff_list.php"))
		{
			//include custom css
			//$this->add_front_end_styles_staff_list_template();
			include($theme_path."/bupro/staff_list.php");
		
		}else{
			
			//include custom css
			//$this->add_front_end_styles_staff_list();			
			include(bookingup_comp_path.'/templates/'.$template.'.php');		
		}
		
		//assign the file output to $content variable and clean buffer
        $content = ob_get_clean();
		return  $content;		
	
	}
	
	function get_staff_account(){
		
		global $bookingultrapro;		
		
		//turn on output buffering to capture script output
        ob_start();
		
        //include the specified file			
		$theme_path = get_template_directory();		
		
		if(file_exists($theme_path."/bupro/dashboard.php"))
		{
			
			include($theme_path."/bupro/dashboard.php");
		
		}else{
			
			include(bookingup_comp_path.'/templates/dashboard.php');
		
		}		
		//assign the file output to $content variable and clean buffer
        $content = ob_get_clean();
		return  $content;		
	
	}
	
	
	/*Get errors display*/
	function get_errors()
	 {
		global $bookingultrapro;
		
		$display = null;
		
		if (isset($this->errors) && is_array($this->errors))  
		{
		    $display .= '<div class="bup-ultra-error">';
		
			foreach($this->errors as $newError) 
			{
				
				$display .= '<span class="bup-error bup-error-block"><i class="bup-icon-remove"></i>'.$newError.'</span>';
			
			}
		$display .= '</div>';
		
		
		} else {
			
			if (isset($_REQUEST['redirect_to']))
			{
				$url = $_REQUEST['redirect_to'];
				
			} elseif (isset($_POST['redirect_to'])) {
				
				$url = $_POST['redirect_to'];
				
			} else {
				
				$url = $_SERVER['REQUEST_URI'];
			}
			wp_redirect( $url );
		}
		return $display;
	}
	
	
	/*Get errors display*/
	function get_errors_reset()
	 {
		global $bookingultrapro;
		
		$display = null;
		
		if (isset($this->errors) && is_array($this->errors))  
		{
		    $display .= '<div class="bup-ultra-error">';
		
			foreach($this->errors as $newError) 
			{
				
				$display .= '<span class="bup-error bup-error-block"><i class="bup-icon-remove"></i>'.$newError.'</span>';
			
			}
		$display .= '</div>';
		
		
		
		}
		return $display;
	}
	
	
	public function get_client_login_form($args=array()) 
	{
		
		global $bookingultrapro;
		
		/* Arguments */
		$defaults = array(       
			'redirect_to' => null,
			'form_header_text' => __('Login','xoousers')
			
        		    
		);
		$args = wp_parse_args( $args, $defaults );
		$args_2 = $args;
		extract( $args, EXTR_SKIP );
		
		$display = null;	
		
		$display .= '<div class="bup-front-cont">';
		
	    $display .= '<div class="bup-user-data-registration-form">';
		
		/*Display errors*/
		if (isset($_POST['bup-client-form-confirm']))
		{
			$display .= $this->get_errors();
		}
		
		
		$display .= '<form action="" method="post" id="bup-client-form" name="bup-client-form" enctype="multipart/form-data">';
		
		$display .= '<input type="hidden" name="bup-client-form-confirm" id="bup-client-form-confirm" >';

		
		$display .= '<div class="bup-profile-separator">'.__('Login data','bookingup').'</div>';
		
		
		$display .= '<div class="bup-profile-field">';									
		$display .= '<label class="bup-field-type" for="user_email_2">';
		$display .= '<i class="fa fa-user"></i>';	
		$display .= '<span>'.__('Username or Email', 'bookingup').' '.$required_text.'</span></label>';
						
					
					
		$display .= '<div class="bup-field-value">';
		
					$display .= '<input type="text" class="'.$required_class.' bup-input " name="user_login" id="user_login" value="'.$bookingultrapro->get_post_value('user_login').'" title="'.__('Type your Username or Email','bookingup').'"  placeholder="'.__('Type your Username or Email','bookingup').'" data-errormessage-value-missing="'.__(' * This input is required!','bookingup').'"/>';					
					$display .= '</div>'; //end field value
					
		$display .= '</div>'; //end field
		
		
		$display .= '<div class="bup-profile-field">';									
		$display .= '<label class="bup-field-type" for="login_user_pass">';
		$display .= '<i class="fa fa-lock"></i>';	
		$display .= '<span>'.__('Password', 'bookingup').' '.$required_text.'</span></label>';
						
					
					
		$display .= '<div class="bup-field-value">';
		
					$display .= '<input type="password" class="'.$required_class.' bup-input " name="login_user_pass" id="login_user_pass" value="'.$bookingultrapro->get_post_value('login_user_pass').'" title="'.__('Type your Password','bookingup').'"  placeholder="'.__('Type your Password','bookingup').'" data-errormessage-value-missing="'.__(' * This input is required!','bookingup').'"/>';					
					$display .= '</div>'; //end field value
					
		$display .= '</div>'; //end field
		
		$display .= '<div class="bup-profile-field">';
		
					$display .= '<button name="bup-btn-book-app-confirm-login" type="submit"  class="bup-button-submit-changes">'.__('Submit','bookingup').'	</button>';	
					
					$display .= '<br><br>';	
					
					$reset_link = $this->get_password_recover_page();
					
					if($reset_link=='NO'){
						
						$reset_password = __('Please set a password reset page.','bookingup');
						
					}else{
						
						$reset_password = '<a href="'.$reset_link.'">'.__('Forgot Password?','bookingup').'</a>';						
					
					}
					
					$display .= '<p class="bup-pass-reset-link">'.$reset_password.'</p>';				
								
				
		$display .= '</div>'; //end submit button	
		
		
		
		
		$display .= '</form>'; //end registration form
		$display .= '</div>'; //end registration form
		$display .= '</div>'; //end bup main cont
		
		
		return $display;
	}
	
	public function get_client_recover_password_form($args=array()) 
	{
		
		global $bookingultrapro;
		
		/* Arguments */
		$defaults = array(       
			'redirect_to' => null,
			'form_header_text' => __('Recover Password','xoousers')
			
        		    
		);
		$args = wp_parse_args( $args, $defaults );
		$args_2 = $args;
		extract( $args, EXTR_SKIP );
		
		$display = null;	
		
		$display .= '<div class="bup-front-cont">';
		
	    $display .= '<div class="bup-user-data-registration-form">';
		
		/*Display errors*/
		if (isset($_POST['bup-client-recover-pass-form-confirm']))
		{
			$display .= $this->get_errors_reset();
			$display .= $this->get_sucess_message_reset;
		}
		
		
		$display .= '<form action="" method="post" id="bup-client-recover-pass-form" name="bup-client-recover-pass-form" enctype="multipart/form-data">';
		
		if(isset($_GET['resskey']) && $_GET['resskey']!='') //this is a reset confirmation form
		{   
		    $icon = 'fa fa-lock';
			$type = 'password';
			$type_password=true;
			$reset_password_button='bup-reset-password-button-conf';	
			
			$display .= '<input type="hidden" name="bup-client-recover-pass-form-confirm-reset" id="bup-client-recover-pass-form-confirm-reset" >';	
			
			$display .= '<input type="hidden" name="bup_reset_key" id="bup_reset_key" value="'.$_GET['resskey'].'" >';	
			
			$legend = __('Type your new password', 'bookingup');
			$legend2 = __('Re-Type your password', 'bookingup');
				
		
		}else{ //the user is requestin a new password
		
			$icon = 'fa fa-user';
			$type = 'text';
			$reset_password_button='';
			$type_password=false;	
			$legend = __('Username or Email', 'bookingup');		
			$display .= '<input type="hidden" name="bup-client-recover-pass-form-confirm" id="bup-client-recover-pass-form-confirm" >';						
		
		}
		
		$display .= '<div class="bup-profile-separator">'.__('Recover your password','bookingup').'</div>';					
		
		$display .= '<div class="bup-profile-field">';									
		$display .= '<label class="bup-field-type" for="user_email_2">';
		$display .= '<i class="'.$icon.'"></i>';
		
		$display .= '<span>'.$legend .' '.$required_text.'</span></label>';					
					
		$display .= '<div class="bup-field-value">';
		
					$display .= '<input type="'.$type .'" class="'.$required_class.' bup-input " name="user_login_reset" id="user_login_reset" value="'.$bookingultrapro->get_post_value('user_login_reset').'" title="'.__('Type your Username or Email','bookingup').'"  placeholder="'.__('Type your Username or Email','bookingup').'" data-errormessage-value-missing="'.__(' * This input is required!','bookingup').'"/>';					
		
		
		$display .= '</div>'; //end field value
					
		$display .= '</div>'; //end field
		
		if($type_password){
			
			$display .= '<div class="bup-profile-field">';									
			$display .= '<label class="bup-field-type" for="user_email_2">';
			$display .= '<i class="'.$icon.'"></i>';
			
			$display .= '<span>'.$legend2 .' '.$required_text.'</span></label>';					
						
			$display .= '<div class="bup-field-value">';
			
						$display .= '<input type="password" class="'.$required_class.' bup-input " name="user_password_reset_2" id="user_password_reset_2" value="'.$bookingultrapro->get_post_value('user_login_reset').'" title="'.__('Type your new password again','bookingup').'"  placeholder="'.__('Type your new password again','bookingup').'" data-errormessage-value-missing="'.__(' * This input is required!','bookingup').'"/>';					
			
			$display .= '</div>'; //end field value						
			$display .= '</div>'; //end field
		}
		
		
		$display .= '<div class="bup-profile-field">';
		 
					$display .= '<button name="bup-btn-book-app-confirm-resetlink" id="bup-btn-book-app-confirm-resetlink" type="submit"  class="bup-button-submit-changes '.$reset_password_button.'">'.__('Submit','bookingup').'	</button>';
					$display .= '<span id="bup-pass-reset-message">&nbsp;</span>';
					
					$display .= '<br><br>';	
					
					$reset_link = $this->get_login_page();
					
					if($reset_link=='NO'){
						
						$reset_password = __('Please set a login page.','bookingup');
						
					}else{
						
						$reset_password = '<a href="'.$reset_link.'">'.__('Login to your account?','bookingup').'</a>';					
					}
					
					$display .= '<p class="bup-pass-reset-link">'.$reset_password.'</p>';							
				
		$display .= '</div>'; //end submit button	
		
		
		$display .= '</form>'; //end registration form
		$display .= '</div>'; //end registration form
		$display .= '</div>'; //end bup main cont
		
		return $display;
	}
	
	
	public function confirm_reset_password()
	{
		global $wpdb,  $bookingultrapro, $wp_rewrite;
		
		require_once(ABSPATH . 'wp-includes/general-template.php');
		require_once(ABSPATH . 'wp-includes/link-template.php');
		
		$wp_rewrite = new WP_Rewrite();
		
		//check redir		
		$account_page_id = $bookingultrapro->get_option('login_page_id');
		$my_account_url = get_permalink($account_page_id);
		
		
		$PASSWORD_LENGHT =7;
		
		$password1 = $_POST['p1'];
		$password2 = $_POST['p2'];
		$key = $_POST['key'];
		
		$html = '';
		$validation = '';
		
		//check password		
		if($password1!=$password2)
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Password must be identical ", 'bookingup')."</div>";
			$html = $validation;			
		}
		
		if(strlen($password1)<$PASSWORD_LENGHT)
		{
			$validation .= "<div class='bup-ultra-error'>".__(" ERROR! Password should contain at least 7 alphanumeric characters ", 'bookingup')."</div>";
			$html = $validation;		
		}		
		
		$user = $this->get_one_user_with_key($key);		
		
		if($validation=="" )
		{			
			if($user->ID >0 )
			{
				//print_r($user);
				$user_id = $user->ID;
				$user_email = $user->user_email;
				$user_login = $user->user_login;
				
				wp_set_password( $password1, $user_id ) ;
				
				//notify user				
				$bookingultrapro->messaging->send_new_password_to_user($user, $password1);				
				$html = "<div class='bup-ultra-success'>".__(" Success!! The new password has been sent to ".$user_email."  ", 'bookingup')."</div>";
				
												
			}else{
				
				// we couldn't find the user			
				$html = "<div class='bup-ultra-error'>".__(" ERROR! Invalid reset link ", 'bookingup')."</div>";
			
			}					
		}
		 echo $html;
		 die();
		
	
	}
	
	
	function get_one_user_with_key($key)
	{
		global $wpdb,  $bookingultrapro;
		
		$args = array( 	
						
			'meta_key' => 'bup_ultra_very_key',                    
			'meta_value' => $key,                  
			'meta_compare' => '=',  
			'count_total' => true,   


			);
		
		 // Create the WP_User_Query object
		$user_query = new WP_User_Query( $args );
		 
		// Get the results//
		$users = $user_query->get_results();	
		
		if(count($users)>0)
		{
			foreach ($users as $user)
			{
				return $user;
			
			}
			
		
		}else{			
			
			
		}		
	
	}	

}
$key = "profile";
$this->{$key} = new BupComplementProfile();
?>