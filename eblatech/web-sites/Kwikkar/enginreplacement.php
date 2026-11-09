<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="html 5 template">
	<meta name="author" content="tonytemplates.com">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<title>Kwik Kar Lube and Auto Repair - Transmission</title>
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
	<header class="page-header header-sticky">
		<nav class="navbar" id="slide-nav">
			<div class="container">
				<div class="header-row">
					<div class="logo">
						<a href="index.php"><img src="images/logo.png" alt="Logo"></a>
					</div>
					<div class="header-right">
						<button type="button" class="navbar-toggle"><i class="icon icon-lines-menu"></i></button>
						<div class="header-right-top">
							<div class="address">
								Monday-Friday <span class="custom-color">8:00AM - 7:00PM</span>
							</div>
							<a href="#" class="appointment" data-toggle="modal" data-target="#appointmentForm"><i class="icon-shape icon"></i><span>Appointment</span></a>
						</div>
						<div class="header-right-bottom">
							<div class="header-phone"><span class="text">SCHEDULE YOUR APPOINTMENT TODAY</span><span class="phone-number">1-<span class="code">972</span>-992-7388</span>
							</div>
						</div>
					</div>
				</div>
				<div id="slidemenu">
					<div class="row">
						<div class="col-md-11">
							<div class="close-menu"><i class="icon-close-cross"></i></div>
							<ul class="nav navbar-nav">
								<li><a href="index.php"><span>Home</span></a></li>
								<li class="about"><a href="about.php"><span>About Us</span></a></li>
								<li class="dropdown active">
									<a href="services.php" data-toggle="dropdown" data-submenu=""><span>Services</span><span class="ecaret"></span></a>
									<ul class="dropdown-menu" role="menu">
                                        <li><a href="oil_change.php">Oil Change</a></li>
										<li><a href="scheduled_maintenance.php">Scheduled Maintenance</a></li>
										<li><a href="brake.php">Brake Service</a></li>				
										<li><a href="state_inspection.php">State Inspection</a></li>
										<li><a href="air_conditiong_heating.php">Air conditioning & Heating</a></li>
                                        <li><a href="transmission.php">Transmission</a></li>
                                        <li><a href="enginreplacement.php">Engin replacement</a></li>
									</ul>
								</li>
								<li class="coupons"><a href="coupon.php"><span>Coupons</span></a></li>
								<li class="contact"><a href="contact.php"><span>Contacts</span></a></li>
							</ul>
						</div>
						<div class="col-md-1">
							<div class="search-container">
								<input placeholder="search" type="text">
								<a class="button">
									<i class="icon icon-search"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- // Header -->
    
	<!-- Content  -->
	<div id="pageTitle">
		<div class="container">
			<!-- Breadcrumbs Block -->
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="index.php">Home</a></li>
					<li><a href="services.php">Services</a></li>
					<li>Engim Replacement</li>
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
				<h2 class="h-lg text-center">ENGIN REPLACEMENT</h2>
				<p class="info text-center">The transmission is complicated and important components of your car</p>
				<div class="service-icon">
					<div class="icon-wrapper"><span><i class="icon icon-gearshift"></i></span>
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
						<p>To schedule an appointment with your friendly neighborhood experts at Car Repair Services, give us a call at 1-800-123-4567 or fill out the form below with your information and requested services. One of our team members will get back to you as soon as possible to confirm your appointment. </p>
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
</body>

</html>