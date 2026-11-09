<?php

/**
 * Plugin Name: Appointment Performance 
 * Plugin URI: http://www.ebla-tech.com/plugins/appointment-preformance
 * Description: calculate statistics for other appointment plugins
 * Version: 1.0
 * Author: Mayas Faraj
 * Author URI: http://www.ebl-tech.com/mayas-faraj
 */

	define( "APPOINTMENT_PERFORMANCE_PLUGIN_DIR", untrailingslashit( plugin_dir_path( __FILE__ ) ) );
	require_once(constant("APPOINTMENT_PERFORMANCE_PLUGIN_DIR") . "/includes/appointment_db.php");

	add_action('admin_print_styles', 'appointment_performance_enqueue_style' );
	add_action('admin_enqueue_scripts', 'appointment_performance_enqueue_script');
	add_action('admin_menu', 'appointment_performance_add_admin_menu');
	add_action('wp_ajax_query_appointment', 'query_appointment');
	add_action('wp_ajax_nopriv_query_appointment', 'query_appointment');
	add_action('wp_ajax_get_set_appointments_staff_id_list', 'get_set_appointments_staff_id_list');

	function appointment_performance_enqueue_style()
	{
		if(is_admin() && isset($_GET["page"]) && $_GET["page"]==="appointment-performance")
		{
			$plugin_url = plugin_dir_url( __FILE__ );
			wp_enqueue_style( 'bootstrap',  $plugin_url . "assets/css/bootstrap.min.css");
			wp_enqueue_style( 'bootstrap-datepicker',  $plugin_url . "assets/css/bootstrap-datepicker.min.css");
			wp_enqueue_style( 'style',  $plugin_url . "assets/css/style.css");
			wp_enqueue_style( 'chartcss',  $plugin_url . "assets/css/chart.css");
		}

	}

	function appointment_performance_enqueue_script()
	{
		if(is_admin() && isset($_GET["page"]) && $_GET["page"]==="appointment-performance")
		{
			$plugin_url = plugin_dir_url( __FILE__ );
			wp_enqueue_script( 'jquery-form' );
			wp_enqueue_script( 'bootstrap', $plugin_url . 'assets/js/bootstrap.min.js', array('jquery'), '1.0.0', false );
			wp_enqueue_script( 'bootstrap-datepicker', $plugin_url . 'assets/js/bootstrap-datepicker.min.js', array('jquery'), '1.0.0', false );
			wp_enqueue_script( 'script', $plugin_url . 'assets/js/plugin.js', array('jquery'), '1.0.0', false );
			wp_enqueue_script( 'chartjs', $plugin_url . 'assets/js/chart.js', array('jquery'), '1.0.0', false );
		}
	}

	function appointment_performance_add_admin_menu()
	{
		add_menu_page('Appointment Performance', 'Appointment Performance', 'manage_options', 'appointment-performance', 'appointment_performance_menu_init', 'dashicons-calendar');
	}

	function appointment_performance_menu_init()
	{	
		$page = file_get_contents(constant("APPOINTMENT_PERFORMANCE_PLUGIN_DIR") . "/templates/main.html");
		$table = file_get_contents(constant("APPOINTMENT_PERFORMANCE_PLUGIN_DIR") . "/templates/table.html");
		$bookingultra_table = "";
		$booked_table = "";

		if(check_bookingultra_exists())
		{
			$bookingultra_table = $table;
			$bookingultra_table = str_replace("[title]", "Booking Ultra Pro", $bookingultra_table);
			$bookingultra_table = str_replace("[name]", "bookingultraTable", $bookingultra_table);
			$appointment_array=get_bookingultra_appointments(null, null);

			$bookingultra_table = str_replace("[approved]", $appointment_array["approved"], $bookingultra_table);
			$bookingultra_table = str_replace("[pending]", $appointment_array["pending"], $bookingultra_table);
			$bookingultra_table = str_replace("[rejected]", $appointment_array["rejected"], $bookingultra_table);
		}

		if(check_booked_exists())
		{
			$booked_table = $table;
			$booked_table = str_replace("[title]", "Booked Plugin", $booked_table);
			$booked_table = str_replace("[name]", "bookedTable", $booked_table);
			$appointment_array=get_booked_appointments(null, null);

			$booked_table = str_replace("[approved]", $appointment_array["approved"], $booked_table);
			$booked_table = str_replace("[pending]", $appointment_array["pending"], $booked_table);
			$booked_table = str_replace("[rejected]", $appointment_array["rejected"], $booked_table);
		}

		if($bookingultra_table!="" || $booked_table!="")
			echo str_replace("[table]", $bookingultra_table . $booked_table, $page);
		else
			echo str_replace("[table]", "---no data---", $page);
	}

	function get_set_appointments_staff_id_list()
	{
		if(isset($_POST["jsonStaffId"]))
		{
			update_option("appointment-performance-staff", $_POST["jsonStaffId"]);
		}

		$staff_array = get_staff();
		$staff_object = json_decode(stripslashes(get_option("appointment-performance-staff")), true);
		$result= array();
		
		foreach($staff_array as $staff)
		{
			$staff_id="[not set]";
			if(isset($staff_object[$staff]))
				$staff_id=$staff_object[$staff];

			$result[$staff]=$staff_id;
		}

		echo json_encode($result);
		exit();
	}

	function query_appointment()
	{
		echo json_encode(get_plugin_appointments($_POST["dateFrom"], $_POST["dateTo"]));
		exit();
	}
?>
