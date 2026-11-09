
jQuery(document).ready(function($) {

	
	//Stripe.setPublishableKey( bup_stripe_vars.publishable_key );

	
});


function bup_authorize_response_handler(status, response) {
	
	if (response.error) {
		// re-enable the submit button
		jQuery('#bup-btn-book-app-confirm').attr("disabled", false);

		var error = '<div class="bup_errors"><p class="bup_error">' + response.error.message + '</p></div>';

		// show the errors on the form
		jQuery('#bup-stripe-payment-errors').html(error);
		jQuery('.edd-cart-ajax').hide();
		
		
	} else {
		
		var form$ = jQuery("#bup-registration-form");
		
		// token contains id, last4, and card type
		var token = response['id'];

		// insert the token into the form so it gets submitted to the server
		form$.append("<input type='hidden' name='bup_stripe_token' value='" + token + "' />");

		// and submit
		//form$.get(0).submit();
		
		// re-enable the submit button
		jQuery('#bup-btn-book-app-confirm').attr("disabled", false);
		
		form$.get(0).submit();

	}
}


function bup_authorize_process_card() {
	
	// disable the submit button to prevent repeated clicks
	jQuery('#bup-btn-book-app-confirm').attr('disabled', 'disabled');

	
	
	Stripe.createToken({
		number: 	     jQuery('.card-number').val(),		
		cvc: 		     jQuery('.card-cvc').val(),
		exp_month:       jQuery('.card-expiry-month').val(),
		exp_year: 	     jQuery('.card-expiry-year').val()		
	}, bup_stripe_response_handler);

	return false; // submit from callback
}
