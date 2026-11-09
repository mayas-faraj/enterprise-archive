<?php
class BupComplementAuthorize
{
	
		
	public function __construct()
	{
		add_action( 'wp_ajax_bup_authorize_net_credit_card',  array( &$this, 'authorize_credit_card' ));
		add_action( 'wp_ajax_nopriv_bup_authorize_net_credit_card',  array( &$this, 'authorize_credit_card' ));	
		
   }
	
	public function load_library() {
		
		global  $bookingultrapro;
		
		
		if (file_exists( bookingup_comp_path . 'libs/authorize/AuthorizeNet.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/authorize/AuthorizeNet.php' );
			
		}
		
		//set api and secret
		$this->api_login_id = $bookingultrapro->get_option('authorize_login') ;
		$this->api_transaction_key = $bookingultrapro->get_option('authorize_key') ;
		$this->authorizenet_sandbox = $bookingultrapro->get_option('authorize_mode') ;
		
		
		if(!defined("AUTHORIZE_NET_SANDBOX"))
		{ define("AUTHORIZE_NET_SANDBOX", ($this->authorizenet_sandbox 	   =='2'? true : false)); }
			
		
		if('2' == AUTHORIZE_NET_SANDBOX )
		{
			if(!defined("AUTHORIZENET_API_LOGIN_ID"))
			{define("AUTHORIZENET_API_LOGIN_ID",    $this->api_login_id );       }
			
			if(!defined("AUTHORIZENET_TRANSACTION_KEY"))
			{define("AUTHORIZENET_TRANSACTION_KEY", $this->api_transaction_key ); }
			
			if(!defined("AUTHORIZENET_SANDBOX"))
			{ define("AUTHORIZENET_SANDBOX", true); }
			
		}else{ 	
		
			if(!defined("AUTHORIZENET_API_LOGIN_ID"))
			{define("AUTHORIZENET_API_LOGIN_ID",    $this->api_login_id );       }
			
			if(!defined("AUTHORIZENET_TRANSACTION_KEY"))
			{define("AUTHORIZENET_TRANSACTION_KEY", $this->api_transaction_key ); }
			
			if(!defined("AUTHORIZENET_SANDBOX"))
			{define("AUTHORIZENET_SANDBOX", false);    }
		}
		
	}
	
	public function authorize_credit_card()
	{
		global  $bookingultrapro;
		
		if (file_exists( bookingup_comp_path . 'libs/authorize/AuthorizeNet.php')) 
		{		
			require_once( bookingup_comp_path . 'libs/authorize/AuthorizeNet.php' );
			
			
		
			$card_num         = sanitize_text_field(str_replace(' ','',$_POST['authorizenet-card-number']));
			$exp_date         = explode( "/", sanitize_text_field($_POST['authorizenet-card-expiry']));
			$exp_month        = str_replace( ' ', '', $exp_date[0]);
			$exp_year         = str_replace( ' ', '',$exp_date[1]);
	
			if (strlen($exp_year) == 2) {
				$exp_year += 2000;
			}
			
			$cvc              = sanitize_text_field($_POST['authorizenet-card-cvc']);
			
			$sale = new AuthorizeNetAIM;
			$sale->amount     = $wc_order->order_total;;
			$sale->card_num   = $card_num;
			$sale->exp_date   = $exp_year.'/'.$exp_month;
			$sale->card_code  = $cvc; 
			
			$customer = (object)array();
			$customer->first_name 			= $wc_order->billing_first_name;
			$customer->last_name 			= $wc_order->billing_last_name;
	
			$sale->setFields($customer);
			
			
			
			$response = $sale->authorizeOnly();
			
			if ($response) 
			{			
				if( (1 == $response->approved) || (4 == $response->approved) )
				{
					
				}else{//approved erro
				
					
				}
			
			}else{ //response erro
			
				
			}
		
		
		
		}
		
		
		
		
	}
	
	public function charge_credit_card($token, $description, $amount)
	{
		global  $bookingultrapro;
		
		$card_num         = sanitize_text_field(str_replace(' ','',$_POST['authorizenet-card-number']));
		$exp_date         = explode( "/", sanitize_text_field($_POST['authorizenet-card-expiry']));
		$exp_month        = str_replace( ' ', '', $exp_date[0]);
		$exp_year         = str_replace( ' ', '',$exp_date[1]);

		if (strlen($exp_year) == 2) {
            $exp_year += 2000;
        }
		
		$cvc              = sanitize_text_field($_POST['authorizenet-card-cvc']);
		
		$sale = new AuthorizeNetAIM;
		$sale->amount     = $wc_order->order_total;;
		$sale->card_num   = $card_num;
		$sale->exp_date   = $exp_year.'/'.$exp_month;
		$sale->card_code  = $cvc; 
		
		$customer = (object)array();
		$customer->first_name 			= $wc_order->billing_first_name;
		$customer->last_name 			= $wc_order->billing_last_name;

		$sale->setFields($customer);
		
		
		if('yes' == AUTHORIZENET_TRANSACTION_MODE)
		{
			$response = $sale->authorizeOnly();
		}
		else
		{
			$response = $sale->authorizeAndCapture();
		}
		
		
		
	}
	
	public function process_order($custom_key, $res)
	{
		global  $bookingultrapro;
		
		// Get Order
		$rowOrder = $bookingultrapro->order->get_order_pending($custom_key);
		
		if ($rowOrder->order_id=="")    
		{
			$errors .= " --- Order Key Not VAlid: " .$custom_key;
			
		}
		
		$txn_id = $res['message']['id'];
		
		$currency_code = $bookingultrapro->get_option("gateway_stripe_currency");			
			
		$order_id = $rowOrder->order_id;								
		$total_price = $rowOrder->order_amount;  				
		$business_email = $paypal_email;			
		$booking_id = 	$rowOrder->order_booking_id	;			
		
		//get appointment			
		$appointment = $bookingultrapro->appointment->get_one($booking_id);
		$staff_id = $appointment->booking_staff_id;	
		$client_id = $appointment->booking_user_id;	
		$service_id = $appointment->booking_service_id;
		
		//service			
		$service = $bookingultrapro->service->get_one_service($service_id);
		
		/*Update Order status*/				
		$bookingultrapro->order->update_order_status($order_id,'confirmed');
		
		/*Update Order With Payment Response*/				
		$bookingultrapro->order->update_order_payment_response($order_id,$txn_id);	
		
		/*Update Appointment*/						
		$bookingultrapro->appointment->update_appointment_status($booking_id,1);												
						
		//get user				
		$staff_member = get_user_by( 'id', $staff_id );
		$client = get_user_by( 'id', $client_id );					
							
		$bookingultrapro->messaging->send_payment_confirmed($staff_member, $client, $service, $appointment,$rowOrder );
	
	}
 
		
	
	

}
$key = "authorize";
$this->{$key} = new BupComplementAuthorize();
?>