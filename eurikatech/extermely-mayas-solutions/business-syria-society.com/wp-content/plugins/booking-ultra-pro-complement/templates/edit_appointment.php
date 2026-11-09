<?php
global $bookingultrapro, $bupcomplement;

//get appointment			
$appointment = $bookingultrapro->appointment->get_one($appointment_id);
$staff_id = $appointment->booking_staff_id;	
$client_id = $appointment->booking_user_id;	
$service_id = $appointment->booking_service_id;
$booking_time_from = $appointment->booking_time_from;

$client = $bookingultrapro->userpanel->get_one($client_id);

$currency = $bookingultrapro->get_option('currency_symbol');		
$time_format = $bookingultrapro->service->get_time_format();		
$booking_time = date($time_format, strtotime($booking_time_from ))	;		
$booking_day = date('D, j F, Y', strtotime($booking_time_from));

$current_user = $bookingultrapro->userpanel->get_user_info();

$current_user_id = $current_user->ID;
$is_client  = $this->is_client($current_user_id);

//echo "current user id : ".$current_user_id;

?>



<div class="bup-adm-new-appointment bup-adm-schedule-info-bar">

	 <strong><?php _e('Created on : ','bookingup')?></strong> <?php echo date('m/d/Y', strtotime($appointment->booking_date));?> | <strong><?php _e('Appointment Date: ','bookingup');?></strong> <?php echo $booking_day;?> <?php _e('at ','bookingup');?> <?php echo $booking_time;?> | <strong><?php _e('Client: ','bookingup');?></strong>	<?php echo $client->ID;?>, <?php echo $client->display_name;?> (<?php echo $client->user_email;?>)	           
             
</div>

<?php if(!$is_client){?>
<div class="bup-adm-new-appointment">	

    <div class="bup-adm-frm-blocks" >               
                   
        <div class="field-header"><?php _e('Select Service','bookingup')?></div>                   
        <?php echo $this->get_categories_drop_down_staff($service_id);?>                            
               
   </div>
   
    <div class="bup-adm-frm-blocks" >
            
        <div class="field-header"><?php _e('On or After','bookingup')?> </div> 
        <input type="text" class="bupro-datepicker" id="bup-start-date" value="<?php echo date($bookingultrapro->get_date_picker_date(), strtotime($appointment->booking_time_from))?>" />         
           
    </div>
</div>
<?php }?>


<div class="bup-adm-bar-opt-edit">

<?php $app_status = $bookingultrapro->appointment->get_status_legend($appointment->booking_status);?>


<?php if(!$is_client){?>

    <p><strong><?php _e('Status','bookingup')?></strong>: <span id="bup-app-status"> <?php echo $app_status?> </span> 
    
    <span> <a href="#" id="bup-adm-update-appoint-status-btn" appointment-id="<?php echo $appointment_id?>" title="<?php _e('Change Status','bookingup')?>"><i class="fa fa-refresh"></i></a></span> 
    
     <p>
 
 <?php }else{?>
 
 <p><strong><?php _e('Status','bookingup')?></strong>: <span id="bup-app-status"> <?php echo $app_status?> </span>     
 
     <?php if($appointment->booking_status == '0' || $appointment->booking_status == '1'){?>
    
    <span style="float:right" id="bp-status-staff-change"> <a href="#" id="bup-adm-update-appoint-status-btn-staff" appointment-id="<?php echo $appointment_id?>" appointment-status="2" title="<?php _e('Cancel Appointment','bookingup')?>" class="bup-adm-change-appoint-status-opt-staff"><i class="fa fa-remove"></i> <?php _e('Cancel Appointment','bookingup')?></a></span>
    
    <?php }?>
      
     <p>
 
 
  <?php }?>

</div>


<?php if(!$is_client){?>


    <div class="bup-adm-check-av-button"  > 
             
          <input type="checkbox" id="bup_re_schedule" name="bup_re_schedule" value="1"> <?php _e('Reschedule Appointment','bookingup')?>
             
    </div>
    
     <div class="bup-adm-check-av-button"  id="bup-availability-box-btn" style="display:none"> 
             
           <button id="bup-adm-check-avail-btn-edit" class="bup-button-submit"><?php _e('Check Availability','bookingup')?></button>
             
    </div> 

<?php }?>

<div class="bup-adm-new-appointment" id="bup-availability-box" style="display:none">
<input type="hidden" id="bup_time_slot" value="">
<input type="hidden" id="bup_booking_date" value="">
<input type="hidden" id="bup_client_id" value="">
<input type="hidden" id="bup_service_staff" value="">
<input type="hidden" id="bup_custom_form" value="">
<input type="hidden" id="bup_appointment_id" value="<?php echo $appointment_id;?>">

<h3><?php _e('Availability','bookingup')?> </h3>
    
    <div class="bup-adm-availa-box" id="bup-steps-cont-res-edit" >  
    
    <p> <?php _e('Please click on the Check Availability to display the available time slots.','bookingup')?> </p>      
               
    </div> 
    
     <div class="bup-adm-check-av-button-d"  > 
         
      <input type="checkbox" id="bup_notify_client_reschedule" name="bup_notify_client_reschedule" value="1" checked="checked"> <?php _e('Send Notification To Client','bookingup')?>
         
</div>
    
    <div class="bup-adm-check-av-button-d"  id="bup-availability-box-btn"> 
         
       <button id="bup-adm-confirm-reschedule-btn" class="bup-button-submit-changes"><?php _e('Confirm Reschedule ','bookingup')?></button>
         
</div> 
    
    


</div>

<div class="bup-adm-new-appointment">

	<div class="bup-adm-extrainfo-box" id="bup-additioninfo-cont-res" > 
    
     <form action=""  id="bup-appo-info-form" name="bup-appo-info-form" >        
                
               <?php echo $bookingultrapro->appointment->get_appointment_edition_form_fields($appointment_id);?>
       </form>        
    </div>
    
    <div class="bup-adm-check-av-button"  id="bup-addpayment-box-btn" > 
    
    <?php $allow_client_to_update = $bookingultrapro->get_option('allow_client_to_update_info'); ?>
         
         <?php if($allow_client_to_update=='1' || $allow_client_to_update ==''){?>
       	<span id="bup-update-info-msg"></span><button id="bup-adm-update-info" class="bup-button-submit-changes"><?php _e('Update Info','bookingup')?></button>
        
        <?php }else{?>
        
        <p class="bup-backend-info-tool" ><i class="fa fa-info-circle"></i><strong>&nbsp;<?php echo $bookingultrapro->get_option('allow_client_message_to_update');?></strong></p>
        
        <?php }?>
         
	</div>
</div>

<?php if(isset($bupcomplement)){
	
	if($is_client){
		
		$payment_button =  false;
	}else{
		
		$payment_button =  true;
		
	}
	
	echo $bupcomplement->payment->get_payments_module_by_staff($payment_button);
	echo $bupcomplement->note->get_admin_module();
	?>
    
    
    <script type="text/javascript">	
	
		bup_load_appointment_payments(<?php echo $appointment_id?>);
		bup_load_appointment_notes(<?php echo $appointment_id?>);					
	
                    
    </script>
    
    


<?php }?> 



 <div class="bup-adm-check-av-button"  > 
         
  
         
</div>