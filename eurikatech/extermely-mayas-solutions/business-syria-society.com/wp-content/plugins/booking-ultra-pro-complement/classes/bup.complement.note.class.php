<?php
class BupComplementNote
{
	
		
	public function __construct()
	{
		$this->ini_module();
		add_action( 'wp_ajax_bup_get_notes_list', array( &$this, 'appointment_get_notes_list' ));
		add_action( 'wp_ajax_bup_get_note_form', array( &$this, 'bup_get_form' ));
		add_action( 'wp_ajax_bup_admin_note_confirm', array( &$this, 'bup_admin_note_confirm' ));
		add_action( 'wp_ajax_bup_delete_note', array( &$this, 'bup_delete_note' ));
		
	
    }	
	
	
	public function ini_module()
	{
		global $wpdb;
		 
		   // Create table
			$query = 'CREATE TABLE IF NOT EXISTS ' . $wpdb->prefix . 'bup_appointment_notes (
				`note_id` bigint(20) NOT NULL auto_increment,
				`note_appointment_id` int(11) NOT NULL,
				`note_title` varchar(300) NOT NULL 	,
				`note_color` varchar(100) NOT NULL 	,
				`note_text` text NOT NULL 	,									
				PRIMARY KEY (`note_id`)
			) COLLATE utf8_general_ci;';

		   $wpdb->query( $query );		    
		  
		  		   
		
	}
	
	public function bup_delete_note()
	{
		
		global $wpdb, $bookingultrapro;
		
		$note_id = $_POST['note_id'];	
		$appointment_id = $_POST['appointment_id'];			
		
		$query = "DELETE FROM " . $wpdb->prefix ."bup_appointment_notes WHERE note_appointment_id = '".$appointment_id."' AND note_id = '".$note_id."' ";
		$wpdb->query( $query );		
		
		die();
	
	}
	
	public function get_one($note_id, $appointment_id)
	{
		
		global $wpdb, $bookingultrapro;
		
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_appointment_notes  ' ;		
		$sql .= ' WHERE note_appointment_id = "'.$appointment_id.'" AND note_id = "'.$note_id.'" ' ;
						
		$res = $wpdb->get_results($sql);
		
		if ( !empty( $res ) )
		{
		
			foreach ( $res as $row )
			{
				return $row;			
			
			}
			
		}			
		
			
	}
		
	public function appointment_get_notes_list () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';		
				
		$appointment_id = $_POST['appointment_id'];	
		
		$sql = ' SELECT * FROM ' . $wpdb->prefix . 'bup_appointment_notes  ' ;		
		$sql .= ' WHERE note_appointment_id = "'.$appointment_id.'" ' ;
						
		$notes = $wpdb->get_results($sql);
		
						
						
		if (!empty($notes)){
			
			
			$html .= '<div class="bup-notes-list"> ';           
		    $html .= ' <ul>';
           
			foreach($notes as $note) 
			{
				
				$html .= '<li>';
				
				$html .= '<div class="bup-notes-actions"><a href="#" title="'.__('Delete', 'bookingup').'" class="bup-note-deletion" bup-note-id="'.$note->note_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-remove"> </i> </a>
					<a href="#" title="'.__('Edit', 'bookingup').'" class="bup-note-edit" bup-note-id="'.$note->note_id.'" bup-appointment-id="'.$appointment_id.'"> <i class="fa fa-pencil"> </i> </a></div>';
					
				$html .= '<a><h3>'.$note->note_title.'</h3><p >'.$note->note_text.'</p></a>';
				$html .='</li>';
				   
			}
			
			$html .= '  </ul> ';        
         	$html .= ' </div>';
					
			} else {
			
			$html .='<p>'.__('There are no notes yet.','bookingup').'</p>';
			} 

       $html .='     ';
        
				
		echo $html;		
		die();
	
	}
	
	public function bup_admin_note_confirm()
	{
		
		global $wpdb, $bookingultrapro;	
		
		$html='';	
		
		$bup_note_title = $_POST['bup_note_title'];
		$bup_note_text = $_POST['bup_note_text'];	
			
		
		$bup_booking_id = $_POST['bup_booking_id'];	
		$bup_note_id = $_POST['bup_note_id'];
		
		
		if($bup_booking_id!='' && $bup_note_title!='' && $bup_note_text!='' && $bup_note_id=='')		
		{
					
			$query = "INSERT INTO " . $wpdb->prefix ."bup_appointment_notes (`note_appointment_id`,`note_title`, `note_text`) VALUES ('$bup_booking_id','".$bup_note_title."','".$bup_note_text."' )";
			
			$wpdb->query( $query );
			$html ='OK';
		
	    }else{
			
			//$query = "UPDATE " . $wpdb->prefix ."bup_orders  SET `order_txt_id` = '".$bup_payment_transaction."',  `order_status` = '".$bup_payment_status."' ,`order_amount` = '$bup_payment_amount' , `order_date` = '".date('Y-m-d',strtotime($bup_payment_date)) ."' WHERE  `order_booking_id` = '$bup_booking_id' AND `order_ID` = '$bup_payment_id' ";
			
			$wpdb->query( $query );
			$html ='OK';
			
			
		}
		
		echo $html;
		die();
		
				
	
	}
	
	public function bup_get_form () 
	{
		global $wpdb, $bookingultrapro;
		
		$html='';	
		
		$note_id = $_POST['payment_id'];
		$appointment_id = $_POST['appointment_id'];		
				
		$status_pending ='';
		$status_confirmed ='';
		
		if($payment_id!='' && $appointment_id!='')		
		{
			//get payments			
			$order = $bookingultrapro->order->get_order_edit( $payment_id , $appointment_id);
			$order_date =	date('m/d/Y', strtotime($order->order_date));
			
			$order_amount =	$order->order_amount;
			$order_txt_id =	$order->order_txt_id;			
			
		}			
			
		$html .= '<p>'.__('Title:','bookingup').'</p>' ;	
		$html .= '<p><input type="text" id="bup_note_title" value="'.$order_amount.'"></p>' ;
		$html .= '<p>'.__('Text:','bookingup').'</p>' ;	
		$html .= '<p><textarea id="bup_note_text"></textarea></p>' ;		
				
		$html .= '<input type="hidden" id="bup_note_id" value="'.$note_id .'" />' ;
		
		
				
		echo $html;		
		die();
	
	}
 
		
	public function get_admin_module()
	{
		$html='';
				 
		$html .=' <div class="bup-adm-new-appointment">

	<div class="bup-profile-separator">'.__('Notes','bookingup').' </div>

 		<div class="bup-adm-check-av-button"  id="bup-addnote-box-btn" > 
         
       	<button id="bup-adm-add-note" class="bup-button-submit-changes">'.__('Add Note','bookingup').'
		</button>
         
		</div> 

		<div class="bup-adm-bookingnotes-box" id="bup-notes-cont-res" >         
                
                             
    	</div>
</div>	';
		return $html; 
		
	}	
	

}
$key = "note";
$this->{$key} = new BupComplementNote();
?>