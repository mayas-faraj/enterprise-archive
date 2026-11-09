    <!DOCTYPE html>
<html lang="en">
<head>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-110934028-1"></script>
    <script>
    window.dataLayer=window.dataLayer || [];
    function gtag()
    {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());
    gtag('config', 'UA-110934028-1');
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta charset="UTF-8">
    <title>Custer Family Dental & Ortho + Kids | McKinney & Frisco Dentist | Kids</title>
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
				<li class="ortho"><a href="ortho.php" class="btn-default">Ortho
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a>
				</li>
				<li class="kids current-menu-item"><a href="kids.php" class="btn-default">Kids
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
								<li class="ortho"><a href="ortho.php" class="btn-default">Ortho
<!--					<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i>-->
					</a>
								</li>
					<li class="kids current-menu-item"><a href="kids.php" class="btn-default">Kids
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
                 <li class="ortho"><a href="ortho.php" class="btn-default">Ortho<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
                </li>
                 <li class="kids current-menu-item"><a href="kids.php" class="btn-default">Kids<i class="fa fa-angle-down hidden-sm hidden-md hidden-lg"></i></a>
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
	//include_once('header.php');
//	include_once('stickyheader.php');
?> 
  <!-- Banner Slider Section starts here-->
<section class="slider">
<div class="owl-carousel owl-theme">

         <!--   <div class="item">
              <img src="images/slider/slider-kids2.jpg" alt="slider" />
              <div class="caption-banner">
              	<div class="container">
              	<h4>Welcome to Dentologist</h4>
              </div>
              </div>
            </div>-->
            
            
            <div class="item">
              <img src="images/slider/slide_03.jpg" alt="slider" />
              <div class="caption-banner">
              	<div class="container">
              	<h1>Welcome to Custer Family Dental</h1>
              	</div>
              </div>
            </div>

            <div class="item">
              <img src="images/slider/slider_03.jpg" alt="slider" />
              <div class="caption-banner">
              	<div class="container">
              	<h1>Seeing Children Starting at 6 Months Old</h1>
              </div>
              </div>
            </div>
          </div>
</section>
<!-- Banner Slider Section ends here-->   
    
 <!-- About Services Section Starts here -->
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
    <!--        <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Frequently Asked Questions on Kids</h2>

                <h4>How early should I start bringing my child to the dentist?</h4>
                <p class="large-text">Children as early as 6 months old should be seen regularly by our team</p>
                <h4>How often do I need to bring my child to the dentist?</h4>
                <p class="large-text">Children and adults should be seen twice a year or every 6 months</p>
                <h4>When do baby teeth come in and when do they fall out?</h4>
                 <ul class="dentologist-list check-circle list-unstyled">
                     <li>Baby teeth begin to form very early on and you will see the first tooth erupt at around 6 months old. All 20 primary teeth should be erupted by 3 years of age.</li>
                     <li>Permanent molars begin to erupt at around 6 years old and this is also when the first baby tooth will be lost.</li>
                     <li>Most permanent teeth will erupt by age 13 and wisdom teeth can erupt anywhere from 14-24 years of age.</li>
                </ul>
                
                <h4>Are x-rays necessary for children?</h4>
                <p class="large-text">Yes, x-rays are essential for proper diagnosis and early detection of cavities. Please review our technology information about <a href="index.php?menu=tech#technology">minimal radiation x-rays</a></p>              
                <h4>My child is grinding at night! What should I do?</h4>
                <p class="large-text>">Many children grind during the night and parents may hear a noise or notice teeth are wearing away. Most cases do not require any treatment and most children out grow this habit. However, in some cases where patients continue to grind into adolescence we may recommend a night guard. Night guards help protect permanent teeth from severe wear that can cause joint problems and eating problems.</p>
            </div>
        </div>
    </div>
</section>
    
<section class="about-dentalia text-left padding-section">
    <div class="container">
        <div class="row vertical-middle stack-xs">
           <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/baby%20Sedation.jpg" class="img-responsive width-400 display-inline-xs" alt="dental implants">
            </div>
            <div class="col-md-8 col-sm-8 margin-top-xs">
                <h2>Sleep Dentistry</h2>
                <p class="large-text">Apprehension when visiting the dentist is completely normal. Here, at Custer Family Dental & Ortho + Kids, our staff is prepared to make you feel comfortable. Our goal is to provide every patient with exemplary treatment in a relaxing and caring environment. At times dentistry, will not be the most comfortable and therefore we offer a variety of option to ease all patients through any procedure. At this time, our office offers many sleep options. These options include:</p>
                 <ul class="dentologist-list check-circle list-unstyled">
                     <li>Nitrous Oxide (Laughing Gas)</li>
                     <li>Oral Sedation</li>
                     <li>IV Sedation</li>
                     <li>General Anesthesia</li>
                </ul>
            </div>
        </div>
    </div>
</section>
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
   <!--        <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Fillings</h2>
                <p class="large-text">A dental filling is the simplest and most effective way to fix a small cavity. It must be noted that fillings are only effective on small cavities; large cavities require other therapies. It is best to take care of a cavity early on in order to prevent the need for more expensive and time-consuming procedures like root canals and crowns in the future. Here at Custer Family Dental & Ortho + Kids we use the newest technology to recognize cavities at an early stage, so you don’t get caught with larger cavities that require more difficult treatments.</p>
                <h4>How are cavities caused?</h4>
                <p class="large-text>">Cavities are caused by small bacteria that thrive and grow by eating sugars that get stuck on and between our teeth. Good oral hygiene helps prevent cavities. Oral hygiene instructions can be found (below)</p>
                <h4>How are fillings done?</h4>
                <p class="large-text>">Fillings are completed with or without local anesthetic depending on the size and location of a cavity. The doctor uses specialized instruments to remove all cavities, decay, or caries. When only healthy tooth structure remains, the doctor will reform the tooth with specialized instruments and materials. There are a wide variety of materials to choose from but only the highest quality materials are used in our office.</p>
            </div>
        </div>
    </div>
</section>
    
 <section class="about-dentalia text-left padding-section">
    <div class="container">
        <div class="row vertical-middle stack-xs">
           <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/Silver%20Crowns.jpg" class="img-responsive width-400 display-inline-xs" alt="dental implants">
            </div>
            <div class="col-md-8 col-sm-8 margin-top-xs">
                <h2>Stainless-steel Crowns (Silver Crowns)</h2>
                <p class="large-text">When cavities get to large, the most appropriate treatment option would be a stainless-steel crown for baby teeth. Crowns help protect the little remaining healthy tooth structure from breaking down even more.</p>
                <h4>How are crowns done?</h4>
                <p class="large-text>">As with fillings, the doctor uses specialized instruments to remove all cavities, decay, or caries. Once all the unhealthy tooth structure is removed a special buildup material may be necessary to keep the crown from falling off the natural tooth. Once the buildup is placed, the final silver crown can be cemented on permanently</p>
            </div>
        </div>
    </div>
</section> 
    
<section class="about-dentalia text-left padding-section">
    <div class="container">
        <div class="row vertical-middle stack-xs">
           <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="images/Root%20Canals2.jpg" class="img-responsive width-400 display-inline-xs" alt="dental implants">
            </div>
            <div class="col-md-8 col-sm-8 margin-top-xs">
                <h2>Baby Root Canals</h2>
                <p class="large-text">When cavities are even larger and start to approach your tooth nerve it may be necessary to have a baby root canal. It is possible to not have any pain or symptoms and still need a root canal. It is also possible to need a root canal after treatment has already been completed on a tooth or even during treatment of a tooth</p>
                <h4>How are baby root canals done?</h4>
                <p class="large-text>">Teeth have to be anesthetized to complete a baby root canal. The doctors will access the nerve at the center of the tooth and remove it using specialized instruments. After the nerve is almost completely removed, special material is placed to replace the nerve and prevent bacteria from growing. Every tooth with a baby root canal must have a silver crown placed on it to extend the tooth’s life</p>
            </div>
        </div>
    </div>
</section>  
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
   <!--        <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Preventing cavities</h2>
                <h4>Oral Hygiene</h4>
                <p class="large-text>">Great oral hygiene and a good diet are the corner stones of a healthy mouth. To prevent cavities and bad breath both children and adults should be brushing twice a day. For gum and tooth health, the American Dental Association also recommends flossing once a day. Adding other methods or oral hygiene like water picks, mouth wash, and tongue scrapers can protect patients from cavities as well but should never be considered a replacement for brushing 2X per day and flossing 1X per day.</p>
                <p>Diet is also an important factor in preventing cavities. Remember children should never be allowed to go to bed with anything other than water. If children go to bed with milk or juice, they are at significantly higher risk for cavities. We recommend brushing teeth prior to going to bed and if anything is ingested then you should repeat brushing your teeth. Children should also limit the amount of candy and sweets they eat. Keeping a balanced diet from all the major food groups is very important to maintaining great oral health.</p>
                <h4>Professional Cleanings</h4>
                <p class="large-text>">Great oral hygiene is not enough to maintain great oral health. It is recommended by the American Dental Association that all patients are seen regularly for dental cleanings and check-ups to help maintain a healthy mouth. Our doctors are highly trained to recognize oral cavity problems including gum disease.</p>
                <p>Gum disease is preventable but not reversible. Any damage done by gum disease cannot repair itself, and must be repaired by a dentist. Children are typically subject to gingivitis or mild gum disease. This can quickly turn into severe gum disease or periodontitis as the child enters adulthood.</p>
                <h4>Sealants</h4>
                <p class="large-text>">Sealants are one of the most effective ways to prevent cavities. This simple, inexpensive procedure can save you time and money. A thin, white composite material is placed on susceptible grooves of teeth. The sealant acts as a barrier between the cavity prone areas on teeth and cavity causing bacteria in the mouth. Sealants can be placed on all patients of all ages from 3 years of age to adults. Sealant are recommended to be placed early on especially on permanent molars at the age of 6 and 12 years old. Sealants have an unexpected lifespan and may have to be replaced from time to time.</p>
                <h4>Fluoride</h4>
                <p class="large-text>">Fluoride is another important treatment option in protecting against cavities. Fluoride will help strengthen teeth of patients of all ages including adults. It is recommended that all children receive extra fluoride treatments during their 6-month check-up appointment. When a doctor notices signs of severe cavities or weak tooth enamel, they will typically prescribe a special prescription strength fluoride toothpaste. This toothpaste should be used as directed and will help protect against cavities.</p>
                <h4>Xylitol</h4>
                <p class="large-text>">Xylitol is a special substitute sugar that can be found in many fruits, chewing gums, and breath mints. Studies show that patients who chew gum with xylitol have a lower cavity rate than patients who chew gum with normal sugars or no gum at all.</p>
            </div>
        </div>
    </div>
</section>
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
     <!--      <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">
            </div>-->
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Emergencies</h2>
                <p class="large-text">Our team at Custer Family Dental & Ortho + Kids will work hard to bring you in same day for your dental emergency. We save time every day for unexpected emergencies. It may not always be possible to completely resolve a dental emergency in one visit, so follow up appointments may be necessary. </p>
                <p class="large-text">We have time set aside for all emergencies ranging from</p>
                 <ul class="dentologist-list check-circle list-unstyled">
                     <li>Severe tooth pain</li>
                     <li>Swelling and gum problems</li>
                     <li>Knocked out teeth</li>
                     <li>Broken fillings</li>
                     <li>Chipped and broken teeth</li>
                     <li>Mild irritation or sensitivity</li>
                </ul>
            </div>
        </div>
    </div>
</section>
    
<section class="about-dentalia text-left padding-section grey-bg">
    <div class="container">
        <div class="row vertical-middle stack-xs">
    <!--        <div class="col-md-4 col-sm-4 text-center-xs">
                <img src="http://wpmupro.com/dentologist-demo/demo-images/dental.jpg" class="img-responsive img-circle width-400 display-inline-xs" alt="dental implants">-->
            </div>
            <div class="col-md-12 col-sm-12 margin-top-xs">
                <h2>Post-Op</h2>
                <h4>Oral Discomfort after a Cleaning</h4>
                <p class="large-text">It is possible to have mild to moderate pain or sensitivity after a dental cleaning especially after deep cleanings. Even during mild dental cleanings, patients may experience mild pain, sensitivity, and bleeding. This is due to inflamed unhealthy gums. It is recommended to use Motrin or Tylenol to relieve pain only if necessary.</p>
                <h4>Local Anesthetic Discomfort</h4>
                <p class="large-text">Local anesthetic is used to numb and put your teeth, gums, and lips to sleep. Your cheek and lips may feel larger and swollen however they still look completely normal. You may not be able to recognize it but you may injure yourself by biting or chewing on your cheek or lip while still being numb. Try to by aware of these behaviors as you may be numb for 2-3 hours.</p>
               <h4>Sealant Care</h4>
                <p class="large-text">After placement of sealants it is recommended to continue brushing and flossing regularly. Restrictions on diet include avoiding hard, sticky candies or food for the next 2 days.</p>
                <h4>Fillings</h4>
                <p class="large-text">After filling placement, it is recommended to continue brushing and flossing regularly. Diet restrictions include avoiding hard and sticky foods for the next two days. It is never okay to chew ice and regular everyday activity can be resumed directly following the procedure; however, remember the effect of local anesthesia may last 2-3 hours.</p> 
                <h4>Extractions</h4>
                <p class="large-text">After a tooth extraction, patients should limit physical activity for a minimum of one day. Some patients do better than others and your recovery time greatly depends on the procedure and you following post-operative instructions. Following the procedure, be sure to maintain pressure with gauze on the extraction site for a minimum of 1 hour. Please avoid using straws, spiting forcefully, or smoking. Take all medications as directed and begin taking pain killers prior to regaining sensation in your mouth. Mild swelling is normal and alternating between hot and cold ice packs can help during the first day post-op. We recommend continuing oral hygiene habits like brushing and flossing 12 hours after the procedure.</p> 
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