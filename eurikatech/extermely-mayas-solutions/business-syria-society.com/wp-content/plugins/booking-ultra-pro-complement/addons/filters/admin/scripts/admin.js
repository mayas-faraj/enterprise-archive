jQuery(document).ready(function($) {
	
	jQuery("body").on("click", ".bup-filter-edit", function(e) {
		e.preventDefault();		
		 
		 var filter_id =  jQuery(this).attr("data-form");	
		
		jQuery.ajax({
						type: 'POST',
						url: ajaxurl,
						data: {"action": "bup_edit_filter", 
						"filter_id": filter_id },
						
						success: function(data){					
						
							 $("#uu-edit-form-box-"+filter_id).html(data);
							 jQuery("#uu-edit-form-box-"+filter_id).slideDown();							
							
							
							}
					});
		return false;
	});
	
	jQuery("body").on("click", ".bup-filter-modify", function(e) {
		e.preventDefault();		
		 
		 var filter_id=  jQuery(this).attr("filter-id");		
		 var filter_name = $('#bup_filter_name_edit_'+filter_id).val();
		
		 
				
		jQuery.ajax({
						type: 'POST',
						url: ajaxurl,
						data: {"action": "bup_edit_filter_conf", "filter_id": filter_id, 
						"filter_name": filter_name },
						
						success: function(data){									
							//refresh
							window.location.reload();								
													
							
							
							}
					});
		return false;
	});
	
	jQuery("body").on("click", ".bup-filter-del", function(e) {
		e.preventDefault();		
		 
		 var filter_id=  jQuery(this).attr("data-form");		
		 
		 
		 doIt=confirm(custom__del_confirmation);
		  
		  if(doIt)
		  {
			
				jQuery.ajax({
								type: 'POST',
								url: ajaxurl,
								data: {"action": "bup_filter_del", "filter_id": filter_id 
								 },
								
								success: function(data){
									
									jQuery("#uu-edit-form-row-"+filter_id).slideUp();						
								
															
									
									
									}
							});
			
			}
		return false;
	});
	
	jQuery("body").on("click", ".bup-filter-close", function(e) {
		e.preventDefault();		
		 
		 var filter_id =  jQuery(this).attr("data-form");			
		jQuery("#uu-edit-form-box-"+cate_id).filter_id();
		return false;
	});
	
});