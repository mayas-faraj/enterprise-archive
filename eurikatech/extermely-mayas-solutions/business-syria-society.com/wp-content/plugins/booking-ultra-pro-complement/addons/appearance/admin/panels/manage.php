<?php
global $bup_appearance, $bookingultrapro, $bupultimate;
$templates = $bup_appearance->get_all();

$template_id = $_GET["template"];

?>

<?php if(!isset($_GET['template'])){?>
<div class="bup-ultra-sect ">
        
      
<form action="" method="post" id="bup-userslist">
          <input type="hidden" name="add-template" value="add-template" />
        
        <div class="bup-ultra-success bup-notification"><?php _e('Success ','bookingup'); ?></div>
        
         <p><?php _e('This module gives you the capability to create new templates for your booking forms.','bookingup'); ?></p>
         
        
    <h3><?php _e('Create New Template ','bookingup'); ?></h3>
    
   
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td width="15%"><?php _e('Name: ','bookingup'); ?></td>
             <td width="85%"><input type="text" id="template_name"  name="template_name"  /></td>
           </tr>
           
                   
          
          </table>
          
           <p>
           <input name="submit" type="submit"  class="button-primary" value="<?php _e('Confirm','bookingup'); ?>"/>
          
    </p>
          
   
        </form>
        
                 <?php
			
			
				
				if (!empty($templates)){
				
				
				?>
       
           <table width="100%" class="wp-list-table widefat fixed posts table-generic">
            <thead>
                <tr>
                    <th width="12%" style="color:# 333"><?php _e('ID', 'bookingup'); ?></th>
                    <th width="10%"></th>
                    <th width="21%"><?php _e('Name', 'bookingup'); ?></th>  
                    <th width="21%"><?php _e('Shortcode', 'bookingup'); ?></th>                 
                    
                    <th width="20%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			
				foreach ( $templates as $template )
				{
					
			?>
              

                <tr  id="uu-edit-form-row-<?php echo $template->template_id; ?>">
                    <td><?php echo $template->template_id; ?></td>
                    <td  id="uu-edit-form-row-name-<?php echo $template->template_id; ?>"><div class="service-color-blet" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template->template_id);?>;"></div></td>
                    <td  id="uu-edit-form-row-name-<?php echo $template->template_id; ?>"><?php echo $template->template_name; ?></td>
                    
                    <td  id="uu-edit-form-row-shortcode-<?php echo $template->template_id; ?>"><?php echo   $bup_appearance->get_copy_paste_shortocde($template->template_id);?></td>
                    
                                      <td> <a href="#" class="bup-template-del"  id="" data-form="<?php echo $template->template_id; ?>" title='<?php _e('Delete','bookingup'); ?>'><i class="fa bup-fa-cus fa-trash-o"></i>&nbsp;&nbsp;
                   </a>  <a href="#" class="bup-template-edit"  id="" data-form="<?php echo $template->template_id ?>" title='<?php _e('Edit','bookingup'); ?>'><i class="fa bup-fa-cus fa-edit"></i>
</a>  <a href="admin.php?page=bup-appearance&tab=manage&template=<?php echo $template->template_id ?>"   id="" data-form="<?php echo $template->template_id ?>" title='<?php _e('Edit','bookingup'); ?>'><i class="fa  bup-fa-cus fa-magic "></i>
</a> </td>
                </tr>
                
                
                <tr>
                
                 <td colspan="6" ><div id='uu-edit-form-box-<?php echo $template->template_id; ?>'></div> </td>
                
                </tr>
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no templates yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
           <script type="text/javascript">  
		
		      var custom__del_confirmation ="<?php _e('Are you totally sure that you want to delete this template?','bookingup'); ?>";
			  
			  
		
		 </script>
        
             

</div>

 <?php } else {
	 
	 $custom_bg = $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);
	  ?>
 
 <div class="bup-ultra-sect ">
        
      
               
        
 <h3><?php _e('Template ','bookingup'); ?></h3>
     <div class="bup-front-cont-custom-options">
      
      <input name="bup-bg-color" type="text" id="bup-bg-color" value="<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>" class="color-picker" data-default-color=""/>
      
      </div>
   
      <div class="bup-front-cont" style="margin:10px 0px 10px 0px">
      
       <div class="bup-adm-custom-div" id="">
       
       <?php 
	   $hide_staff= $bookingultrapro->get_template_label("hide_staff",$template_id);
	   $hide_service= $bookingultrapro->get_template_label("hide_service",$template_id);
	   $show_location= $bookingultrapro->get_template_label("show_location",$template_id);
	   $show_cart= $bookingultrapro->get_template_label("show_cart",$template_id);	
		
		
		?> 
        
        
        <input class="bup-show-cart-checked" value="1" name="bup-show-cart"  id="bup-show-cart" type="checkbox" <?php if( $show_cart==1) echo 'checked="checked"';?>><label for="bup-show-cart"><span></span><?php _e('Activate Shopping Cart','bookingup'); ?></label> &nbsp;        
        
         <input class="bup-show-locations-checked" value="1" name="bup-show-location"  id="bup-show-location" type="checkbox" <?php if( $show_location==1) echo 'checked="checked"';?>><label for="bup-show-location"><span></span><?php _e('Show Locations','bookingup'); ?></label> &nbsp;
        
         <input class="bup-hide-service-checked" value="1" name="bup-hide-service"  id="bup-hide-service" type="checkbox" <?php if( $hide_service==1) echo 'checked="checked"';?>><label for="bup-hide-service"><span></span><?php _e('Hide Services','bookingup'); ?></label> &nbsp;
       
        <input class="bup-hide-staff-checked" value="1" name="bup-hide-staff"  id="bup-hide-staff" type="checkbox" <?php if( $hide_staff==1) echo 'checked="checked"';?>><label for="bup-hide-staff"><span></span><?php _e('Hide Staff','bookingup'); ?></label>
       
       </div>
      
      
        <div class="bup-adm-custom-div" id=""> 
        
        
               
        <?php if(isset($bupultimate)){?>
        <button id="bup-template-set-form-type" class="bup-button-submit-appearance"><span><i class="fa fa-bed"></i></span> <?php _e('Set Type ','bookingup'); ?></button>
        
         <?php } ?>
        
        <button id="bup-template-set-categories" class="bup-button-submit-appearance"><span><i class="fa fa-edit"></i></span> <?php _e('Set Categories ','bookingup'); ?></button>
                 
       	<button id="bup-template-set-alias" class="bup-button-submit-appearance"><span><i class="fa fa-user-secret "></i></span> <?php _e('Set Alias ','bookingup'); ?></button>
         
		</div>
      
     
      


  <div class="bup-filter-header" id="up-filter-header">
  
  
    <?php if($show_cart==1){?>
    
    
     <div class="bup-book-steps-cont" id="bup-book-steps-cont-cart">
    
    	
        <div class="bup-book-step1 bup-steps-cart">
        		
                <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-1" step-number="1" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">1</div>
                <div class="bup-cart-step-text-active bup-template-editable" data-key='step1_label' id='step1_label_ui'><span><?php echo $bookingultrapro->get_template_label("step1_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step2 bup-steps-cart">
        
        
            	<div class="bup-cart-step-line-inactive"></div>
        
        <div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-2" step-number="2" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">2</div>
                  <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step2_label' id='step2_label_ui'><span><?php echo $bookingultrapro->get_template_label("step2_label",$template_id);?></span></div>
        
        </div>
        
         <div class="bup-book-step33 bup-steps-cart">
        
        	    <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-33" step-number="33" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">3</div>
                  <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step3cart_label' id='step3cart_label_ui'><span><?php echo $bookingultrapro->get_template_label("step3cart_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step3 bup-steps-cart">
        
        	    <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-3" step-number="3" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">4</div>
                  <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step3_label' id='step3_label_ui'><span><?php echo $bookingultrapro->get_template_label("step3_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step4 bup-steps-cart">      
        		 <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-4" step-number="4" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">5</div>
                <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step4_label' id='step4_label_ui'><span><?php echo $bookingultrapro->get_template_label("step4_label",$template_id);?></span></div>
        
        </div>
        
       
    
       
    
    </div>
    
    
    
    
    <?php }else{?>
    
    <div class="bup-book-steps-cont" id="bup-book-steps-cont">
    
    	
        <div class="bup-book-step1 bup-steps">
        		
                <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-1" step-number="1" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">1</div>
                <div class="bup-cart-step-text-active bup-template-editable" data-key='step1_label' id='step1_label_ui'><span><?php echo $bookingultrapro->get_template_label("step1_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step2 bup-steps">
        
        
            	<div class="bup-cart-step-line-inactive"></div>
        
        <div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-2" step-number="2" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">2</div>
                  <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step2_label' id='step2_label_ui'><span><?php echo $bookingultrapro->get_template_label("step2_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step3 bup-steps">
        
        	    <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-3" step-number="3" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">3</div>
                  <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step3_label' id='step3_label_ui'><span><?php echo $bookingultrapro->get_template_label("step3_label",$template_id);?></span></div>
        
        </div>
        
        <div class="bup-book-step4 bup-steps">
        
        
        		 <div class="bup-cart-step-line-inactive"></div>
        
        		<div class="bup-cart-step-active bup-move-steps" id="bup-step-rounded-4" step-number="4" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>">4</div>
                <div class="bup-cart-step-text-inactive bup-template-editable" data-key='step4_label' id='step4_label_ui'><span><?php echo $bookingultrapro->get_template_label("step4_label",$template_id);?></span></div>
        
        </div>
    
       
    
    </div>
    
     <?php } //end if shopping cart?>
    
    
    	<div class="bup-book-info-cont" id="bup-book-info-cont-div">
        
        
           <div class="bup-book-info-text" >
           
          
           
           
           </div>
           
           <div class="bup-book-info-block1" id="bup-customizer-location-list" <?php if( $show_location !=1) echo 'style="display:none"';?>>
           
           
               <label class="bup-template-editable" data-key='select_location_label' id='select_location_label_ui'><span><?php echo $bookingultrapro->get_template_label("select_location_label",$template_id);?></span></label>
           
             <select name="bup-location" id="bup-location">
             <option value="" selected="selected"><?php _e('Select Location ','bookingup'); ?></option>
             <option value="" ><?php _e('Location 1 ','bookingup'); ?></option>
             <option value="" ><?php _e('Location 2 ','bookingup'); ?></option>
             <option value="" ><?php _e('Location 3 ','bookingup'); ?></option>
             <option value="" ><?php _e('Location 4 ','bookingup'); ?></option>
             </select>                    
           
           </div>
           
           <div class="bup-book-info-block1" id="bup-customizer-service-list" <?php if( $hide_service==1) echo 'style="display:none"';?>>
           
           
               <label class="bup-template-editable" data-key='select_service_label' id='select_service_label_ui'><span><?php echo $bookingultrapro->get_template_label("select_service_label",$template_id);?></span></label>
           
             <select name="bup-category" id="bup-category-d"><option value="" selected="selected"><?php echo $bookingultrapro->get_template_label("select_service_label_drop",$template_id);?></option><optgroup label="Facials"><option value="14">Essential Facial</option><option value="16">Signature Facial </option><option value="15">Spa Facial</option></optgroup><optgroup label="Hair"><option value="11">Blowouts</option><option value="10">Color &amp; Highlights</option><option value="9">Cuts</option><option value="12">Hair Extensions</option><option value="13">Men’s Blended Color</option></optgroup><optgroup label="Hair Design &amp; Style"><option value="29">Blow Dry</option></optgroup><optgroup label="Massage"><option value="21">Chair Massage</option><option value="17">Essential Massage</option><option value="19">Signature Massage</option><option value="20">Spa Massage</option></optgroup><optgroup label="Nails"><option value="22">Manicures</option><option value="25">Pedicures</option><option value="24">Signature Gel Manicure </option><option value="23">Spa Manicure</option></optgroup></select>
           
                     
           
           </div>
           
            <div class="bup-book-info-block1" >
            
             <label class="bup-template-editable" data-key='select_date_label' id='select_date_label_ui'><span><?php echo $bookingultrapro->get_template_label("select_date_label",$template_id);?></span></label>
              <input type="text" class="bupro-datepicker" id="bup-start-date"  value="<?php echo date( $bookingultrapro->get_date_picker_date(), current_time( 'timestamp', 0 ) )?>"/>       
              
                       
           </div>
           
           
            <div class="bup-book-info-block1" id="bup-staff-booking-list" <?php if( $hide_staff==1) echo 'style="display:none"';?> >
            
             <label class="bup-template-editable" data-key='select_provider_label' id='select_provider_label_ui'><span><?php echo $bookingultrapro->get_template_label("select_provider_label",$template_id);?></span> </label>
           
             <select name="bup-staff" id="bup-staff"><option value="" selected="selected">Any</option><option value="61">Jhon ($30.00)</option><option value="60">Julia ($30.00)</option><option value="27">Lorena Harris ($30.00)</option></select>          
           
           
            </div>    
        
        	
    
        </div>
        
        
        
         </div>
         
          <div class="bup-nav-search-options-bar" id="bup-steps-nav-buttons" > 
         
         	<button id="bup-btn-next-step1" class="bup-button-submit-steps" style="background-color:<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>"><?php echo $bookingultrapro->get_template_label("btn_check_availability_button_text",$template_id);?></button>
         
         </div> 
         
         
         <div class="bup-book-info-text" id="bup-steps-cont-res-step-1">
             
             <div class="bup-selected-staff-booking-info">      
             
             
              <p class="bup-template-editable" data-key='step1_texts' id='step1_texts_ui'><span><?php echo $bookingultrapro->get_template_label("step1_texts",$template_id);?></span></p>
              
              </div>
          
          </div>
          
           <div class="bup-book-info-text" id="bup-steps-cont-res-step-33" style="display:none">
           
           		
                
                <div class="bup-profile-separator">Shopping Cart</div>
                
                <div class="bup-shopping-cart-cont">
                
                <div class="bup-shopping-cart-header">You have: (<span>3</span>) items in your cart </div> 
                
                <table class="wp-list-table widefat fixed posts table-generic" width="100%">
            <thead>
                <tr>
                    <th><span class="bup-template-editable bup-editable" data-key='cart_header_1_texts' id='cart_header_1_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_1_texts",$template_id);?></span></th>
                    <th><span class="bup-template-editable bup-editable" data-key='cart_header_2_texts' id='cart_header_2_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_2_texts",$template_id);?></span></th>
                     
                                        
                    <th><span class="bup-template-editable bup-editable" data-key='cart_header_3_texts' id='cart_header_3_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_3_texts",$template_id);?></span></th> 
                   
                   
                     <th><span class="bup-template-editable bup-editable" data-key='cart_header_4_texts' id='cart_header_4_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_4_texts",$template_id);?></span></th>
					  <th><span class="bup-template-editable bup-editable" data-key='cart_header_5_texts' id='cart_header_5_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_5_texts",$template_id);?></span></th>
                    <th><span class="bup-template-editable bup-editable" data-key='cart_header_6_texts' id='cart_header_6_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_6_texts",$template_id);?></span></th>
					<th><span class="bup-template-editable bup-editable" data-key='cart_header_7_texts' id='cart_header_7_texts_ui'><?php echo $bookingultrapro->get_template_label("cart_header_7_texts",$template_id);?></span></th>
                    
                   
                </tr>
            </thead>
            
            <tbody><tr><td>Essential Facial</td><td>12/20/2016</td><td>04:30 PM</td><td>Gary Henderson</td><td>1</td><td class="bupcartprice">$30.00</td><td><a href="#" class="bup-btn-delete-cart-item" item-cart-id="0" title="Delete"><i class="fa fa-trash-o"></i></a></td></tr><tr><td>Essential Facial</td><td>12/22/2016</td><td>02:30 PM</td><td>Gary Henderson</td><td>1</td><td class="bupcartprice">$30.00</td><td><a href="#" class="bup-btn-delete-cart-item" item-cart-id="1" title="Delete"><i class="fa fa-trash-o"></i></a></td></tr><tr><td>Hair Extensions</td><td>12/21/2016</td><td>11:00 AM</td><td>Lorena Harris</td><td>1</td><td class="bupcartprice">$200.00</td><td><a href="#" class="bup-btn-delete-cart-item" item-cart-id="2" title="Delete"><i class="fa fa-trash-o"></i></a></td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td class="bupcarttotal"> $260.00</td><td>&nbsp;</td></tr></tbody>
        			</table></div><div class="bup-shopping-cart-footer">  <span class="bupbtncartclear">  <button id="bup-btn-clean-cart" class="bup-button-submit" style="background-color:<?php echo  $custom_bg?>"> Clear Cart</button></span>  <span class="bupbtncartcheckout">  <button id="bup-btn-checkout-cart" class="bup-button-submit bup-button-submit-steps" style="background-color:<?php echo  $custom_bg?>"><i class="fa fa-check" aria-hidden="true"></i> Checkout</button></span>
                    
                    </div>
           
            </div> 
          
          <div class="bup-book-info-text" id="bup-steps-cont-res-step-3" style="display:none">
          
          <div class="bup-selected-staff-booking-info">
          
                  
           <p class="bup-template-editable" data-key='step3_texts' id='step3_texts_ui' style="word-wrap: break-all;"><span><?php echo $bookingultrapro->get_template_label("step3_texts",$template_id);?></span></p>
           
          
          </div>
          
          
          <div class="bup-user-data-registration-form">					<form action="" method="post" id="bup-registration-form" name="bup-registration-form" enctype="multipart/form-data"><input type="hidden" name="bup_date" id="bup_date" value="2016-03-04"><input type="hidden" name="bup_service_cost" id="bup_service_cost" value="100.00"><input type="hidden" name="service_id" id="service_id" value="10"><input type="hidden" name="staff_id" id="staff_id" value="114"><input type="hidden" name="book_from" id="book_from" value="09:00"><input type="hidden" name="book_to" id="book_to" value="10:00"><input type="hidden" name="bup-custom-form-id" id="bup-custom-form-id" value=""><input type="hidden" name="bup-filter-id" id="bup-filter-id" value=""><div class="bup-field ">Fields with (*) are required</div><div class="bup-profile-separator">Account Info</div><div class="bup-profile-field"><label class="bup-field-type" for="display_name"><i class="fa fa-user"></i><span>Your Name (*)</span></label><div class="bup-field-value"><input type="text" class=" validate[required] bup-input " name="display_name" id="reg_display_name" value="" title="Your Name" placeholder="Your Name" data-errormessage-value-missing=" * This input is required!"></div></div><div class="bup-profile-field"><label class="bup-field-type" for="user_email"><i class="fa fa-envelope"></i><span>E-mail (*)</span></label><div class="bup-field-value"><input type="text" class=" validate[required] bup-input " name="user_email" id="reg_user_email" value="" title="E-mail" placeholder="E-mail" data-errormessage-value-missing=" * This input is required!"></div></div><div class="bup-profile-field"><label class="bup-field-type" for="user_email_2"><i class="fa fa-envelope"></i><span>Re-type your email (*)</span></label><div class="bup-field-value"><input type="text" class=" validate[required] bup-input " name="user_email_2" id="reg_user_email_2" value="" title="Re-type your email" placeholder="Re-type your email" data-errormessage-value-missing=" * This input is required!"></div><div class="bup-profile-field"><label class="bup-field-type" for="telephone"><i class="fa fa-phone"></i><span>Phone Number (*)</span></label><div class="bup-field-value"><input type="text" class=" validate[required] bup-input " name="telephone" id="reg_telephone" value="" title="Phone Number" placeholder="Phone Number" data-errormessage-value-missing=" * This input is required!"><div class="xoouserultra-help">Input your phone number</div></div></div><div class="bup-profile-separator">Appointment Info</div><div class="bup-profile-field"><label class="bup-field-type" for="special_notes"><i class="fa fa-pencil"></i><span>Comments  </span></label><div class="bup-field-value"><textarea class=" bup-input bup-input-text-area" rows="10" name="special_notes" id="special_notes" title="Comments" placeholder="Comments" data-errormessage-value-missing=" * This input is required!"></textarea></div></div>
          
          
          
          <div class="bup-field ">
						
						<div class="bup-field-value">
						    <input type="hidden" name="bup-register-form" value="bup-register-form">
														
							
							
						</div>
					</div><div class="bup-profile-field-cc" id="bup-stripe-payment-errors"></div></div></form></div></div>
        
        
        
        <div class="bup-book-info-text" id="bup-steps-cont-res-step-2" style="display:none">
        
        <div class="bup-selected-staff-booking-info">
        
        <p class="bup-template-editable" data-key='step2_texts' id='step2_texts_ui'><span><?php echo $bookingultrapro->get_template_label("step2_texts",$template_id);?></span></p>
        
        <?php $selected_template = $bookingultrapro->get_template_label("layout_selected",$template_id);
		
		
		
		?>
        <div class="bup-customizer-layout"><input class="bup-customizer-checked" value="1" name="bup-custo-layout"  id="bup-custo-layout-1" type="radio" <?php if( $selected_template==1) echo 'checked="checked"';?>><label for="bup-custo-layout-1"><span></span>Default Layout</label> <input class="bup-customizer-checked" value="2" name="bup-custo-layout"  id="bup-custo-layout-2" type="radio"  <?php if( $selected_template==2) echo 'checked="checked"';?>><label for="bup-custo-layout-2"><span></span>Reduced Layout</label></div>
        
        
        
        <p></p></div>
        
        <div class="bup-time-slots-divisor" id="bup-time-sl-div-1">
        
        <h3><h3>03/14/<?php echo  date('Y')?></h3></h3>
        
        <ul class="bup-time-slots-available-list"><li id="bup-time-slot-hour-range-1-1" ><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;07:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="07:00-08:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-2" ><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;07:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="07:30-08:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-3"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;08:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="08:00-09:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-4"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;08:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="08:30-09:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-5"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;09:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="09:00-10:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-6"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;09:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="09:30-10:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-7"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;10:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="10:00-11:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-8"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;10:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="10:30-11:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-9"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;11:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="11:00-12:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-1-10"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;11:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button  style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-12" bup-data-timeslot="11:30-12:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li></ul></div>
        
        <div class="bup-time-slots-divisor" id="bup-time-sl-div-4">
        
        <h3>03/15/<?php echo  date('Y')?></h3>
        
        <ul class="bup-time-slots-available-list"><li id="bup-time-slot-hour-range-4-1"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;08:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="08:00-09:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-2"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;08:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="08:30-09:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-3"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;09:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="09:00-10:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-4"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;09:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="09:30-10:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-5"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;10:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="10:00-11:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-6"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;10:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="10:30-11:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-7"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;11:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="11:00-12:00" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li><li id="bup-time-slot-hour-range-4-8"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;11:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="11:30-12:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li> <li id="bup-time-slot-hour-range-4-8"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;12:00 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>"  class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="11:30-12:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li> <li id="bup-time-slot-hour-range-4-8"><div class="bup-timeslot-time"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;12:30 AM</div><div class="bup-timeslot-count"><span class="spots-available">1 time slot available </span></div><span class="bup-timeslot-people"><button style="background-color:<?php echo  $custom_bg?>" class="new-appt bup-button bup-btn-book-app " bup-data-date="2016-02-15" bup-data-timeslot="11:30-12:30" bup-data-service-staff="11-42"><span class="button-timeslot"></span><span class="bup-button-text">Book Appointment</span></button></span></li> </ul></div></div>
    
    

</div>                  
                         
             

</div>
<input type="hidden"  id="template_id" name="template_id" value="<?php echo $_GET["template"]?>" />

<input type="hidden"  id="bup_cus_bg_color" name="bup_cus_bg_color" value="<?php echo $bookingultrapro->get_template_label("bup_cus_bg_color",$template_id);?>" />
<input type="hidden"  id="step1_label" name="step1_label" value="<?php echo $bookingultrapro->get_template_label("step1_label",$template_id);?>" />
<input type="hidden"  id="step2_label" name="step2_label" value="<?php echo $bookingultrapro->get_template_label("step2_label",$template_id);?>" />
<input type="hidden"  id="step3_label" name="step3_label" value="<?php echo $bookingultrapro->get_template_label("step3_label",$template_id);?>" />
<input type="hidden"  id="step3cart_label" name="step3cart_label" value="<?php echo $bookingultrapro->get_template_label("step3cart_label",$template_id);?>" />

<input type="hidden"  id="step4_label" name="step4_label" value="<?php echo $bookingultrapro->get_template_label("step4_label",$template_id);?>" />

<input type="hidden"  id="select_service_label" name="select_service_label" value="<?php echo $bookingultrapro->get_template_label("select_service_label",$template_id);?>" />
<input type="hidden"  id="select_service_label_drop" name="select_service_label_drop" value="<?php echo $bookingultrapro->get_template_label("select_service_label_drop",$template_id);?>" />

<input type="hidden"  id="select_location_label" name="select_location_label" value="<?php echo $bookingultrapro->get_template_label("select_location_label",$template_id);?>" />

<input type="hidden"  id="select_date_label" name="select_date_label" value="<?php echo $bookingultrapro->get_template_label("select_date_label",$template_id);?>" />
<input type="hidden"  id="select_provider_label" name="select_provider_label" value="<?php echo $bookingultrapro->get_template_label("select_provider_label",$template_id);?>" />

<input type="hidden"  id="step1_texts" name="step1_texts" value="<?php echo $bookingultrapro->get_template_label("step1_texts",$template_id);?>" />
<input type="hidden"  id="step2_texts" name="step2_texts" value="<?php echo $bookingultrapro->get_template_label("step2_texts",$template_id);?>" />
<input type="hidden"  id="step3_texts" name="step3_texts" value="<?php echo $bookingultrapro->get_template_label("step3_texts",$template_id);?>" />

<input type="hidden"  id="step3_cart_texts" name="step3_cart_texts" value="<?php echo $bookingultrapro->get_template_label("step3_cart_texts",$template_id);?>" />


<input type="hidden"  id="cart_header_1_texts" name="cart_header_1_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_1_texts",$template_id);?>" />
<input type="hidden"  id="cart_header_2_texts" name="cart_header_2_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_2_texts",$template_id);?>" />
<input type="hidden"  id="cart_header_3_texts" name="cart_header_3_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_3_texts",$template_id);?>" />
<input type="hidden"  id="cart_header_4_texts" name="cart_header_4_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_4_texts",$template_id);?>" />

<input type="hidden"  id="cart_header_5_texts" name="cart_header_5_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_5_texts",$template_id);?>" />
<input type="hidden"  id="cart_header_6_texts" name="cart_header_6_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_6_texts",$template_id);?>" />
<input type="hidden"  id="cart_header_7_texts" name="cart_header_7_texts" value="<?php echo $bookingultrapro->get_template_label("cart_header_7_texts",$template_id);?>" />
<input type="hidden"  id="checked_categories_pre" name="checked_categories_pre" value="<?php echo $bookingultrapro->get_template_label("category_ids",$template_id);?>" />




     <div id="bup-template-data-box" title="<?php _e('Edit Data','bookingup')?>"></div>
     <div id="bup-template-alias-box" title="<?php _e('Set User Alias','bookingup')?>"></div>
     <div id="bup-template-categories-box" title="<?php _e('Set Categories','bookingup')?>"></div>
     <div id="bup-template-form-type-box" title="<?php _e('Set Booking Form Type','bookingup')?>"></div>

     
    
     
     <p>
     
         
     <button name="bup-btn-book-app-confirm" id="bup-save-template-confirm" class="bup-button-submit-changes"><?php _e('SAVE CHANGES','bookingup')?>	</button> &nbsp; <span id="bup-appearance-message-save"></span>
     
     </p>



<script type="text/javascript">  
			
			var myBUPOptions = {
   
    			change: function(event, ui){
				
					$("#bup-btn-next-step1").css("background-color", ui.color.toString());
					$(".bup-cart-step-active").css("background-color", ui.color.toString());
					$(".bup-btn-book-app").css("background-color", ui.color.toString());
					$("#bup-btn-checkout-cart").css("background-color", ui.color.toString());
					$("#bup-btn-clean-cart").css("background-color", ui.color.toString());	
					
					jQuery('#bup_cus_bg_color').val(jQuery('#bup-bg-color').val());
					
									
				}, 				
    		};
		
		     jQuery('.color-picker').wpColorPicker(myBUPOptions);
			 
			 bup_selected_template(<?php echo $selected_template?>)	 ; 
			 
			 <?php if($show_location==1){?>
			 jQuery( ".bup-book-info-block1").addClass( "bup-four-cols-booking" );
			 
			 <?php }  ?>
			  
		
		 </script>


 
 <?php }  ?>
 
 <div id="bup-spinner" class="bup-spinner" style="display:none">
            <span> <img src="<?php echo bookingup_url?>admin/images/loaderB16.gif" width="16" height="16" /></span>&nbsp; <?php echo __('Please wait ...','bookingup')?>
	</div>