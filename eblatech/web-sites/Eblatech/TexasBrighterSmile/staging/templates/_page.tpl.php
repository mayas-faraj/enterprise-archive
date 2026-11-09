<?php
	global $base_path , $base_url , $base_root;
	global $node_index;
	$is_front = drupal_is_front_page();

	$aboutus = get_node_by_alias('about-us');
?>
	<!-- main container of all the page elements -->
	<div id="Home">
		<div class="w1">
			<!-- header of the page -->
			<header id="header" class="style14">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12">
							<!-- page logo -->
							<div class="logo">
								<a href="#">
									<img src="<?=$base_url?>/files/logo.png" alt="Malbray Chemicals" class="img-responsive w-logo">
									<img src="<?=$base_url?>/files/logo-2.png" alt="Malbray Chemicals" class="img-responsive b-logo">
								</a>
							</div>
							<!-- main navigation of the page -->
							<nav id="nav">
								<a href="#" class="nav-opener"><i class="fa fa-bars"></i></a>
								<div class="nav-holder">
									<ul class="list-inline nav-top">
										<li><a href="#Home" class="smoothanchor">Home</a></li>
										<li><a href="#About-us" class="smoothanchor">About US</a></li>
										<li><a href="#Services" class="smoothanchor">Services</a></li>
										<li><a href="#Contact-us" class="smoothanchor">Contact us</a></li>
									</ul>
								</div>
							</nav>

						</div>
					</div>
				</div>
			</header>
			<!-- search popup -->



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
            <?php 
            }
			?>
			<!-- footer of the page -->
			
            
<footer id="footer" class="style9">
				<!-- footer cent -->
				<div class="footer-cent bg-shark">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3 info-box column1">
                                <!-- f our mission -->
                                <div class="f-our-mission">
                                    <h5><?=$aboutus->title?></h5>
                                    <div class="f-mission-box">
                                        <?=$aboutus->field_page_summary['und'][0]['value']?>
                                        <a href="#ABOUT-US" class="btn-more">READ MORE <i class="fa fa-angle-double-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 column2">
                                <!-- f contact info2 -->
                                <div class="f-contact-info2">
                                    <h5>Contact Information</h5>
                                    <address>
                                    <i class="fa fa-map-marker"></i> Iraq –Erbil- Azadi Qt.Edres Barzani Street/Near F.Harriri Stadium
                                    </address>
                                    <div class="mail-box2">
                                        <span class="mail-box"><i class="fa fa-envelope-o"></i> <a href="mailto:info@malbraychemicals.com" class="email">info@malbraychemicals.comm</a></span>
                                    </div>
                                    <div class="tel-holder">
                                        <span class="tel-box"><i class="fa fa-phone"></i> <a href="tel:07508886622" class="tel">07508886622 </a></span>
                                   	</div>
                                   	<div class="tel-holder">
                                        <span class="tel-box"><i class="fa fa-fax"></i> <a href="tel:0662557116" class="tel">0662557116</a></span>
                                    </div>                                    


                                    <div class="mail-box2">
                                        <span class="mail-box"><i class="fa fa-link"></i> <a href="http://www.malbraychemicals.com" class="email">www.malbraychemicals.com</a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 column4">
                            
                            
                                <div class="contact-form" id="contact-us">
                                    <!-- email form -->
                                    <h5>Contact us</h5>
                                    <h6 id="mail-msg"></h6>
                                    <form class="email-form" method="post" action="#" onSubmit="return false">
                                        <fieldset>
                                            
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <input type="text" name="name" id="name" class="form-control" placeholder="Name">
                                                </div>
                                            </div>
                                
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <input type="text" name="email" id="email" class="form-control" placeholder="EMAIL">
                                                </div>
                                            </div>		
                                
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <input type="text" name="mobile" id="mobile"  class="form-control" placeholder="Mobile">
                                                </div>
                                            </div>
                                
                                            <div class="row">
                                                <div class="col-xs-12 ">
                                                    
                                                    <textarea name="message" id="message" cols="" rows="" class="form-control" placeholder="Message"></textarea>
                                                </div>
                                            </div>
                                
                                
                                            <div class="row text-center">
                                                <div class="col-xs-12">
                                                    <button id="send" class="btn-submit btn-block" type="submit">SEND</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            
                            </div>
                        </div>
                    </div>
				</div>
				<!-- footer bottom -->
				<div class="footer-bottom bg-dark-jungle">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- bottom box5 -->
                                <div class="bottom-box5">
                                    <ul class="list-inline footer-social">
                                        <li><a href="https://www.facebook.com/Malbray-Chemicals-Company-797915610253839/?ref=br_rs" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="https://twitter.com/"><i class="fa fa-twitter" target="_blank"></i></a></li>
                                        <li><a href="https://www.linkedin.com/" target="_blank"><i class="fa fa-linkedin"></i></a></li>

                                    </ul>
                                    <span class="copyright">&copy; <?=date('Y')?> - <a href="#"> Malbray Chemicals Company</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</footer>            
            
            
            
            
		</div>
		<div class="fa fa-chevron-up" id="gotoTop" style="display: none;"></div>
	</div>