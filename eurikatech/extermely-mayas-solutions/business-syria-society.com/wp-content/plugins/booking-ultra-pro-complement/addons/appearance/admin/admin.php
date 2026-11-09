<?php
class BookingUltraAppearance {

	var $options;

	function __construct() {
		
		
		$this->ini_module();
	
		/* Plugin slug and version */
		$this->slug = 'bookingultra';
		$this->subslug = 'bup-appearance';
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
		$this->plugin_data = get_plugin_data( bup_appearance_path . 'index.php', false, false);
		$this->version = $this->plugin_data['Version'];
		
		/* Priority actions */
		add_action('admin_menu', array(&$this, 'add_menu'), 11);
		add_action('admin_enqueue_scripts', array(&$this, 'add_styles'), 9);
		add_action('admin_head', array(&$this, 'admin_head'), 9 );
		add_action('admin_init', array(&$this, 'admin_init'), 9);
		
		add_action( 'wp_ajax_bup_edit_template', array(&$this, 'edit' ));
		add_action( 'wp_ajax_bup_edit_template_conf', array(&$this, 'edit_conf' ));
		add_action( 'wp_ajax_bup_template_del', array(&$this, 'delete' ));
		add_action( 'wp_ajax_bup_get_element_value', array(&$this, 'get_element_value' ));
		add_action( 'wp_ajax_bup_update_template_values', array(&$this, 'update_template_values' ));
		
		add_action( 'wp_ajax_bup_get_alias_set_form', array(&$this, 'get_alias_form' ));
		add_action( 'wp_ajax_bup_update_user_alias', array(&$this, 'bup_update_user_alias' ));
		
		add_action( 'wp_ajax_bup_get_template_categories', array(&$this, 'get_template_categories' ));
		add_action( 'wp_ajax_bup_update_template_categories', array(&$this, 'bup_update_template_categories' ));
		
		add_action( 'wp_ajax_bup_get_form_type', array(&$this, 'get_form_type' ));
		add_action( 'wp_ajax_bup_update_form_type', array(&$this, 'update_form_type' ));
		
		
		
		
		
		
		
		
		
	}
	
	public function ini_module()
	{
		global $wpdb;
		 
		   // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_appearance_templates (
				`template_id` bigint(20) NOT NULL auto_increment,
				`template_name` varchar(300) NOT NULL ,	
				`template_customization` longtext ,									
				PRIMARY KEY (`template_id`)
			) COLLATE utf8_general_ci;';

		   $wpdb->query( $query );	
		   
		   	   
		    
		  		   
		
	}
	
	function admin_init() 
	{
	
		$this->tabs = array(
			'manage' => __('Appearance','bookingup')
			
		);
		$this->default_tab = 'manage';		
		
	}
	
	public function get_all ()
	{
		global $wpdb;
				
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_appearance_templates ORDER BY template_name ' ;								
		$rows = $wpdb->get_results($sql);
			
		return $rows;
		
				
	}
	
	
	
	
	
	public function get_copy_paste_shortocde ($id)
	{
		$html = '';		
		$html .= "[bupro_appointment template_id='".$id."']";		
		return $html;	
				
	}
	
	public function get_form_type ()
	{
		global $wpdb, $bookingultrapro;		
		$template_id = $_POST["template_id"];
		
		// 1 or blank  = Default with time slot, 2 is for hotels and accomodations
		
		$value= '';
		$html = '';
		
		
		$form_type = $bookingultrapro->get_template_label("booking_form_type",$template_id);
		$checked_default = '';
		$checked_2 = '';
	

		$html .= '<div class="bup-front-cont" style="width:96%">' ;
		
	
						
				if($form_type==1 || $form_type=='')
				{
					$checked_default = 'checked="checked"';
				}
				
				if($form_type==2)
				{
					$checked_2 = 'checked="checked"';
				}
				
		$html .='<div class="bup-serv-category-title"><input type="radio" class="ubp-cate-template-checked" '.$checked_default.' value="1" name="bup-form-type" id="bup-form-type-1"><label for="bup-form-type-1"><span></span>'.__('Default (With Time Slots)','bookingup').'</label></div>';
		
		$html .='<div class="bup-serv-category-title"><input type="radio" class="ubp-cate-template-checked" '.$checked_2.' value="2" name="bup-form-type" id="bup-form-type-2"><label for="bup-form-type-2"><span></span>'.__('Hotels (With From & To Dates)','bookingup').'</label></div>';		
				
						
					
		
        			
		
		$html .= '</div>' ;
		
		echo $html;
		
		die();
		
		
	}
	
	public function get_template_categories ()
	{
		global $wpdb, $bookingultrapro;		
		$template_id = $_POST["template_id"];
		
		$value= '';
		$html = '';
		
		$cate_pre_set = array();		
			
		$preset_categories = $bookingultrapro->get_template_label("category_ids",$template_id);
		
		$cate_pre_set = explode(',',$preset_categories);
		
				
		

		$html .= '<div class="bup-front-cont" style="width:96%">' ;
		
	
		$cate_list = $bookingultrapro->service->get_all_categories(); 
		
		if ( !empty( $cate_list ) )
		{		
		
			foreach ( $cate_list as $cate )
			{
				$checked = '';
				
				if(in_array($cate->cate_id,$cate_pre_set))
				{
					$checked = 'checked="checked"';
				}
				
				$html .='<div class="bup-serv-category-title"><input type="checkbox" class="ubp-cate-template-checked" '.$checked.' value="'.$cate->cate_id.'" name="bup-cate[]" data-category-id="'.$cate->cate_id.'" id="bup-cate-'.$cate->cate_id.'"><label for="bup-cate-'.$cate->cate_id.'"><span></span>'.$cate->cate_name.'</label></div>';		
				
						
			
			}		
			
			
			
			
			
		}	
		
		
        			
		
		$html .= '</div>' ;
		
		echo $html;
		
		die();
		
		
	}
	
	public function get_alias_form ()
	{
		global $wpdb, $bookingultrapro;
		
		$template_id = $_POST["template_id"];
		
		$value= '';
		$html = '';
		
		$uultra_combined_search = '';
		
		$relation = "AND";
		$args= array('keyword' => $uultra_combined_search ,  'relation' => $relation,  'sortby' => 'ID', 'order' => 'DESC');
		$users = $bookingultrapro->userpanel->get_staff_filtered($args);
		
		$total = $users['total'];
		
		if (empty($users['users']))
		{
			$total = 0;		
		
		}
		
		$template_alias = get_option('bup_template_name_alias_'.$template_id);
		
		if(!is_array($template_alias)){$template_alias=array();}
		
		
	
		$html .= '<div class="bup-customizer">' ;
		$html .= '<table width="100%" class="wp-list-table widefat fixed posts table-generic">
            <thead>
                <tr>
                    <th width="50%" style="color:# 333">'.__('Staff', 'bookingup').'</th>
                    <th width="50%">'.__('Display As', 'bookingup').'</th>
                    
                </tr>
            </thead>
            
            <tbody>' ;	
			
			if (!empty($users['users']))
			{
				$html .='<ul>';
				$c_c =0;
				
				foreach($users['users'] as $user) 
				{
					
					$user_id = $user->ID;	
					
					$alias_name = '';
					
					if(isset($template_alias[$user_id]))
					{
						
						$alias_name = $template_alias[$user_id]['user_alias'];
						
					}
			
					 $html .= '<tr>
						 <td width="50%">'.$user->display_name.'</td>
						 <td width="50%"><input type="text" style="width:99%" data-user-id="'.$user_id.'" id="bup_alias_id_'.$user_id.'"  name="bup_alias['.$user_id.']" class="bup-alias-textbox" value="'.$alias_name.'"  /></td>
					   </tr>';
					   
					   
			   }
			
			}else{
				
				$html .=__('There are no staff members.','bookingup');
				
			
			}
			
		
		$html .= '</tbody>
        </table>';
        			
		
		$html .= '</div>' ;
		
		echo $html;
		
		die();
		
		
	}
	
	public function bup_update_template_categories()
	{
		$template_id = $_POST['template_id']	;
		
		$user_alias = array();
		$category_list = $_POST["checked_categories"]; 	
		
		if($template_id!='')
		{
			$cate_clean =rtrim($category_list,",");	
			
			//echo 'c ' .$cate_clean;
			
			$template_values = get_option('bup_template_'.$template_id);		
			$template_values['category_ids'] = $cate_clean;		
			update_option('bup_template_'.$template_id, $template_values);
		
		}
		
		echo $cate_clean;	
		
		
		
		
		die();
	
	}
	
	public function update_form_type()
	{
		$template_id = $_POST['template_id']	;		
		$form_type = $_POST["checked_type"]; 	
		
		if($template_id!='')
		{
			
			$template_values = get_option('bup_template_'.$template_id);		
			$template_values['booking_form_type'] = $form_type;		
			update_option('bup_template_'.$template_id, $template_values);
		
		}
		
		print_r($template_values);	
		
		
		
		
		die();
	
	}
	
	public function bup_update_user_alias()
	{
		$template_id = $_POST['template_id']	;
		
		$user_alias = array();
		$user_alias = $_POST["user_alias"]; 
		
		$template_user_alias = array();		
		
		
		if($template_id!='')
		{
			$user_alias =rtrim($user_alias,"|");
			$user_list = explode("|", $user_alias);
			
						
			foreach($user_list as  $alias)
			{
				$details = explode("-", $alias);
				
			
				$user_id = $details[0];
				$alias_name= $details[1];
				
				$template_user_alias[$user_id] = array('user_id' =>$user_id, 'user_alias' =>$alias_name );		
			
			}
			update_option('bup_template_name_alias_'.$template_id,$template_user_alias);
									
		}else{
			
			delete_option('bup_template_name_alias_'.$template_id);
			
			
		}
		
		print_r($template_user_alias);
		
		
		
		
		die();
	
	}
	
	public function get_element_value ()
	{
		global $wpdb, $bookingultrapro;
		
		$template_id = $_POST["template_id"];
		$element_id = $_POST["element_id"];	
		
		$value= '';
		$html = '';
		
	
		$value = $bookingultrapro->get_template_label($element_id,$template_id);	
		
		$html .= '<p><textarea id="bup_template_label_edit_text" style=" width:100%; height:100px"></textarea></p>' ;
		//$html .= '<p><in  id="bup_template_label_edit_text_old">'.$value.'</textarea></p>' ;				
		$html .= '<input type="hidden" id="bup_temp_label" value="'.$element_id .'" />' ;
		
		if($element_id=='select_service_label'){ //select service label
		
			$html .= '<p>'.__('Drop&Down Label','bookingup').'</p>' ;	
			$html .= '<p><textarea id="bup_template_label_edit_text_second" style=" width:100%; height:100px"></textarea></p>' ;
		
			
		
		}
		
		echo $html;
		
		die();
		
		
	}
	
	public function displays_shortcodes ($label)
	{
		
	}
	
	public function update_template_values ()
	{
		global $wpdb;
		
		$template_id = $_POST["template_id"];
		$step1_label = $_POST["step1_label"];
		$step2_label = $_POST["step2_label"];
		$step3_label = $_POST["step3_label"];
		$step3cart_label = $_POST["step3cart_label"];
		$step4_label = $_POST["step4_label"];
		$bup_cus_bg_color = $_POST["bup_cus_bg_color"];	
		
		$select_service_label = $_POST["select_service_label"];
		$select_service_label_drop = $_POST["select_service_label_drop"];
		$select_date_label = $_POST["select_date_label"];
		$select_provider_label = $_POST["select_provider_label"];
		
		$step1_texts = $_POST["step1_texts"];
		$step2_texts = $_POST["step2_texts"];
		$step3_texts = $_POST["step3_texts"];
		$step3_cart_texts = $_POST["step3_cart_texts"];
		$layout_selected = $_POST["layout_selected"];
		$hide_staff = $_POST["hide_staff"];
		$hide_service = $_POST["hide_service"];
		$show_location = $_POST["show_location"];
		$show_cart = $_POST["show_cart"];
		
		$cart_header_1_texts = $_POST["cart_header_1_texts"];
		$cart_header_2_texts = $_POST["cart_header_2_texts"];
		$cart_header_3_texts = $_POST["cart_header_3_texts"];
		$cart_header_4_texts = $_POST["cart_header_4_texts"];
		$cart_header_5_texts = $_POST["cart_header_5_texts"];
		$cart_header_6_texts = $_POST["cart_header_6_texts"];
		$cart_header_7_texts = $_POST["cart_header_7_texts"];
		
		$category_list = $_POST["checked_categories"]; 
		$cate_clean =rtrim($category_list,",");	
		
		
	
		$template=array(
			 	
				'step1_label' => $step1_label,
				'step2_label' => filter_var($step2_label),
				'step3_label' => filter_var($step3_label),
				'step3cart_label' => filter_var($step3cart_label),
				'step4_label' => filter_var($step4_label),
				'bup_cus_bg_color' => filter_var($bup_cus_bg_color),				
				'select_service_label' => filter_var($select_service_label),
				'select_service_label_drop' => filter_var($select_service_label_drop),
				'select_date_label' => filter_var($select_date_label),
				'select_provider_label' => filter_var($select_provider_label),
				'step1_texts' => filter_var($step1_texts),
				'step2_texts' => filter_var($step2_texts),
				'step3_texts' => filter_var($step3_texts),
				'step3_cart_texts' => filter_var($step3_cart_texts),
				'layout_selected' => filter_var($layout_selected),
				'hide_staff' => filter_var($hide_staff),
				'hide_service' => filter_var($hide_service),
				'show_location' => filter_var($show_location),
				'show_cart' => filter_var($show_cart),
				'category_ids' =>$cate_clean,			
				
				'cart_header_1_texts' => filter_var($cart_header_1_texts),
				'cart_header_2_texts' => filter_var($cart_header_2_texts),
				'cart_header_3_texts' => filter_var($cart_header_3_texts),
				'cart_header_4_texts' => filter_var($cart_header_4_texts),
				'cart_header_5_texts' => filter_var($cart_header_5_texts),
				'cart_header_6_texts' => filter_var($cart_header_6_texts),
				'cart_header_7_texts' => filter_var($cart_header_7_texts)
				
				
				
			);	
		
			
		
		
		if($template_id!= "")
		{	
		
		 	update_option('bup_template_'.$template_id, $template);		
						
		
		}
		
		echo __('DONE!','bookingup');
		
		die();
		
		
	}
	
	
	
	public function delete ()
	{
		global $wpdb;
		
		$template_id = $_POST["template_id"];		
		
		
		if($template_id!= "")
		{			
			$query = "DELETE FROM " .$wpdb->prefix ."bup_appearance_templates WHERE template_id = '".$template_id."' ";			
			$wpdb->query( $query );		
			die();
			
		
		}
		
		
	}
	public function edit_conf ()
	{
		global $wpdb;
		
		$template_id = $_POST['template_id'];
		$template_name = $_POST['template_name'];
		
		if($_POST['template_id']!="" && $_POST['template_name']!="" ){
				
			$query = "UPDATE " .$wpdb->prefix ."bup_appearance_templates SET  template_name = '".$template_name."' WHERE template_id = '".$template_id."' ";			
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
		
		$template_id = $_POST['template_id'];
		
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_appearance_templates  WHERE template_id = "'.$template_id.'"  ' ;				
		$rows = $wpdb->get_results($sql);
		
		if ( !empty( $rows ) )
		{
		
			foreach ( $rows as $filter )
			{
				$template = $filter;		
			
			}
			
		}		
				
				
		$html .="<p>".__( 'Name:', 'bookingup')."</p>";				
		$html .="<p><input type='text' value='".$template->template_name."' class='bup-input' id='bup_template_name_edit_".$template_id."'></p>";
		
		
		
				
		$html .="<p><input type='button' class='button-primary bup-template-close' value='".__( 'Close', 'bookingup')."' data-form= ".$template_id."> <input type='button'  class='button-primary bup-template-modify' template-id= ".$template_id." value='".__( 'Save', 'bookingup')."'> </p>";
		
		echo $html;
		die();
		
	}
	

	
	
	
	function admin_head(){

	}

	function add_styles(){
	
		wp_register_script( 'bup_appearance_js', bup_appearance_url . 'admin/scripts/admin.js', array( 
			'jquery'
		) );
		wp_enqueue_script( 'bup_appearance_js' );
	
		wp_register_style('bup_appearance_css', bup_appearance_url . 'admin/css/admin.css');
		wp_enqueue_style('bup_appearance_css');
		
	}
	
	function add_menu()
	{
		add_submenu_page( 'bookingultra', __('Appearance','bookingup'), __('Appearance','bookingup'), 'manage_options', 'bup-appearance', array(&$this, 'admin_page') );
		
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
			require_once bup_appearance_path.'admin/panels/'.$tab.'.php';
		}
	}
	
	public function save()
	{
		global $wpdb;
		
		if(isset($_POST['template_name'])  && $_POST['template_name']!="")
		{
			
			$template_name = $_POST['template_name'];
			
			
			$query = "INSERT INTO " . $wpdb->prefix ."bup_appearance_templates (`template_name`) VALUES ('".$template_name."' )";
			
			$wpdb->query( $query );
							
				
			
			echo '<div class="updated"><p><strong>'.__('New template has been created.','bookingup').'</strong></p></div>';
		}else{
			
			echo '<div class="error"><p><strong>'.__('Please input a name for the new template.','bookingup').'</strong></p></div>';
			
			
		}
	
	
	}
	
	
	function admin_page() {
	
		
		if (isset($_POST['add-template']) && $_POST['add-template']=='add-template') 
		{
			$this->save();
		}

		
		
	?>
	
		<div class="wrap <?php echo $this->slug; ?>-admin">
        
           <h2>BOOKING ULTRA PRO - <?php _e('APPEARANCE','bookingup'); ?></h2>
           
           <div id="icon-users" class="icon32"></div>
			
						
			<h2 class="nav-tab-wrapper"><?php $this->admin_tabs(); ?></h2>

			<div class="<?php echo $this->slug; ?>-admin-contain">
				
				<?php $this->get_tab_content(); ?>
				
				<div class="clear"></div>
				
			</div>
			
		</div>

	<?php }

}
global $bup_appearance;
$bup_appearance = new BookingUltraAppearance();