<?php
global $bookingultrapro;

$user_id = $current_user->ID;

$tab ='';

if(isset($_GET['tab'])){$tab =$_GET['tab'];}

if($tab==''){$inc ='main';}
if($tab=='services'){$inc ='services';}
if($tab=='appointment'){$inc ='appointment';}
if($tab=='schedule'){$inc ='schedule';}


//print_r($_GET);

		
?>

<div class="bup-user-profile-cont">

	<div class="bup-profile-top-header">
    
    
    <?php //check card background			
			$style_bg_thumb ="";
			$style_bg_thumb ="background-color:#f8a496;";
			
			if($thumb!="")
			{				
				$style_bg_thumb =  'background-image: url('.$thumb.');';			
			}
			
			?>
			
			
			
			<a style="<?php echo $style_bg_thumb; ?>" tabindex="-1" href="<?php echo $permalink?>" class="bup-profile-top-bg-profile">  </a>	
			
			
			<div class="bup-my-thumb">               
                  <?php echo $this->get_user_pic( $user_id, 120, 'avatar', $pic_boder_type, 'fixed');?>   
              
            </div> 
    
    
    
    </div>
    
    
    <div class="bup-profile-top-nav"> 
    
      <ul>
      	<li><?php echo $this->get_profile_menu_url('main', $user_id);?></li>
        <li><?php echo $this->get_profile_menu_url('services', $user_id);?></li>
        <li><?php echo $this->get_profile_menu_url('schedule', $user_id);?></li>       
        <li><?php echo $this->get_profile_menu_url('appointment', $user_id);?></li>
      </ul>
      
     </div>
      
      
       <div class="bup-profile-botton-cont">
       
       		<?php if($inc =='main' || $inc ==''){?>   
            
           
            
             <div class="bup-main-cont-1"> 
              <h1><?php _e('Overview: ','bookingup');?>    </h1> 
            
             </div>  
             
             <div class="bup-main-cont-2">
              <h1><?php _e('Services: ','bookingup');?>    </h1> 
              
              <div class="bup-profile-services-cont">
            
            		<?php echo $this->get_staff_services_profile($user_id);?>  
                
                 </div> 
            
             </div>     
            	
            
            <?php }?>
			
			<?php if($inc =='services'){?>
            
                <h1><?php _e('My Services: ','bookingup');?>    </h1> 
            
            	<div class="bup-profile-services-cont">
            
            		<?php echo $this->get_staff_services_profile($user_id);?>  
                
                 </div>         
            	
            
            <?php }?>
            
            <?php if($inc =='schedule'){?>
            
            <h1><?php _e('My Schedule: ','bookingup');?>    </h1> 
            
            	
            
            <?php }?>
            
            <?php if($inc =='about'){?>
            
            	
            
            <?php }?>
            
             <?php if( ($inc =='appointment' || $_GET['bup_payment_method']=='stripe') ){?>
             
             	<h1><?php _e('Make an Appointment: ','bookingup');?>    </h1>         
                       
             
             	<?php echo do_shortcode("[bupro_appointment template_id='".$booking_form_template_id."' staff_id='".$user_id."']");?>    
              
              
            	
            
             <?php }?>       
       
    
       </div>
       
       

</div>

