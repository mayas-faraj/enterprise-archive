<?php
/*
Plugin Name: Booking Ultra Pro Complement
Plugin URI: https://bookingultrapro.com
Description: Extension for Booking Ultra Pro Plugin.
Version: 1.0.40
Author: Booking Ultra Pro
Author URI: https://bookingultrapro.com/
*/



define('bookingup_comp_url',plugin_dir_url(__FILE__ ));
define('bookingup_comp_path',plugin_dir_path(__FILE__ ));
define('bup_sms_api','https://smsapi.bookingultrapro.com/');


$plugin = plugin_basename(__FILE__);

// Auto updates
if (is_admin())
{
	
 add_action('init', '__wbup__wbupltra_pluign_au');
 add_action('init', 'bup_check_plugin_actives');
 
}

function __wbup__wbupltra_pluign_au()
{
	require_once ('wp_autoupdate.php');
	
	$va = get_option('bup_c_key');
	$wptuts_plugin_current_version = '1.0.40';
	$wptuts_plugin_remote_path = 'https://bookingultrapro.com/upgrades/bup-plugin-update.php?serial_n='.$va;
	
	$wptuts_plugin_slug = plugin_basename(__FILE__);
	new __wubup__wpbookinguptrapro_plugin_auto_update ($wptuts_plugin_current_version, $wptuts_plugin_remote_path, $wptuts_plugin_slug);
}

// Helper to activate a plugin on another site without causing a fatal error by
register_activation_hook( __FILE__, 'bup_comp_activation');

function bup_comp_load_textdomain() 
{     	   
	   $locale = apply_filters( 'plugin_locale', get_locale(), 'booking-ultra-pro-complement' );	   
       $mofile = bookingup_comp_path . "languages/bookingup-$locale.mo";
			
		// Global + Frontend Locale
		load_textdomain( 'bookingup', $mofile );
		load_plugin_textdomain( 'bookingup', false, dirname(plugin_basename(__FILE__)).'/languages/' );
}

/* Load plugin text domain (localization) */
add_action('init', 'bup_comp_load_textdomain');		
add_action('init', 'bup_comp_output_buffer');
function bup_comp_output_buffer() {
		ob_start();
}


/* Master Class  */
require_once (bookingup_comp_path . 'classes/bup.complement.class.php');

 
function  bup_comp_activation( $network_wide ) 
{
	$plugin_path = '';
	$plugin = "booking-ultra-pro-complement/index.php";	
	
	if ( is_multisite() && $network_wide ) // See if being activated on the entire network or one blog
	{ 
		activate_plugin($plugin_path,NULL,true);			
		
	} else { // Running on a single blog		   	
			
		activate_plugin($plugin_path,NULL,false);		
		
	}
}

$bupcomplement = new BookingUltraProComplement();
$bupcomplement->plugin_init();

global $bupultimate;

/* load addons */

//if(isset($bookingultrapro))
//{

require_once bookingup_comp_path . 'addons/forms/index.php';
require_once bookingup_comp_path . 'addons/aweber/index.php';
require_once bookingup_comp_path . 'addons/appearance/index.php';
require_once bookingup_comp_path . 'addons/reminders/index.php';

//}
function  bup_check_plugin_actives() 
{
	
	include_once( ABSPATH . 'wp-admin/includes/plugin.php' );

	if(is_plugin_active('booking-ultra-pro-ultimate/index.php')){require_once bookingup_comp_path . 'addons/profiles/index.php';}	
	
	if(is_plugin_active('booking-ultra-pro-ultimate/index.php')){require_once bookingup_comp_path . 'addons/filters/index.php';}	
	
	if(is_plugin_active('booking-ultra-pro/index.php'))
	{
		
	
	}
		
}
