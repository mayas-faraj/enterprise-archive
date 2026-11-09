<?php
class BookingUltraFilters {

	var $options;

	function __construct() {
		
		
		$this->ini_module();
	
		/* Plugin slug and version */
		$this->slug = 'bookingultra';
		$this->subslug = 'bup-filters';
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
		$this->plugin_data = get_plugin_data( bup_forms_path . 'index.php', false, false);
		$this->version = $this->plugin_data['Version'];
		
		/* Priority actions */
		add_action('admin_menu', array(&$this, 'add_menu'), 11);
		add_action('admin_enqueue_scripts', array(&$this, 'add_styles'), 9);
		add_action('admin_head', array(&$this, 'admin_head'), 9 );
		add_action('admin_init', array(&$this, 'admin_init'), 9);
		
		add_action( 'wp_ajax_bup_edit_filter', array(&$this, 'edit' ));
		add_action( 'wp_ajax_bup_edit_filter_conf', array(&$this, 'edit_conf' ));
		add_action( 'wp_ajax_bup_filter_del', array(&$this, 'delete' ));
		
		
		
	}
	
	public function ini_module()
	{
		global $wpdb;
		 
		   // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_filters (
				`filter_id` bigint(20) NOT NULL auto_increment,
				`filter_name` varchar(300) NOT NULL ,	
				`filter_email` varchar(300) NOT NULL ,									
				PRIMARY KEY (`filter_id`)
			) COLLATE utf8_general_ci;';

		  // $wpdb->query( $query );	
		   
		    // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_filter_staff (
				`fstaff_id` bigint(20) NOT NULL auto_increment,
				`fstaff_staff_id` int(11) NOT NULL,
				`fstaff_location_id` int(11) NOT NULL,										
				PRIMARY KEY (`fstaff_id`)
			) COLLATE utf8_general_ci;';

		  // $wpdb->query( $query );	
		   
		    
		  		   
		
	}
	
	function admin_init() 
	{
	
		$this->tabs = array(
			'manage' => __('Locations','bookingup')
			
		);
		$this->default_tab = 'manage';		
		
	}
	
	public function get_all ()
	{
		global $wpdb;
				
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_filters ORDER BY filter_name ' ;								
		$rows = $wpdb->get_results($sql);
			
		return $rows;
		
				
	}
	
	
	public function get_all_calendar_filter ()
	{
		global $wpdb;
				
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_filters ORDER BY filter_name ' ;								
		$rows = $wpdb->get_results($sql);
			
		$selected ='';

		
		$count = 0;
		
		$html = '';
		
		$html .= '<select name="bup-location-calendar" id="bup-location-calendar">';
		$html .= '<option value="" selected="selected" >'.__('All Locations', 'bookingup').'</option>';
				
		if (!empty($rows))
		{
			
			foreach($rows as $filter) 
			{
				
		
				$html .= '<option value="'.$filter->filter_id.'" '.$selected.'>'.$filter->filter_name.'</option>';
				
				
			}
			
					
		
		}
		
		$html .= '</select>';
		
		return $html;
		
				
	}
	
	
	
	public function get_copy_paste_shortocde ($id)
	{
		$html = '';		
		$html .= "[bupro_appointment location_id='".$id."']";		
		return $html;	
				
	}
	
	
	
	public function delete ()
	{
		global $wpdb;
		
		$filter_id = $_POST["filter_id"];		
		
		
		if($filter_id!= "")
		{			
			$query = "DELETE FROM " .$wpdb->prefix ."bup_filters WHERE filter_id = '".$filter_id."' ";			
			$wpdb->query( $query );		
			die();
			
		
		}
		
		
	}
	public function edit_conf ()
	{
		global $wpdb;
		
		$filter_id = $_POST['filter_id'];
		$filter_name = $_POST['filter_name'];
		
		if($_POST['filter_id']!="" && $_POST['filter_name']!="" ){
				
			$query = "UPDATE " .$wpdb->prefix ."bup_filters SET  filter_name = '".$filter_name."' WHERE filter_id = '".$filter_id."' ";			
			$wpdb->query( $query );	
		}
		echo $html;
		die();
		
	}
	
	function genRandomString() 
	{
		$length = 5;
		$characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWZYZ";
		
		$real_string_legnth = strlen($characters) ;
		
		$string="";
		
		for ($p = 0; $p < $length; $p++)
		{
			$string .= $characters[mt_rand(0, $real_string_legnth-1)];
		}
		
		return strtolower($string);
	}
	
	public function edit()
	{
		
		global $wpdb;
		
		$html ='';
		
		$filter_id = $_POST['filter_id'];
		
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_filters  WHERE filter_id = "'.$filter_id.'"  ' ;				
		$rows = $wpdb->get_results($sql);
		
		if ( !empty( $rows ) )
		{
		
			foreach ( $rows as $filter )
			{
				$fil = $filter;		
			
			}
			
		}		
				
				
		//print_r($form);
		$html .="<p>".__( 'Name:', 'bookingup')."</p>";				
		$html .="<p><input type='text' value='".$fil->filter_name."' class='bup-input' id='bup_filter_name_edit_".$filter_id."'></p>";
		
		
		
				
		$html .="<p><input type='button' class='button-primary bup-filter-close' value='".__( 'Close', 'bookingup')."' data-form= ".$filter_id."> <input type='button'  class='button-primary bup-filter-modify' filter-id= ".$filter_id." value='".__( 'Save', 'bookingup')."'> </p>";
		
		echo $html;
		die();
		
	}
	

	
	
	
	function admin_head(){

	}

	function add_styles(){
	
		wp_register_script( 'bup_filters_js', bup_filters_url . 'admin/scripts/admin.js', array( 
			'jquery'
		) );
		wp_enqueue_script( 'bup_filters_js' );
	
		wp_register_style('bup_filters_css', bup_filters_url . 'admin/css/admin.css');
		wp_enqueue_style('bup_filters_css');
		
	}
	
	function add_menu()
	{
		add_submenu_page( 'bookingultra', __('Locations','bookingup'), __('Locations','bookingup'), 'manage_options', 'bup-filters', array(&$this, 'admin_page') );
		
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
			require_once bup_filters_path.'admin/panels/'.$tab.'.php';
		}
	}
	
	public function save()
	{
		global $wpdb;
		
		if(isset($_POST['filter_name'])  && $_POST['filter_name']!="")
		{
			
			$filter_name = $_POST['filter_name'];
			
			
			$query = "INSERT INTO " . $wpdb->prefix ."bup_filters (`filter_name`) VALUES ('".$filter_name."' )";
			
			$wpdb->query( $query );
							
				
			
			echo '<div class="updated"><p><strong>'.__('New location has been created.','bookingup').'</strong></p></div>';
		}else{
			
			echo '<div class="error"><p><strong>'.__('Please input a name for the new location.','bookingup').'</strong></p></div>';
			
			
		}
	
	
	}
	
	
	function admin_page() {
	
		
		if (isset($_POST['add-filter']) && $_POST['add-filter']=='add-filter') 
		{
			$this->save();
		}

		
		
	?>
	
		<div class="wrap <?php echo $this->slug; ?>-admin">
        
           <h2>BOOKING ULTRA PRO - <?php _e('LOCATIONS','bookingup'); ?></h2>
           
           <div id="icon-users" class="icon32"></div>
			
						
			<h2 class="nav-tab-wrapper"><?php $this->admin_tabs(); ?></h2>

			<div class="<?php echo $this->slug; ?>-admin-contain">
				
				<?php $this->get_tab_content(); ?>
				
				<div class="clear"></div>
				
			</div>
			
		</div>

	<?php }

}
global $bup_filter;
$bup_filter = new BookingUltraFilters();