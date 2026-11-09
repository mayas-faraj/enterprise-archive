<?php
class BupComplementGoogleCalendar
{
	
		
	public function __construct()
	{
		
		$this->load_library();			
	
    }
	
	public function load_library()
	{
		
		
	}
	
	//this is used on staff dashboard
	public function get_auth_url_staff()
	{
		global $bookingultrapro;
		
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
			$redirect_url = $bookingultrapro->get_my_account_page().'?module=account';
		
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setRedirectUri($redirect_url);
			$client->setAccessType('offline');
			$client->setApprovalPrompt('force');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			//$cal = new Google_CalendarService($client);		
			$authUrl = $client->createAuthUrl();
		
		}	
		
		return $authUrl;
		
			
	}
	
	public function get_auth_url()
	{
		global $bookingultrapro;
		
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
		
			$redirect_url = get_admin_url().'admin.php?page=bookingultra&tab=users';
		
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setRedirectUri($redirect_url);
			$client->setAccessType('offline');
			$client->setApprovalPrompt('force');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			//$cal = new Google_CalendarService($client);		
			$authUrl = $client->createAuthUrl();
		
		}	
		
		return $authUrl;
		
			
	}
	
	public function auth_client_with_code_staff($code, $current_staff_id=NULL)
	{
		global $bookingultrapro;
		
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
		
			$redirect_url = $bookingultrapro->get_my_account_page().'?module=account';		
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setRedirectUri($redirect_url);
			$client->setAccessType('offline');
			$client->setApprovalPrompt('force');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			$credentials = $client->authenticate($code); 
			
			$access_token = $client->getAccessToken();

		  	// Refresh the token if it's expired.
		    if ($client->isAccessTokenExpired()) 
		    {
			 // $client->refreshToken($client->getRefreshToken());
			
		    }
			
			update_user_meta ($current_staff_id, 'google_cal_access_token', $access_token);	
			
			//get all calendars			
			 $callendars = array();
			
			 //let's create the event.				 
			 $service = new Google_Service_Calendar($client);
			 
			 try {
				 
				 $calendarList  = $service->calendarList->listCalendarList();
				 
				 foreach ($calendarList->getItems() as $calendarListEntry) 
				 {
							   
				   $callendars[] = array('id' => $calendarListEntry->id, 'summary' => $calendarListEntry->getSummary());
				 }
				 
				 update_user_meta ($current_staff_id, 'google_calendar_list', $callendars);
			 
			 } catch (Google_Service_Exception $e) {

	
					$err_message = $e->getMessage();					
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
					
						print_r($err_message);
						exit();
					
					 }			 
			 
			 }
			 
			 		  	
		}	
		
		return $client;		
			
	}
	
	public function auth_client_with_code($code, $current_staff_id=NULL)
	{
		global $bookingultrapro;
		
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
		
			$redirect_url = get_admin_url().'admin.php?page=bookingultra&tab=users';
		
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setRedirectUri($redirect_url);
			$client->setAccessType('offline');
			$client->setApprovalPrompt('force');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			$credentials = $client->authenticate($code); 
			
			$access_token = $client->getAccessToken();

		  	// Refresh the token if it's expired.
		    if ($client->isAccessTokenExpired()) 
		    {
			 // $client->refreshToken($client->getRefreshToken());
			
		    }	
						
			update_user_meta ($current_staff_id, 'google_cal_access_token', $access_token);				
			
			//get all calendars			
			 $callendars = array();
			
			 //let's create the event.				 
			 $service = new Google_Service_Calendar($client);
			 
			 
			  try {
				  
				 $calendarList  = $service->calendarList->listCalendarList();
			 
				 foreach ($calendarList->getItems() as $calendarListEntry) 
				 {
							   
				   $callendars[] = array('id' => $calendarListEntry->id, 'summary' => $calendarListEntry->getSummary());
				 }
			 
			 	 update_user_meta ($current_staff_id, 'google_calendar_list', $callendars);


			 } catch (Google_Service_Exception $e) {
			
				
					$err_message = $e->getMessage();
								
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
								
							echo "ERROR retreiving calendar list". print_r($err_message);
							exit();
								
					 }
			
			 }
 
			 
			 
		  	
		}	
		
		return $client;
		
			
	}
	
	public function create_event($booking_id,$order_data)
	{
		global $bookingultrapro;		
		extract($order_data);
		
		$time_from = $day.' '.$time_from.':00';
		$time_to = $day.' '.$time_to.':00';
		
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
		
			$redirect_url = get_admin_url().'admin.php?page=bookingultra&tab=users';
		
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setRedirectUri($redirect_url);
			$client->setAccessType('offline');
			$client->setApprovalPrompt('force');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			
			//get staff access token		
			$accessToken = $bookingultrapro->bup_get_user_meta($staff_id, 'google_cal_access_token');			
			
			if($accessToken!='') //get auth url
			{
				
				$client->setAccessToken($accessToken);
	
				// Refresh the token if it's expired.
				if ($client->isAccessTokenExpired()) 
				{
					$client->refreshToken($client->getRefreshToken());				
					update_user_meta ($staff_id, 'google_cal_access_token', $client->getAccessToken());
				 }
				  
				 //let's create the event.				 
				 $service = new Google_Service_Calendar($client);
				 $google_calendar_default = $bookingultrapro->bup_get_user_meta($staff_id, 'google_calendar_default');
				 
				 $calendar_id = 'primary';				 
				 if($google_calendar_default!='')
				 {
					 $calendar_id = $google_calendar_default;
					 
				 }			 
				 
				 				 
				 $time_zone_string = get_option('timezone_string');	
				 
				 $sumary = 	$this->get_google_cal_sumary($service_id, $staff_id , $user_id);
				 $description = $this->get_google_cal_description($service_id, $staff_id , $user_id, $booking_id, $time_from); 
								 
				 $event_data = array(
							  'summary' => $sumary,
							  'description' => $description,
							  'start' => array(
								'dateTime' => $this->get_google_cal_date_format($time_from),
								'timeZone' => $time_zone_string,
							  ),
							  'end' => array(
								'dateTime' => $this->get_google_cal_date_format($time_to),
								'timeZone' => $time_zone_string,
							  ));
							  
				
				 
				 $event = new Google_Service_Calendar_Event($event_data);				 
				 
								 

				 try {
					 
					$new_event = $service->events->insert($calendar_id, $event);
					$new_event_id= $new_event->getId();					
					$bookingultrapro->appointment->update_booking_meta($booking_id, 'google_event_id', $new_event_id);
					$bookingultrapro->appointment->update_booking_meta($booking_id, 'google_calendar_id', $calendar_id);
					
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
					
						print_r($new_event);
						exit();
					
					 }
					
				
				 } catch (Google_Service_Exception $e) {
					
					$err_message = $e->getMessage();
					
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
					
						print_r($err_message);
						exit();
					
					 }
				 }
	
			
			} //end if staff access token
						
			
		  	
		}	
		
		return $err_message;
		
			
	}
	
	public function update_event($event_id, $calendar_id, $staff_id, $order_data)
	{
		global $bookingultrapro;
		
		
		extract($order_data);		
		$time_from = $day.' '.$time_from.':00';
		$time_to = $day.' '.$time_to.':00';
		
				
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
	
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setAccessType('offline');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			
			//get client access token		
			$accessToken = $bookingultrapro->bup_get_user_meta($staff_id, 'google_cal_access_token');			
			
			if($accessToken!='') //get auth url
			{				
				$client->setAccessToken($accessToken);
	
				// Refresh the token if it's expired.
				if ($client->isAccessTokenExpired()) 
				{
					$client->refreshToken($client->getRefreshToken());				
					update_user_meta ($staff_id, 'google_cal_access_token', $client->getAccessToken());
				 }
				  
				 //let's create the event.				 
				 $service = new Google_Service_Calendar($client);
				 
				 if($calendar_id=='')
				 {
					 
					  $calendar_id = 'primary';					 
				 }
				 
				 $time_zone_string = get_option('timezone_string');		 
				 
				 $sumary = 	$this->get_google_cal_sumary($service_id, $staff_id , $user_id);
				 $description = 	$this->get_google_cal_description($service_id, $staff_id , $user_id, $booking_id, $time_from); 
				 
				 // First retrieve the event from the API.
				 $event = $service->events->get($calendar_id, $event_id);	
				 
				// $event->setSummary($sumary);

				// $start = new Google_Service_Calendar_EventDateTime();
				// $start->setDateTime($this->get_google_cal_date_format($time_from));  
				// $event->setStart($start);
				// $end = new Google_Service_Calendar_EventDateTime();
				 //$end->setDateTime($this->get_google_cal_date_format($time_to));  
				// $event->setEnd($end);
				
				$event_data = array(
							  'summary' => $sumary,
							  'description' => $description,
							  'start' => array(
								'dateTime' => $this->get_google_cal_date_format($time_from),
								'timeZone' => $time_zone_string,
							  ),
							  'end' => array(
								'dateTime' => $this->get_google_cal_date_format($time_to),
								'timeZone' => $time_zone_string,
							  ));						 

				 try {
					 
					 				 
					 $updatedEvent = $service->events->update($calendar_id, $event->getId(), $event_data);			
					
				
				
				 } catch (Google_Service_Exception $e) {
					
					$err_message = $e->getMessage();
					
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
					
						print_r($err_message);
						exit();
					
					 }
				 }
	
			
			} //end if user access token						
			
		  	
		}
		
		return $err_message;	
			
	}
	
	public function delete_event($event_id, $calendar_id, $staff_id)
	{
		global $bookingultrapro;
		
				
		if (file_exists( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/google-api-php-client/src/Google/autoload.php' );	
		
	
			$client_id = $bookingultrapro->get_option('google_calendar_client_id');
			$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
			
			$client = new Google_Client();
			$client->setApplicationName("Google Calendar Application");
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setAccessType('offline');
			$client->setScopes(array('https://www.googleapis.com/auth/calendar'));
			
			//get client access token		
			$accessToken = $bookingultrapro->bup_get_user_meta($staff_id, 'google_cal_access_token');			
			
			if($accessToken!='') //get auth url
			{				
				$client->setAccessToken($accessToken);
	
				// Refresh the token if it's expired.
				if ($client->isAccessTokenExpired()) 
				{
					$client->refreshToken($client->getRefreshToken());				
					update_user_meta ($staff_id, 'google_cal_access_token', $client->getAccessToken());
				 }
				  
				 //let's create the event.				 
				 $service = new Google_Service_Calendar($client);
				 
				 if($calendar_id=='')
				 {
					 
					  $calendar_id = 'primary';					 
				 }			 
								 

				 try {
					 
					$new_event = $service->events->delete($calendar_id, $event_id);			
					
				
				
				 } catch (Google_Service_Exception $e) {
					
					$err_message = $e->getMessage();
					
					if($bookingultrapro->get_option('google_calendar_debug') == 'yes'){
					
						print_r($err_message);
						exit();
					
					 }
				 }
	
			
			} //end if user access token						
			
		  	
		}
		
		return $err_message;	
			
	}
	
	 /**
     * Returns a collection of Google calendar events
     *
     * @param \DateTime $start_date
     * @return array|false
     */
    public function getCalendarEvents( \DateTime $start_date )
    {
        // get all events from calendar, without timeMin filter (the end of the event can be later then the start of searched time period)
        $result = array();

        try {
			
            $calendar_access = $this->getCalendarAccess();
            $limit_events    = get_option( 'burpro_gc_limit_events' );

            $timeMin = $start_date->format( \DateTime::RFC3339 );

            $events = $this->service->events->listEvents( $this->getCalendarID(), array(
                'singleEvents' => true,
                'orderBy'      => 'startTime',
                'timeMin'      => $timeMin,
                'maxResults'   => $limit_events ?: self::EVENTS_PER_REQUEST,
            ) );

            while ( true ) {
                foreach ( $events->getItems() as $event ) {
                    /** @var \Google_Service_Calendar_Event $event */
                    // transparency = 'opaque'      - The event blocks time on the calendar.
                    //              = 'transparent' - The event does not block time on the calendar.
                    if ( $event->getStatus() !== 'cancelled' && ( $event->getTransparency() === null || $event->getTransparency() === 'opaque' ) ) {
                        // Skip events created by Bookly in non freeBusyReader calendar.
                        if ( $calendar_access != 'freeBusyReader' ) {
                            $ext_properties = $event->getExtendedProperties();
                            if ( $ext_properties !== null ) {
                                $private = $ext_properties->private;
                                if ( $private !== null && array_key_exists( 'service_id', $private ) ) {
                                    continue;
                                }
                            }
                        }

                        // Get start/end dates of event and transform them into WP timezone (Google doesn't transform whole day events into our timezone).
                        $event_start = $event->getStart();
                        $event_end   = $event->getEnd();

                        if ( $event_start->dateTime == null ) {
                            // All day event.
                            $event_start_date = new \DateTime( $event_start->date, new \DateTimeZone( $this->getCalendarTimezone() ) );
                            $event_end_date = new \DateTime( $event_end->date, new \DateTimeZone( $this->getCalendarTimezone() ) );
                        } else {
                            // Regular event.
                            $event_start_date = new \DateTime( $event_start->dateTime );
                            $event_end_date = new \DateTime( $event_end->dateTime );
                        }

                        // Convert to WP time zone.
                        $event_start_date = date_timestamp_set( date_create( Config::getWPTimeZone() ), $event_start_date->getTimestamp() );
                        $event_end_date   = date_timestamp_set( date_create( Config::getWPTimeZone() ), $event_end_date->getTimestamp() );

                        $result[] = new Slots\Booking(
                            0,
                            1,
                            $event_start_date->format( 'Y-m-d H:i:s' ),
                            $event_end_date->format( 'Y-m-d H:i:s' ),
                            0,
                            0,
                            0,
                            true
                        );
                    }
                }

                if ( ! $limit_events && $events->getNextPageToken() ) {
                    $events = $this->service->events->listEvents( $this->getCalendarID(), array(
                        'singleEvents' => true,
                        'orderBy'      => 'startTime',
                        'timeMin'      => $timeMin,
                        'pageToken'    => $events->getNextPageToken()
                    ) );
                } else {
                    break;
                }
            }

            return $result;
        } catch ( \Exception $e ) {
            $this->errors[] = $e->getMessage();
        }

        return false;
    }

		
	public function get_google_cal_date_format($date)
	{
		global $bookingultrapro;
		
		//2015-05-28T17:00:00-07:00
		$d_date = date('Y-m-d', strtotime($date));
		$d_time = date('H:i:s', strtotime($date));
		
		return $d_date.'T'.$d_time ;
	
	}
	
	public function get_google_cal_description($service_id, $staff_id , $user_id, $booking_id, $date_from)
	{
		global $bookingultrapro;
		
					
		$service = $bookingultrapro->service->get_one_service($service_id);	
		$staff_member = get_user_by( 'id', $staff_id );
		$client = get_user_by( 'id', $user_id );
		
		$time_format = $bookingultrapro->service->get_time_format();		
				
		$from_at = date($time_format, strtotime($date_from));
		$from_date = $bookingultrapro->commmonmethods->formatDate($date_from);
		
		//get meta data		
		$phone = $bookingultrapro->appointment->get_booking_meta($booking_id, 'full_number');
		
		if($phone==''){
			
			$phone = $bookingultrapro->appointment->get_booking_meta($booking_id, 'telephone');		
		}
		
		
	   // $line_break = '<br>';
		$line_break = "\r\n";	
		$html = '';	
		
		//$html = $service->service_title.  __(' by ', 'bookingup').$staff_member->display_name.  __(' at ', 'bookingup'). $from_at. __(' on ', 'bookingup') . $from_date;
		
				
		$html .= "-----".__("Appointment Details:","bookingup")."-----".  $line_break;	
		$html .= __('Service: ','bookingup') .$service->service_title. $line_break;
		$html .= __('Staff Member: ','bookingup').$staff_member->display_name. $line_break;		
		$html .= __('Client: ','bookingup').$client->display_name . $line_break;
		$html .= __('Phone: ','bookingup').$phone . $line_break;
		$html .= __('Client Email: ','bookingup').$client->user_email . $line_break;	
		$html .= __('Date: ','bookingup').$from_date . $line_break;
		$html .= __('Time: ','bookingup') .$from_at. $line_break;
		return $html ;
	
	}
	
	public function get_google_cal_sumary($service_id, $staff_id , $user_id)
	{
		global $bookingultrapro;
		
		$template = $bookingultrapro->get_option('google_calendar_template');
		
		$html ='';
		
		if($template=='service_name' || $template=='')
		{		
			$service = $bookingultrapro->service->get_one_service($service_id);			
			$html = $service->service_title;
			
		}elseif($template=='staff_name'){
			
			$staff_member = get_user_by( 'id', $staff_id );
			$html = $staff_member->display_name;
			
		}elseif($template=='client_name'){
			
			$client = get_user_by( 'id', $user_id );		
			$html = $client->display_name;
			
		}	
		
		return $html ;
	
	}
	
	//this is used on staff dashboard
	public function get_user_auth_status_staff($staff_id)
	{
		global $bookingultrapro;
		
		$html = '';
		
		$client_id = $bookingultrapro->get_option('google_calendar_client_id');
		$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
		
		//get client access token		
		$accessToken = $bookingultrapro->bup_get_user_meta($staff_id, 'google_cal_access_token');
		
		if($accessToken=='') //get auth url
		{
			if($client_id=='' || $client_secret=='')
			{				
				$html = "<p>".__('Please set client ID and client Secret!','bookingup')."</p>";
				
			
			}else{
				
				$auth_url = $this->get_auth_url_staff();			
				$html = "<p><a href='$auth_url'>".__('Connect Me!','bookingup')."</a></p>";
				
			}	
		
		}else{
			
			if($client_id=='' || $client_secret=='')
			{				
				$html = "<p>".__('Please set client ID and client Secret!','bookingup')."</p>";
				
			
			}else{		
			
				$html = "<p class='bup-backend-info-tool-conected' > ".__('Already Connected!','bookingup')."</p> <a href='#' id='bup-disconnect-gcal-user-front' user-id='".$staff_id."'><span><i class='fa fa-chain-broken'></i></span>&nbsp;".__('Disconnect','bookingup')."</a>";
				
				$html .= "<p>&nbsp;</p>";				
				$html .= "<p>".__('Select Your Calendar:','bookingup')."</p>";
				$html .= "<p>".$this->get_calendar_list_drop($staff_id)."</p>";
					
				$html .= '<p> <button name="bup-backenedb-set-gacal" id="bup-backenedb-set-gacal" class="bup-button-submit-changes">'.__('SET CALENDAR','bookingup').'	</button> </p>';
				
				$html .= "<p id='bup-gcal-message3'>&nbsp;</p>";
				
				$google_calendar_default = $bookingultrapro->bup_get_user_meta($staff_id, 'google_calendar_default');
				
				if($google_calendar_default=='')
				{
					$html .= "<p id='bup-gcal-message1' ><strong class='bup-backend-info-tool-warning'>".__("IMPORTANT: You haven't set a calendar, yet.",'bookingup')."</strong></p>";
					
					$html .= "<p class='bup-backend-info-tool' id='bup-gcal-message2'><i class='fa fa-info-circle'></i><strong>&nbsp;".__("If you don't set a calendar the primary calendar will be used by default. ",'bookingup')."</strong></p>";
				
				}else{
					
					$html .= "<p class='bup-backend-info-tool' id='bup-gcal-message44'><i class='fa fa-info-circle'></i><strong>&nbsp;".__("If you don't see your new calendars, plase disconnect and connect again. ",'bookingup')."</strong></p>";
					
					
				
				}							
			
			}
			
			
		}		
		
		return $html;
		
			
	}
	
	function get_calendar_list_drop($staff_id)	
	{
		global $bookingultrapro;
		
		$html = '<select name="bup_staff_calendar_list" size="1" id="bup_staff_calendar_list">';
		
		//display calendars list				
		$google_calendar_list = $bookingultrapro->bup_get_user_meta($staff_id, 'google_calendar_list');
		$google_calendar_default = $bookingultrapro->bup_get_user_meta($staff_id, 'google_calendar_default');
		
		 foreach ($google_calendar_list as $calendar) 
		 {
			 $sel =  '';
			 if($calendar['id']==$google_calendar_default){$sel =  'selected="selected"';}
			 
 			$html .= '<option value="'.$calendar['id'].'" '.$sel.'>'.$calendar['summary'].'</option>'; 		 			   
			   
    	 }
		 
		 $html .= '</select>';
				
				
		return $html;
	
	}
	
	
	
	public function get_user_auth_status($staff_id)
	{
		global $bookingultrapro;
		
		$html = '';
		
		$client_id = $bookingultrapro->get_option('google_calendar_client_id');
		$client_secret = $bookingultrapro->get_option('google_calendar_client_secret');
		
		//get client access token		
		$accessToken = $bookingultrapro->bup_get_user_meta($staff_id, 'google_cal_access_token');
		
		if($accessToken=='') //get auth url
		{
			if($client_id=='' || $client_secret=='')
			{				
				$html = "<p>".__('Please set client ID and client Secret!','bookingup')."</p>";
				
			
			}else{
				
				$auth_url = $this->get_auth_url();			
				$html = "<p><a href='$auth_url'>".__('Connect Me!','bookingup')."</a></p>";
				
			}	
		
		}else{
			
			if($client_id=='' || $client_secret=='')
			{				
				$html = "<p>".__('Please set client ID and client Secret!','bookingup')."</p>";
				
			
			}else{		
			
				$html = "<p>".__('Already Connected!','bookingup')."</p> <a href='#' id='bup-disconnect-gcal-user' user-id='".$staff_id."'>".__('Disconnect','bookingup')."</a>";			
			
			}
			
			
		}		
		
		return $html;
		
			
	}
	
	

}
$key = "googlecalendar";
$this->{$key} = new BupComplementGoogleCalendar();
?>