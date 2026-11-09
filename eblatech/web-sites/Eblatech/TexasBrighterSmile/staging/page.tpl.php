<?php
	global $base_path , $base_url , $base_root;
	global $node_index;
	$is_front = drupal_is_front_page();

	$aboutus = get_node_by_alias('about-us');
?>
<div class="preloader" id="preloader"> <img src="<?=$base_url?>/files/preloader.gif" alt="" /> </div>
<!-- =========================
     TOP BAR
============================== -->
<div class="top-bar" id="top-bar">
	<div class="container">
		<div class="row"> 
			
			<!-- TOP BAR LEFT -->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div class="top-bar-adress">


                    <address>
                    <i class="flaticon-navigation-arrow"></i>
                        <a href="https://www.google.com/maps/place/5100+W+Sublett+Rd+%23100,+Arlington,+TX+76001/@32.6448559,-97.1902296,705m/data=!3m1!1e3!4m5!3m4!1s0x864e647d1c542bb7:0xc50e723865206be1!8m2!3d32.6452941!4d-97.187939" target="_blank">5100 W. Sublett Rd, Suite 100, Arlington, Tx 76001.</a>
                    </address>
                    </div>
			</div>
			
			<!-- TOP BAR RIGHT -->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div class="top-bar-social">
                    <a href="https://www.facebook.com/Brighter-Smile-1195043370641098/" target="_blank"><i class="fa fa-facebook"></i></a>
<!--                    <a href="#"><i class="fa fa-google-plus"></i></a> -->
<!--                    <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                    <a href="#"><i class="fa fa-skype"></i></a>-->
                </div>
				<div class="top-bar-mail"> <i class="fa fa-envelope"></i>
                    <a href="mailto:office@texasbrightersmile.com">office@texasbrightersmile.com</a> </div>
			</div>
		</div>
	</div>
</div>
<!-- =========================
     END TOP BAR   
============================== --> 

<!-- =========================
     HEADER
============================== -->
<div class="header" id="header">
	<div class="container">
		<div class="row"> 
			
			<!-- HEADER LOGO -->
			<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				<div class="header-logo"> <a href="<?=$base_url?>"><img src="<?=$base_url?>/files/logo-b.png" alt="" />
					</a> </div>
			</div>
			
			<!-- HEADER BUTTONS -->
			<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
				<div class="header-button"> <a href="#bookform1" class="fancybox-2 btn btn-default">
					<span class="plus">+</span>
					MAKE AN APPOINTMENT</a> </div>
                <div class="header-phone"> <i class="fa fa-phone"></i> <a id="telephoneNumber" href="tel:+1-817-697-2723">(817) 697-2723</a> </div>
			</div>
		</div>
	</div>
</div>
<!-- =========================
     END HEADER
============================== --> 

<!-- =========================
     MAIN MENU
============================== -->
<div id="smartposition"></div>
<div class="top-menu" id="top-menu">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="mobile-bar-cont">
					<div class="top-menu-logo"> 
                    <a href="#"><img src="<?=$base_url?>/files/logo-b.png" alt="" /></a> 
                        </div>
					<div class="mobile-bar">
						<div class="show-menu" id="show-menu"> <i class="fa fa-bars"></i> </div>
					</div>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#top-bar">HOME</a></li>
<!--					<li><a href="#ABOUT-US">ABOUT US</a></li>-->
					<li><a href="#GALLERY">GALLERY</a></li>
                    <li><a href="#SERVICES">SERVICES</a></li>
					<li><a href="#OUR-DOCTORS">DOCTORS</a></li>
					<li><a href="#OUR-DOCTORS">INSURANCES</a></li>
					<!--<li><a href="#TESTIMONIALS">TESTIMONIALS</a></li>-->
<!--					<li><a href="#NEWS">NEWS</a></li>-->
					<li><a href="#CONTACT-US">CONTACT US</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- =========================
     END MAIN MENU
============================== --> 




<?php 
if($is_front)
{
	print render($page['content']);
} 
else
{

?>	

<section id="" class="other_page">
	<div class="container">
		<div class="box first">                                 
	<?php 
	print render($page['content']); 
	?>   
		</div>
	</div>
</div>
</section>
<?php 
}
?>

<!-- =========================
    FOOTER
============================== -->
<div class="footer" id="CONTACT-US">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 footer-matchheight">
				<div class="row"> 
					

					<!-- FOOTER ITEM 2 -->
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 footer-item footer-item-2">
						<h3 class="footer-title footer-title-line"><i class="fa fa-clock-o"></i> OPENING HOURS</h3>
						<div class="opening-left"> 
                        	Monday<br>
                        
							Thursday<br>	Wednsday<br>
							Friday<br>
							Saturday<br>
							</div>
						<div class="opening-right"> 
                        	9:00 am - 6:00 pm<br>
							9:00 am - 6:00 pm<br>
							
							9:00 am - 6:00 pm<br>
							9:00 am - 6:00 pm<br>
							by appointment<br>
							</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 footer-copyright">
						<div> Copyright &copy; <?=date('Y')?> Brighter Smile Family Dentistry, Developed by <a href="http://ebla-tech.com" target="_blank">EBLA TECH</a>  </div>
					</div>
				</div>
			</div>
			
			<!-- FOOTER ITEM 3 -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 footer-item footer-item-3 footer-matchheight" id="footer-item-3">
				<h3 class="footer-title"><i class="fa fa-map-marker"></i> CONTACTS</h3>

                    <div class="footer-item-3-phone"> <i class="fa fa-phone"></i> <a href="tel:+1-817-697-2723">(817) 697-2723</a> </div>
				<div class="footer-item-3-location">

                    <address>
                        <i class="flaticon-navigation-arrow"></i>
                        <a href="https://www.google.com/maps/place/5100+W+Sublett+Rd+%23100,+Arlington,+TX+76001/@32.6448559,-97.1902296,705m/data=!3m1!1e3!4m5!3m4!1s0x864e647d1c542bb7:0xc50e723865206be1!8m2!3d32.6452941!4d-97.187939" target="_blank">5100 W. Sublett Rd, Suite 100, Arlington, Tx 76001.</a>
                    </address>

                    </div>
				<div class="footer-item-3-mail"> <i class="fa fa-envelope"></i> <a href="mailto:office@texasbrightersmile.com">office@texasbrightersmile.com</a> </div>
				<div class="footer-item-3-socials">
                    <a href="https://www.facebook.com/Brighter-Smile-1195043370641098/"><i class="fa fa-facebook"></i></a>
<!--                    <a href="#"><i class="fa fa-google-plus"></i></a> -->
<!--                    <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                    <a href="#"><i class="fa fa-skype"></i></a> -->
                </div>
			</div>
			
			<!-- FOOTER ITEM 4 -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 footer-item footer-item-4 footer-matchheight" id="footer-item-4"> </div>
		</div>
	</div>
</div>
<!-- =========================
    END FOOTER
============================== --> 








<!-- =========================
    END COLOR SWITHER
============================== -->
<div class="totop" id="totop"> <i class="fa fa-angle-up"></i> </div>