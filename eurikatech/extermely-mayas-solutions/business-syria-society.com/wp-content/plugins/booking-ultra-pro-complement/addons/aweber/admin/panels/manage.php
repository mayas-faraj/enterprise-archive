<?php
global $bup_aweber, $bookingultrapro;

$authorized = false;

if(isset($_GET['oauth_token']) && $_GET['oauth_token'] !='' && isset($_GET['oauth_verifier']) && $_GET['oauth_verifier'] !='')
{
	//returns from aweber	
	$bup_aweber->set_access_tokens();
	$authorized = true;
}

?>
<div class="bup-ultra-sect ">
        
        
        <div class="bup-ultra-success bup-notification"><?php _e('Success ','bookingup'); ?></div>               
    
    
    <?php if( $bookingultrapro->get_option('aweber_consumer_key')=='' || $bookingultrapro->get_option('aweber_consumer_secret')=='' ){?>
    
    <h3><?php _e('IMPORTANT','bookingup'); ?></h3>
    <div class="bup-ultra-warning "><?php _e('You have to set your APP ID, Consumer Key and Consumer Secret to start using Aweber ','bookingup'); ?></div>
    
    
    <?php }else{
		
		
		
		$authorizationURL = $bup_aweber->get_authorize_url();
		
	
		?>
        
       <?php  if(get_option('bup_aweber_access_token')=='' || get_option('bup_aweber_access_token_secret')==''){ //authorization code is not set?>
    
    <h3><?php _e('CONNECT YOUR AWEBER ACCOUNT','bookingup'); ?></h3>
    
    <p><?php _e("Now that you have set the APP ID, Consumer Key and Consumer Secret you will need to conect your account with the plugin. This is required just once. Just <a href='".$authorizationURL."' target='_blank'>click here the connect</a> when you're ready.",'bookingup'); ?></p>
          
       
    
    
    
    <p id="bup-aw-auth-message">
                     
    </p>
    
     <?php }else{ //authorization code set?>
     
       <?php if($authorized ){?>
          
                   
           <h3><?php _e("You're now connected to your AWeber Account.",'bookingup'); ?></h3>
           <p><a href="admin.php?page=bup-aweber"><?php _e("Click here",'bookingup'); ?></a> <?php _e(" to set your AWeber list.",'bookingup'); ?></p>
          
          
           <?php }else{ ?>
           
     
     <p><?php _e("You're already connected to your AWeber Account.",'bookingup'); ?></p>
     
      <p>
           <input name="bup-aweber-connect-reset" id="bup-aweber-connect-reset" type="button"  class="button-secondary bup-ultra-btn-red" value="<?php _e('Reset Your Authorization Code','bookingup'); ?>"/>
          
    </p>
    
    <h3><?php _e('Your Lists','bookingup'); ?></h3>
    
    <p><?php _e("Please select what list the users will be added to.",'bookingup'); ?></p>
    
    <?php echo $bup_aweber->get_lists()?>
    
    <p>
           <input name="bup-aweber-set-list" id="bup-aweber-set-list" type="button"  class="button-primary" value="<?php _e('Set List','bookingup'); ?>"/>  
          
    </p>
    
    <p id="bup-aw-list-message"> 
    
			<?php if(get_option( "buproaw_aweber_list")==''){?>
            
            <div class="bup-ultra-warning "> <?php _e("IMPORTANT: Make sure you've set a list. Otherwise AWeber will fail.",'bookingup'); ?></div>
            
             <?php }?>
     
       <?php } ?>
    
    </p>
    
    
     
     
      <?php }?>
    
    
     
          
    
    
    <?php }?>
    
   
        
                        
        <script type="text/javascript">
	
		
			 var message_wait_availability ='<img src="<?php echo bookingup_url?>admin/images/loaderB16.gif" width="16" height="16" /></span>&nbsp; <?php echo __("Please wait ...","bookingup")?>'; 
			  
		
	</script>


     

             

</div>