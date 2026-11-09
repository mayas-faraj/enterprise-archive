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
    <title>Custer Family Dental & Ortho + Kids | McKinney & Frisco Dentist | Ortho</title>
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
				<li class="home">
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
				<li class="ortho current-menu-item"><a href="ortho.php" class="btn-default">Ortho
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
								<li class="home">
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
								<li class="ortho current-menu-item"><a href="ortho.php" class="btn-default">Ortho
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
                <li class="home"><a href="<?=$home?>" class="btn-default">Home</a>
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
                 <li class="ortho current-menu-item"><a href="ortho.php" class="btn-default">Ortho<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
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
<!-- Banner Slider Section starts here-->
<section class="slider">
<div class="owl-carousel owl-theme">

            <div class="item">
              <img src="images/slider/slider_05.jpg" alt="slider" />
              <div class="caption-banner">
              	<div class="container">
              	<h1>Welcome to Custer Family Dental</h1>
              </div>
              </div>
            </div>
            
            
            <div class="item">
              <img src="images/slider/slider_02.jpg" alt="slider" />
              <div class="caption-banner">
              	<div class="container">
              	<h1>Make Your Perfect Smiles Happen</h1>
              </div>
              </div>
            </div>
            
            

            
            
          </div>
</section>
<!-- Banner Slider Section ends here--> 
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
    <!--        <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Ortho and Braces Frequently Asked Questions</h2>

                <h4>What age should I get braces?</h4>
                <p class="large-text">The American Association of Orthodontists recommends orthodontic screenings for children by the age of 7 years old. Patients of all ages from 7 years old through adulthood are candidates for orthodontic treatment. Treatment started at an early age can help prevent need for surgical procedures during adulthood in order to fix severe over and under bites.</p>
               <h4>What is an open bite, over bite, deep bite, under bite, cross bite?</h4>
                 <ul class="dentologist-list check-circle list-unstyled">
                     <li><h6>Over bite:</h6> A broad term describing the relationship of upper teeth to lower teeth. People normally have a mild over bite and this only becomes a problem when patients have a very deep overbite</li>
                     <li><h6>Open bite:</h6>Upper teeth and lower teeth do not cover each other</li>
                     <li><h6>Deep bites:</h6>Upper teeth cover too much of a lower tooth</li>
                    <li><h6>Under bite:</h6>Lower teeth in front of upper teeth</li>
                     <li><h6>Cross bite:</h6>Upper teeth bite on the inside of lower teeth</li>
                </ul>
                <h4>What causes crooked teeth?</h4>
                <p class="large-text">Crooked teeth can stem from a variety of factors including genetics, thumb sucking, poor breathing, and premature tooth loss.</p> 
                <h4>Why can’t I get Invisalign?</h4>
                <p class="large-text">Invisalign technology can treat many cases however, very severe or special cases cannot be treated with Invisalign technology. Conventional braces are still a highly recommended treatment option and will never be completely replaced by Invisalign.</p> 
                <h4>How long do I need to wear braces or Invisalign retainers?</h4>
                <p class="large-text>">Each case is different and will be evaluated fully by our team to give you an accurate estimated treatment time during the consultation appointment. Patients can react differently to treatment so doctors may recommend slowing down or speeding up the process depending on many factors.</p>
                <h4>Will orthodontic treatment hurt?</h4>
                <p class="large-text>">Mild to moderate discomfort is expected during orthodontic treatments. Teeth are being moved with moderate amounts of pressure being placed on them which may cause discomfort. This usually last for 24-72 hours and can be controlled with Tylenol or Ibuprofen.</p>
                <h4>Is orthodontic treatment necessary?</h4>
                <p class="large-text>">Typically, orthodontic treatment is an elective treatment with cosmetic goals. However, there are many cases that maybe recommended due to malocclusion, incorrect bites, and jaw growth deficiencies.</p>
            </div>
        </div>
    </div>
</section>
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
     <!--       <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Ortho Treatment Options</h2>
               <h4>Invisalign</h4>
                <p class="large-text">An effective treatment option for mild to moderate cases where the esthetics of traditional braces is not sufficient. Patient compliance is crucial for Invisalign to yield results. Retainers must be worn 24 hours a day, 7 days a week. Retainers are replaced approximately every 2 weeks.</p>
               <h4>Conventional braces</h4>
                <p class="large-text">The most effective treatment option for complex cases. Patient compliance is not needed to get straight teeth due to the fact that braces cannot be removed by the patient. These lead to another problem. Patients have to spend more time committed to with oral hygiene in order to clean teeth and braces.</p>
            </div>
        </div>
    </div>
</section>
    
<section class="colums padding-section grey-bg">
    <div class="container">  
            <div class="row">
            <div class="col-md-12">
                <h2 class="text-capitalize no-padding font-24 no-margin-top"><strong>Ortho Treatment Options</strong></h2>
            </div>
            <div class="col-md-6">
               <h4>Invisalign</h4>
                <p class="large-text">An effective treatment option for mild to moderate cases where the esthetics of traditional braces is not sufficient. Patient compliance is crucial for Invisalign to yield results. Retainers must be worn 24 hours a day, 7 days a week. Retainers are replaced approximately every 2 weeks.</p>
            </div>
            <div class="col-md-6">
               <h4>Conventional braces</h4>
                <p class="large-text">The most effective treatment option for complex cases. Patient compliance is not needed to get straight teeth due to the fact that braces cannot be removed by the patient. These lead to another problem. Patients have to spend more time committed to with oral hygiene in order to clean teeth and braces.</p>
            </div>
        </div>
         </div>
    </section>
    
<section class="about-dentalia text-left padding-section">
    <div class="container">
        <div class="row vertical-middle stack-xs">
           <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/Oral%20Hygiene.jpg" class="img-responsive width-400 display-inline-xs" alt="dental implants">
            </div>
            <div class="col-md-8 col-sm-8 margin-top-xs">
                <h2>Oral Hygiene During Orthodontic Treatment</h2>
                <p class="large-text">Straight teeth with cavities is never a goal. When our doctors notice declining oral hygiene, patient will be recommended options to improve oral hygiene like water picks, floss threaders, and interproximal brushes. If oral hygiene continues to decline our team will be forced to removed braces until oral hygiene is improved. This can be costly and time consuming.</p>
                <p class="large-text">Patients with braces should be seen for a professional cleaning every 3 months. Patients should also be brushing their teeth 4 times per day and flossing a minimum of once per day.</p>
            </div>
        </div>
    </div>
</section>
    
 <section class="colums padding-section grey-bg">
    <div class="container">   
    <div class="row">
            <div class="col-md-12">
                <h2 class="text-capitalize font-24"><strong>Ortho Emergencies</strong></h2>
            </div>
            <div class="four-columns">
                <div class="col-lg-3 col-sm-6">
                    <p><h6>Poking Wire:</h6>Place a ball of wax in warm water and mold it around the pointy part of the wire or try cutting the wire with a nail clipper or cuticle cutter</p>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <p><h6>Loose Bracket:</h6>Avoid playing with the loose bracket and try to remove it. Make sure you save the bracket and bring it in to your appointment</p>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <p><h6>Missing O-ring:</h6>Place a ball of wax in warm water and mold it around the bracket missing the band</p>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <p><h6>Sore teeth:</h6>Sore teeth are normal when starting treatment, making adjustments, and changing wires. Typically, this will last for 24-72 hours and can be controlled with Tylenol or Ibuprofen</p>
                </div>
            </div>
        </div>
     </div>
    </section>
    
   <section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
     <!--       <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Ortho Terms</h2>
               <h4>Spacers</h4>
                <p class="large-text">Rubber donuts used to make space between teeth</p>
               <h4>Brackets</h4>
                <p class="large-text">Small attachments that are stuck to your teeth and the orthodontic wire is placed on to move your teeth</p>
                <h4>O-rings</h4>
                <p class="large-text">Rings used to hold wires to brackets</p>
                 <h4>Elastics (rubber bands)</h4>
                <p class="large-text">Rubber bands that correct your bite and must be worn consistently</p>
                <h4>Headgear</h4>
                <p class="large-text">Used to correct protrusion of upper or lower jaws and are typically worn at night time</p>
                 <h4>Space Maintainer</h4>
                <p class="large-text">An appliance used to save space for permanent teeth when baby teeth are prematurely lost</p>
                 <h4>Palatal Expander</h4>
                <p class="large-text">An appliance placed in the roof of the mouth to expand the upper jaw</p>
                 <h4>Retainers</h4>
                <p class="large-text">An appliance used after orthodontic treatment to maintain teeth in their new position. Teeth will move if they are not retained in their new positions. It is incredibly important to wear and maintain your retainer as directed</p>
            </div>
        </div>
    </div>
</section> 
<!-- About Services Section Ends here --> 
    
<?php
  include('contactus.php');
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