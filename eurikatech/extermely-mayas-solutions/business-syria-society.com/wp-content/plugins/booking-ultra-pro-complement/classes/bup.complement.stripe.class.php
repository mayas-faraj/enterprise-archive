<?php
class BupComplementStripe
{
	
		
	public function __construct()
	{
		
		global  $bookingultrapro;
		
		$settings = get_option('bup_options');
		$activate_stripe=$settings['gateway_stripe_active'];
		
		
		if($activate_stripe=='1')	
		{		
			// Load Stripe library
			$this->load_library();		
		}
		
    }
	
	/*
	 * Function to load the Stripe library.
	 * Include this plugin's Stripe library reference unless another plugin already includes it.
	 */
	public function load_library() {
		if ( ! class_exists( 'Stripe\Stripe' ) ) {
			require_once( bookingup_comp_path . 'libs/stripe-php/init.php' );
		}
		
	/*	\Stripe\Stripe::setApiKey("sk_test_BQokikJOvBiI2HlWgH4olfQ2");
\Stripe\Stripe::$apiBase = "https://api-tls12.stripe.com";
try {
  \Stripe\Charge::all();
  echo "TLS 1.2 supported, no action required.";
} catch (\Stripe\Error\ApiConnection $e) {
  echo "TLS 1.2 is not supported. You will need to upgrade your integration.";
}*/

	}
	
	public function charge_credit_card($token, $description, $amount)
	{
		global  $bookingultrapro;
		
	
		$amount = $amount*100;
		
		$key = $this->get_stripe_keys();		
		$result =  array();
		
		$res = 'ok';
		
		\Stripe\Stripe::setApiKey($key['secret_key']);
		
				
		$currency_code = $bookingultrapro->get_option("gateway_stripe_currency");
				
		if($currency_code==''){$currency_code='usd';}
		
		try {
			$charge = \Stripe\Charge::create(array(
			  "amount" => (int)$amount,
			  "currency" => $currency_code,
			  "source" => $token,
			  "description" => $description)
			);
			
			$res = 'ok';
			
			$message = $charge;
			$id =$charge->id;
		
			//print_r($charge);
			
		}catch(\Stripe\Error\Card $e){
			
			//echo $e->getMessage();
			
			$message = $e->getMessage();			
			$res = 'failed';
		}
		
		$result = array('result'=>$res,'message'=>$message, 'id'=>$id );
		//print_r($result);
		
		return $result;
		
		
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
		
		$txn_id = $res['id'];
		
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
	
	
	public function process_order_cart($custom_key, $res)
	{
		global  $bookingultrapro;		
		
		$is_cart = false;
			
		//check if this is a transaction by using shopping cart
		$shopping_cart = $bookingultrapro->order->get_cart_with_key_status($custom_key,"0");
			
		$cart_id = $shopping_cart->cart_id;
		
		if($cart_id!="") //we have a shoping cart opened
		{
			$txn_id = $res['id'];
			$is_cart = true;				
			$total_price = $shopping_cart->cart_amount;
				
			/*We have to notify client, admin and staff members of this purchase*/				
			$appointments_cart = $bookingultrapro->appointment->get_all_with_cart($cart_id);
					    
			foreach ( $appointments_cart as $appointment )
			{
					
					$booking_id = $appointment->booking_id;
					
					//get users				
					$staff_member = get_user_by( 'id', $appointment->booking_staff_id );
					$client = get_user_by( 'id', $appointment->booking_user_id );
					
					//service			
					$service = $bookingultrapro->service->get_one_service($appointment->booking_service_id);
																	
					/*Get Order*/	
					$rowOrder = $bookingultrapro->order->get_order_with_booking_id($appointment->booking_id);
												
					/*Update Order status*/	
					$order_id = 	$rowOrder->order_id;		
					$bookingultrapro->order->update_order_status($order_id,'confirmed');
					
					/*Update Order With Payment Response*/				
					$bookingultrapro->order->update_order_payment_response($order_id,$txn_id);
											
					 /*Update Appointment*/						
					$bookingultrapro->appointment->update_appointment_status($booking_id,1);							
					
					/*Send Notifications*/
					$bookingultrapro->messaging->send_payment_confirmed($staff_member, $client, $service, $appointment,$rowOrder );				
					
			
			 } //end for each
				 
			 /*Update Cart status*/	
			 $bookingultrapro->order->update_cart_status($cart_id,'1');
				 
			 //kill cart session					
			 $bookingultrapro->register->kill_shopping_cart();					
				 
				
		}else{ //this is not a cart purchase			
				
			
			// Get Order
			$rowOrder = $bookingultrapro->order->get_order_pending($custom_key);
			
			if ($rowOrder->order_id=="")    
			{
				$errors .= " --- Order Key Not VAlid: " .$custom_key;
				
			}
			
			$txn_id = $res['id'];
			
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
		
		
		} //end if cart purchase
		
		
		
	
	}
 
		
	public function get_stripe_keys()
	{
		global  $bookingultrapro;
		
		$keys = array();
		
		if($bookingultrapro->get_option('enable_live_key')=='2') //test
		{
			
			$keys = array('publishable_key' => $bookingultrapro->get_option('test_publish_key'), 'secret_key' => $bookingultrapro->get_option('test_secret_key'));
			
			
		}else{ //production
		
			
			$keys = array('publishable_key' => $bookingultrapro->get_option('live_publish_key'), 'secret_key' => $bookingultrapro->get_option('live_secret_key'));
		
		
		
		}
		
		
		return $keys; 
		
	}	
	

}
$key = "stripe";
$this->{$key} = new BupComplementStripe();
?>