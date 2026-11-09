<?php
global $bup_form, $bookingultrapro;

$forms = $bup_form->get_all();

?>
<div class="bup-ultra-sect ">
        
      
<form action="" method="post" id="bup-userslist">
          <input type="hidden" name="add-form" value="add-form" />
        
        <div class="bup-ultra-success bup-notification"><?php _e('Success ','bookingup'); ?></div>
        
         <p><?php _e('This module gives you the capability to setup multiple or separate registration forms. For instance, If you want to have two separate forms or more e.g. Clients, Partners, Sellers, etc. This tool helps you create multiple forms with different fields.','bookingup'); ?></p>
         
        
    <h3><?php _e('Add New Form ','bookingup'); ?></h3>
    
   
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td width="15%"><?php _e('Name: ','bookingup'); ?></td>
             <td width="85%"><input type="text" id="form_name"  name="form_name"  /></td>
           </tr>
           
                   
          
          </table>
          
           <p>
           <input name="submit" type="submit"  class="button-primary" value="<?php _e('Confirm','bookingup'); ?>"/>
          
    </p>
          
   
        </form>
        
                 <?php
			
			
				
				if (!empty($forms)){
				
				
				?>
       
           <table width="100%" class="wp-list-table widefat fixed posts table-generic">
            <thead>
                <tr>
                    <th width="12%" style="color:# 333"><?php _e('Unique Identifier', 'bookingup'); ?></th>
                    <th width="21%"><?php _e('Name', 'bookingup'); ?></th>
                    
                    <th width="13%"><?php _e('Shortcode', 'bookingup'); ?></th>
                    <th width="20%"><?php _e('Actions', 'bookingup'); ?></th>
                </tr>
            </thead>
            
            <tbody>
            
            <?php 
			
				foreach ( $forms as $key => $form )
				{
					
			?>
              

                <tr  id="uu-edit-form-row-<?php echo $key; ?>">
                    <td><?php echo $key; ?></td>
                    <td  id="uu-edit-form-row-name-<?php echo $key; ?>"><?php echo $form['name']; ?></td>
                    
                    <td><?php echo $bup_form->get_copy_paste_shortocde($key);?></td>
                   <td> <a href="#" class="button bup-form-del"  id="" data-form="<?php echo $key; ?>"><i class="uultra-icon-plus"></i>&nbsp;&nbsp;<?php _e('Delete','bookingup'); ?>
                   </a>  <a href="#" class="button-primary button-secondary bup-form-edit"  id="" data-form="<?php echo $key ?>"><i class="uultra-icon-plus"></i>&nbsp;&nbsp;<?php _e('Edit','bookingup'); ?>
</a> </td>
                </tr>
                
                
                <tr>
                
                 <td colspan="5" ><div id='uu-edit-form-box-<?php echo $key; ?>'></div> </td>
                
                </tr>
                <?php
					}
					
					} else {
			?>
			<p><?php _e('There are no custom forms yet.','bookingup'); ?></p>
			<?php	} ?>

            </tbody>
        </table>
        
        
           <script type="text/javascript">  
		
		      var custom__del_confirmation ="<?php _e('Are you totally sure that you want to delete this form?','bookingup'); ?>";
			  
			  
		
		 </script>
        
             

</div>