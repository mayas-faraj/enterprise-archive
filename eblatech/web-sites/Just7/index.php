<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-112244800-1"></script>
	<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());

	gtag('config', 'UA-112244800-1');
	</script>
	<meta name="google-site-verification" content="dmZ4_n3bRTB6AgeS6XPDAFo1PZId2wdfdIZi-xAZE-c" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Just 7, Auto Repair, State inspection, Oil change">
	<meta name="author" content="kwikkarlewisville.com">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<title>Just7 Carrollton- Oil Change, Auto Repair, State Inspection & more</title>
	<!-- Bootstrap core CSS -->
	<link href="css/plugins/bootstrap.min.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-submenu.css" rel="stylesheet">
	<link href="css/plugins/animate.min.css" rel="stylesheet">
	<link href="css/plugins/slick.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-datetimepicker.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<!-- Icon Font-->
	<link href="iconfont/style.css" rel="stylesheet">
	<link href="Font-Awesome-master\css\font-awesome.css" rel="stylesheet">
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Muli:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Google map -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
</head>

<body class="home">
	<!-- Loader -->
	<div id="loader-wrapper">
		<div class="loader">
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
			<div class="subline"></div>
			<div class="subline"></div>
			<div class="subline"></div>
			<div class="subline"></div>
			<div class="subline"></div>
			<div class="loader-circle-1">
				<div class="loader-circle-2"></div>
			</div>
			<div class="needle"></div>
			<div class="loading">Loading</div>
		</div>
	</div>
	<!-- //Loader -->
    
    <?php
        include('header.php');
        include('slider.php');
		include('servicesbannerblock.php');
    ?>
        
	<!-- Block -->
	<div class="block repairService">
		<div class="container">
			<div class="row">
				<div class="divider-lg visible-sm visible-xs"></div>
				<div class="col-md-6 col-lg-6">
					<h2>About Car Repair Services</h2>
					<p>Our service facility is independently owned and operated providing full-service repair and maintenance services. We use the latest diagnostic equipment to guarantee your vehicle is repaired or serviced properly and in a timely fashion. We are a member of Professional Auto Service, an elite performance network, where independent service facilities share common goals of being world-class automotive service centers.</p>
					<ul class="marker-list-sm marker-list-italic">
						<li>24 Month / 24,000km Nationwide Warranty</li> 
						<li>Courtesy Local Shuttle Service within 5 miles</li>
					</ul>
				</div>
					<div class="col-md-6 col-lg-6"> 
					<div class="coupon">
						<div class="coupon-row">
							<div class="coupon-col-left text-center">
								<div class="coupon-text1">Coupons from</div>
								<div class="coupon-text2"><span>$</span>25<span>off</span></div>
								<div class="coupon-text3">Repairs!</div>
							</div>
							<div class="coupon-col-right text-center">
								<div class="coupon-text4">Our Latest Specials</div>
								<div class="coupon-text5">Any Servcie of $250 or More</div>
								<a href="coupon.php" class="coupon-all">SEE ALL COUPONS<span></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<?php
		include('servicesblock.php');
		include('testimonialsblock.php');
		include('appointmentblock.php');
	?>
        

	</div>
	<!-- // Content  -->

    <?php
        include('footer.php');
    ?>
    
	<div class="darkout-menu"></div>
	<!--Get Form Info-->
	<div class="modal modal-info fade" id="tab1Modal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>The Tires Price</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li><b>Price:</b> $49.95</li>
						<li><b>Your discount:</b> -20%</li>
						<li><b>Total Price:</b> $39.95</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Form Info -->
	<!--Get Form Info-->
	<div class="modal modal-info fade" id="tab2Modal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>Oil Change Price</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li><b>Price:</b> $49.95</li>
						<li><b>Your discount:</b> -20%</li>
						<li><b>Total Price:</b> $39.95</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Form Info -->
	<!--Get Form Info-->
	<div class="modal modal-info fade" id="tab3Modal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>Batteries Price</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li><b>Price:</b> $49.95</li>
						<li><b>Your discount:</b> -20%</li>
						<li><b>Total Price:</b> $39.95</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Form Info -->
	<!--Get Form Info-->
	<div class="modal modal-info fade" id="tab4Modal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>Brakes Price</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li><b>Price:</b> $49.95</li>
						<li><b>Your discount:</b> -20%</li>
						<li><b>Total Price:</b> $39.95</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Form Info -->
	<!--Get Form Info-->
	<div class="modal modal-info fade" id="tab5Modal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>Aligment Price</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li><b>Price:</b> $49.95</li>
						<li><b>Your discount:</b> -20%</li>
						<li><b>Total Price:</b> $39.95</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Form Info -->
    
	<!--Get Recalls-->
	<div class="modal modal-info fade" id="getRecallsModal">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xs-9">
							<h3>Recalls, Investigations & Complaints</h3>
						</div>
						<div class="col-xs-3">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
						</div>
					</div>
				</div>
				<div class="modal-body">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae in, perspiciatis iusto rerum non temporibus tenetur.
					<ul class="marker-list-sm marker-list-italic">
						<li>Lorem ipsum dolor sit amet, consectetur</li>
						<li>Repellendus alias unde tempore assumenda fugiat</li>
						<li>Blanditiis impedit repellat, quos minus dolorem autem</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Get Recalls -->

    <?php
        include('form.php');
    ?>
    
	<!-- External JavaScripts -->
	<script src="js/jquery.js"></script>
	<script src="js/plugins/bootstrap.min.js"></script>
	<script src="js/plugins/slick.min.js"></script>
	<script src="js/plugins/jquery.form.js"></script>
	<script src="js/plugins/jquery.validate.min.js"></script>
	<script src="js/plugins/moment.js"></script>
	<script src="js/plugins/bootstrap-datetimepicker.min.js"></script>
	<script src="js/plugins/jquery.waypoints.min.js"></script>
	<script src="js/plugins/jquery.countTo.js"></script>
	<!-- Custom JavaScripts -->
	<script src="js/custom.js"></script>
	<script src="js/forms.js"></script>
    <script src="js/main.js"></script>
	<script src="js/SliderService.js"></script>
	<script type="text/javascript" src="//cdn.callrail.com/companies/485844452/2882a59eb7747095fb9f/12/swap.js"></script>
</body>

</html>