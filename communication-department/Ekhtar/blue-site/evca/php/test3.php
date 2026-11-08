<?php

	function add($params)
	{
		$a=0;
		foreach($params as $value)
			$a+=$value;
		echo $a;	
	}	

	add(array(4,5,6));

?>
