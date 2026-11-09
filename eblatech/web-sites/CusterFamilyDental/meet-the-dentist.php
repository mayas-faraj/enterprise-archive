<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <title>Meet The Dentist - Dentologist</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/swiper.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/responsive.css" type="text/css">
    <link rel="shortcut icon" href="images/fav/favorit.gif" type="image/x-icon">
<meta name="keywords" content="Custer, Dental, Keywords">
<meta name="description" content="Page Meta Description Comes here">
</head>
<body>

<?php

    $page = (!isset($_GET['page']) || empty($_GET['page'])) ? 'index.php' : $_GET['page'];
    if ($page=='index.php')
    {
        $home='index.php';
        $news='index.php#news';
        $about = 'index.php#aboutus';
        $meetus = 'index.php#meetus';
        $technology = 'index.php#technology';
        $contactus = 'index.php#contact-us';
    }
?>


<!--header section starts here-->
<header>
	<div class="hidden-sm hidden-md hidden-lg">
		<div id="MobileSticky" class="row grey-bg ">
			<div class="col-sm-4 col-sx-4">
				<nav class="navbar navbar-default ">
					<div class="container-fluid">
						<div class="navbar-header">
							<span class="col-sx-3  pull-left">
								<a href="tel:+1-972-532-3635" class="btn"><i class="fa fa-phone fa-2x"></i> 972-532-3635</a>
							</span>
							<span class="col-sx-3  pull-left">
								<a href="https://www.google.com/maps/place/5131+S+Custer+Rd+%23105,+McKinney,+TX+75070/@33.1629765,-96.7350586,17z/data=!3m1!4b1!4m5!3m4!1s0x864c160bd0f13aa7:0x472971873ef9a5d0!8m2!3d33.1629765!4d-96.7328699?hl=en" target="_blank" class="btn"> <i class="fa fa-map-signs fa-2x"></i> Map</a> 
							</span>
							<button id ="show" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu-dropdown" aria-expanded="false" style="margin-top:0px;">
				  				<span class="sr-only">Toggle navigation</span> 
				  				<span class="icon-bar"></span>
				  				<span class="icon-bar"></span>
				  				<span class="icon-bar"></span> 
							</button>
                            </div>
                    </div>
				</nav>
			</div>
		</div>
		<div class="collapse navbar-collapse" id="main-menu-dropdown">
			<ul class="main-menu text-center">
				<li class="current-menu-item">
					<a href="<?=$home?>" class="btn-default">Home</a> </li>
				<li class="about"><a href="<?=$about?>" class="btn-default">About Us 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
                <li class="meet"><a href="<?=$meetus?>" class="btn-default">Meet Us 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
				<li class="tech"><a href="<?=$technology?>" class="btn-default">Technology
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a></li>
                 <li class="news"><a href="<?=$news?>" class="btn-default">News 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
				<li class="general"><a href="generaldentistry.php" class="btn-default">General Dentistry
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
				<li class="ortho"><a href="ortho.php" class="btn-default">Ortho
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a>
				</li>
				<li class="kids"><a href="kids.php" class="btn-default">Kids
<!--
					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg">
					</i>
-->
					</a> </li>
                
                <li class="Visit"><a href="new-visit.php" class="btn-default">New Patient
                           </a></li>
                
				<li class="contact">
					<a href="<?=$contactus?>" class="btn-default ">Schedule Now
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>

			</ul>
		</div>
		<div class="row">
			<div  class="col-md-4 col-sm-12 col-xs-12 ">
				<a href="index.php" class="brand">
					<img src="images/logo-300.jpg" alt="Custer Dental" title="Custer Dental" class="img-responsive"></a>
			</div>
		</div>

	</div>
	<div class="hidden-xs">
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-6">
				<a href="index.php" class="brand">
					<img style="margin:3px 5px 3px 5px"src="images/logo-300.jpg" alt="Custer Family Dental" title="Custer Family Dental" class="img-responsive"></a>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-6">
				<span class="col-sx-3  pull-right">
							<a href="tel:+1-972-532-3635" class="btn">
					<i class="fa fa-phone "></i> 972-532-3635
				</a> 
						</span>
				<span class="col-sx-3  pull-right"><a href="https://www.google.com/maps/place/5131+S+Custer+Rd+%23105,+McKinney,+TX+75070/@33.1629765,-96.7350586,17z/data=!3m1!4b1!4m5!3m4!1s0x864c160bd0f13aa7:0x472971873ef9a5d0!8m2!3d33.1629765!4d-96.7328699?hl=en" target="_blank" class="btn">
					 <i class="fa fa-map-signs "></i> Map
					</a> </span>
			</div>
			
			<div class="hidden-sm hidden-md hidden-lg col-xs-4 list-inline">
				<div class="">
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-facebook  "></i></a></li>
						<li><a href="#"><i class="fa fa-twitter "></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus "></i></a></li>
					</ul>
				</div>
			</div>
			<div class="pull-right col-xs-2 hidden-sm hidden-md hidden-lg">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu-dropdown" aria-expanded="false" style="margin-top:0px;"> 
				  <span class="sr-only">Toggle navigation</span> 
				  <span class="icon-bar"></span> 
				  <span class="icon-bar"></span> 
				  <span class="icon-bar"></span> </button>
						</div>
					</div>
				</nav>
			</div>
            
			<div class="col-md-7 col-sm-12 col-xs-12">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="collapse navbar-collapse" id="main-menu-dropdown">
							<ul class="main-menu text-center">
								<li>
									<a href="<?=$home?>" class="btn-default">Home</a> </li>      
								<li class="about"><a href="<?= $about ?>" class="btn-default">About Us 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>

                    <li class="meet"><a href="<?=$meetus?>" class="btn-default">Meet Us 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
								<li class="tech"><a href="<?=$technology?>" class="btn-default">Technology
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a></li>
                                 <li class="news"><a href="<?= $news ?>" class="btn-default">News 
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
								<li class="general"><a href="generaldentistry.php" class="btn-default">General Dentistry
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>
								<li class="ortho"><a href="ortho.php" class="btn-default">Ortho
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a>
								</li>
					<li class="kids"><a href="kids.php" class="btn-default">Kids
<!--
					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg">
					</i>
-->
					</a> </li>
                       <li class="Visit"><a href="new-visit.php" class="btn-default">New Patient
                           </a></li>
                                
					<li class="contact">
									<a href="<?=$contactus?>" class="btn btn-default">Schedule Now
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a> </li>


							</ul>
						</div>
					</div>
				</nav>

			</div>
		</div>
	</div>


	<!-- Breadcrumb starts here -->
	<div class="container">
		<div class="row " style="display:none">
			<div class="col-md-8 col-sm-12 col-xs-12 pull-right">
				<div class="pull-right">
					<ul class="list-inline sm-text-center mt-5">
						<li><a href="https://www.facebook.com/Custer-Family-Dental-Ortho-Kids-1830215266992699/" target="_blank"><i class="fa fa-facebook text-white"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus text-white"></i></a></li>
					</ul>
				</div>

				<div class="pull-right">
					<a href="https://www.google.com/maps/place/5131+S+Custer+Rd+%23105,+McKinney,+TX+75070/@33.1629765,-96.7350586,17z/data=!3m1!4b1!4m5!3m4!1s0x864c160bd0f13aa7:0x472971873ef9a5d0!8m2!3d33.1629765!4d-96.7328699">5131 S. Custer Rd Ste 105 McKinney, TX 75070 </a>
				</div>

				<div class="pull-right">
					<i class="fa fa-phone text-white"></i> <a class="text-white" href="tel:+1-972-532-3635">+972-532-3635</a> <i class="fa fa-fax text-white"></i> <a class="text-white" href="tel:+1-972-532-3960">+972-532-3960</a>
				</div>

			</div>
		</div>

	</div>
	<!-- Breadcrumb ends here -->
</header>
<!--header section ends here-->
    
<!-- sticky header section starts here-->
<header class="stuck up hidden-xs hidden-sm">
  <div class="">
    <div class="row">
      <div class="col-md-4"><a href="index.php" class="brand"><img src="images/CusterFamilyDental_Logo-01-Sticky.png" alt="logo"></a></div>
      <div class="col-md-8">
        <ul class="main-menu">
                <li><a href="<?=$home?>" class="btn-default">Home</a>
                </li>
                <li class="about"><a href="<?=$about?>" class="btn-default">About Us<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="meet"><a href="<?=$meetus?>" class="btn-default">Meet Us<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="tech"><a href="<?=$technology?>" class="btn-default">Technology<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="news"><a href="<?=$news?>" class="btn-default">News<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="general"><a href="generaldentistry.php" class="btn-default">General Dentistry<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="ortho"><a href="ortho.php" class="btn-default">Ortho<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="kids"><a href="kids.php" class="btn-default">Kids<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                <li class="Visit"><a href="new-visit.php" class="btn-default">New Patient<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                <li class="contact"><a href="<?=$contactus?>" class="btn-default">Schedule Now </a>
                </li>
			
        </ul>
      </div>
    </div>
  </div>
</header>
<!-- sticky header section ends here-->

<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i></button>
    <style>
    #myBtn {
    display: none; /* Hidden by default */
    position: fixed; /* Fixed/sticky position */
    bottom: 20px; /* Place the button at the bottom of the page */
    right: 30px; /* Place the button 30px from the right */
    z-index: 99; /* Make sure it does not overlap */
    border: none; /* Remove borders */
    outline: none; /* Remove outline */
    background-color: cadetblue; /* Set a background color */
    color: white; /* Text color */
    cursor: pointer; /* Add a mouse pointer on hover */
    padding: 15px; /* Some padding */
    border-radius: 10px; /* Rounded corners */
}

#myBtn:hover {
    background-color: #555; /* Add a dark-grey background on hover */
}
    </style>
    
    <script>// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
    document.documentElement.scrollTop = 0; // For IE and Firefox
}</script>
    
<!--  doctor Intro Section Starts here -->
<sectionm id="Dr.houari" class="dr-intro padding-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/Ibrahim%20Houari%20DDS%20McKinney%20Dentist.jpg" alt="Team member" class="img-responsive width-400 display-inline-xs">
            </div>
            <div class="col-md-8 col-sm-8">
                <p class="link-color text-uppercase margin-top-xs">General Dentist</p>
                <h1 class="heading-bottom heading-full text-left no-margin-top">Dr. Ibrahim Houari<a href="tel:+1-972-532-3635" class="font-18"><i class="fa fa-phone" aria-hidden="true"></i></a> <a href="mailto:info@custerdental.com?Subject=Book an appointment" class="font-18"><i class="fa fa-envelope" aria-hidden="true"></i></a></h1>

               <!-- <p class="designation">DDS</p>-->
        
            </div>
        </div>
    </div>
</section>
<!--  doctor Intro Section Ends here -->

<section class="achievement-cert padding-section grey-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
         <!--   <h2 class="text-center no-margin-top">Achievements & Certificates</h2>-->
            <ul class="list-unstyled list-bordered">
                <li>Born in Chicago, Illinois, but raised in Plano, Texas, Dr. Houari is a true Texan at heart! Growing up he attended Plano Senior High School where he was varsity soccer captain.</li>
            <li>
            <p>While the prospect of pursuing soccer professionally was appealing to Dr. Houari, he knew from an early age that dentistry was his true calling. So, he put his soccer pursuits aside and concentrated on becoming a dentist. He attended the University of Texas at Dallas for his undergraduate career where he graduated with honors. He then attended the University of Texas Health Science Center at San Antonio for his Doctorate of Dental Surgery where he also graduated with honors. Throughout his dental career Dr. Houari has been practicing and advocating quality dental care for all patients.</p>
            </li>
            <li>
           	<p>Though Dr.Houari loved his time in San Antonio, he always knew that Dallas was where he wanted to settle down. He hopes to continue to serving his patients in the McKinney/Frisco area for a very long time to come. During his free time, Dr. Houari enjoys playing soccer, working out, exploring his hometown of Dallas, spending time with family, and rooting for his Dallas Cowboys!</p>
            </li>
                <li><p>
                Dr. Houari is a part of many dental organization including, the <a href="http://www.ada.org/en" target="_blank">ADA</a>, the <a href="https://www.agd.org/" target="_blank">Academy of General Dentistry</a>, the <a href="http://www.tda.org/" target="_blank">Texas Dental Association</a>, & <a href="http://www.ntds4.com/" target="_blank">North Texas Dental Society</a>.
            </p></li>
            </ul>
			</div>
		</div>
	</div>
</section>

<!--  doctor Intro Section Starts here -->
<section id="Dr.Nitin" class="dr-intro padding-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/nitin.jpg" alt="Team member" class="img-responsive width-400 display-inline-xs">
            </div>
            <div class="col-md-8 col-sm-8">
                <p class="link-color text-uppercase margin-top-xs">Orthodontist Specialist</p>
                <h1 class="heading-bottom heading-full text-left no-margin-top">Dr. Nitin Malhotra</h1>

            <!--    <p class="designation">DDS</p>-->
        
            </div>
        </div>
    </div>
</section>
<!--  doctor Intro Section Ends here -->

<section class="achievement-cert padding-section grey-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
         <!--   <h2 class="text-center no-margin-top">Achievements & Certificates</h2>-->
            <ul class="list-unstyled list-bordered">
                <li>Dr. Malhotra received his doctorate degree from Temple University School of Dentistry in 2005 followed by an orthodontic residency at the University of Colorado in 2008. Following his 10 years' worth of experience in multiple locations and multiple cities, Dr. Malhotra decided to bring his talents to Custer Dental & Ortho + kids in McKinney, TX.</li>

                <li>Over his many years of experience, Dr. Malhotra has refined his orthodontic skills by continuing to persuade further education of the highest level. Dr. Malhotra is a part of many dental and orthodontic organizations including the American Association of Orthodontists, Southwestern Society of Orthodontists, American Dental Association, Texas Dental Association, Dallas County Dental Society, Dallas Indo-American Dental Association, American Orthodontic Society and World Federation of Orthodontists.</li>

                <li>During his free time, Dr. Malhotra enjoys volleyball, hiking, traveling, and being a DJ. Enjoys giving back to the community with multiple community events and organizations that he works with.</li>

                <li><p>Dr. Malhotra is a part of many dental organization including, the 
                <a href="http://www.aaoinfo.org" target="_blank">American Association of Orthodontists</a>,
                the <a href="http://www.swso.org" target="_blank">Southwestern Society of Orthodontists: <a>, 
                the <a href="http://www.ada.org/en" target="_blank">American Dental Association</a>,
                the <a href="http://www.tda.org" target="_blank">Texas Dental Association</a>, 
                the <a href="http://www.dcds.org" target="_blank">Dallas County Dental Society</a>,
                the <a href="http://www.tda.org" target="_blank">Dallas Indo-American Dental Association</a>
                & <a href="http://www.wfo.org" target="_blank">American Orthodontic Society and World Federation of Orthodontists</a>.
                </p></li>
            </ul>
			</div>
		</div>
	</div>
</section>
 
<!--  doctor Intro Section Starts here -->
<!--<section class="dr-intro padding-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/coming-soon-photo.gif" alt="Team member" class="img-responsive width-400 display-inline-xs">
            </div>
            <div class="col-md-8 col-sm-8">
                <p class="link-color text-uppercase margin-top-xs">Dentist</p>
                <h1 class="heading-bottom heading-full text-left no-margin-top">Dr. Khaled Jadid<a href="tel:+1-972-532-3635" class="font-18"><i class="fa fa-phone" aria-hidden="true"></i></a> <a href="mailto:info@custerdental.com?Subject=Book an appointment" class="font-18"><i class="fa fa-envelope" aria-hidden="true"></i></a></h1>

                <p class="designation">DDS</p>
        
            </div>
        </div>
    </div>
</section>-->
<!--  doctor Intro Section Ends here -->

<!--<section class="achievement-cert padding-section grey-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
            <ul class="list-unstyled list-bordered">
                <li></li>
            <li>
            <p></p>
            </li>
            <li>
           	<p></p>
            </li>
            </ul>
			</div>
		</div>
	</div>
</section>-->
<?php
    include('contactus.php');
    include('footer.php');
?>

<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/swiper-init.js"></script>
<script src="js/main.js"></script>
</body>
</html>