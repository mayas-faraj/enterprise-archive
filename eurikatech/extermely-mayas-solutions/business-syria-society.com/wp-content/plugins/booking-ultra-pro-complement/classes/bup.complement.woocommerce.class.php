<?php
class BupComplementWooCommerce
{
	
		
	public function __construct()
	{
		
		// Load Stripe library
		$this->load_library();
		
					
	
    }
	
	
	public function add_product_to_cart($product_id) 
	{	
		
		$found = false;
		
		//check if product already in cart
		if ( sizeof( WC()->cart->get_cart() ) > 0 ) 
		{
			foreach ( WC()->cart->get_cart() as $cart_item_key => $values ) 
			{
				$_product = $values['data'];
				if ( $_product->id == $product_id )
					$found = true;
			}
			
			// if product not found, add it
			if ( ! $found )
				WC()->cart->add_to_cart( $product_id );
				
		} else {
			
			// if no products in cart, add it
			WC()->cart->add_to_cart( $product_id );
		}
		
	}
	
	
	

}
$key = "woocommerce";
$this->{$key} = new BupComplementWooCommerce();
?>