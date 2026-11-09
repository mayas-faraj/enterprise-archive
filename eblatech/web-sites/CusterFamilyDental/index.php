
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-107438887-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-107438887-1');
</script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-T4Q5TJG');
</script>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta charset="UTF-8">
<title>Custer Family Dental & Ortho + Kids | McKinney & Frisco Dentist</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/swiper.min.css" type="text/css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
<link rel="stylesheet" href="css/owl.theme.default.min.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/responsive.css" type="text/css">
<link rel="shortcut icon" href="images/fav/favorit.gif" type="image/x-icon">
<meta name="keywords" content="Custer, Dental, McKinney, Frisco">
<meta name="description" content="Local dentist serving McKinney, Frisco, & Allen for all your dental needs from teeth whitening to dental pain and emergencies. We are here to serve all patients and are happily accepting new patients of all ages as young as 6 months old.">
</head>
<body id="home">
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T4Q5TJG"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!--Preload section starts here-->
<!--<div class="preload"> <i class="fa fa-heartbeat"></i> </div>-->
<!--Preload section ends here--> 


<?php		

//include('search.php');	
include('header.php');
include('stickyheader.php');
include('slider.php');

include('features.php');
include('welcome.php');
/*include('appointment.php');*/

include('aboutus.php');
include('team.php'); 
include('technology.php');   
include('services.php');
//include('testimonails.php');
    
include('contactus.php');
//include('map.php');
include('footer.php');
?> 


<script src="js/jquery-2.1.4.min.js"></script> 
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/swiper-init.js"></script>
<script src="js/owl.carousel.js"></script> 
<script src="js/slider-init.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/main.js"></script>

<script>
$(document).ready(function()
{
    var byClick=false;

    $('.stuck .main-menu>li').click(function()
    {
        byClick=true;
    })

    $('section').each(function()
    {
        var waypoint=new Waypoint({
            element: $(this),
            handler: function(direction)
            {
                if(!byClick)
                {
                    var id=waypoint.element.attr('id');
                    $('.stuck .main-menu>li.current-menu-item').removeClass('current-menu-item');
                    if(id=="news")
                        $('.stuck .main-menu>li.news').addClass('current-menu-item');
                    else if(id=="aboutus")
                        $('.stuck .main-menu>li.about').addClass('current-menu-item');
                    else if(id=="meetus")
                        $('.stuck .main-menu>li.meet').addClass('current-menu-item');
                    else if(id=="technology")
                        $('.stuck .main-menu>li.tech').addClass('current-menu-item');
                    else if(id=="contact-us")
                        $('.stuck .main-menu>li.contact').addClass('current-menu-item');
                    else
                        $('.stuck .main-menu>li.home').addClass('current-menu-item');
                }

                byClick=false;
            },
            offset: 90
        })
    }
    );
});
</script>
</body>
</html>
