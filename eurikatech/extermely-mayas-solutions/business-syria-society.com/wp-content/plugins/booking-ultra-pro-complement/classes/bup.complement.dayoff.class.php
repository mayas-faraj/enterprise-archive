<?php
class BupComplementDayOff
{
	
		
	public function __construct()
	{
		$this->ini_module();
		
		add_action( 'wp_ajax_bup_dayoff_add_confirm', array( &$this, 'add_one' ));
		add_action( 'wp_ajax_bup_get_staff_daysoff', array( &$this, 'get_staff_daysoff_list' ));
		add_action( 'wp_ajax_bup_delete_dayoff', array( &$this, 'delete_me' ));
		
		add_action( 'wp_ajax_bup_special_schedule_add_confirm', array( &$this, 'add_one_rule' ));
		add_action( 'wp_ajax_bup_get_staff_special_schedule_list', array( &$this, 'get_staff_special_schedule_list' ));
		
		add_action( 'wp_ajax_bup_delete_special_schedule', array( &$this, 'delete_special_schedule' ));
		
		
		
		
		
		
		
	
    }	
	
	
	public function ini_module()
	{
		global $wpdb;
		 
		   // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_staff_days_off (
				`dayoff_id` bigint(20) NOT NULL auto_increment,
				`dayoff_user_id` int(11) NOT NULL,
				`dayoff_from` date NOT NULL,
				`dayoff_to` date NOT NULL,
				`dayoff_recurrent` int(1) NOT NULL DEFAULT "0",											
				PRIMARY KEY (`dayoff_id`)
			) COLLATE utf8_general_ci;';

		   $wpdb->query( $query );	
		   
		   
		      // Create table for breaks
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_staff_availability_rules (
				  `special_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
				  `special_schedule_staff_id` int(11) NOT NULL,
				  `special_schedule_date` date NOT NULL,				 
				  `special_schedule_time_from` time NOT NULL,
				  `special_schedule_time_to` time NOT NULL,
				  PRIMARY KEY (`special_schedule_id`)
			) ENGINE=MyISAM COLLATE utf8_general_ci;';

		   $wpdb->query( $query );	    
		  
		  		   
		
	}
	
	function is_in_holiday($staff_id, $date)
	{
		
		global  $wpdb, $bookingultrapro;				
		
		$sql ="SELECT * FROM " . $wpdb->prefix . "bup_staff_days_off  
		WHERE dayoff_user_id = '".$staff_id."'  AND '".$date."'   between  dayoff_from AND dayoff_to ;";
		$rows = $wpdb->get_results($sql);
		
		if ( !empty( $rows ))
		{
			return true;	
					
		}else{
			
			return false;			
		
		}
		
		
	}
	
	public function delete_me()
	{
		global  $bookingultrapro , $wpdb;
		
		$staff_id = $_POST['staff_id'];
		$dayoff_id = $_POST['dayoff_id'];
		
		$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_staff_days_off  WHERE dayoff_user_id=%d AND dayoff_id = %d ;',array($staff_id,$dayoff_id));
		
		$results = $wpdb->query($sql);
		die();
	
	}	
	
	public function delete_special_schedule()
	{
		global  $bookingultrapro , $wpdb;
		
		$staff_id = $_POST['staff_id'];
		$schedule_id = $_POST['schedule_id'];
		
		$sql = $wpdb->prepare('DELETE FROM ' . $wpdb->prefix . 'bup_staff_availability_rules  WHERE special_schedule_staff_id=%d AND special_schedule_id = %d ;',array($staff_id,$schedule_id));
		
		$results = $wpdb->query($sql);
		die();
	
	}	
	
	
	
	public function add_one()
	{
		global  $bookingultrapro , $wpdb;
		
		$staff_id = $_POST['staff_id'];
		
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
	
	public function add_one_rule()
	{
		global  $bookingultrapro , $wpdb;
		
		$staff_id = $_POST['staff_id'];
		
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
	
	public function get_staff_daysoff($staff_id)
	{
		global $wpdb, $bookingultrapro;
		
		$html='';
		
		
		
		$html .= '<div class="bup-details-staff-sections">';	
            
       
        $html .= ''.__('From','bookingup').' <input type="text" class="bupro-datepicker" id="bup-start-date" value="'.date( $bookingultrapro->get_date_picker_date(), current_time( 'timestamp', 0 ) ).'" /> '.__('To','bookingup').' <input type="text" class="bupro-datepicker" id="bup-end-date" value="'.date( $bookingultrapro->get_date_picker_date(), current_time( 'timestamp', 0 ) ).'" />  <button name="bup-btn-add-staff-day-off-confirm" id="bup-btn-add-staff-day-off-confirm" class="bup-button-submit-daysoff" day-id="1">Add	</button>&nbsp; <span id="bup-dayoff-message-add"></span>';  
		
		
		$html .= '<div class="bup-adm-frm-daysofflst" id="bup-staff-daysoff-list" >'; 
		
		$html .= $this->get_staff_daysoff_list($staff_id);     
           
  		$html .= '</div> ';
		
		$html .= '</div>';		
		return $html;
		
	
	
	}
	
	
	public function get_staff_special_schedule($staff_id)
	{
		global $wpdb, $bookingultrapro;
		
		$html='';
		
		
		
		$html .= '<div class="bup-details-staff-sections">';	
            
       
        $html .= ''.__('On','bookingup').' <input type="text" class="bupro-datepicker" id="bup-special-schedule-date" value="'.date( $bookingultrapro->get_date_picker_date(), current_time( 'timestamp', 0 ) ).'" /> '.__('I will <strong>not</strong> be available from : ','bookingup').'  '.$this->get_business_hours_drop_down('bup-special-schedule-from', 'bup_select_start').' '.__(' to : ','bookingup').' '.$this->get_business_hours_drop_down('bup-special-schedule-to', 'bup_select_end').' <button name="bup-btn-add-staff-day-off-confirm" id="bup-btn-add-staff-special-schedule-confirm" class="bup-button-submit-daysoff" day-id="1">'.__('Add','bookingup').' 	</button>&nbsp; <span id="bup-speschedule-message-add"></span>';  
		
		
		$html .= '<div class="bup-adm-frm-specialschedule" id="bup-staff-special-schedule-list" >'; 
		
		$html .= $this->get_staff_special_schedule_list($staff_id);     
           
  		$html .= '</div> ';
		
		$html .= '</div>';		
		return $html;
		
	
	
	}
	
	//returns the business hours drop down
	public function get_business_hours_drop_down($cbox_id, $select_start_to_class)
	{
		global  $bookingultrapro;
		
		$hours = 24; //amount of hours working in day		
		$min_minutes = $bookingultrapro->get_option('bup_time_slot_length');
				
		if($min_minutes ==''){$min_minutes=15;}	
				
		$hours = (60/$min_minutes) *$hours;		
		$min_minutes=$min_minutes*60;
		
		//get default value for this week's day		
		if($select_start_to_class=='bup_select_start')
		{
			$from_to_value = 'from';		
			
		}else{
				
			$from_to_value = 'to';			
			
		}		
		
		
		$html .= '<select id="'.$cbox_id.'" name="'.$cbox_id.'" class="'.$select_start_to_class.'">';				
	
		
		for($i = 0; $i <= $hours ; $i++)
		{ 		
			$minutes_to_add = $min_minutes * $i; // add 30 - 60 - 90 etc.
			$timeslot = date('H:i:s', strtotime($row['hours_start'])+$minutes_to_add);	
			
			$selected = '';				
			
			
			if($from_to_value == 'to' && $i == 48)
			{
				$sel_value ='24:00';
							
			}else{
								
				$sel_value =date('H:i', strtotime($timeslot));			
				
			}	
			
			
			$html .= '<option value="'.$sel_value.'" '.$selected.'  >'.date('h:i A', strtotime($timeslot)).'</option>';
			
			
		}
		
		$html .='</select>';
		
		return $html;
	
	}
	
	public function get_staff_daysoff_list($staff_id = null)
	{
		global  $bookingultrapro , $wpdb;
		
		$action = $_POST['action'];
		
		$time_format = $bookingultrapro->service->get_date_format_conversion();
		
		if($action=='bup_get_staff_daysoff')
		{	
			$staff_id = $_POST['staff_id'];
		
		}		
						
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
		
		
		
		if($action=='bup_get_staff_daysoff')
		{
			echo $html;
			die();
		}else{
			
			return $html;
			
			
		}
		
		
	
	}
	
	
	public function get_staff_special_schedule_list($staff_id = null)
	{
		global  $bookingultrapro , $wpdb;
		
		$action = $_POST['action'];
		
		$date_format = $bookingultrapro->service->get_date_format_conversion();		
		$time_format = $bookingultrapro->service->get_time_format();
		
		
		
		if($action=='bup_get_staff_special_schedule_list')
		{	
			$staff_id = $_POST['staff_id'];
		
		}		
						
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
		
		
		
		if($action=='bup_get_staff_special_schedule_list')
		{
			echo $html;
			die();
		}else{
			
			return $html;
			
			
		}
		
		
	
	}
	
	
		
	

}
$key = "dayoff";
$this->{$key} = new BupComplementDayOff();
?>