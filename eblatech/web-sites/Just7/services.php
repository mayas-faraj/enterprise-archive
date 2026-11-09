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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="html 5 template">
	<meta name="author" content="tonytemplates.com">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<title>Just7 Carrollton - Oil Change, Auto Repair, State Inspection - Services</title>
	<!-- Bootstrap core CSS -->
	<link href="css/plugins/bootstrap.min.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-submenu.css" rel="stylesheet">
	<link href="css/plugins/animate.min.css" rel="stylesheet">
	<link href="css/plugins/slick.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-datetimepicker.css" rel="stylesheet">
	<link href="css/custom.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<!-- Icon Font-->
	<link href="iconfont/style.css" rel="stylesheet">
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Muli:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Google map -->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
</head>

<body>
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
    
	<!-- Header -->
		<!-- Header -->
	<header class="page-header header-sticky">
		<nav class="navbar" id="slide-nav">
			<div>
				<div class="header-row">
					<div class="logo">
						<a href="index.php"><img src="images/logo.png" alt="Logo"></a>
					</div>
					<div class="header-right">
						<button type="button" class="navbar-toggle"><i id="sidebarButton" class="icon icon-lines-menu"></i></button>
						<div class="header-right-top">
							<div class="address">
								Monday-Sunday <span class="custom-color">7:00AM - 7:00PM</span>
							</div>
							<a href="tel:972 418 7777" class="appointment"><span><span class="initialNumber">(972)</span>418-7777</span></a>
						</div>
                     <!--   <div class="header-left-bottom">
                           <h6 style="color:white">1299 Justin Road (F.M.407) Carrollton, TX 75077</h6>
                        </div>-->
						<div class="header-right-bottom">
                    <!--   <img src="images/spanish-icon.png" width="50" height="50" align=left alt="hable">-->  
							<div class="header-phone"><!--<span class="text">Call now</span>-->
							<ul class="nav navbar-nav">
								<li><a href="index.php"><span>Home</span></a></li>
								<li class="dropdown services active">
									<a href="services.php" data-toggle="dropdown" data-submenu=""><span>Services</span><span class="ecaret"></span></a>
									<ul class="dropdown-menu" role="menu">
                                        <li><a href="oil-change.php">Oil Change</a></li>
										<li><a href="scheduled-maintenance.php">Scheduled Maintenance</a></li>
										<li><a href="brake.php">Brake Service</a></li>				
										<li><a href="state-inspection.php">State Inspection</a></li>
										<li><a href="air-conditiong-heating.php">Air conditioning & Heating</a></li>
                                        <li><a href="transmission.php">Transmission</a></li>
                                        <li><a href="engine-replacement.php">Engine replacement</a></li>
									</ul>
								</li>
								<li class="coupons"><a href="#" data-toggle="modal" data-target="#appointmentForm"><span>Appointment</span></a></li>
								<li class="coupons"><a href="coupon.php"><span>Coupons</span></a></li>
								<li class="contact"><a href="contact.php"><span>Contacts</span></a></li>
							</ul>
                               
                                <!--<a href="tel:+1-972-317-0234"> <span class="phone-number"><span class="code">(972)</span>317-0234</span></a> -->
                               <!-- <a href="tel:+1-972-317-0234"></a>-->
                            </div>
						</div>
					</div>
				</div>
				
				<?php include('slidemenu.php'); ?>
				
			</div>
		</nav>
	</header>
	<!-- // Header -->
	<!-- // Header -->
     
	<!-- Content  -->
	<div id="pageTitle">
		<div class="container">
			<!-- Breadcrumbs Block -->
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="index.php">Home</a></li>
					<li>Services</li>
				</ul>
			</div>
			<!-- //Breadcrumbs Block -->
			<h1>Services</h1>
		</div>
	</div>
	<div id="pageContent">
		<!-- Services -->
		<div class="block">
			<div class="container">
				<h2 class="h-lg text-center">What We Do</h2>
				<p class="info text-center">We offer full service auto repair & maintenance</p>
				<div class="panel-group">
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq1" >OIL CHANGE<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq1" class="panel-collapse collapse in">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>We offer Conventional, Semi-Sythetic, Full synthetic oils with most common weights from different oil brands such as pennzoil, Mobile1 and others. Our technicians will always provide you with the information about the recommended oil for your car and pricing to maintain the health of your engine and extendes the life of your car.</p>
											<a href="oil-change.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="oil-change.php" class="image-scale-color"><img src="images/service-2-bg.jpg" alt=""></a>
															<i class="icon icon-oil"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq2">SCHEDULED MAINTENANCE<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq2" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>Don't forget the maintenance! It's the little things that count, and checking a few of these little things off your list will put you ahead of the game, and ease the pain in your wallet. Most maintenance checks only take a minute, and most maintenance tasks can be tackled in an afternoon. Don't maintain your car and you'll pay the price down the road.</p>
											<a href="scheduled-maintenance.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="scheduled-maintenance.php" class="image-scale-color"><img src="images/how-works-img-2.jpg" alt=""></a>
															<i class="icon icon-car-wheel"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq3">BRAKE SERVICE<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq3" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>The braking system is easily one of the most important system in your car. Brakes are such a basic function that it’s easy to take them for granted until it’s too late. When you step on the brake, your car transmits the force from your foot to its brakes through a fluid, commanding a stopping force ten times as powerful as the force that puts the car in motion. On most cars, the front brakes are of the disc type, and the rear brakes are of the "drum" type, which use two semi-circular shoes to press outward against the inner surfaces of a steel drum. Older cars often had drum brakes on all four wheels, but many newer cars now have 4-wheel disc brakes.</p>
											<a href="brake.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="brake.php" class="image-scale-color"><img src="images/service-4-bg.jpg" alt=""></a>
															<i class="icon icon-disc-brake"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq4">STATE INSPECTION<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq4" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>You must present proof of insurance at the time of inspection during the driving portion of the State Inspection Test, the vehicle will be checked for steering slack or binding ,horn operation , brake stopping distance and parking brake function.</p>
											<a href="state-inspection.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="state-inspection.php" class="image-scale-color"><img src="images/state-inspection.jpg" alt=""></a>
															<i class="icon icon-engine"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq5">AIR Conditioning<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq5" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>The radiator. Refrigerant runs through the condenser and air flows across its cooling fins, removing heat from the circulating refrigerant. If the fins become damaged or plugged up with debris, air flow is restricted, and that means heat isn't removed properly. Restriction can also cause the vehicle to overheat. Check the fins periodically to make sure they are clean and in good condition.</p>
											<a href="air-conditiong-heating.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="air-conditiong-heating.php" class="image-scale-color"><img src="images/ac.jpg" alt=""></a>
															<i class="icon icon-exhaust-pipe"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="faq-item">
						<div class="panel">
							<div class="panel-heading">
								<h4 class="panel-title"><a role="button" data-toggle="collapse" href="#faq6">Transmission Service<span class="caret-toggle closed">–</span><span class="caret-toggle opened">+</span></a></h4>
							</div>
							<div id="faq6" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4 col-sm-6">
											<p>Transmission fluid acts as a lubricant for all the moving parts in your transmission. Automatic transmission fluid also acts as a coolant and helps transmit power from the engine to the transmission.</p>
											<a href="transmission.php" class="serviceMore">Get This Service</a>
										</div>
										<div class="col-md-4 col-sm-0"></div>
										<div class="col-md-4 col-sm-6">
											<div class="row">
												<div class="col-xs-8 col-md-0 col-sm-0"></div>
												<div class="col-xs-4 col-md-12 col-sm-12">
													<div class="services-block-alt">
														<div class="image">
															<a href="transmission.php" class="image-scale-color"><img src="images/transmission.jpg" alt=""></a>
															<i class="icon icon-gearshift"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-services">
					<div class="text-center">
						<h2 class="h-lg">Vehicle damage? <span class="color">We'll fix it</span></h2>
						<p class="info">We specialise in repairing accident damage to vehicles. In fact, we're the second largest accident damage repair network.</p>
						<h2 class="h-phone">Call: <a href="tel:+1-972-418-7777">(972)418-7777</a></h2>
						<h2 class="h-phone">Fax: <a href="tel:+1-972-418-7778">(972)418-7778</a></h2>
						<div class="btn-inline"><a class="btn btn-invert" href="contact.php"><span>Need help?</span></a></div>
					</div>
				</div>
			</div>
		</div>
		<!-- //Services -->

		<!-- Block -->
		<div class="block offset-sm">
			<div class="container">
                <div class="row">
					<div class="col-sm-12">
                        <h2>Just7 - Oil Change & more </h2>
                        <P>
                            is your local source for a quality full-service oil change & Auto Repair. The Just7 - Oil Change & more certified technicians  bring years of experience to service your car quickly, effectively and with precision. The Just7 - Oil Change & more certification process ensures that people working on, around or under your car are trained experts who know your car and its needs. This commitment to service assures that you and your car get the service you deserve and you will not find a cleaner, more well maintained shop anywheree .
                        </P>    
                        <h1>Services:</h1>
                        <P>
                           Just7 offers a wide array of services for your vehicle. Click on a service below to get a description. <br>Full Service Oil Change & Lube Air Conditioning and Heating 
                            <ul>
                                <li>Air Filtration Replacement</li>
                                <li>Alternators Battery Service</li>
                                <li>Brake</li>
                                <li>Bearings & seal</li>
                                <li>CV Axles</li>
                                <li>Cabin Air Filter</li>
                                <li>Charging Systems</li>
                                <li>Differential Service</li>
                                <li>Engine Repair</li>
                                <li>Emissions Repair</li>
                                <li>Fuel Filter Replacement</li>
                                <li>Fuel Injection Service</li>
                                <li>Fuel System Cleaning</li>
                                <li>Gearbox Service</li>
                                <li>Hose & Belt Replacement</li>
                                <li>Light Bulb Replacement</li>
                                <li>Oil & Gas Caps</li>
                                <li>PCV Valves </li>
                                <li>Radiator Antifreeze/Coolant Service</li>
                                <li>Belt Replacement Service</li>
                                <li>State Inspections</li>
                                <li>Shocks & Struts</li>
                                <li>Starters Tire Rotation</li>
                                <li><a href="">Transmission Service - Tune Ups - Timing Belts - Transfer Case Service</a></li>
                                <li>Wiper Blade Replacement</li>
                                <li><a href="">30, 60, 90,000 Mile Warranty Service</a></li>
                            </ul>    
                    </div>
                </div>
            </div>
        </div>
	</div>
	<!-- // Content  -->
    
    <?php
        include('footer.php');
    ?>
    
	<div class="darkout-menu"></div>
	<!-- Appointment Form -->
	<div class="modal fade" id="appointmentForm">
		<div class="modal-dialog container">
			<div class="modal-content">
				<div class="modal-header"><a href="#" class="appointment" data-toggle="modal" data-target="#appointmentForm"><i class="icon-shape icon"></i><span>Appointment</span></a>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="icon-close-cross"></i></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<h2>Schedule <span class="color">Auto Service</span></h2>
						<p>To schedule an appointment with your friendly neighborhood experts at Car Repair Services, give us a call at (972)418-7777 or fill out the form below with your information and requested services. One of our team members will get back to you as soon as possible to confirm your appointment. </p>
						<div class="divider"></div>
						<form id="appointment-form" class="contact-form form-horizontal" name="contactform" method="post">
							<div id="successAppointment" class="successform">
								<p>Your message was sent successfully!</p>
							</div>
							<div id="errorAppointment" class="errorform">
								<p>Something went wrong, try refreshing and submitting the form again.</p>
							</div>
							<h5>Contact information</h5>
							<div class="form-inline">
								<div>
									<input type="text" name="name" class="form-control input-custom" value="" placeholder="First name">
								</div>
								<div>
									<input type="text" name="lastname" class="form-control input-custom" value="" placeholder="Last name">
								</div>
							</div>
							<div class="form-inline">
								<div>
									<input type="text" name="phone" class="form-control input-custom" value="" placeholder="Phone number">
								</div>
								<div>
									<input type="text" name="email" class="form-control input-custom" value="" placeholder="Your E-mail">
								</div>
							</div>
							<div class="divider"></div>
							<h5>Appointment details</h5>
							<div class="form-inline">
								<div class="datetimepicker-wrap">
									<input type="text" name="date" class="form-control input-custom datetimepicker" placeholder="">
								</div>
								<div class="timepicker-wrap">
									<input type="text" name="time" class="form-control input-custom timepicker" placeholder="">
								</div>
							</div>
							<div class="form-inline">
								<div>
									<input name="autoinfo" type="text" class="form-control input-custom" value="" placeholder="Vehicle Year, Make and Model">
								</div>
								<div class="form-inline">
									<div class="select-wrapper">
										<select name="select1" class="input-custom">
											<option value="2000">2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
										</select>
									</div>
									<div>
										<input name="kilometers" type="text" class="form-control input-custom" value="" placeholder="Current Kilometers">
									</div>
								</div>
							</div>
							<div class="form-inline">
								<textarea name="message" class="form-control textarea-custom" placeholder="Service Required"></textarea>
							</div>
							<div class="divider"></div>
							<div class="row">
								<div class="col-sm-4 col-md-3 bootstrap-datetimepicker-widget">
									<button type="submit" id="submit" class="btn btn-lg"><span>SUBMIT</span></button>
								</div>
								<div class="divider visible-xs"></div>
								<div class="col-sm-8 col-md-9">
									<p><i>Please note that the date and time you requested may not be available. We will contact you to confirm your actual appointment details.</i></p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Appointment Form -->

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
</body>

</html>