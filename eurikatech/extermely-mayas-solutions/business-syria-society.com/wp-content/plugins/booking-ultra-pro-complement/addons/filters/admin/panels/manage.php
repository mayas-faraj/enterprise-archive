<?php
global $bup_filter, $bookingultrapro;

$filters = $bup_filter->get_all();

?>
<div class="bup-ultra-sect ">
        
      
<form action="" method="post" id="bup-userslist">
          <input type="hidden" name="add-filter" value="add-filter" />
        
        <div class="bup-ultra-success bup-notification"><?php _e('Success ','bookingup'); ?></div>
        
         <p><?php _e('This module gives you the capability to create locations for your bookings.','bookingup'); ?></p>
         
        
    <h3><?php _e('Add New Location ','bookingup'); ?></h3>
    
   
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td width="15%"><?php _e('Name: ','bookingup'); ?></td>
             <td width="85%"><input type="text" id="filter_name"  name="filter_name"  /></td>
           </tr>
           
                   
          
          </table>
          
           <p>
           <input name="submit" type="submit"  class="button-primary" value="<?php _e('Confirm','bookingup'); ?>"/>
          
    </p>
          
   
        </form>
        
                 <?php
			
			
				
				if (!empty($filters)){
				
				
				?>
       
           <table width="100%" class="wp-list-table widefat fixed posts table-generic">
            <thead>
                <tr>
                    <th width="12%" style="color:# 333"><?php _e('ID', 'bookingup'); ?></th>
                    <th width="21%"><?php _e('Name', 'bookingup'); ?></th>  
                    <th width="21%"><?php _e('Shortcode', 'bookingup'); ?></th>                   
                    
                    <th width="20%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			
				foreach ( $filters as $filter )
				{
					
			?>
              

                <tr  id="uu-edit-form-row-<?php echo $filter->filter_id; ?>">
                    <td><?php echo $filter->filter_id; ?></td>
                    <td  id="uu-edit-form-row-name-<?php echo $filter->filter_id; ?>"><?php echo $filter->filter_name; ?></td>
                    
                    <td  id="uu-edit-form-row-shortcode-<?php echo $filter->filter_id; ?>"><?php echo   $bup_filter->get_copy_paste_shortocde($filter->filter_id);?></td>
                    
                                      <td> <a href="#" class="bup-filter-del"  id="" data-form="<?php echo $filter->filter_id; ?>" title='<?php _e('Delete','bookingup'); ?>'><i class="fa fa-trash-o"></i>&nbsp;&nbsp;
                   </a>  <a href="#" class="bup-filter-edit"  id="" data-form="<?php echo $filter->filter_id ?>" title='<?php _e('Edit','bookingup'); ?>'><i class="fa fa-edit"></i>
</a> </td>
                </tr>
                
                
                <tr>
                
                 <td colspan="5" ><div id='uu-edit-form-box-<?php echo $filter->filter_id; ?>'></div> </td>
                
                </tr>
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no locations yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
           <script type="text/javascript">  
		
		      var custom__del_confirmation ="<?php _e('Are you totally sure that you want to delete this location?','bookingup'); ?>";
			  
			  
		
		 </script>
        
             

</div>