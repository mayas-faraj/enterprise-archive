<?php
global $bookingultrapro;

define('bup_reminders_url',plugin_dir_url(__FILE__ ));
define('bup_reminders_path',plugin_dir_path(__FILE__ ));

//if(isset($bookingultrapro)){

	/* functions */
	foreach (glob(bup_reminders_path . 'functions/*.php') as $filename) { require_once $filename; }
	
	/* administration */
	if (is_admin()){
		foreach (glob(bup_reminders_path . 'admin/*.php') as $filename) { include $filename; }
	}
	
//}