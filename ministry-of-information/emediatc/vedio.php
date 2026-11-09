<?php
require_once('connections/fpack.php');
require_once("class/function.php");

$query_company = mysql_query("select * from video_details  WHERE  appear ='1'  order by  numeric_order limit 0,6 ") or die ("No Select");
    $total = mysql_num_rows($query_company);
	if($total > 0) {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl"><head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>rcarousel – Auto mode</title>
<link type="text/css" rel="stylesheet" href="js/JqSlideVedio/rcarousel.css">
<style type="text/css">
	#container {
		width: 420px;
		position: relative;
	}
	
	#carousel {
		margin: 0 auto;
	}

	#carousel img {
		border: 0;
	}

	#ui-carousel-next, #ui-carousel-prev {
		width: 60px;
		height: 100px;
		background: url(images/arrow-left.png) #fff center center no-repeat;
		display: block;
		position: absolute;
		top: 0;
		z-index: 100;
	}

	#ui-carousel-next {
		right: 0;
		background-image: url(images/arrow-right.png);
	}

	#ui-carousel-prev {
		left: 0;
	}
	
	#ui-carousel-next > span, #ui-carousel-prev > span {
		display: none;
	}		
</style>
</head>
	<body>
    
     <div id="container">
	      <div style="width: 300px; overflow: hidden; height: 100px;" class="ui-carousel" id="carousel">
          <div class="wrapper">
			<?php 
			while($row_company = mysql_fetch_assoc($query_company)) { 
			$path = "thumb_photo/";
			$namePic = ProtectHTML($row_company["prod_img_1"]);
			$alt_pic = ProtectHTML($row_company["prod_name[$lang]"]);
			$scale = 128;
			$scale_height=67;	
			?>
            <img style="width: 91px; height: 61px; margin-right: 8px; cursor: pointer" src="<?=$path.$namePic?>" >
            <?php }//end while
			 mysql_free_res($query_company);
			?>
		  </div>
          </div>
				<a style="opacity: 1;" href="#" id="ui-carousel-next"><span>next</span></a>
				<a href="#" id="ui-carousel-prev"><span>prev</span></a>
		</div>
    
<script type="text/javascript" src="js/JqSlideVedio/jquery-1.js"></script>
<script type="text/javascript" src="js/JqSlideVedio/jquery_003.js"></script>
<script type="text/javascript" src="js/JqSlideVedio/jquery_002.js"></script>
<script type="text/javascript" src="js/JqSlideVedio/jquery.js"></script>
<script type="text/javascript">
	jQuery(function( $ ) {
		$( "#carousel" ).rcarousel({
			auto: {
				enabled: true,
				interval: 3000,
				direction: "prev"
			}
		});
		
		$( "#ui-carousel-next" )
			.add( "#ui-carousel-prev" )
			.hover(
				function() {
					$( this ).css( "opacity", 0.7 );
				},
				function() {
					$( this ).css( "opacity", 1.0 );
				}
			);				
	});
</script>
<?php }//end if?>
</body></html>