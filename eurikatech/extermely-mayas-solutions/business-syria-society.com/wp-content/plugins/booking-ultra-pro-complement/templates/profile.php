<?php
global $bookingultrapro;

$user_id = $current_user->ID;

$tab ='';

if(isset($_GET['tab'])){$tab =$_GET['tab'];}

if($tab==''){$inc ='main';}
if($tab=='services'){$inc ='services';}
if($tab=='appointment'){$inc ='appointment';}
if($tab=='schedule'){$inc ='schedule';}
	
?>

<div class="bup-user-profile-cont">

	<div class="bup-profile-top-header">
    
    
    <?php //check card background			
			$style_bg_thumb ="";
			$style_bg_thumb ="background-color:#f04646;";
			$user_profile_bg_color = get_user_meta( $user_id, 'bup_profile_bg_color', true );
			
			if($thumb!="")
			{				
				$style_bg_thumb =  'background-image: url('.$thumb.');';			
			}
			
			if($user_profile_bg_color!="")
			{				
				$style_bg_thumb =  "background-color:".$user_profile_bg_color.";";			
			}
			
			?>
			
			
			
			<a style="<?php echo $style_bg_thumb; ?>" tabindex="-1" href="<?php echo $permalink?>" class="bup-profile-top-bg-profile">  </a>	
			
			
			<div class="bup-my-thumb">               
                  <?php echo $this->get_user_pic( $user_id, 120, 'avatar', $pic_boder_type, 'fixed');?>  
                  
                  
                  <div class="bup-top-info">
                      <h1><?php _e('Hi','bookingup');?>, <?php _e(" I'm ",'bookingup');?><?php echo $current_user->display_name;?> </h1> 
                      
                      <div class="bup-summary-bar">                       
                        <small> <?php echo get_user_meta( $user_id, 'bup_summary', true )?> </small> 
                      
                      </div>
                      
                      <div class="bup-summary-bar-2">
                      
                      	 <?php echo $this->get_staff_top_profile_location( $user_id);?> 
                      
                      </div>
                                        
                  </div>              
            </div> 
            
            
			<div class="bup-top-options">
            
            	 <?php echo $this->get_staff_top_right_nav_profile( $user_id);?>                       
                                
            </div>
            
            <div class="bup-top-options-book">            
            	                
                <?php echo $this->get_staff_top_book_appointment( $user_id);?>                     
                                
            </div>
            
    
    </div>
    
      
       <div class="bup-profile-botton-cont" >
       
       		<?php if($inc =='main' || $inc =='' && $_GET['bup_payment_method']==''){?>             
           
            
             <div class="bup-main-cont-1" > 
              <h1><?php _e('Overview: ','bookingup');?>   <span class="bup-widget-frontend-colspan"><a href="#" title="<?php _e('Close ','bookingup');?>" class="bup-widget-frontend-colapsable" widget-id="1"><i class="fa fa-sort-desc" id="bup-close-open-icon-1"></i></a></span> </h1>
              
              <div class="bup-profile-bio-cont" id="bup-front-end-backend-landing-1">
              
             	 <?php echo get_user_meta( $user_id, 'bup_description', true )?>
              
               </div>
              
              <h1><?php _e('Schedule: ','bookingup');?>     <span class="bup-widget-frontend-colspan"><a href="#" title="<?php _e('Close ','bookingup');?>" class="bup-widget-frontend-colapsable" widget-id="2"><i class="fa fa-sort-desc" id="bup-close-open-icon-2"></i></a></span>  </h1> 
              
                <div class="bup-profile-schedule-cont" id="bup-front-end-backend-landing-2">
                          
            		<?php echo $this->get_staff_schedule_profile($user_id);?>  
                
                 </div>
                 
              
              <h1><?php _e('Location: ','bookingup');?>        <span class="bup-widget-frontend-colspan"><a href="#" title="<?php _e('Close ','bookingup');?>" class="bup-widget-frontend-colapsable" widget-id="3"><i class="fa fa-sort-desc" id="bup-close-open-icon-3"></i></a></span> </h1>
              
             	 <div class="bup-profile-googlemap-cont" id="bup-front-end-backend-landing-3">
                          
            		<?php echo $this->get_staff_map_location_profile($user_id);?>                     
                  
                
                 </div>              
                
            
             </div>  
             
             <div class="bup-main-cont-2">
              <h1><?php _e('Services: ','bookingup');?>         <span class="bup-widget-frontend-colspan"><a href="#" title="<?php _e('Close ','bookingup');?>" class="bup-widget-frontend-colapsable" widget-id="4"><i class="fa fa-sort-desc" id="bup-close-open-icon-4"></i></a></span> </h1> 
              
              <div class="bup-profile-services-cont" id="bup-front-end-backend-landing-4">
                          
            		<?php echo $this->get_staff_services_profile($user_id);?>  
                
              </div> 
            
             </div>     
            	
            
            <?php }?>           
            
          
            
             <?php if( ($inc =='appointment' || $_GET['bup_payment_method']=='stripe') ){?>
             
             	<h1><?php _e('Make an Appointment: ','bookingup');?>    </h1>         
                       
             
             	<?php echo do_shortcode("[bupro_appointment template_id='".$booking_form_template_id."' staff_id='".$user_id."']");?>    
              
            
             <?php }?>  
                  
       </div>

</div>

