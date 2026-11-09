<?php
define('bup_appearance_url',plugin_dir_url(__FILE__ ));
define('bup_appearance_path',plugin_dir_path(__FILE__ ));

	/* functions */
	foreach (glob(bup_appearance_path . 'functions/*.php') as $filename) { require_once $filename; }
	
	/* administration */
	if (is_admin()){
		foreach (glob(bup_appearance_path . 'admin/*.php') as $filename) { include $filename; }
	}