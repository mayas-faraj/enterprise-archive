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
	<title>Car Repair Services & Auto Mechanic HTML website template</title>
	<!-- Bootstrap core CSS -->
	<link href="css/plugins/bootstrap.min.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-submenu.css" rel="stylesheet">
	<link href="css/plugins/animate.min.css" rel="stylesheet">
	<link href="css/plugins/slick.css" rel="stylesheet">
	<link href="css/plugins/bootstrap-datetimepicker.css" rel="stylesheet">
	<link href="css/plugins/nouislider.css" rel="stylesheet">
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
    
    <?php
        include('header.php');
    ?>
    
	<!-- Content  -->
	<div id="pageTitle">
		<div class="container">
			<!-- Breadcrumbs Block -->
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>Shop</li>
				</ul>
			</div>
			<!-- //Breadcrumbs Block -->
			<h1>Our Shop</h1>
		</div>
	</div>
	<div id="pageContent">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-3 column-left column-filters">
					<div class="column-filters-inside">
						<div class="side-block">
							<h3>Categories</h3>
							<ul class="category-list">
								<li><a href="#">Audios  <span>(2)</span></a></li>
								<li><a href="#">Daily Inspiration  <span>(7)</span></a></li>
								<li><a href="#">Freelance  <span>(3)</span></a></li>
								<li><a href="#">Links  <span>(1)</span></a></li>
								<li><a href="#">Mobile  <span>(1)</span></a></li>
								<li><a href="#">Photography  <span>(5)</span></a></li>
								<li><a href="#">Quotes  <span>(1)</span></a></li>
								<li><a href="#">Resources  <span>(3)</span></a></li>
								<li><a href="#">Status  <span>(1)</span></a></li>
							</ul>
						</div>
						<div class="side-block">
							<h3>Price</h3>
							<div class="range">
								<div id="rangeSlider1"></div>
								<p>Price: $<span id="number-1-2"></span> - $<span id="number-1-1"></span></p>
							</div>
						</div>
						<div class="side-block">
							<h3>Popular</h3>
							<div class="prd-sm">
								<div class="prd-sm-img">
									<a href="product.html"><img src="images/shop-product-popular-1.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="prd-sm-info">
									<h3><a href="product.html">Hub Bearing</a></h3>
									<div class="price">$188.79</div>
								</div>
							</div>
							<div class="prd-sm">
								<div class="prd-sm-img">
									<a href="product.html"><img src="images/shop-product-popular-2.jpg" class="img-responsive" alt=""></a>
								</div>
								<div class="prd-sm-info">
									<h3><a href="product.html">Gasoline High Pressure Pump</a></h3>
									<div class="price">$19.99</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8 col-lg-9 column-center">
					<div class="filters-row">
						<div class="filters-row-left"><span>Showing 1–9 of 18 results</span>
							<div class="form-inline">
								<div class="select-wrapper">
									<select name="select">
										<option value="">Default Sorting</option>
										<option value="">Sort By Price</option>
										<option value="">Sort By Name</option>
									</select>
								</div>
							</div>
						</div>
						<div class="filters-row-right">
							<div class="simple-pagination">
								<span>Pages:</span>
								<a class="active" href="#">1</a>
								<a href="#">2</a>
								<a href="#">&raquo;</a>
							</div>
						</div>
					</div>
					<div class="prd-grid">
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-1.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Oxygen (O2) Sensor</a></h3>
								<div class="price">$19.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-2.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Knock Sensor</a></h3>
								<div class="price">$188.79</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-3.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Hub Bearing</a></h3>
								<div class="rating rating-4"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></div>
								<div class="price">$109.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-4.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Gasoline High Pressure Pump</a></h3>
								<div class="rating rating-4"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></div>
								<div class="price">$39.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-5.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Fuel Pressure Sensor</a></h3>
								<div class="price">$7.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-6.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Exhaust Systems</a></h3>
								<div class="price">$39.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-7.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Universal Clamp-on Chrome Air Filter</a></h3>
								<div class="price">$5.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-8.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Crankshaft Position Sensor</a></h3>
								<div class="price">$38.88</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
						<div class="prd">
							<div class="prd-img">
								<a href="product.html"><img src="images/shop-prd-9.jpg" class="img-responsive" alt=""></a>
							</div>
							<div class="prd-info">
								<h3><a href="product.html">Clutch Replacement Kit</a></h3>
								<div class="price">$69.99</div>
								<a href="#" class="btn btn-invert"><span><i class="icon-shop-cart"></i>Add To Cart</span></a>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="text-center">
						<ul class="pagination">
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
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
	<script src="js/plugins/nouislider.min.js"></script>
	<!-- Custom JavaScripts -->
	<script src="js/custom.js"></script>
	<script src="js/forms.js"></script>
    <script src="js/main.js"></script>
</body>

</html>