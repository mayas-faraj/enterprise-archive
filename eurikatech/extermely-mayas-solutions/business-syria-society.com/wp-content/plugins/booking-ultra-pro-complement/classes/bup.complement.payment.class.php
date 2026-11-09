<?php
class BupComplementPayment
{
	
		
	public function __construct()
	{		
		
					
	
    }	
 
		
	public function get_payments_module()
	{
		$html='';
				 
		$html .=' <div class="bup-adm-new-appointment">

	<div class="bup-profile-separator">'.__('Payments','bookingup').' </div>

 		<div class="bup-adm-check-av-button"  id="bup-addpayment-box-btn" > 
         
       	<button id="bup-adm-add-payment" class="bup-button-submit-changes">'.__('Add Payment','bookingup').'
		</button>
         
		</div> 

		<div class="bup-adm-bookinginfo-box" id="bup-payments-cont-res" >         
                
                             
    	</div>
</div>	';
		return $html; 
		
	}	
	
	public function get_payments_module_by_staff($payment_button = true)
	{
		$html='';
				 
		$html .=' <div class="bup-adm-new-appointment">
		
		<span class="bup-main-close-open-tab"><a href="#" title="'.__('Close','bookingup').'" class="bup-widget-home-colapsable" widget-id="1"><i class="fa fa-sort-desc" id="bup-close-open-icon-1"></i></a></span>

		<div class="bup-profile-separator">'.__('Payments','bookingup').' </div>
		
		
		<div id="bup-staff-box-cont-1" > ';
	
            if($payment_button)
			{
				$html .='	<div class="bup-adm-check-av-button"  id="bup-addpayment-box-btn" > 
			 
			<button id="bup-adm-add-payment" class="bup-button-submit-changes">'.__('Add Payment','bookingup').'
			</button>
			 
			</div> 		';	
			
			}
	
		$html .='	<div class="bup-adm-bookinginfo-box" id="bup-payments-cont-res" >  </div>
		
		</div> 
		
		
		
</div>	';
		return $html; 
		
	}	
	
	
	
	
	

}
$key = "payment";
$this->{$key} = new BupComplementPayment();
?>