<?php
class BupComplementLocation
{
	
		
	public function __construct()
	{
		add_action( 'wp_ajax_ubp_update_staff_locations', array( &$this, 'ubp_update_staff_locations' ));
	
    }	
	
	public function ubp_update_staff_locations()
	{
		$staff_id = $_POST['staff_id']	;
		
		$service_list = array();
		$modules = $_POST["location_list"]; 		
		
		//delete all services from this staff member
		if($staff_id!='')
		{
			$this->ubp_delete_staff_locations($staff_id);
		}
		
		if($modules!="" && $staff_id!='')
		{
			$modules =rtrim($modules,"|");
			$location_list = explode("|", $modules);
					
			foreach($location_list as  $location)
			{						
							
				//add in db				
				$this->ubp_assign_staff_locations($staff_id, $location);
			
			
			}
			
									
		}
		
		
		
		
		die();
	
	}
	
	public function ubp_delete_staff_locations($staff_id)
	{
		global $wpdb;
		
		$sql = 'DELETE FROM ' . $wpdb->prefix . 'bup_filter_staff  WHERE fstaff_staff_id="'.(int)$staff_id.'" ';
		$wpdb->query($sql);		
	}
	
	public function ubp_assign_staff_locations($staff_id, $location_id)
	{
		global $wpdb;
		
		
		$new_record = array(
						'fstaff_id'        => NULL,
						'fstaff_staff_id' => $staff_id,
						'fstaff_location_id' => $location_id					
						
						
						
					);
					
		$wpdb->insert( $wpdb->prefix . 'bup_filter_staff', $new_record, array( '%d', '%d', '%d'));
						
	}
	

}
$key = "location";
$this->{$key} = new BupComplementLocation();
?>