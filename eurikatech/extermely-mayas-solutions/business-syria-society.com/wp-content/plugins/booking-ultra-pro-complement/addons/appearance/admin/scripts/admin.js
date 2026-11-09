jQuery(document).ready(function($) {
	
	
	
		jQuery(document).on("click", ".bup-move-steps", function(e) {
			
			e.preventDefault();
			
			var step_number =  jQuery(this).attr("step-number");
			var template_id =  jQuery('#template_id').val();
			
			//alert(step_number);
			
			jQuery('.bup-book-info-text').hide();			
			jQuery('#bup-steps-cont-res-step-'+step_number).show();		
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
		
		
	jQuery(document).on("click", ".bup-customizer-checked", function(e) {	
			
			
			var templated_cheked =  $('input:radio[name=bup-custo-layout]:checked').val();			
			bup_selected_template(templated_cheked);
			
				
     });
	 
	 jQuery(document).on("click", ".bup-hide-staff-checked", function(e) {
			

			var val_cheked =  jQuery('#bup-hide-staff').val();
			var ischecked = $(this).is(":checked");	
			
			if(ischecked)	{				
				
				jQuery('#bup-staff-booking-list').hide();
				
			}else{
				
				jQuery('#bup-staff-booking-list').show();
				
				
			}	
			
				
     });
	 
	  jQuery(document).on("click", ".bup-hide-service-checked", function(e) {
			

			var val_cheked =  jQuery('#bup-hide-service').val();
			var ischecked = $(this).is(":checked");	
			
			if(ischecked)	{				
				
				jQuery('#bup-customizer-service-list').hide();
				
			}else{
				
				jQuery('#bup-customizer-service-list').show();
				
				
			}	
			
				
     });
	 
	  jQuery(document).on("click", ".bup-show-locations-checked", function(e) {
			

			var val_cheked =  jQuery('#bup-show-location').val();
			var ischecked = $(this).is(":checked");	
			
			if(ischecked)	{				
				
				jQuery('#bup-customizer-location-list').show();
				jQuery( ".bup-book-info-block1").addClass( "bup-four-cols-booking" );				
				
			}else{
				
				jQuery('#bup-customizer-location-list').hide();
				jQuery( ".bup-book-info-block1").removeClass( "bup-four-cols-booking" );
				
				
			}	
			
				
     });
		
		
	
	
	jQuery(document).on("click", "#bup-template-set-alias", function(e) {
			
			
			var template_id =  jQuery('#template_id').val();
			
			jQuery("#bup-spinner").show();
			
	
			
    		jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_get_alias_set_form", "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-alias-box" ).html( data );
						jQuery("#bup-template-alias-box" ).dialog( "open" );
						jQuery("#bup-spinner").hide();
												
																
						
					}
				});
			
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
		
	jQuery(document).on("click", "#bup-template-set-categories", function(e) {
			
			
			var template_id =  jQuery('#template_id').val();			
			jQuery("#bup-spinner").show();			
	
			
    		jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_get_template_categories", "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-categories-box" ).html( data );
						jQuery("#bup-template-categories-box" ).dialog( "open" );
						jQuery("#bup-spinner").hide();												
																
						
					}
				});
			
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
		
	
	jQuery(document).on("click", "#bup-template-set-form-type", function(e) {
			
			
			var template_id =  jQuery('#template_id').val();			
			jQuery("#bup-spinner").show();			
	
			
    		jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_get_form_type", "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-form-type-box" ).html( data );
						jQuery("#bup-template-form-type-box" ).dialog( "open" );
						jQuery("#bup-spinner").hide();												
																
						
					}
				});
			
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
	
	
	function ubp_get_checked_categories ()	
		{
			
			var checkbox_value = "";
			jQuery(".ubp-cate-template-checked").each(function () {
				
				var ischecked = $(this).is(":checked");
			   
				if (ischecked) 
				{
					
					checkbox_value += $(this).val()+ ",";
				}
				
				
			});
			
			return checkbox_value;		
		}
	
	/* edit categories */	
	jQuery( "#bup-template-categories-box" ).dialog({
			autoOpen: false,			
			width: '400px', // overcomes width:'auto' and maxWidth bug
   			
			responsive: true,
			fluid: true, //new option
			modal: true,
			buttons: {
			"Save & Exit": function() {				
				
				var checked_categories = ubp_get_checked_categories();
				var template_id =  jQuery('#template_id').val();
				
				
				jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_update_template_categories", "checked_categories": checked_categories , "template_id": template_id },
					
					success: function(data){
						
						jQuery('#checked_categories_pre').val(data);
						
						jQuery("#bup-template-categories-box" ).dialog( "close" );
												
																
						
					}
				});
				
			},
			
			"Close": function() {
				
				
				jQuery( this ).dialog( "close" );
			},
			
			
			},
			close: function() {
			
			
			}
	});
	
	
	/* edit form type */	
	jQuery( "#bup-template-form-type-box" ).dialog({
			autoOpen: false,			
			width: '400px', // overcomes width:'auto' and maxWidth bug
   			
			responsive: true,
			fluid: true, //new option
			modal: true,
			buttons: {
			"Save & Exit": function() {				
				
				var checked_type =$('input:radio[name=bup-form-type]:checked').val();
				var template_id =  jQuery('#template_id').val();
				
				
				jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_update_form_type", "checked_type": checked_type , "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-form-type-box" ).dialog( "close" );
												
																
						
					}
				});
				
			},
			
			"Close": function() {
				
				
				jQuery( this ).dialog( "close" );
			},
			
			
			},
			close: function() {
			
			
			}
	});
	
	function ubp_get_alias_values ()	
		{
			
			var checkbox_value = "";
			jQuery(".bup-alias-textbox").each(function () {
				
				var ischecked = $(this).is(":checked");
				
				var user_id =  jQuery(this).attr("data-user-id");
				var user_alias =  $(this).val();
			   
				if (user_alias!='') 
				{
					checkbox_value += user_id + "-" + user_alias + "|";
				}
				
				
			});
			
			
			return checkbox_value;		
		}
		
	
	/* edit alias */	
	jQuery( "#bup-template-alias-box" ).dialog({
			autoOpen: false,			
			width: '400px', // overcomes width:'auto' and maxWidth bug
   			
			responsive: true,
			fluid: true, //new option
			modal: true,
			buttons: {
			"Save & Exit": function() {				
				
				var user_alias = ubp_get_alias_values();
				var template_id =  jQuery('#template_id').val();
				
				
				jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_update_user_alias", "user_alias": user_alias , "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-alias-box" ).dialog( "close" );
												
																
						
					}
				});
				
			},
			
			"Close": function() {
				
				
				jQuery( this ).dialog( "close" );
			},
			
			
			},
			close: function() {
			
			
			}
	});
		
	
	
	
	jQuery(document).on("click", ".bup-template-editable", function(e) {
			
			e.preventDefault();
			
			var element_id =  jQuery(this).attr("data-key");
			var template_id =  jQuery('#template_id').val();
			
			jQuery("#bup-spinner").show();
			
			var label_data =  jQuery('#'+element_id).val();
			var label_data_drop =  jQuery('#'+element_id+'_drop').val();
			
			
			
			
    		jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_get_element_value", "element_id": element_id , "template_id": template_id },
					
					success: function(data){
						
						jQuery("#bup-template-data-box" ).html( data );
						jQuery("#bup_template_label_edit_text" ).val(label_data );	
						jQuery("#bup_template_label_edit_text_second" ).val(label_data_drop );
						
							
						jQuery("#bup-template-data-box" ).dialog( "open" );
						jQuery("#bup-spinner").hide();
												
																
						
					}
				});
			
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
	
	
	jQuery(document).on("click", "#bup-save-template-confirm", function(e) {
			
			e.preventDefault();
			
			var template_id =  jQuery('#template_id').val();
			var bup_cus_bg_color =  jQuery('#bup-bg-color').val();
			
			var step1_label =  jQuery('#step1_label').val();
			var step2_label =  jQuery('#step2_label').val();
			var step3_label =  jQuery('#step3_label').val();
			var step3cart_label =  jQuery('#step3cart_label').val();
			var step4_label =  jQuery('#step4_label').val();
			
			var select_service_label =  jQuery('#select_service_label').val();
			var select_service_label_drop =  jQuery('#select_service_label_drop').val();
			var select_date_label =  jQuery('#select_date_label').val();
			var select_provider_label =  jQuery('#select_provider_label').val();
			
			var step1_texts =  jQuery('#step1_texts').val();
			var step2_texts =  jQuery('#step2_texts').val();
			var step3_texts =  jQuery('#step3_texts').val();
			var step3_cart_texts =  jQuery('#step3_cart_texts').val();
			
			
			var cart_header_1_texts =  jQuery('#cart_header_1_texts').val();
			var cart_header_2_texts =  jQuery('#cart_header_2_texts').val();
			var cart_header_3_texts =  jQuery('#cart_header_3_texts').val();
			var cart_header_4_texts =  jQuery('#cart_header_4_texts').val();
			var cart_header_5_texts =  jQuery('#cart_header_5_texts').val();
			var cart_header_6_texts =  jQuery('#cart_header_6_texts').val();
			var cart_header_7_texts =  jQuery('#cart_header_7_texts').val();
			
			var checked_categories =  jQuery('#checked_categories_pre').val();
			
						
			if($("#bup-hide-staff").is(':checked'))	{				
				
				var hide_staff=1;
				
			}else{
				
				var hide_staff=0;				
				
			}	
			
			if($("#bup-hide-service").is(':checked'))	{				
				
				var hide_service=1;
				
			}else{
				
				var hide_service=0;				
				
			}
			
			
			if($("#bup-show-location").is(':checked'))	{				
				
				var show_location=1;
				
			}else{
				
				var show_location=0;				
				
			}
			
			if($("#bup-show-cart").is(':checked'))	{				
				
				var show_cart=1;
				
			}else{
				
				var show_cart=0;				
				
			}
			
			var layout_selected =  $('input:radio[name=bup-custo-layout]:checked').val();
			
			jQuery("#bup-appearance-message-save" ).html('' );
			
			jQuery("#bup-spinner").show();
			
			
			
    		jQuery.ajax({
					type: 'POST',
					url: ajaxurl,
					data: {"action": "bup_update_template_values", "template_id": template_id , 
					
					"bup_cus_bg_color": bup_cus_bg_color, 
					"step1_label": step1_label , 
					"step2_label": step2_label, 
					"step3_label": step3_label,
					"step3cart_label": step3cart_label,  
					"step4_label": step4_label,
					"select_service_label": select_service_label, 
					"select_service_label_drop": select_service_label_drop, 
					"select_date_label": select_date_label, 
					"select_provider_label": select_provider_label,					
					"step1_texts": step1_texts,
					"step2_texts": step2_texts,
					"step3_texts": step3_texts,
					"step3_cart_texts": step3_cart_texts,
					"layout_selected": layout_selected,
					"hide_staff": hide_staff,
					"hide_service": hide_service,
					"show_location": show_location, 
					"show_cart": show_cart,
					"checked_categories": checked_categories,			
					
					"cart_header_1_texts": cart_header_1_texts,
					"cart_header_2_texts": cart_header_2_texts,
					"cart_header_3_texts": cart_header_3_texts,
					"cart_header_4_texts": cart_header_4_texts,
					"cart_header_5_texts": cart_header_5_texts,
					"cart_header_6_texts": cart_header_6_texts,
					"cart_header_7_texts": cart_header_7_texts
					
					 },
					
					success: function(data){
						
						jQuery("#bup-appearance-message-save" ).html(data );
						jQuery("#bup-spinner").hide();
						
					}
				});
			
			
			 // Cancel the default action
    		e.preventDefault();
			 
				
        });
		
	
	
		
	
	/* open client member form */	
	jQuery( "#bup-template-data-box" ).dialog({
			autoOpen: false,			
			width: '400px', // overcomes width:'auto' and maxWidth bug
   			
			responsive: true,
			fluid: true, //new option
			modal: true,
			buttons: {
			"Ok": function() {				
				
				var ret;
				
				var bup_temp_label=   jQuery("#bup_temp_label").val();
				
				var bup_template_label_edit_text=   jQuery("#bup_template_label_edit_text").val();
				var bup_template_label_edit_text_second=   jQuery("#bup_template_label_edit_text_second").val();
				var template_id=   jQuery("#template_id").val();
				
				//update fields				
				jQuery("#"+bup_temp_label).val(bup_template_label_edit_text);
				jQuery("#"+bup_temp_label+'_drop').val(bup_template_label_edit_text_second);
				
				//update labels
				jQuery("#"+bup_temp_label+'_ui').html('<span>'+bup_template_label_edit_text+'</span>');
				
				jQuery( this ).dialog( "close" );
				
								
				
				
			
			},
			
			"Close": function() {
				
				
				jQuery( this ).dialog( "close" );
			},
			
			
			},
			close: function() {
			
			
			}
	});
	
	jQuery("body").on("click", ".bup-template-edit", function(e) {
		e.preventDefault();		
		 
		 var template_id =  jQuery(this).attr("data-form");	
		
		jQuery.ajax({
						type: 'POST',
						url: ajaxurl,
						data: {"action": "bup_edit_template", 
						"template_id": template_id },
						
						success: function(data){					
						
							 $("#uu-edit-form-box-"+template_id).html(data);
							 jQuery("#uu-edit-form-box-"+template_id).slideDown();							
							
							
							}
					});
	});
	
	jQuery("body").on("click", ".bup-template-modify", function(e) {
		e.preventDefault();		
		 
		 var template_id=  jQuery(this).attr("template-id");		
		 var template_name = $('#bup_template_name_edit_'+template_id).val();
		
		 
				
		jQuery.ajax({
						type: 'POST',
						url: ajaxurl,
						data: {"action": "bup_edit_template_conf", "template_id": template_id, 
						"template_name": template_name },
						
						success: function(data){									
							//refresh
							window.location.reload();								
													
							
							
							}
					});
		return false;
	});
	
	jQuery("body").on("click", ".bup-template-del", function(e) {
		e.preventDefault();		
		 
		 var template_id=  jQuery(this).attr("data-form");		
		 
		 
		 doIt=confirm(custom__del_confirmation);
		  
		  if(doIt)
		  {
			
				jQuery.ajax({
								type: 'POST',
								url: ajaxurl,
								data: {"action": "bup_template_del", "template_id": template_id 
								 },
								
								success: function(data){
									
									jQuery("#uu-edit-form-row-"+template_id).slideUp();						
								
															
									
									
									}
							});
			
			}
		return false;
	});
	
	jQuery("body").on("click", ".bup-template-close", function(e) {
		e.preventDefault();		
		 
		 var template_id =  jQuery(this).attr("data-form");			
		jQuery("#uu-edit-form-box-"+template_id).hide();
		return false;
	});
	
});

function bup_selected_template(templated_cheked)
{
	
			
			if(templated_cheked==1) // default
			{
				
				jQuery( ".bup-time-slots-divisor").removeClass( "bup-time-slots-divisor-reduced" );
				jQuery( ".bup-time-slots-available-list li").removeClass( "bupreduced" );
				jQuery( ".bup-time-slots-available-list").removeClass( "bup-time-slots-available-list-bupreduced" );
				
				jQuery( ".bup-timeslot-people").show();
				
				
				
			}else{
				
				jQuery( ".bup-time-slots-divisor").addClass( "bup-time-slots-divisor-reduced" );
				jQuery( ".bup-time-slots-available-list li").addClass( "bupreduced" );
				jQuery( ".bup-time-slots-available-list").addClass( "bup-time-slots-available-list-bupreduced" );
				
				jQuery( ".bup-timeslot-people").hide();		
				
			
			}
	
}