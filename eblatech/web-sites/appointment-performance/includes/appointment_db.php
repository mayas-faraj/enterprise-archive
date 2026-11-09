<?php
	if(substr($_SERVER["SCRIPT_NAME"], -14)=="restful-ws.php")
		require_once("../../../../wp-admin/includes/plugin.php");

	function check_bookingultra_exists()
	{
		return is_plugin_active( 'booking-ultra-pro/index.php' );
	}

	function check_booked_exists()
	{
		return is_plugin_active( 'booked/booked.php' );
	}

	function get_bookingultra_appointments_by_staffid($date_from=null, $date_to=null, $staff_id=null, $service_name=null)
	{
		$staff_name=null;

		if($staff_id!=null)
		{
			$staff_name=get_staff_name($staff_id);
			if(!$staff_name)
				return false;
		}

		return get_bookingultra_appointments($date_from, $date_to, $staff_name, $service_name);
	}


	function get_bookingultra_appointments($date_from=null, $date_to=null, $staff_name=null, $service_name=null)
	{
		$PENDING=0;
		$APPROVED=1;
		$REJECTED=2;

		$appointments=array();

		/*$DATE_FORMAT="Y-m-d";
		$date_object=new DateTime();
		$date_object->setTimezone(new DateTimeZone("GMT"));
		$date_object->setTimestamp(intval($date_from)/1000);
		$date_from_value=date_format($date_object, $DATE_FORMAT);
		$date_object->setTimestamp(intval($date_to)/1000);
		$date_to_value=date_format($date_object, $DATE_FORMAT);*/

		$sql_query="SELECT count(*) FROM @prefix_bup_bookings INNER JOIN @prefix_bup_services ON @prefix_bup_bookings.booking_service_id=@prefix_bup_services.service_id INNER JOIN @prefix_users ON @prefix_bup_bookings.booking_staff_id=@prefix_users.ID WHERE booking_status=%d";

		if($date_from!=null) $sql_query .= " AND booking_time_from>='$date_from 00:00:00'";
		if($date_to!=null) $sql_query .=" AND booking_time_to<'$date_to 23:59:59'";
		if($service_name!=null) $sql_query .=" AND service_title='$service_name'";
		if($staff_name!=null) $sql_query .= " AND display_name='$staff_name'";

		global $wpdb;
		//$wpdb->print_error();
		$sql_query = str_replace( "@prefix_", $wpdb->prefix, $sql_query);

		//query for pending status
		$pending_count=$wpdb->get_var($wpdb->prepare($sql_query, $PENDING));
		//query for approved status
		$approved_count=$wpdb->get_var($wpdb->prepare($sql_query, $APPROVED));
		//query for rejected status
		$rejected_count=$wpdb->get_var($wpdb->prepare($sql_query, $REJECTED));

		$appointments["approved"]=$approved_count;
		$appointments["pending"]=$pending_count;
		$appointments["rejected"]=$rejected_count;

		return $appointments;
	}

	function get_booked_appointments($date_from=null, $date_to=null)
	{
		$PENDING="draft";
		$APPROVED="publish";
		$appointments=array();


		$sql_query="SELECT COUNT(*) FROM @prefix_posts INNER JOIN @prefix_postmeta ON @prefix_posts.ID=@prefix_postmeta.post_id WHERE meta_key='_appointment_timestamp' AND post_status='%s'";

		if($date_from!=null) 
		{
			$timestamp_from = intval(strtotime($date_from));
			$sql_query .= " AND CAST(meta_value AS UNSIGNED)>='$timestamp_from'";
		}

		if($date_to!=null) 
		{
			$timestamp_to = intval(strtotime($date_to)) + 86399; //increase 24 * 60 * 60 -1 seconds
			$sql_query .= " AND CAST(meta_value AS UNSIGNED)<'$timestamp_to'";
		}

		global $wpdb;
		//$wpdb->print_error();
		$sql_query = str_replace( "@prefix_", $wpdb->prefix, $sql_query);

		//query for pending status
		$pending_count=$wpdb->get_var($wpdb->prepare($sql_query, $PENDING));
		//query for approved status
		$approved_count=$wpdb->get_var($wpdb->prepare($sql_query, $APPROVED));

		/*
		$DATE_FORMAT="Y-m-d";
		$date_object=new DateTime();
		$date_object->setTimezone(new DateTimeZone("GMT"));
		$date_object->setTimestamp(intval($timestamp_from));
		$date_from_value=date_format($date_object, $DATE_FORMAT);
		$date_object->setTimestamp(intval($timestamp_to));
		$date_to_value=date_format($date_object, $DATE_FORMAT);*/

		$appointments["approved"]=$approved_count;
		$appointments["pending"]=$pending_count;
		$appointments["rejected"]=0;
		return $appointments;
	}


	function get_staff_appointments($date_from=null, $date_to=null, $service_name=null)
	{
		$staff_array=get_staff();
		$staff_object = json_decode(stripslashes(get_option("appointment-performance-staff")), true);

		$appointments=array();
		foreach($staff_array as $staff)
		{
			$staff_id=$staff;

			if(isset($staff_object[$staff]))
				$staff_id=$staff_object[$staff];

			if($staff==get_site_url())
			{
				if(check_booked_exists() && ($service_name==null || $service_name==get_site_url()))
					array_push($appointments, array
					(
						"staffId" => $staff_id,
						"appointments" => get_booked_appointments($date_from, $date_to)
					));
			}
			else
				if(check_bookingultra_exists())
					array_push($appointments, array
					(
						"staffId" => $staff_id,
						"appointments" => get_bookingultra_appointments($date_from, $date_to, $staff, $service_name)
					));
		}

		return $appointments;
	}

	function get_plugin_appointments($date_from=null, $date_to=null, $staff_id=null, $service_name=null)
	{
		$appointments=array();
		$staff_name=null;
		if($staff_id!=null)
		{
			$staff_name=get_staff_name($staff_id);
			if(!$staff_name)
				return false;
		}

		
		if(check_bookingultra_exists())
			array_push($appointments, array
			(
				"name" => "bookingultra", 
				"appointments" => get_bookingultra_appointments($date_from ,$date_to, $staff_name, $service_name)
			));

		if(check_booked_exists() && $staff_name==null && $service_name==null)
		{
			array_push($appointments, array
			(
				"name" => "booked",
				"appointments" => get_booked_appointments($date_from, $date_to)
			));
		}

		return $appointments;
	}

	function get_total_appointments($date_from=null, $date_to=null, $staff_id=null, $service_name=null)
	{
		$ALL="[ALL]";
		$NONE="[NONE]";

		$appointments=array();
		$appointments["pending"]=0;
		$appointments["approved"]=0;
		$appointments["rejected"]=0;

		$staff_name=null;

		if($staff_id!=null)
		{
			$staff_name=get_staff_name($staff_id);
			if(!$staff_name)
				return false;
		}

		if($service_name!=null)
			$appointments["serviceName"]=$service_name;
		else
			$appointments["serviceName"]=$ALL;

		if($staff_id!=null)
			$appointments["staffId"]=$staff_id;
		else
			$appointments["staffId"]=$ALL;

		if($date_from!=null)
			$appointments["dateFrom"]=$date_from;
		else
			$appointments["dateFrom"]=$NONE;

		if($date_to!=null)
			$appointments["dateTo"]=$date_to;
		else
			$appointments["dateTo"]=$NONE;

		if(check_bookingultra_exists())
		{
			$bookingultra_appointments = get_bookingultra_appointments($date_from ,$date_to, $staff_name, $service_name);
			if($bookingultra_appointments!=null)
			{
				$appointments["approved"]+=$bookingultra_appointments["approved"];
				$appointments["pending"]+=$bookingultra_appointments["pending"];
				$appointments["rejected"]+=$bookingultra_appointments["rejected"];
			}
		}

		if(check_booked_exists() && $service_name==null && ($staff_name==null || $staff_name==get_site_url()))
		{
				$booked_appointments =  get_booked_appointments($date_from, $date_to);
				if($booked_appointments!=null)
				{
					$appointments["approved"]+=$booked_appointments["approved"];
					$appointments["pending"]+=$booked_appointments["pending"];
					$appointments["rejected"]+=$booked_appointments["rejected"];
				}
		}

		return $appointments;
	}

	function get_staff_name($staff_id)
	{
		$staff_object = json_decode(stripslashes(get_option("appointment-performance-staff")), true);
		return array_search($staff_id, $staff_object);
	}


	function get_staff()
	{
		$staff=array();

		if(check_bookingultra_exists())
		{
			global $wpdb;

			$query_result = $wpdb->get_results(str_replace("@prefix_", $wpdb->prefix, "SELECT display_name FROM @prefix_users WHERE ID in (SELECT DISTINCT avail_staff_id FROM @prefix_bup_staff_availability);")); 

			if($query_result!=null && count($query_result)>0)
				foreach($query_result as $result)
					array_push($staff, $result->display_name);
		}

		if(check_booked_exists())
		{
			array_push($staff, get_site_url());
		}

		return $staff;
	}

	function get_services()
	{
		$services=array();

		if(check_bookingultra_exists())
		{
			global $wpdb;

			$query_result = $wpdb->get_results(str_replace("@prefix_", $wpdb->prefix, "SELECT service_title FROM @prefix_bup_services")); 

			if($query_result!=null && count($query_result)>0)
				foreach($query_result as $result)
					array_push($services, $result->service_title);
		}

		if(check_booked_exists())
		{
			array_push($services, get_site_url());
		}

		return $services;
	}


?>
