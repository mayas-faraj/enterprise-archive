<?php
class BupComplementAweber
{
	
	
	function buproaw_subscribe($list_user, $list_id )
	{		
		global $bookingultrapro;	
		
		//include AWeberAPI Class if we don't have it already
		if(!class_exists("AWeberAPI"))
		{
			require_once( bookingup_comp_path . 'libs/aweber_api/aweber_api.php' );
		}
		
		try {
		
			//get aweber account or fail
			$account = $this->bupaw_getAccount();	
			if(empty($account))
				return;
			
			$listURL = "/accounts/{$account->id}/lists/{$list_id}";
			$list = $account->loadFromUrl($listURL);
			$subscribers = $list->subscribers;
			
			$new_subscriber = $subscribers->create(array(
						'email' => $list_user->user_email,
						'name' => trim($list_user->display_name )));
		} catch(AWeberAPIException $exc) {
			/*print "<h3>AWeberAPIException:</h3>";
			print " <li> Type: $exc->type              <br>";
			print " <li> Msg : $exc->message           <br>";
			print " <li> Docs: $exc->documentation_url <br>";
			print "<hr>";
			exit(1); */
		}			
					
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

}
$key = "aweber";
$this->{$key} = new BupComplementAweber();
?>