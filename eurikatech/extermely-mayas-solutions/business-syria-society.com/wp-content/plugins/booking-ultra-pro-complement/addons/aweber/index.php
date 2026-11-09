<?php
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);

define('bup_aweber_url',plugin_dir_url(__FILE__ ));
define('bup_aweber_path',plugin_dir_path(__FILE__ ));

	/* functions */
	foreach (glob(bup_aweber_path . 'functions/*.php') as $filename) { require_once $filename; }
	
	/* administration */
	if (is_admin()){
		foreach (glob(bup_aweber_path . 'admin/*.php') as $filename) { include $filename; }
	}