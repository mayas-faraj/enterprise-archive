<?php
class BookingUltraReminder {

	var $options;

	function __construct() {
		
		
		$this->ini_module();
	
		/* Plugin slug and version */
		$this->slug = 'bookingultra';
		$this->subslug = 'bup-reminders';
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
		$this->plugin_data = get_plugin_data( bup_reminders_path . 'index.php', false, false);
		$this->version = $this->plugin_data['Version'];
		
		/* Priority actions */
		add_action('admin_menu', array(&$this, 'add_menu'), 15);
		add_action('admin_enqueue_scripts', array(&$this, 'add_styles'), 9);
		add_action('admin_head', array(&$this, 'admin_head'), 12 );
		add_action('admin_init', array(&$this, 'admin_init'), 12);
		
	
		
	}
	
	
	
	
	
	public function bup_set_option($option, $newvalue)
	{
		$settings = get_option('bup_options');
		$settings[$option] = $newvalue;
		update_option('bup_options', $settings);
	}
	
	public function ini_module()
	{
		global $wpdb;		   		  		   
		
	}
	
	function admin_init() 
	{
	
		$this->tabs = array(
			'manage' => __('SMS Reminders','bookingup'),
			'settings' => __('Settings','bookingup')
			
		);
		$this->default_tab = 'manage';		
		
	}		
	
	function admin_head(){

	}

	function add_styles(){
	
		wp_register_script( 'bup_reminders_js', bup_reminders_url . 'admin/scripts/admin.js', array( 
			'jquery'
		) );
		wp_enqueue_script( 'bup_reminders_js' );
	
		wp_register_style('bup_reminders_css', bup_reminders_url . 'admin/css/admin.css');
		wp_enqueue_style('bup_reminders_css');
		
	}
	
	function add_menu()
	{
		add_submenu_page( 'bookingultra', __('SMS Reminders','bookingup'), __('SMS Reminders','bookingup'), 'manage_options', 'bup-reminders', array(&$this, 'admin_page') );
		
	
		
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
			require_once bup_reminders_path.'admin/panels/'.$tab.'.php';
		}
	}
	
	
	
	function admin_page() {
		
		
		global $bookingultrapro, $bupcomplement;
		
		
		if (isset($_POST['update_settings']) &&  $_POST['reset_email_template']=='' && !isset($_POST['update_bup_slugs'])) {
            $bookingultrapro->buupadmin->update_settings();
        }
		
		if (isset($_POST['update_bup_slugs']) && $_POST['update_bup_slugs']=='bup_slugs')
		{
		   $bookingultrapro->buupadmin->update_settings();
           $bookingultrapro->create_rewrite_rules();
			echo '<div class="updated"><p><strong>'.__('Rewrite Rules were Saved.','bookingup').'</strong></p></div>';
        }
	
		
				
	?>
	
		<div class="wrap <?php echo $this->slug; ?>-admin">
        
           <h2>BOOKING ULTRA PRO - <?php _e('SMS REMINDERS','bookingup'); ?></h2>
           
           <div id="icon-users" class="icon32"></div>
			
						
			<h2 class="nav-tab-wrapper"><?php $this->admin_tabs(); ?></h2>

			<div class="<?php echo $this->slug; ?>-admin-contain">
				
				<?php $this->get_tab_content(); ?>
				
				<div class="clear"></div>
				
			</div>
			
		</div>

	<?php }

}
global $bup_reminders;
$bup_reminders = new BookingUltraReminder();