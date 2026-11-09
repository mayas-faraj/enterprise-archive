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
								<li class="active"><a href="index.php"><span>Home</span></a></li>
								<li class="dropdown services">
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