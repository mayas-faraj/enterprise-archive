<?php
class BookingUltraAweber {

	var $options;

	function __construct() {
		
		
		$this->ini_module();
	
		/* Plugin slug and version */
		$this->slug = 'bookingultra';
		$this->subslug = 'bup-aweber';
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
		$this->plugin_data = get_plugin_data( bup_forms_path . 'index.php', false, false);
		$this->version = $this->plugin_data['Version'];
		
		/* Priority actions */
		add_action('admin_menu', array(&$this, 'add_menu'), 11);
		add_action('admin_enqueue_scripts', array(&$this, 'add_styles'), 9);
		add_action('admin_head', array(&$this, 'admin_head'), 9 );
		add_action('admin_init', array(&$this, 'admin_init'), 9);
		
		add_action( 'wp_ajax_bup_aweber_update_auth_code', array(&$this, 'update_auth_code' ));
		add_action( 'wp_ajax_bup_aweber_update_auth_code_reset', array(&$this, 'auth_code_reset' ));
		add_action( 'wp_ajax_bup_aweber_set_list', array(&$this, 'aweber_set_list' ));
		
		
		
		
		
	}
	
	public function ini_module()
	{
		global $wpdb;		   		  		   
		
	}
	
	function admin_init() 
	{
	
		$this->tabs = array(
			'manage' => __('Aweber','bookingup')
			
		);
		$this->default_tab = 'manage';		
		
	}
	
	public function update_auth_code ()
	{
		global $bookingultrapro;
		
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
			
		$response = array();		
		$html='';
		
		$options = get_option("buproaw_options");				
		$authorization_code = $_POST['auth_key'];
		$access_key = $options['access_key'];
		$access_secret = $options['access_secret'];	
		
		//valid auth
		//get token if needed
		if(!empty($authorization_code) && (empty($access_key) || empty($access_secret)))
		{
			try {
				# set $authorization_code to the code that is given to you from
				# https://auth.aweber.com/1.0/oauth/authorize_app/YOUR_APP_ID			
				$auth = AWeberAPI::getDataFromAweberID($authorization_code);
				list($consumerKey, $consumerSecret, $accessKey, $accessSecret) = $auth;
	
				# Store the Consumer key/secret, as well as the AccessToken key/secret
				# in your app, these are the credentials you need to access the API.
				$access_key = $accessKey;
				$options['access_key'] = $access_key;
				$access_secret = $accessSecret;
				$options['access_secret'] = $access_secret;
				
				
				if( empty($access_key) || empty($access_secret))
				{
					$html .= '<div class="bup-ultra-warning ">';
					$html .= "<h3>AWeberAPIException:</h3>";
					$html .= "<li> Authorization Failed          <br>";
					$html .= "</div>";
					
					$message = 'NOOK';
					
				}else{
				
					$message = 'OK';							
					update_option('buproaw_options', $options);
					update_option('bup_aweber_authorization_code', $authorization_code );
					
					//load lists
					$this->bupaw_load_lists();
				
				}
				
			}
			catch(AWeberAPIException $exc) {
				
				$html .= '<div class="bup-ultra-warning ">';
				$html .= "<h3>AWeberAPIException:</h3>";
				$html .= "<li> Type: $exc->type              <br>";
				$html .= "<li> Msg : $exc->message           <br>";
				$html .= "<li> Docs: $exc->documentation_url <br>";
				
				$html .= "</div>";
				$message = 'NOOK';
				
				
			}
		}
		
		//update lists
		
		
		$response = array('response' => $message, 'content' => $html);		
		echo json_encode($response);
					
		
		die();	
			
						
	}
	
	function buproaw_subscribe($list_user, $list_id )
	{		
		global $bookingultrapro;	
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
		//get aweber account or fail
		$account = $this->bupaw_getAccount();	
		if(empty($account))
			return;
		
		$listURL = "/accounts/{$account->id}/lists/{$list_id}";
		$list = $account->loadFromUrl($listURL);
		$subscribers = $list->subscribers;
		
		$new_subscriber = $subscribers->create(array(
					'email' => $list_user->user_email,
					'name' => trim($list_user->first_name . " " . $list_user->last_name)));
					
					
	}

	
	
	/*
	Load the AWeber API
	*/
	function bupaw_load_lists()
	{
			
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
		$options = get_option("buproaw_options");				
		$access_key = $options['access_key'];
		$access_secret = $options['access_secret'];
		
		//get lists
		if(!empty($access_key) && !empty($access_secret))
		{
			//get aweber account or fail
			$account = $this->bupaw_getAccount();	
			if(!empty($account)) {
				try {
					$buproaw_lists = $account->lists->data['entries'];
					$all_lists = array();
								
					//save all lists in an option
					$i = 0;	
					foreach ( $buproaw_lists as $list ) {
						$all_lists[$i]['id'] = $list['id'];				
						$all_lists[$i]['account_id'] = $account->id;
						$all_lists[$i]['name'] = $list['name'];
						$i++;
					}
					
					/** Save all of our new data */
					update_option( "buproaw_all_lists", $all_lists);
					
				} catch(AWeberAPIException $exc) {
					print "<h3>AWeberAPIException:</h3>";
					print " <li> Type: $exc->type              <br>";
					print " <li> Msg : $exc->message           <br>";
					print " <li> Docs: $exc->documentation_url <br>";
					print "<hr>";
				}
			} else {
				global $pmproaw_exception;
				if(!empty($pmproaw_exception)) {
					print "<h3>AWeberAPIException:</h3>";
					print " <li> Type: $pmproaw_exception->type              <br>";
					print " <li> Msg : $pmproaw_exception->message           <br>";
					print " <li> Docs: $pmproaw_exception->documentation_url <br>";
					print "<hr>";
				}			
			}
		}
		
	
	}
	
		
	public function get_authorize_url ()
	{
		global $bookingultrapro;
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
		$consumer_key = $bookingultrapro->get_option('aweber_consumer_key');
		$consumer_secret = $bookingultrapro->get_option('aweber_consumer_secret');		
		
		$aweber = new AWeberAPI($consumer_key, $consumer_secret);
		
		$callbackUrl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        list($requestToken, $requestTokenSecret) = $aweber->getRequestToken($callbackUrl);
		
		update_option( "bup_aweber_request_token", $requestToken);
		update_option( "bup_aweber_request_token_secret", $requestTokenSecret);
		
		return $aweber->getAuthorizeUrl();					
					
						
	}
	
	public function set_access_tokens ()
	{
		global $bookingultrapro;
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
		$consumer_key = $bookingultrapro->get_option('aweber_consumer_key');
		$consumer_secret = $bookingultrapro->get_option('aweber_consumer_secret');		
		
		$aweber = new AWeberAPI($consumer_key, $consumer_secret);
		
		$aweber->user->tokenSecret = get_option('bup_aweber_request_token_secret');
		$aweber->user->requestToken = $_GET['oauth_token'];
		$aweber->user->verifier = $_GET['oauth_verifier'];
		list($accessToken, $accessTokenSecret) = $aweber->getAccessToken();		
	
		update_option( "bup_aweber_access_token", $accessToken);
		update_option( "bup_aweber_access_token_secret", $accessTokenSecret);
		
		$account = $aweber->getAccount($accessToken, $accessTokenSecret);
		
		$bupsroaw_lists = $account->lists->data['entries'];
		$all_lists = array();
								
		//save all lists in an option
		$i = 0;	
		foreach ( $bupsroaw_lists as $list ) {
						$all_lists[$i]['id'] = $list['id'];				
						$all_lists[$i]['account_id'] = $account->id;
						$all_lists[$i]['name'] = $list['name'];
						$i++;
		}
				
		/** Save all of our new data */
		update_option( "buproaw_all_lists", $all_lists);				
						
	}
	
				

		
	/*
	Load the AWeber API
	*/
	function bupaw_getAccount($force = false)
	{
		global $buprooaw_aweber_api, $buproaw_aweber_account, $bookingultrapro;
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}	
		
		if(empty($force) && empty($buproaw_aweber_account)) {	
			
			$options = get_option("buproaw_options");
			
			$consumer_key = $bookingultrapro->get_option('aweber_consumer_key');
			$consumer_secret = $bookingultrapro->get_option('aweber_consumer_secret');
			
			if(empty($options['access_key']) || empty($options['access_secret']))
				return false;
			
			try {
				$buprooaw_aweber_api = new AWeberAPI($consumer_key , $consumer_secret);
				$buproaw_aweber_account = $buprooaw_aweber_api->getAccount($options['access_key'], $options['access_secret']);
			} catch(AWeberAPIException $exc) {			
				global $buproaw_exception;
				$buproaw_exception = $exc;				
				
				return false;
			}
		}
		
		return $buproaw_aweber_account;
	}
	
	public function valid_auth ($auth_key)
	{
		global $bookingultrapro;
						
					
						
	}
	
	public function get_lists ()
	{
		global $bookingultrapro;
		$html = '';
		
		$lists = get_option( "buproaw_all_lists");
		$list_selected = get_option( "buproaw_aweber_list");
		
		if(!empty($lists))
		{
			$html .= "<select name='bup-selected-aweber-list' id='bup-selected-aweber-list'>";
			
			foreach($lists as $list)
			{
				$html .= "<option value='" . $list['id'] . "' ";
				
				if($list['id']==$list_selected)
					$html .= "selected='selected'";
					
				$html .= ">" . $list['name'] . "</option>";
				
			}
			$html .= "</select>";
		}
		else
		{
			$html .= "No lists found.";
		}	
		
		
		return $html;
						
					
						
	}
	
	public function auth_code_reset ()
	{
		global $wpdb;					
		delete_option('bup_aweber_authorization_code' );
		delete_option('bup_aweber_access_token_secret' );
		delete_option('bup_aweber_access_token' );
		delete_option('bup_aweber_request_token_secret' );
		delete_option('bup_aweber_request_token' );
		delete_option('buproaw_options' );	
		
		die();	
			
	}	
	
	public function aweber_set_list ()
	{
		global $wpdb;	
		
		$html = '';
		
		$list_id = $_POST["list_id"];		
		update_option( "buproaw_aweber_list", $list_id);
		
		$html .= '<div class="bup-ultra-success ">';
		$html .= '<p>'.__('Done!','bookingup').'</p>';
		$html .= '</div>';
		
		echo $html;
		die();	
			
	}	
	
	
	
	
	
		
	
	function admin_head(){

	}

	function add_styles(){
	
		wp_register_script( 'bup_aweber_js', bup_aweber_url . 'admin/scripts/admin.js', array( 
			'jquery'
		) );
		wp_enqueue_script( 'bup_aweber_js' );
	
		wp_register_style('bup_aweber_css', bup_aweber_url . 'admin/css/admin.css');
		wp_enqueue_style('bup_aweber_css');
		
	}
	
	function add_menu()
	{
		add_submenu_page( 'bookingultra', __('Aweber','bookingup'), __('Aweber','bookingup'), 'manage_options', 'bup-aweber', array(&$this, 'admin_page') );
		
	
		
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
			require_once bup_aweber_path.'admin/panels/'.$tab.'.php';
		}
	}
	
	
	
	function admin_page() {
	
		
				
	?>
	
		<div class="wrap <?php echo $this->slug; ?>-admin">
        
           <h2>BOOKING ULTRA PRO - <?php _e('AWEBER','bookingup'); ?></h2>
           
           <div id="icon-users" class="icon32"></div>
			
						
			<h2 class="nav-tab-wrapper"><?php $this->admin_tabs(); ?></h2>

			<div class="<?php echo $this->slug; ?>-admin-contain">
				
				<?php $this->get_tab_content(); ?>
				
				<div class="clear"></div>
				
			</div>
			
		</div>

	<?php }

}

$bup_aweber = new BookingUltraAweber();
