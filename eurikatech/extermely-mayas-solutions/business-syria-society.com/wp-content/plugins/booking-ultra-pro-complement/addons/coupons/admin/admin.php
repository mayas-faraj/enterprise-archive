<?php
class BookingUltraCoupons {

	var $options;
	var $custom_forms = array();

	function __construct() {
		
		
		$this->ini_module();
	
		/* Plugin slug and version */
		$this->slug = 'bookingultra';
		$this->subslug = 'bup-coupons';
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
		$this->plugin_data = get_plugin_data( bup_forms_path . 'index.php', false, false);
		$this->version = $this->plugin_data['Version'];
		
		/* Priority actions */
		add_action('admin_menu', array(&$this, 'add_menu'), 11);
		add_action('admin_enqueue_scripts', array(&$this, 'add_styles'), 9);
		add_action('admin_head', array(&$this, 'admin_head'), 9 );
		add_action('admin_init', array(&$this, 'admin_init'), 9);
		
		add_action( 'wp_ajax_bup_edit_form', array(&$this, 'edit_form' ));
		add_action( 'wp_ajax_bup_edit_form_conf', array(&$this, 'edit_form_conf' ));
		add_action( 'wp_ajax_bup_edit_form_del', array(&$this, 'edit_form_del' ));
		
		
		
	}
	
	public function ini_module()
	{
		global $wpdb;
		 
		   // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_coupons (
				`coupon_id` bigint(20) NOT NULL auto_increment,
				`coupon_code` varchar(300) NOT NULL 	,
				`coupon_discount` int(11) NOT NULL,
				`coupon_deduction` varchar(300) NOT NULL 	,
				`coupon_expiration` varchar(100) NOT NULL 	,
				`note_text` text NOT NULL 	,									
				PRIMARY KEY (`coupon_id`)
			) COLLATE utf8_general_ci;';

		   $wpdb->query( $query );		    
		  
		  		   
		
	}
	
	function admin_init() 
	{
	
		$this->tabs = array(
			'manage' => __('Manage Coupons','bookingup')
			
		);
		$this->default_tab = 'manage';		
		
	}
	
	public function get_all ()
	{
		global $wpdb;
		$forms = array();		
		$forms = get_option('bup_custom_forms_collection');		
		return $forms;
		
				
	}
	
	public function get_copy_paste_shortocde ($id)
	{
		$html = '';		
		$html .= "[bupro_appointment form_id='".$id."']";		
		return $html;	
				
	}
	
	
	
	public function edit_form_del ()
	{
		global $wpdb;
		
		$form_id = $_POST["form_id"];		
		
		
		if($form_id!= "")
		{
			$forms = get_option('bup_custom_forms_collection');
			
			$pos = $form_id;
			
			unset($forms[$pos]);
			
			ksort($forms);
			print_r($forms);
			update_option('bup_custom_forms_collection', $forms);
			
			//delete from 
			$custom_form = 'bup_profile_fields_'.$form_id;
			delete_option($custom_form);
			die();
			
		
		}
		
		
	}
	public function edit_form_conf ()
	{
		global $wpdb;
		
		$form_id = $_POST['form_id'];
		
		if($_POST['form_id']!="" && $_POST['form_name']!="" ){
				
			$forms = get_option('bup_custom_forms_collection');			
			$forms[$form_id] =  array('name' =>$_POST['form_name'], 'role' =>$_POST['p_role']);
			
			ksort($forms);		
			update_option('bup_custom_forms_collection', $forms);
		}
		echo $html;
		die();
		
	}
	
	function genRandomString() 
	{
		$length = 5;
		$characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWZYZ";
		
		$real_string_legnth = strlen($characters) ;
		//$real_string_legnth = $real_string_legnth– 1;
		$string="";
		
		for ($p = 0; $p < $length; $p++)
		{
			$string .= $characters[mt_rand(0, $real_string_legnth-1)];
		}
		
		return strtolower($string);
	}
	
	public function edit_form ()
	{
		global  $xoouserultra;
		
		$html ='';
		
		$form_id = $_POST['form_id'];
				
		$forms = get_option('bup_custom_forms_collection');			
		$form = $forms[$form_id] ;
		$form_role =$form['role'];
		
		//print_r($form);
		$html .="<p>".__( 'Name:', 'bookingup')."</p>";				
		$html .="<p><input type='text' value='".$form['name']."' class='bup-input' id='bup_form_name_edit_".$form_id."'></p>";
		
		
		
				
		$html .="<p><input type='button' class='button-primary bup-form-close' value='".__( 'Close', 'bookingup')."' data-form= ".$form_id."> <input type='button'  class='button-primary bup-form-modify' form-id= ".$form_id." value='".__( 'Save', 'bookingup')."'> </p>";
		
		echo $html;
		die();
		
	}
	

	
	
	
	function admin_head(){

	}

	function add_styles(){
	
		wp_register_script( 'bup_forms_js', bup_forms_url . 'admin/scripts/admin.js', array( 
			'jquery'
		) );
		wp_enqueue_script( 'bup_forms_js' );
	
		wp_register_style('bup_forms_css', bup_forms_url . 'admin/css/admin.css');
		wp_enqueue_style('bup_forms_css');
		
	}
	
	function add_menu()
	{
		add_submenu_page( 'bookingultra', __('Forms','bookingup'), __('Forms','bookingup'), 'manage_options', 'bup-forms', array(&$this, 'admin_page') );
		
		//do_action('bup_admin_menu_hook');
		
		
	}

	function admin_tabs( $current = null ) {
			$tabs = $this->tabs;
			$links = array();
			if ( isset ( $_GET['tab'] ) ) {
				$current = $_GET['tab'];
			} else {
				$current = $this->default_tab;
			}
			foreach( $tabs as $tab => $name ) :
				if ( $tab == $current ) :
					$links[] = "<a class='nav-tab nav-tab-active' href='?page=".$this->subslug."&tab=$tab'>$name</a>";
				else :
					$links[] = "<a class='nav-tab' href='?page=".$this->subslug."&tab=$tab'>$name</a>";
				endif;
			endforeach;
			foreach ( $links as $link )
				echo $link;
	}

	function get_tab_content() {
		$screen = get_current_screen();
		if( strstr($screen->id, $this->subslug ) ) {
			if ( isset ( $_GET['tab'] ) ) {
				$tab = $_GET['tab'];
			} else {
				$tab = $this->default_tab;
			}
			require_once bup_forms_path.'admin/panels/'.$tab.'.php';
		}
	}
	
	public function save()
	{
		global $wpdb;
		
		if(isset($_POST['form_name'])  && $_POST['form_name']!="")
		{
			$slug = $this->genRandomString();
			$forms = get_option('bup_custom_forms_collection');
			
			$new_form[$slug] =  array('name' =>$_POST['form_name'], 'role' =>$_POST['p_role']);
			
			if(is_array($forms))
			{
				$new_forms = array_merge($forms, $new_form);	
			}else{
				
				$new_forms =  $new_form;				
			
			}
			
			ksort($new_forms);			
			update_option('bup_custom_forms_collection',$new_forms);					
				
			
			echo '<div class="updated"><p><strong>'.__('New form has been created.','bookingup').'</strong></p></div>';
		}else{
			
			echo '<div class="error"><p><strong>'.__('Please input a name for the new form.','bookingup').'</strong></p></div>';
			
			
		}
	
	
	}
	
	
	function admin_page() {
	
		
		if (isset($_POST['add-form']) && $_POST['add-form']=='add-form') 
		{
			$this->save();
		}

		
		
	?>
	
		<div class="wrap <?php echo $this->slug; ?>-admin">
        
           <h2>BOOKING ULTRA PRO - <?php _e('COUPONS','bookingup'); ?></h2>
           
           <div id="icon-users" class="icon32"></div>
			
						
			<h2 class="nav-tab-wrapper"><?php $this->admin_tabs(); ?></h2>

			<div class="<?php echo $this->slug; ?>-admin-contain">
				
				<?php $this->get_tab_content(); ?>
				
				<div class="clear"></div>
				
			</div>
			
		</div>

	<?php }

}

$bup_coupon = new BookingUltraCoupons();