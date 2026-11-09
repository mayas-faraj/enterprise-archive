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
	<title>Just7  Carrollton- Oil Change, Auto Repair, State Inspection - Oil Change</title>
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

	<!-- Header 
		Header -->
	<!-- <header class="page-header header-sticky">
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
							<a href="#" class="appointment"><span><span class="initialNumber">(972)</span>418-7777</span></a>
						</div>
                     
						<div class="header-right-bottom">
                 
							<div class="header-phone"> 
							<ul class="nav navbar-nav">
								<li><a href="index.php"><span>Home</span></a></li>
								<li class="dropdown services active">
									<a href="services.php" data-toggle="dropdown" data-submenu=""><span>Services</span><span class="ecaret"></span></a>
									<ul class="dropdown-menu" role="menu">
                                        <li><a href="oil_change.php">Oil Change</a></li>
										<li><a href="scheduled_maintenance.php">Scheduled Maintenance</a></li>
										<li><a href="brake.php">Brake Service</a></li>				
										<li><a href="state_inspection.php">State Inspection</a></li>
										<li><a href="air_conditiong_heating.php">Air conditioning & Heating</a></li>
                                        <li><a href="transmission.php">Transmission</a></li>
                                        <li><a href="engine_replacement.php">Engine replacement</a></li>
									</ul>
								</li>
								<li class="coupons"><a href="#" data-toggle="modal" data-target="#appointmentForm"><span>Appointment</span></a></li>
								<li class="coupons"><a href="coupon.php"><span>Coupons</span></a></li>
								<li class="contact"><a href="contact.php"><span>Contacts</span></a></li>
							</ul>
                               
                               
                            </div>
						</div>
					</div>
				</div>
				
				<?php include('slidemenu.php'); ?>
				
			</div>
		</nav>
	</header>-->
	<!-- // Header -->
	<!-- // Header -->
     <?php
        include('header.php');
        
    ?>
	<!-- Content  -->
	<div id="pageTitle">
		<div class="container">
			<!-- Breadcrumbs Block -->
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="index.php">Home</a></li>
					<li><a href="services.php">Services</a></li>
					<li>Oil Change</li>
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
				<h2 class="h-lg text-center">Oil Change</h2>
				<p class="info text-center">The best way to minimize breakdowns is doing routine maintenance</p>
				<div class="service-icon">
                    <div class="icon-wrapper"><span><i class="icon icon-oil"></i></span>
					</div>
				</div>
			</div>
		</div>
		<!-- //Services -->
		<!-- Block -->
		<div class="block offset-sm">
			<div class="container">
				<div class="text-center">
					<h3 class="text-center">An oil change can really change your mood.<br>And it will definitely change your oil.</h3>
				</div>
				<div class="row">
					<div class="col-sm-6">
                        <h4 class="title">Full Service Oil Change includes:</h4>
						<ul class="marker-list-sm">
							<li>Change Oil Up To 5 Quarts</li>
							<li>Install New Oil Filter</li>
							<li>Check Air Filter</li>
							<li>Check Wiper Blades</li>
							<li>Check & Fill Brake Fluid Level</li>
                            <li>Check Exterior Lights</li>
                            <li>Check all Belt</li>
                            <li>Vacuum front Interior</li>       
                            <li>Install New Oil Plug Gasket**</li>		
                            <li>Lubricate Chassis (when applicable)</li>
                            <li>100% Satisfaction Guarantee</li>
						</ul>
					</div>
					<div class="col-sm-6">
					   <h4 class="title">As Needed:</h4>
						<ul class="marker-list-sm">
							<li>Check & Fill Antifreeze/Coolant</li>
							<li>Check & Fill Transmission/Transaxle Fluid*</li>
							<li>Check & Fill Differential Fluid* (when applicable)</li>
							<li>Check & Fill Transfer Case Fluid* (when applicable)</li>
                            <li>Check & Fill Power Steering Fluid</li>
                            <li>Check & Fill Windshield Washer Fluid</li>
                            <li>Inflate Tires to Proper Pressure</li>
                            <li>Check Cabin Air Filter</li>
                            <li>Note Unusual Conditions</li>
							<li>Battery Check</li>
						</ul>
					</div>
				</div>
                <br>
                <div class="row">
					<div class="col-sm-12">
                        <p>At Just7 , We believe that time is money. Our Oil changes are fast and reliable to suit your time.
                        </p>
                        <p>
                            We offer Conventional, Semi-Sythetic, Full synthetic oils with most common weights from different oil brands such as pennzoil, Mobile1 and others. Our technicians will always provide you with the information about the recommended oil for your car and pricing to maintain the health of your engine and extendes the life of your car.
                        </p>
                    </div>
                </div>
				<div class="divider-lg"></div>
				<div class="row">
					<div class="col-sm-4">
						<div class="text-icon-sm">
							<a href="#" class="icon-wrapper" data-toggle="modal" data-target="#appointmentForm"><span><i class="icon icon-calendar"></i><span class="icon-hover"></span></span></a>
							<h4 class="title">Appointments</h4>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="text-icon-sm form-popup-wrap">
							<a href="#" class="icon-wrapper form-popup-link"><span><i class="icon icon-technology"></i><span class="icon-hover"></span></span></a>
							<div class="form-popup">
								<form id="quote-form" method="post">
									<div id="successQuote" class="successform">
										<p>Your message was sent successfully!</p>
									</div>
									<div id="errorQuote" class="errorform">
										<p>Something went wrong, try refreshing and submitting the form again.</p>
									</div>
									<div class="form-inline">
										<input type="text" name="name" class="form-control input-custom" value="" placeholder="Your Name">
									</div>
									<div class="form-inline">
										<div>
											<input type="text" name="email" class="form-control input-custom" value="" placeholder="Your E-mail">
										</div>
										<div>
											<input type="text" name="phone" class="form-control input-custom" value="" placeholder="Phone number">
										</div>
									</div>
									<div class="form-inline">
										<div class="select-wrapper">
											<select name="select1" class="input-custom">
												<option value="Vehicle">Vehicle</option>
												<option value="Car">Car</option>
												<option value="Bike">Bike</option>
											</select>
										</div>
										<div class="select-wrapper">
											<select name="select2" class="input-custom">
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
									</div>
									<div class="form-inline">
										<div class="select-wrapper">
											<select name="select3" class="input-custom">
												<option value="">Choose service</option>
												<option value="Preventative Maintenance">Preventative Maintenance</option>
												<option value="Brake Repair">Brake Repair & Service</option>
												<option value="Transmission Service">Transmission Service & Repair</option>
											</select>
										</div>
									</div>
									<div class="form-inline">
										<textarea name="message" class="form-control textarea-custom" placeholder="Your comment"></textarea>
									</div>
									<button type="submit" id="submit" class="btn btn-lg btn-full"><span>get a quote</span></button>
								</form>
							</div>
							<h4 class="title">Estimates</h4>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="text-icon-sm">
							<a href="coupon.php" class="icon-wrapper"><span><i class="icon icon-diploma"></i><span class="icon-hover"></span></span></a>
							<h4 class="title">Coupon</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- // Block -->
		<!-- Block -->
		<div class="block full-block">
			<div class="container-fluid">
				<div class="row service-row">
					<div class="col-sm-6">
						<div class="service-row-text">
							<h2>Trust Our Products</h2>
							<p>For over 60 years, Car Repair Service has been helping drivers across North America maintain their vehicles. With ASE-certified mechanics in all of our stores, we can take care of all of your auto repair and maintenance needs. From oil changes, filter replacements, and fluid flushes to brakes and brake repair, shocks and struts, muffler repair, tires, and wheel alignment, we’ve got you covered.</p>
							<p>Use the quick links in the gold bar to book an appointment at your Car Repair Service store today!</p>
						</div>
					</div>
					<div class="divider visible-xs"></div>
					<div class="col-sm-6">
						<div class="service-row-image" data-bg="images/services-4-img.jpg"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- // Block -->
		<!-- Block -->
		<div class="block">
			<div class="container">
				<div class="text-center">
					<h2 class="text-center">Oil Change – More than You Wanted to Know</h3>
				</div>
				<p><strong>Engine Oil</strong><br>
  Most cars on the road today use multi-grade oil — one that can work efficiently in cold and hot weather. A multi-grade oil is rated by two numbers, such as 5W-30.</p>
<p><strong>About the oil classification system.</strong><br>
Each engine oil comes with a classification indicating its viscosity, which is its friction or resistance to flow. In a multi-grade oil, the first number indicates how the oil will flow when it is cold. The lower the number, the lighter the oil and the better it will perform at lower temperatures. The second number indicates the thickness of that same oil at high temperatures. For example, a 5W-30 oil will flow as a 5-weight oil at zero degrees Fahrenheit and as a 30-weight oil at 210 degrees Fahrenheit</p>
<p><strong>Why viscosity is a concern.</strong><br>
During cold starting, only a small amount of oil is present in the upper parts of engines. To lessen the friction when upper engine parts, such as the valve train, pistons, overhead cam and cam bearings, scrub against each other, a lower viscosity allows the oil to reach the components more quickly.</p>
<p><strong>Why 5W-30 and 5w-20 oils are so popular.</strong><br>
  Many vehicles today leave the factory with 5W-30 or 5w-20 engine oil. Vehicle manufacturers recommend them because they are lighter oils that perform well in a range of temperatures and help improve gas mileage.</p>
<p><strong>Synthetic Oils</strong><br>
  Not all motor engine oils are 100% petroleum. Synthetic oils, which are primarily chemically compounded lubricants, are also available. They can provide:</p>
<ul class="marker-list-sm">
  <li> Higher viscosity stability over a wider temperature range</li>
  <li>Reduced oil thickening</li>
  <li>Reduced wear and increased load-carrying ability.</li>
</ul>
<p><strong>Which oil is right for your car?</strong><br>
  The simplest and safest way to find out is to check your owner's manual...or talk to your Midas mechanic.</p>
<p><strong>Oil Filters</strong><br>
  Oil filters are designed to trap foreign particles suspended in the oil and prevent them from getting to the engine bearings and other parts.</p>
<p><strong>Fluids</strong><br>
  Your vehicle relies on a variety of fluids to operate its brake, steering, transmission, engine cooling and other systems. When these fluids become degraded or are at incorrect levels, damage to other components may occur...so always follow the manufacturer-recommended service schedule.</p>
<p><strong>Automatic Transmission Fluid</strong><br>
  This is typically an oil-based fluid used in a transmission that lubricates and cools the transmission and provides hydraulic pressure to shift gears automatically.</p>
<p><strong>Brake Fluid</strong><br>
  This is the hydraulic fluid used to transmit pressure through the brake lines in a brake system providing stopping power and protecting hydraulic brake components from internal corrosion.</p>
<p><strong>Coolant/Antifreeze</strong><br>
  This is the mixture of water and antifreeze used in an engine cooling system to dissipate heat and maintain the engine's temperature throughout its operating range.</p>
<p><strong>Starting &amp; Charging</strong><br>
  The battery starts your car, powers on-board computers and supplies emergency power needs. A weakened battery causes stress on alternators and starters, especially during extreme temperatures. Let Midas test and inspect your battery regularly.</p>
<p><strong>Air Filters</strong><br>
  Clean air filters can increase engine performance, boost fuel mileage and reduce engine wear. Cabin air filters can minimize airborne contaminants in the passenger compartment and improve heating/cooling efficiency.</p>
<p><strong>Touch® Courtesy Check</strong><br>
  The Midas Touch® Courtesy Check is fast, efficient and covers many items on your vehicle’s preventive maintenance schedule. We’ll conduct a visual check, looking inside, outside, under the hood and under the vehicle, then provide you with a written report.</p>
			</div>
		</div>
		<!-- // Block -->
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
	<script type="text/javascript" src="//cdn.callrail.com/companies/485844452/2882a59eb7747095fb9f/12/swap.js"></script>
</body>

</html>