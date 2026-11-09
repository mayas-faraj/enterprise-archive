     <!DOCTYPE html>
<html lang="en">
<head>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T4Q5TJG');</script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <title>Custer Family Dental & Ortho + Kids | McKinney & Frisco Dentist | New Patient</title>
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/responsive.css" type="text/css">
  	<meta name="keywords" content="Dentologist, Keywords">
   <meta name="description" content="Local dentist serving McKinney, Frisco, & Allen for all your dental needs from teeth whitening to dental pain and emergencies. We are here to serve all patients and are happily accepting new patients of all ages as young as 6 months old.">   
	<link rel="shortcut icon" href="images/fav/favorit.gif" type="image/x-icon">
</head>
<body>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T4Q5TJG"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!--Preload section starts here-->
<!--<div class="preload"> <i class="fa fa-heartbeat"></i> </div>-->
<!--Preload section ends here--> 

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
								<li class="current-menu-item">
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
                <li class="home current-menu-item"><a href="<?=$home?>" class="btn-default">Home</a>
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
    
<?php
//	include_once('header.php');
//	include_once('stickyheader.php');
?> 

<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
            <div class="col-md-12 col-sm-12 margin-top-xs">
              <!--  <h2>Ortho Treatment Options</h2>  -->
               <h4>The permanent maxillary second molar: Canal number And configurations in a Tunisian population</h4>
			   <img src="images/maxillary.jpg"/><br/>
                 
                <p class="large-text"><b>Introduction</b></p>

				<p class="large-text">One of the major causes of failure in endodontic treatment is the impossibility of locating and treating the entire root canal system, a result of the lack of knowledge regarding the dental, internal or external anatomy. 1
Maxillary molars are the teeth that contain the greatest number of roots, with diverse shapes and formations, which is why their internal canal system is so variable. 2
Any existing root canals that remain undetected by the operator during the entire course of endodontic treatment are a major threat to the failure of treatment. 3
The aim of the current research was to describe the variations in the root canal anatomy of maxillary first molar in a tunisian population using sectioning.
.</p> 

		<p class="large-text"><b>Materials and Methods</b></p>

			<p class="large-text">In this study, we used 98 maxillary second molars that have been extracted mainly for periodontal reasons. The teeth were stored in a sodium hypochlorite solution diluted to 5% during 3 days and then washed in running water and dried.
Each tooth is macroscopically examined to determine the number of roots and grinded progressively at the root surface to highlight the path of the root canals.
Canal number and configurations are observed and analyzed using sections:

<ul>
    <li>Mesio buccal and disto buccal root: bucco-lingual sections</li>
    <li>Palatal root: mesio-distal sections</li></ul>

<p class="large-text"><b>Conclusion</b></p>
	<p class="large-text">The present study showed that most of maxillary first molars were 3 rooted (93%), 5.8% were 2 rooted and 1.1% presented one root. In the mesio buccal root, the most prevalent configuration was type I (97.5%), type II represented 2.5%. In the disto buccal root and in the palatal root, we found  vertucci type I on 100% of cases.</p>


			
				<p class="large-text"><b>Orginal article from <a href="http://www.dentalnews.com/2016/07/26/permanent-maxillary-second-molar-canal-number-configurations-tunisian-population">http://www.dentalnews.com/2016/07/26/permanent-maxillary-second-molar-canal-number-configurations-tunisian-population</a></b></p>
            </div>
        </div>
    </div>
</section>  
    

<?php
include('footer.php');
?>

<script src="js/jquery-2.1.4.min.js"></script> 
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/swiper-init.js"></script>
<script src="js/owl.carousel.js"></script> 
<script src="js/slider-init.js"></script> 
<script src="js/main.js"></script>
    
</body>
</html>