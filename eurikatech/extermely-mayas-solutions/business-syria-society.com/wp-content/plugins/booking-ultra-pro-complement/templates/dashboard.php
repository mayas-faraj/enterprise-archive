<?php
global $bookingultrapro , $bup_filter, $bupultimate, $bupcomplement;


$current_user = $bookingultrapro->userpanel->get_user_info();

$user_id = $current_user->ID;
$user_email = $current_user->user_email;
$howmany = 5;

$currency_symbol =  $bookingultrapro->get_option('paid_membership_symbol');
$date_format =  $bookingultrapro->get_int_date_format();
$time_format =  $bookingultrapro->service->get_time_format();

$appointments = $bupcomplement->profile->get_all_by_staff_status("0",$user_id);
$appointments_week = $bupcomplement->profile->get_all_this_week($user_id);
$appointments_today= $bupcomplement->profile->get_all_this_day($user_id);



$pending = $bupcomplement->profile->get_appointments_total_by_status_staff(0, $user_id);
$cancelled = $bupcomplement->profile->get_appointments_total_by_status_staff(2, $user_id);
$noshow = $bupcomplement->profile->get_appointments_total_by_status_staff(3, $user_id);
$unpaid = $bookingultrapro->order->get_orders_by_status('pending');

$allappo = $bookingultrapro->appointment->get_appointments_planing_total('all');

$how_many_upcoming_app = 20;

//today
$today = $bupcomplement->profile->get_appointments_planing_total('today', $user_id);
$tomorrow = $bupcomplement->profile->get_appointments_planing_total('tomorrow', $user_id);
$week = $bupcomplement->profile->get_appointments_planing_total('week', $user_id);


$module = "";
$act= "";
$view= "";
$reply= "";


if(isset($_GET["module"])){	$module = $_GET["module"];	}
if(isset($_GET["act"])){$act = $_GET["act"];	}
if(isset($_GET["view"])){	$view = $_GET["view"];}
if(isset($_GET["reply"])){	$reply = $_GET["reply"];}


if(isset($_GET["code"]) && $_GET["code"] !='' && isset($bupcomplement->googlecalendar) && $module=='account')
{
	session_start();
	
	$current_staff_id =$user_id ;
		
	if($current_staff_id!='')
	{			
		//google calendar.	
		$client = $bupcomplement->googlecalendar->auth_client_with_code_staff($_GET["code"], $current_staff_id);	
	
	}

}

$is_client  = $this->is_client($user_id);

if($is_client){
	
	$provider_legend_col = __('Staff', 'bookingup');
	
}else{
	
	$provider_legend_col = __('Client', 'bookingup');

}



?>
<div class="bup-user-dahsboard-cont">


	<div class="bup-top-header">   
    
    	<?php echo $bupcomplement->profile->get_user_avatar_top($user_id);?>   
        
        
        <div class="bup-top-options"> 
             <ul>            
             
                 <li><?php echo $bupcomplement->profile->get_user_backend_menu_new('home', __('Main','bookingup'),'fa-home');?></li>
                 <?php if(!$this->is_client($user_id)){?>
                 
                 	<li><?php echo $bupcomplement->profile->get_user_backend_menu_new('profile', __('My Profile','bookingup') ,'fa-user');?></li>   
                 <?php }?>
                               
                 <li><?php echo $bupcomplement->profile->get_user_backend_menu_new('displayall', __('My Appointments','bookingup') ,'fa-calendar');?></li>
                  <li><?php echo $bupcomplement->profile->get_user_backend_menu_new('account',  __('My Account','bookingup'),'fa-address-card-o');?></li>
                  
                  <?php if(!$this->is_client($user_id)){?>
                  <li><?php echo $bupcomplement->profile->get_user_backend_menu_new('settings', __('Settings','bookingup') ,'fa-wrench');?></li>
                  <?php }?>
                  <li><?php echo $bupcomplement->profile->get_user_backend_menu_new('logout', __('Logout','bookingup'),'fa-sign-out');?></li>
            
             </ul>
         
         </div> 
             
    </div>
    
    
    <div class="bup-centered-cont">
    
    
    <?php if($module=='' || $module=='home'){?>
    
    
    
           <div class="bup-appointments-planning">
            <ul>
                        <li class="today"><h3><?php _e('Today','bookingup')?></h3><p class="today"><?php echo $today ?></p></li>
                        <li class="tomorrow"><h3><?php _e('Tomorrow','bookingup')?></h3><p class="tomorrow"><?php echo $tomorrow ?></p></li>
                        <li class="week"><h3><?php _e('This Week','bookingup')?></h3><p class="week"><?php echo $week ?></p></li>
                
            </ul>
            
             
        
        </div>
    
    
    
    
    
    
          <h2><?php _e('Pending Approval','bookingup')?> <span class="bup-widget-backend-colspan"><a href="#" title="Close" class="bup-widget-backend-colapsable" widget-id="1"><i class="fa fa-sort-desc" id="bup-close-open-icon-1"></i></a></span></h2>
    	  <div class="bup-main-app-list" id="bup-backend-landing-1">
        
         <?php
			
			
				
				if (!empty($appointments)){
					
					//client staff legend
				
				
				?>
       
           <table width="100%" class="">
            <thead>
                <tr>
                    <th width="3%" class="bp_table_row_hide" id="bp_table_row_id"><?php _e('#', 'bookingup'); ?></th>
                    <th width="10%"><?php _e('Date', 'bookingup'); ?></th>
                     
                     <?php if(isset($bup_filter) && isset($bupultimate)){?>
                     
                      <th width="12%"><?php _e('Location', 'bookingup'); ?></th>
                     
                     <?php	} ?>
                    
                    <th width="16%"><?php echo $provider_legend_col; ?></th>
                   
                   
                     <th width="22%"><?php _e('Service', 'bookingup'); ?></th>
                    <th width="20%"><?php _e('At', 'bookingup'); ?></th>
                    
                     
                     <th width="10%"><?php _e('Status', 'bookingup'); ?></th>
                    <th width="7%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			$filter_name= '';
			$phone= '';
			foreach($appointments as $appointment) {
				
				
				$date_from=  date("Y-m-d", strtotime($appointment->booking_time_from));
				$booking_time = date($time_format, strtotime($appointment->booking_time_from ))	.' - '.date($time_format, strtotime($appointment->booking_time_to ));
				 
				
				$client_id = $appointment->booking_user_id;				
				
				
				
				if($is_client){
					
					$client = get_user_by( 'id', $appointment->booking_staff_id );					
				
				}else{ //staff member
					
					$client = get_user_by( 'id', $client_id );					
				}
				
				if(isset($appointment->filter_name)){$filter_name=$appointment->filter_name;};
				
				//get phone			
				$phone = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'telephone');
				
				$comments = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'special_notes');
				
				
					
			?>
              

                <tr>
                    <td class="bp_table_row_hide"><?php echo $appointment->booking_id; ?></td>
                     <td><?php echo  date($date_format, strtotime($date_from)); ?>      </td> 
                     
                      <?php if(isset($bup_filter) && isset($bupultimate)){?>
                      
                      <td><?php echo $filter_name; ?> </td>
                       <?php	} ?>
                      
                    <td><?php echo $client->display_name; ?></td>
                   
                    <td><?php echo $appointment->service_title; ?> </td>
                    <td><?php echo  $booking_time; ?></td>                  
                     
                      <td><?php echo $bookingultrapro->appointment->get_status_legend($appointment->booking_status); ?></td>
                   <td> <a href="?module=see&id=<?php echo $appointment->booking_id?>" class="bup-appointment-edit-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Edit','bookingup'); ?>"><i class="fa fa-edit"></i></a>
                   
                   <?php if(!$is_client){?>
                   &nbsp;<a href="#" class="bup-appointment-delete-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Delete','bookingup'); ?>"><i class="fa fa-trash-o"></i></a>
                  
                   <?php }?>
                  
                   
                   </td>
                </tr>
                
                
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no pending approval appointments yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
               
          </div>
          
          
           <h2><?php _e('Today Approved Appointments','bookingup')?>  <span class="bup-widget-backend-colspan"><a href="#" title="<?php _e('Close','bookingup')?>" class="bup-widget-backend-colapsable" widget-id="2"><i class="fa fa-sort-desc" id="bup-close-open-icon-2"></i></a></span></h2>
    	  <div class="bup-main-app-list" id="bup-backend-landing-2">
          
          
               <?php
			
			
				
				if (!empty($appointments_today)){
				
				
				?>
       
           <table width="100%" class="">
            <thead>
                <tr>
                    <th width="3%" class="bp_table_row_hide"><?php _e('#', 'bookingup'); ?></th>
                    <th width="10%"><?php _e('Date', 'bookingup'); ?></th>
                     
                     <?php if(isset($bup_filter) && isset($bupultimate)){?>
                     
                      <th width="12%"><?php _e('Location', 'bookingup'); ?></th>
                     
                     <?php	} ?>
                    
                    <th width="16%"><?php echo $provider_legend_col; ?></th>
                   
                   
                     <th width="22%"><?php _e('Service', 'bookingup'); ?></th>
                    <th width="20%"><?php _e('At', 'bookingup'); ?></th>
                    
                     
                     <th width="10%"><?php _e('Status', 'bookingup'); ?></th>
                    <th width="7%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			$filter_name= '';
			$phone= '';
			foreach($appointments_today as $appointment) {
				
				
				$date_from=  date("Y-m-d", strtotime($appointment->booking_time_from));
				$booking_time = date($time_format, strtotime($appointment->booking_time_from ))	.' - '.date($time_format, strtotime($appointment->booking_time_to ));
				 
				
				$client_id = $appointment->booking_user_id;				
				//$client = get_user_by( 'id', $client_id );
				
				
				if($is_client){
					
					$client = get_user_by( 'id', $appointment->booking_staff_id );					
				
				}else{ //staff member
					
					$client = get_user_by( 'id', $client_id );					
				}
				
				if(isset($appointment->filter_name)){$filter_name=$appointment->filter_name;};
				
				//get phone
			
				$phone = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'telephone');
				
				$comments = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'special_notes');
				
				
					
			?>
              

                <tr>
                    <td class="bp_table_row_hide"><?php echo $appointment->booking_id; ?></td>
                     <td><?php echo  date($date_format, strtotime($date_from)); ?>      </td> 
                     
                      <?php if(isset($bup_filter) && isset($bupultimate)){?>
                      
                      <td><?php echo $filter_name; ?> </td>
                       <?php	} ?>
                      
                    <td><?php echo $client->display_name; ?></td>
                   
                    <td><?php echo $appointment->service_title; ?> </td>
                    <td><?php echo  $booking_time; ?></td>                  
                     
                      <td><?php echo $bookingultrapro->appointment->get_status_legend($appointment->booking_status); ?></td>
                   <td> <a href="?module=see&id=<?php echo $appointment->booking_id?>" class="bup-appointment-edit-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Edit','bookingup'); ?>"><i class="fa fa-edit"></i></a>
                   
                    <?php if(!$is_client){?>
                   &nbsp;<a href="#" class="bup-appointment-delete-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Delete','bookingup'); ?>"><i class="fa fa-trash-o"></i></a>
                   
                     <?php	} ?>
                   
                   
                   </td>
                </tr>
                
                
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no approved appointments yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
          </div>
          
          <h2><?php _e('This Week Approved Appointments','bookingup')?>   <span class="bup-widget-backend-colspan"><a href="#" title="<?php _e('Close','bookingup')?>" class="bup-widget-backend-colapsable" widget-id="3"><i class="fa fa-sort-desc" id="bup-close-open-icon-3"></i></a></span></h2>
    	  <div class="bup-main-app-list" id="bup-backend-landing-3">
          
          
               <?php
			
			
				
				if (!empty($appointments_week)){
				
				
				?>
       
           <table width="100%" class="">
            <thead>
                <tr>
                    <th width="3%" class="bp_table_row_hide"><?php _e('#', 'bookingup'); ?></th>
                    <th width="10%"><?php _e('Date', 'bookingup'); ?></th>
                     
                     <?php if(isset($bup_filter) && isset($bupultimate)){?>
                     
                      <th width="12%"><?php _e('Location', 'bookingup'); ?></th>
                     
                     <?php	} ?>
                    
                    <th width="16%"><?php echo $provider_legend_col; ?></th>
                   
                   
                     <th width="22%"><?php _e('Service', 'bookingup'); ?></th>
                    <th width="20%"><?php _e('At', 'bookingup'); ?></th>
                    
                     
                     <th width="10%"><?php _e('Status', 'bookingup'); ?></th>
                    <th width="7%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			$filter_name= '';
			$phone= '';
			foreach($appointments_week as $appointment) {
				
				
				$date_from=  date("Y-m-d", strtotime($appointment->booking_time_from));
				$booking_time = date($time_format, strtotime($appointment->booking_time_from ))	.' - '.date($time_format, strtotime($appointment->booking_time_to ));
				 
				
				$client_id = $appointment->booking_user_id;				
				//$client = get_user_by( 'id', $client_id );
				
				if($is_client){
					
					$client = get_user_by( 'id', $appointment->booking_staff_id );					
				
				}else{ //staff member
					
					$client = get_user_by( 'id', $client_id );					
				}
				
				if(isset($appointment->filter_name)){$filter_name=$appointment->filter_name;};
				
				//get phone
			
				$phone = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'telephone');
				
				$comments = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'special_notes');
				
				
					
			?>
              

                <tr>
                    <td class="bp_table_row_hide"><?php echo $appointment->booking_id; ?></td>
                     <td><?php echo  date($date_format, strtotime($date_from)); ?>      </td> 
                     
                      <?php if(isset($bup_filter) && isset($bupultimate)){?>
                      
                      <td><?php echo $filter_name; ?> </td>
                       <?php	} ?>
                      
                    <td><?php echo $client->display_name; ?></td>
                   
                    <td><?php echo $appointment->service_title; ?> </td>
                    <td><?php echo  $booking_time; ?></td>                  
                     
                      <td><?php echo $bookingultrapro->appointment->get_status_legend($appointment->booking_status); ?></td>
                   <td> <a href="?module=see&id=<?php echo $appointment->booking_id?>" class="bup-appointment-edit-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Edit','bookingup'); ?>"><i class="fa fa-edit"></i></a>
                   
                    <?php if(!$is_client){?>
                   &nbsp;<a href="#" class="bup-appointment-delete-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Delete','bookingup'); ?>"><i class="fa fa-trash-o"></i></a>
                   <?php	} ?>
                   
                   </td>
                </tr>
                
                
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no approved appointments yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
          </div>
          
          
       <?php }elseif($module=='see'){
		   
		   $appointment_id = $_GET['id'];
		   ?>
       
       
          <h2><?php _e('Appointment Details','bookingup')?> </h2>
      
           <div class="bup-common-cont"> 
           
           
                <?php  $bupcomplement->profile->edit_appointment ($appointment_id, $user_id);?>
           
            </div>
            
           
          
          
     <?php }elseif($module=='upload_avatar'){?>
     
     
     
     
      <?php if($user_id==''){?>	
             
             
                 <div class="bup-staff-left " id="bup-staff-list">           	
            	 </div>
                 
                 <div class="bup-staff-right " id="bup-staff-details">
                 </div>
            
            <?php }else{ //upload avatar?>
            
           <?php  
		   
		   $crop_image = $_POST['crop_image'];
		   if( $crop_image=='crop_image') //displays image cropper
			{
			
			 $image_to_crop = $_POST['image_to_crop'];
			 
			
			 ?>
             
             <div class="bup-staff-right-avatar " >
           		  <div class="pr_tipb_be">
                              
                            <?php echo $bupcomplement->profile->display_avatar_image_to_crop($image_to_crop, $user_id);?>                          
                              
                   </div>
                   
             </div>
            
           
		    <?php }else{  
			
			$user = get_user_by( 'id', $user_id );
			?> 
            
            <div class="bup-staff-right-avatar " >
            
           
                   <div class="bup-avatar-drag-drop-sector"  id="bup-drag-avatar-section">
                   
                   <h3> <?php echo $user->display_name?><?php _e("'s Picture",'bookingup')?></h3>
                        
                             <?php echo $bookingultrapro->userpanel->get_user_pic( $user_id, 80, 'avatar', 'rounded', 'dynamic')?>

                                                    
                             <div class="uu-upload-avatar-sect">
                              
                                     <?php echo $bupcomplement->profile->avatar_uploader($user_id)?>  
                              
                             </div>
                             
                        </div>  
                    
             </div>
             
             
              <?php }  ?>
            
             <?php }?>
             
       <?php }elseif($module=='settings'){?>
       
       
        <h2><?php _e('Settings','bookingup')?> </h2>
      
       <div class="bup-common-cont"> 
       
       
       			<?php echo $bupcomplement->profile->bup_get_staff_details($user_id)?>                     
                                           
                     
                                                                 
        </div>
                     
                     
          
          
     <?php }elseif($module=='account'){?>
     
      <h2> <i class="fa fa-google"></i> <?php  _e('Google Calendar','bookingup');?>  </h2>  
       
         <div class="bup-common-cont">   
         
         <?php 
		 
			 if(isset($bupcomplement->googlecalendar))
			{
				
				echo $bupcomplement->googlecalendar->get_user_auth_status_staff($user_id);			
				
			
			}
		 ?> 
         
         </div>
         
       <h2><i class="fa fa-id-card-o"></i> <?php _e('Personal Details','bookingup')?> </h2>
       
       <?php
       
	   $user_description = get_user_meta( $user_id, 'description', true ); 
	   
	   ?>
       
       <div class="bup-common-cont"> 
       
       <p><?php  _e('Your Display Name','bookingup');?></p>
       <p><input type="text" name="bup_display_name" id="bup_display_name" value="<?php echo $current_user->display_name?>" /></p>
       
        <p><?php  _e('Your Address','bookingup');?></p>
       <p><input type="text" name="bup_address" id="bup_address" value="<?php echo get_user_meta( $user_id, 'address', true );?>" /></p>
       
        <p><?php  _e('Your City','bookingup');?></p>
       <p><input type="text" name="bup_city" id="bup_city" value="<?php echo get_user_meta( $user_id, 'city', true )?>" /></p>
       
        <p><?php  _e('Your Country','bookingup');?></p>
       <p><input type="text" name="bup_country" id="bup_country" value="<?php echo get_user_meta( $user_id, 'country', true );?>" /></p>
       
       <p><?php  _e('Summary','bookingup');?></p>
       <p><input type="text" name="bup_summary" id="bup_summary" value="<?php echo get_user_meta( $user_id, 'bup_summary', true );?>" /></p>
       
       <p><?php  _e('Description','bookingup');?></p>
       <p>
       <?php  echo $this->get_me_wphtml_editor('bup_description', get_user_meta( $user_id, 'bup_description', true ));?>
       </p>
       
       <p>
                                                  
                         <button name="bup-backenedb-update-personaldata" id="bup-backenedb-update-personaldata" class="bup-button-submit-changes"><?php  _e('UPDATE INFORMATION','bookingup');?>	</button>
                         
                         </p>
                         
                         <p id="bup-p-update-profile-msg"></p>
       
       </div> 
     
      <h2><i class="fa fa-lock"></i> <?php _e('Update your Password','bookingup')?> </h2>
      
       <div class="bup-common-cont">                      
                                           
                     
                       <form method="post" name="bup-close-account" >
                       <p><?php  _e('Type your New Password','bookingup');?></p>
                 			 <p><input type="password" name="p1" id="p1" /></p>
                            
                             <p><?php  _e('Re-type your New Password','bookingup');?></p>
                 			 <p><input type="password"  name="p2" id="p2" /></p>
                            
                         <p>
                                                  
                         <button name="bup-backenedb-eset-password" id="bup-backenedb-eset-password" class="bup-button-submit-changes"><?php  _e('RESET PASSWORD','bookingup');?>	</button>
                         
                         </p>
                         
                         <p id="bup-p-reset-msg"></p>
               		  </form> 
                                           
                     </div>
                     
                     
           <h2> <i class="fa fa-envelope-o"></i> <?php  _e('Update Your Email','bookingup');?>  </h2> 
           
                   <div class="bup-common-cont">                                           
                     
                       <form method="post" name="bup-change-email" >
                       <p><?php  _e('Type your New Email','bookingup');?></p>
                 			 <p><input type="text" name="bup_email" id="bup_email" value="<?php echo $user_email?>" /></p>
                                                        
                         <p>
                                                  
                         <button name="bup-backenedb-update-email" id="bup-backenedb-update-email" class="bup-button-submit-changes"><?php  _e('CHANGE EMAIL','bookingup');?>	</button>
                         
                         </p>                         
                         <p id="bup-p-changeemail-msg"></p>
               		  </form>
                      
                      </div>
          
    <?php }elseif($module=='displayall'){
		
		
		
		$howmany = "";
		$year = "";
		$month = "";
		$day = "";
		$special_filter = "";
		$bup_staff_calendar = "";
		
		$bp_status ="";
		
		if(isset($_GET["howmany"]))
		{
			$howmany = $_GET["howmany"];		
		}
		
		if(isset($_GET["bp_month"]))
		{
			$month = $_GET["bp_month"];		
		}
		
		if(isset($_GET["bp_day"]))
		{
			$day = $_GET["bp_day"];		
		}
		
		if(isset($_GET["bp_year"]))
		{
			$year = $_GET["bp_year"];		
		}
		
		if(isset($_GET["bp_status"]))
		{
			$bp_status = $_GET["bp_status"];		
		}
		
		if(isset($_GET["special_filter"]))
		{
			$special_filter = $_GET["special_filter"];		
		}
		

		
		$appointments_all = $bupcomplement->profile->get_all_filtered($user_id);

		?>
    
    	 <h2><?php _e('All My Appointments','bookingup')?> </h2>
         
         
         <div class="bup-appointments-module-filters">
         
          <form action="" method="get">
         <input type="hidden" name="module" value="displayall" />
          
         
              <select name="bp_month" id="bp_month">
               <option value="" selected="selected"><?php _e('All Months','bookingup'); ?></option>
               <?php
			  
			  $i = 1;
              
			  while($i <=12){
			  ?>
               <option value="<?php echo $i?>"  <?php if($i==$month) echo 'selected="selected"';?>><?php echo $i?></option>
               <?php 
			    $i++;
			   }?>
             </select>
             
             <select name="bp_day" id="bp_day">
               <option value="" selected="selected"><?php _e('All Days','bookingup'); ?></option>
               <?php
			  
			  $i = 1;
              
			  while($i <=31){
			  ?>
               <option value="<?php echo $i?>"  <?php if($i==$day) echo 'selected="selected"';?>><?php echo $i?></option>
               <?php 
			    $i++;
			   }?>
             </select>
             
             <select name="bp_year" id="bp_year">
               <option value="" selected="selected"><?php _e('All Years','bookingup'); ?></option>
               <?php
			  
			  $i = 2014;
              
			  while($i <=2020){
			  ?>
               <option value="<?php echo $i?>" <?php if($i==$year) echo 'selected="selected"';?> ><?php echo $i?></option>
               <?php 
			    $i++;
			   }?>
             </select>
                
                        <?php if(isset($bupcomplement) && isset($bupultimate) && !$is_client){?>
            <select name="special_filter" id="special_filter">
               <option value="" selected="selected"><?php _e('All Locations','bookingup'); ?></option>
               <?php
			  
			  $filters = $bupcomplement->profile->get_all_filters_by_staff($user_id);
              
			 foreach ( $filters as $filter )
				{
			  ?>
               <option value="<?php echo $filter->filter_id?>" <?php if($special_filter==$filter->filter_id) echo 'selected="selected"';?> ><?php echo $filter->filter_name?></option>
               <?php 
			    $i++;
			   }?>
             </select>
             
            <?php  }?>  
            
            <select name="bp_status" id="bp_status">
               <option value="" <?php if($bp_status =="" ) echo 'selected="selected"';?>><?php _e('All Status','bookingup'); ?></option>
                <option value="0" <?php if("0"==$bp_status ) echo 'selected="selected"';?>> <?php _e('Pending','bookingup'); ?></option>
                 <option value="1" <?php if(1==$bp_status ) echo 'selected="selected"';?>><?php _e('Approved','bookingup'); ?></option>
                  <option value="2" <?php if(2==$bp_status ) echo 'selected="selected"';?>> <?php _e('Cancelled','bookingup'); ?></option>
                  
                   <option value="3" <?php if(3==$bp_status ) echo 'selected="selected"';?>> <?php _e('No-Show','bookingup'); ?></option>
                   
               
          </select>      
                                             
            <select name="howmany" id="howmany">
               <option value="20" <?php if(20==$howmany ||$howmany =="" ) echo 'selected="selected"';?>>20 <?php _e('Per Page','bookingup'); ?></option>
                <option value="40" <?php if(40==$howmany ) echo 'selected="selected"';?>>40 <?php _e('Per Page','bookingup'); ?></option>
                 <option value="50" <?php if(50==$howmany ) echo 'selected="selected"';?>>50 <?php _e('Per Page','bookingup'); ?></option>
                  <option value="80" <?php if(80==$howmany ) echo 'selected="selected"';?>>80 <?php _e('Per Page','bookingup'); ?></option>
                   <option value="100" <?php if(100==$howmany ) echo 'selected="selected"';?>>100 <?php _e('Per Page','bookingup'); ?></option>
               
          </select>
          
                       <button name="bup-btn-calendar-filter-appo" id="bup-btn-calendar-filter-appo" class="bup-button-submit-changes"><?php _e('Filter','bookingup')?>	</button>
                </div>  
                
                
            
        
        
         </form>
         
                 
         
         </div>
    	  <div class="bup-main-app-list">
          
          
          
                     <?php
			
			
				
				if (!empty($appointments_all)){
				
				
				?>
       
           <table width="100%" class="">
            <thead>
                <tr>
                    <th width="4%"><?php _e('#', 'bookingup'); ?></th>
                    <th width="4%">&nbsp;</th>
                    
                     <th width="13%"><?php _e('Date', 'bookingup'); ?></th>
                     
                     <?php if(isset($bup_filter) && isset($bupultimate)){?>
                     
                      <th width="11%"><?php _e('Location', 'bookingup'); ?></th>
                     
                     <?php	} ?>
                    
                    <th width="23%"><?php echo $provider_legend_col; ?></th>
                                     
                     <th width="18%"><?php _e('Service', 'bookingup'); ?></th>
                    <th width="16%"><?php _e('At', 'bookingup'); ?></th>                    
                     
                     <th width="9%"><?php _e('Status', 'bookingup'); ?></th>
                    <th width="9%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			$filter_name= '';
			$phone= '';
			foreach($appointments_all as $appointment) {
				
				
				$date_from=  date("Y-m-d", strtotime($appointment->booking_time_from));
				$booking_time = date($time_format, strtotime($appointment->booking_time_from ))	.' - '.date($time_format, strtotime($appointment->booking_time_to ));
				 
				$staff = $bookingultrapro->userpanel->get_staff_member($appointment->booking_staff_id);
				
				$client_id = $appointment->booking_user_id;				
				//$client = get_user_by( 'id', $client_id );
				
				if($is_client){
					
					$client = get_user_by( 'id', $appointment->booking_staff_id );					
				
				}else{ //staff member
					
					$client = get_user_by( 'id', $client_id );					
				}
				
				
				if(isset($appointment->filter_name)){$filter_name=$appointment->filter_name;};
				
				//get phone
			
				$phone = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'telephone');
				
				$comments = $bookingultrapro->appointment->get_booking_meta($appointment->booking_id, 'special_notes');
				
				
					
			?>
              

                <tr>
                    <td><?php echo $appointment->booking_id; ?></td>
                     <td>  <?php if($comments!=''){?><a href="#" class="bup-appointment-edit-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('See Details','bookingup'); ?>"><i class="fa fa-envelope-o"></i></a> <?php }?></td>
                   
                     <td><?php echo  date($date_format, strtotime($date_from)); ?>      </td> 
                     
                      <?php if(isset($bup_filter) && isset($bupultimate)){?>
                      
                      <td><?php echo $filter_name; ?> </td>
                       <?php	} ?>
                      
                    <td><?php echo $client->display_name; ?> <?php if(!$is_client){?>(<?php echo $client->user_email; ?>)<?php } ?></td>
                                   
                    <td><?php echo $appointment->service_title; ?> </td>
                    <td><?php echo  $booking_time; ?></td>                  
                     
                      <td><?php echo $bookingultrapro->appointment->get_status_legend($appointment->booking_status); ?></td>
                   <td> <a href="?module=see&id=<?php echo $appointment->booking_id?>" class="bup-appointment-edit-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Edit','bookingup'); ?>"><i class="fa fa-edit"></i></a>
                  
                   <?php if(!$is_client){?>
                   &nbsp;<a href="#" class="bup-appointment-delete-module" appointment-id="<?php echo $appointment->booking_id?>" title="<?php _e('Delete','bookingup'); ?>"><i class="fa fa-trash-o"></i></a>
                   <?php	} ?>
                   
                   </td>
                </tr>
                
                
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no appointments yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
          </div>
    
    
    
    
    <?php }?>
    
    </div>
   
   


</div>

 <div id="bup-spinner" class="bup-spinner" style="display:none">
            <span> <img src="<?php echo bookingup_comp_url?>templates/images/loaderB16.gif" width="16" height="16" /></span>&nbsp; <?php echo _e('Please wait ...','bookingup')?>
	</div>
    
     <div id="bup-appointment-change-status" title="<?php _e('Appointment Status','bookingup')?>"></div>
     <div id="bup-new-payment-cont" title="<?php _e('Add Payment','bookingup')?>"></div>
     <div id="bup-new-note-cont" title="<?php _e('Add Note','bookingup')?>"></div>
    
