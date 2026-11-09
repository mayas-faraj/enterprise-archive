<?php
global $bookingultrapro;
		
?>

<div class="bup-directory3">
<ul>

<?php 

foreach($users_list['users'] as $user)
{
	$user_id = $user->ID;	
	//$thumb = $bookingultrapro->userpanel->get_profile_bg_url($user_id);			
	//$permalink = $bookingultrapro->userpanel->get_user_profile_permalink($user_id);
	$permalink = $this->get_user_profile_permalink($user_id);
	
	?>
	<li>
			
	<?php	
			//check card background			
			$style_bg_thumb ="";
			$style_bg_thumb ="background-color:$bgcolor;";
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
			
			
			
			<a style="<?php echo $style_bg_thumb; ?>" tabindex="-1" href="<?php echo $permalink?>" class="bup-profile-card-bg-profile">  </a>	
			
			
			<div class="bup-my-thumb">
               
                  <?php echo $this->get_user_pic( $user_id, 120, 'avatar', $pic_boder_type, 'fixed');?>   
              
            </div> 
            
			
			 <p class="bup-user-name">
             <a href="<?php echo $permalink;?>">
			 <?php echo $user->display_name?></a></p> 
			
			<div class="bup-desc-info">
			 <?php //echo $bookingultrapro->userpanel->display_optional_fields_pro_minified( $user_id,$display_country_flag, $optional_fields_to_display)?>
			</div>
			
					
			</li>
			
<?php 

} //end for each
			?>
		
</ul>

</div>

