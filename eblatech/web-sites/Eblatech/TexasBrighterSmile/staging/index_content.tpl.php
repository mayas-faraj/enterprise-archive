<?php
	global $base_path , $base_url;
	$slider_arr = get_nodes_by_type('slider',8, 'ORDER by n.created ASC');
	$service_arr = get_nodes_by_type('service',0, 'ORDER by n.created ASC');
	$home_service_arr = get_nodes_by_type('home_service',3, 'ORDER by n.created ASC');
	$doctors = get_nodes_by_type('doctor', 4, 'ORDER by n.created ASC');
	$news = get_nodes_by_type('news', 4, 'ORDER by n.created ASC');
	$client_arr = get_nodes_by_type('client','', 'ORDER by n.created ASC');
	$testimonial_arr = get_nodes_by_type('testimonial','', 'ORDER by n.created ASC');
	
	
 	$aboutus = get_node_by_alias('about-us');
	$drdarweesh = get_node_by_alias('Dr.Darweesh');
	$training = get_node_by_alias('training');
	$aso = get_node_by_alias('ASO-I-HAMMED');
	$quality = get_node_by_alias('quality');
	$clients = get_node_by_alias('clients');
?>

<style>
		#back_to_camera {
			clear: both;
			display: block;
			height: 80px;
			line-height: 40px;
			padding: 20px;
		}

		.gallery
		{
				width: 80%;
				margin-left: 10%;
		}
</style>

<script>
		jQuery(function(){
			
			jQuery('#camera_wrap_3').camera({
				height: '56%',
				pagination: false,
				thumbnails: true,
				imagePath: '../images/'
			});

		});
</script>

<!-- =========================
     HEADER SLIDER
============================== -->
<div id="slider" class="slider">
	<div class="sp-slides">
		<!-- HEADER SLIDER ITEM -->
		<div class="sp-slide"> <img class="sp-image" src="css/<?=$base_url?>/files/blank.gif" alt=""
	        		data-src="<?=$base_url?>/files/offer2.png"
					data-small="<?=$base_url?>/files/Slider5.png"
					data-medium="<?=$base_url?>/files/Slider5.png"
					data-large="<?=$base_url?>/files/Slider5.png"
									/>
			<div class="container">
				 
			</div>
		</div>
		<!-- HEADER SLIDER ITEM -->
		<div class="sp-slide"> <img class="sp-image" src="css/<?=$base_url?>/files/blank.gif" alt=""
	        		data-src="<?=$base_url?>/files/offer1.jpg"
					data-small="<?=$base_url?>/files/Slider4.png"
					data-medium="<?=$base_url?>/files/Slider4.png"
					data-large="<?=$base_url?>/files/Slider4.png"
									/>
			<div class="container">
				 
			</div>
		</div>
		<!-- HEADER SLIDER ITEM -->
		<div class="sp-slide"> <img class="sp-image" src="css/<?=$base_url?>/files/blank.gif" 
									alt=""
	        		data-src="<?=$base_url?>/files/slide_01.jpg"
										data-small="<?=$base_url?>/files/Slider1.png"
					data-medium="<?=$base_url?>/files/Slider1.png"
					data-large="<?=$base_url?>/files/Slider1.png"/>
			<div class="container">
			 
				
				<h3 class="sp-layer slider-welcome" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-370" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="0" data-hide-delay="0"> Welcome Dental Clinic </h3>
				<h1 class="sp-layer slider-title" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-230" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="200" data-hide-delay="200"> It is quite simple! </h1>
				<h2 class="sp-layer slider-subtitle"
                        data-position="leftCenter" data-horizontal="15" data-vertical="-120"
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="400" data-hide-delay="400"> You choose convenient time! </h2>
				<p class="sp-layer slider-text" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="80" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="600" data-hide-delay="600">
				<p class="sp-layer slider-button" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="300" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="800" data-hide-delay="800"> <a href="#" class="btn btn-primary">READ MORE</a> </p>
			</div>
		</div>
		<!-- HEADER SLIDER ITEM -->
		<div class="sp-slide"> <img class="sp-image" src="css/<?=$base_url?>/files/blank.gif" alt=""
	        		data-src="<?=$base_url?>/files/slide_02.jpg"
										data-small="<?=$base_url?>/files/Slider2.png"
					data-medium="<?=$base_url?>/files/Slider2.png"
					data-large="<?=$base_url?>/files/Slider2.png"/>
			<div class="container">
				<h3 class="sp-layer slider-welcome" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-370" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="0" data-hide-delay="0"> Healthy kids </h3>
				<h1 class="sp-layer slider-title" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-230" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="200" data-hide-delay="200"> Our concern </h1>
				<h2 class="sp-layer slider-subtitle" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-120" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="400" data-hide-delay="400"> Discount for children $99 </h2>
				<p class="sp-layer slider-text" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="80" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="600" data-hide-delay="600">
				<p class="sp-layer slider-button" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="300" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="800" data-hide-delay="800"> <a href="#" class="btn btn-primary">READ MORE</a> </p>
			</div>
		</div>
		<!-- HEADER SLIDER ITEM -->
		<div class="sp-slide"> <img class="sp-image" src="css/<?=$base_url?>/files/blank.gif" alt=""
	        		data-src="<?=$base_url?>/files/slide_03.jpg" 	data-small="<?=$base_url?>/files/Slider3.png"
					data-medium="<?=$base_url?>/files/Slider3.png"
					data-large="<?=$base_url?>/files/Slider3.png"/>
			<div class="container">
				<h3 class="sp-layer slider-welcome" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-370" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="0" data-hide-delay="0"> A beautiful smile is our task! </h3>
				<h1 class="sp-layer slider-title" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-230" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="200" data-hide-delay="200"> Dental services </h1>
				<h2 class="sp-layer slider-subtitle" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="-120" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="400" data-hide-delay="400"> Healthy teeth - healthy body </h2>
				<p class="sp-layer slider-text" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="80" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="600" data-hide-delay="600">
				<p class="sp-layer slider-button" 
                        data-position="leftCenter" data-horizontal="15" data-vertical="300" 
                        data-show-transition="left" data-hide-transition="left"
                        data-show-delay="800" data-hide-delay="800"> <a href="#" class="btn btn-primary">READ MORE</a> </p>
			</div>
		</div>
	</div>
</div>
<!-- =========================
     END HEADER SLIDER
============================== --> 

<!-- =========================
     SERVICES
============================== -->
<div class="services" id="services">
	<div class="container-fluid">
		<div class="row"> 
			
			<!-- SERVICES ITEM -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 service bg-primary-2">
				<div class="service-icon"> <i class="flaticon-medical-1"></i> </div>
				<div class="service-title">
					<h3>teeth whitening</h3>
				</div>
				<div class="service-text"> Tooth whitening can be a very effective way of lightening the natural colour of your teeth without removing any of the tooth surface. </div>
			</div>
			
			<!-- SERVICES ITEM -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 service bg-child-2">
				<div class="service-icon"> <i class="flaticon-medical-2"></i> </div>
				<div class="service-title">
					<h3>implants</h3>
				</div>
				<div class="service-text"> Dental implants may be an option for people who have lost a tooth or teeth due to periodontal disease, an injury, or some other reason. </div>
			</div>
			
			<!-- SERVICES ITEM -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 service bg-child-3">
				<div class="service-icon"> <i class="flaticon-tool"></i> </div>
				<div class="service-title">
					<h3>extractions</h3>
				</div>
				<div class="service-text"> In orthodontics if the teeth are crowded, sound teeth may be extracted to create space so the rest of the teeth can be straightened. </div>
			</div>
			
			<!-- SERVICES ITEM -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 service bg-child-4">
				<div class="service-icon"> <i class="flaticon-medical"></i> </div>
				<div class="service-title">
					<h3>gum disease</h3>
				</div>
				<div class="service-text"> Plaque is the primary cause of gum disease. However, other factors can contribute to periodontal disease. </div>
			</div>
		</div>
	</div>
</div>
<!-- =========================
     END SERVICES
============================== -->
<div class="doctors gallery" id="gallery">
	<div class="container">
		<div class="row">
			<div class="fluid_container">
				<h2 class="section-title">Office
					<span class="bold700">Tour</span>
				</h2>
				<p class="section-subtitle">Check out the events, activities and accomplishments of texas brighter smile that updated every time.</p>
					<div class="camera_wrap camera_emboss" id="camera_wrap_3">
						<div data-thumb="files/thumbs/main_slider1.jpg" data-src="files/main_slider1.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider2.jpg" data-src="files/main_slider2.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider3.jpg" data-src="files/main_slider3.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider4.jpg" data-src="files/main_slider4.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider5.jpg" data-src="files/main_slider5.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider6.jpg" data-src="files/main_slider6.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
						<div data-thumb="files/thumbs/main_slider7.jpg" data-src="files/main_slider7.jpg">
							<!--div style="position:absolute; top:5%; left:5%; background:#000; color:#fff; padding:5px; width:25%" class="fadeIn camera_effected"></div-->
						</div>
					</div><!-- #camera_wrap_3 -->

				</div><!-- .fluid_container -->
			</div>
		</div>
	</div>

 
<!-- =========================
     ABOUT
============================== -->

<?php if(0){ ?>
<div class="about" id="ABOUT-US">
	<div class="container">
		<div class="row">
			
 			<!-- ABOUT TEXT -->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 about-text">
				<h2 class="section-title"><span class="bold700">ABOUT</span><?=$drdarweesh->title?></h2>
					<?=$drdarweesh->body['und'][0]['value']?>
			</div>
			
			<!-- ABOUT BACKGROUND -->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 about-bg"> </div>
		</div>
	</div>
</div>

<?php } ?>

<div class="tipsfaq" id="SERVICES">
	<div class="container">
		<div class="row"> 
			
			<!-- TIPS -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 tips">
				<h2 class="section-title">
					<span class="bold700">OUR</span>
					SERVICES</h2>
				<!-- TIPS NAVS -->
				<div class="tips-tabs">
					<ul class="nav nav-tabs tabs-carousel">
						
						<?php
                        $index = 0;
                        foreach($service_arr as $item)
                        {
                            ++$index;
                            $nid = $item->nid;
                            $title = $item->title;
                            $body = $item->body['und'][0]['value'];
                            $active_class = '';            
        					if ($index == 1 ) $active_class = 'active';
							echo '<li class="'.$active_class.'"><a href="#service'.$index.'" data-toggle="tab">'.$title.'</a></li>';
                        }
                        ?>                        
					</ul>
					<div class="tips-btn tips-next" id="next-tips"><i class="fa fa-angle-right"></i></div>
					<div class="tips-btn tips-prev" id="prev-tips"><i class="fa fa-angle-left"></i></div>
				</div>
				<!-- TIPS ITEMS -->
				<div class="tips-content">
					<div class="tab-content"> 
						
						<?php
                        $index = 0;
                        foreach($service_arr as $item)
                        {
                            ++$index;
                            $nid = $item->nid;
                            $title = $item->title;
                            $body = $item->body['und'][0]['value'];
                            $image1_item_url = file_create_url($item->field_service_image1['und'][0]['uri']);
							$active_class = '';            
        					if ($index == 1 ) $active_class = 'active in';
							
                        ?>
						<div class="tab-pane fade <?=$active_class?> tips-content-item" id="service<?=$index?>">
							<div class="tips-content-item-text">
								<p><?=$body?></p>
							</div>
							<div class="tips-content-item-image"> 
                            <img src="<?=$image1_item_url?>" alt="<?=$title?>" title="<?=$title?>" />
							</div>
						</div>
						<?php
                        }
                        ?>                        
					</div>
				</div>
			</div>
			

		</div>
	</div>
</div>


<!-- =========================
     END ABOUT
============================== --> 

<!-- =========================

<!-- =========================
     END CERTIFICATES
============================== -->
<!-- =========================
     DOCTORS
============================== -->
<div class="doctors" id="OUR-DOCTORS">
    <div class="container">
        <div class="row">
            <h2 class="section-title">MEET
                <span class="bold700">Dr. Darweesh</span>
            </h2>
            <p class="section-subtitle">All staff members of Dental Clinic are licensed professionals. Our staff consists of licensed general dentists, hygienists, dental assis-<br>
                tants, an endodontist, a periodontist, and an oral surgeon.</p>
            <div class="doctors-container">

                    <?php
                    $index = 0;
                    foreach($doctors as $item)
                    {
                        //$appointmentURL = $item.field_doctor_appointment_link
                        ?>
                        <div class="doctors-item">
                            <div class="doctors-item-container">
                                <div class="doctors-item-image"> <img src="<?=file_create_url($item->field_doctors_portrait['und'][0]['uri'])?>"
                                                                      alt="<?=$item->field_doctors_portrait['und'][0]['alt']?>" /> </div>
                                <div class="doctors-item-name"><?=$item->title?></div>
                                <div class="doctors-item-position"><?=$item->field_doctor_possition['und'][0]['value']?></div>

                        		
                        		<div class="row">
                        			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">

                        					<?=$item->body['und'][0]['value']?>
                        			</div>

                        		</div>                                
                                
                                
                                
                            </div>
                            <div class="doctors-item-social">
                                <?php if (isset($item->field_doctors_facebook_link["und"][0]["value"])  )
                                    echo '<a href="'.$item->field_doctors_facebook_link["und"][0]["value"].'"><i class="fa fa-facebook"></i></a>';
                                ?>
                                <?php if (isset($item->field_doctors_tweeter_link["und"][0]["value"]))
                                    echo '<a href="'.$item->field_doctors_tweeter_link["und"][0]["value"].'"><i class="fa fa-twitter"></i></a>';
                                ?>
                                <?php if (isset($item->field_doctors_skype_address["und"][0]["value"]))
                                    echo '<a href="'.$item->field_doctors_skype_address["und"][0]["value"].'"><i class="fa fa-skype"></i></a>';
                                ?></div>
                            <?php
                            if (isset($item->field_doctor_appointment_link['und'][0]['nid']))
                            {
                                ?>
                                <div class="doctors-item-button">

                                    <a href="#bookform1" class="fancybox-2 btn btn-default">
                                        <span class="plus">+</span>
                                        BOOK APPOINTMENT</a> </div>
                                <?php
                            }
                            ?>
                        </div>
                        <?php
                    }
                    ?>

            </div>
        </div>
    </div>
</div>


<!-- =========================
     DOCTORS
============================== -->

<!-- =========================
     END DOCTORS
============================== -->

<!-- =========================
    REVIEW 
============================== -->	
    
<?php if(0) {?>    
<div class="review" id="TESTIMONIALS">
    <div class="container">
        <div class="row">
            <h2 class="section-title">
                <span class="bold700">TESTIMONIALS</span>
            </h2>
            <p class="section-subtitle">Many of our patients are our friends now, and they recommend our Dental clinic to their friends and come with their children and<br>
                senior parents to us. We are very proud that you entrust the health of your relatives to us! </p>
            <div class="review-container">
                <div class="owl-review" id="owl-review">

                    <?php
                    $index = 0;
                    foreach($testimonial_arr as $item)
                    {
                        ++$index;
                        $nid = $item->nid;
                        $title = $item->title;
                        $position = $item->field_testimonial_position['und'][0]['value'];
                        $body = $item->body['und'][0]['value'];


                        ?>
                        <div class="review-item">

                            <div class="review-item-text"><?=$body?></div>
                            <div class="review-item-name"><?=$title?></div>
                            <div class="review-item-position"><?=$position?></div>
                            <div class="review-item-quote"><img src="<?=$base_url?>/files/quote.png" alt="" /></div>
                        </div>
                        <?php
                    }
                    ?>



                </div>
                <!-- REVIEW BUTTONS -->
                <div class="carousel-btn carousel-next" id="next-review"><i class="fa fa-angle-right"></i></div>
                <div class="carousel-btn carousel-prev" id="prev-review"><i class="fa fa-angle-left"></i></div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">

                <a href="#bookform2" class="fancybox-2 btn btn-default">ADD REVIEW</a>
            </div>

        </div>
    </div>
</div>
<!-- =========================
    END REVIEW
============================== -->

<!-- =========================
     STORIES
============================== -->
<div class="stories">
	<div class="container">
		<div class="row">
			<h2 class="section-title">
				<span class="bold700">SUCCESS</span>
				STORIES</h2>
			<p class="section-subtitle">Happy patients stories</p>
			<div class="certs-container">
				<div class="owl-stories" id="owl-stories"> 
					
					<!-- STORIES ITEM -->
					<div class="stories-item">
						<div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
							<div class="stories-item-name"> Jeanette Evvie </div>
							<div class="stories-item-position"> Student </div>
							<div class="stories-item-rating">
								<select id="stories-rating-1" name="stories-rating-1">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<div class="stories-item-text">
								<div class="stories-item-text-quote"><img src="<?=$base_url?>/files/quote.png" alt="" /></div>
								My visits to Dental clinic is always more than just a pleasant experience! I had my cleaning done by Arnie Alban and she did an absolutely impeccable job!! She meticulously and patiently removed the most stubborn stains without causing any discomfort! If you are seeking perfection, then I highly recommend Arnie! </div>
							<div class="stories-item-desc"> Tooth whitening can be a very effective way of lightening the natural colour of your teeth without removing any of the tooth surface.
								<ul>
									<li>Teeth whitening</li>
									<li>Teeth cleaning</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
							<div class="stories-item-before"> <img src="<?=$base_url?>/files/stories1.jpg" alt="" />
								<div class="stories-item-before-title"> BEFORE </div>
							</div>
							<div class="stories-item-after"> <img src="<?=$base_url?>/files/stories2.jpg" alt="" />
								<div class="stories-item-after-title"> AFTER </div>
							</div>
						</div>
					</div>
					
					<!-- STORIES ITEM -->
					<div class="stories-item">
						<div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
							<div class="stories-item-name"> Candice Heath </div>
							<div class="stories-item-position"> Office Manager </div>
							<div class="stories-item-rating">
								<select id="stories-rating-2" name="stories-rating-2">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<div class="stories-item-text">
								<div class="stories-item-text-quote"><img src="<?=$base_url?>/files/quote.png" alt="" /></div>
								I just recently had my braces taken off and to my amazement, underneath was the most beautiful smile I ever could have dreamed possible. I just wanted to thank you for giving me so much to smile about! </div>
							<div class="stories-item-desc"> Orthodontics can give you the straight teeth and proper bite that will help you chew better, smile more often, and keep your teeth longer.
								<ul>
									<li>Orthodontic treatment</li>
									<li>Bite correction</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
							<div class="stories-item-before"> <img src="<?=$base_url?>/files/stories3.jpg" alt="" />
								<div class="stories-item-before-title"> BEFORE </div>
							</div>
							<div class="stories-item-after"> <img src="<?=$base_url?>/files/stories4.jpg" alt="" />
								<div class="stories-item-after-title"> AFTER </div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-btn carousel-next" id="next-stories"><i class="fa fa-angle-right"></i></div>
				<div class="carousel-btn carousel-prev" id="prev-stories"><i class="fa fa-angle-left"></i></div>
			</div>
		</div>
	</div>
</div>
<?php } ?>
<!-- =========================
    END STORIES
============================== --> 

<!-- =========================
    BLOG
============================== -->
<div class="blog" id="NEWS">
	<div class="container">
		<div class="row">
			<h2 class="section-title">LATEST
				<span class="bold700">NEWS</span>
			</h2>
			<p class="section-subtitle">We will always keep you informed about fresh news about our job in Texas Brighter Smile. Moreover, you will find useful articles about dental care,<br>
				the newest technologies in the treatment, oral hygiene, and interesting events related to dentistry and medicine in general. </p>
			<div class="blog-container">
				<div class="owl-blog" id="owl-blog">
                    <?php
                    foreach ($news as $newsItem)
                    {
                        $newsID = $newsItem->nid;
                        if(isset($newsItem->field_news_image['und'][0]['uri']))
                            $news_image_item_url = file_create_url($newsItem->field_news_image['und'][0]['uri']);
                        else
                            $news_image_item_url="";
                        if (isset($newsItem->field_news_date['und'][0]['value']))
                            $news_date = $newsItem->field_news_date['und'][0]['value'];
                        else
                            $news_date = "";
                        if (isset($newsItem->field_news_author['und'][0]['value']))
                            $news_auther = $newsItem->field_news_author['und'][0]['value'];
                        else
                            $news_auther = "";
                        if (isset($newsItem->body['und'][0]['summary']))
                            $summary = $newsItem->body['und'][0]['summary'];
                        else
                            $summary  = "";
                        if (isset($newsItem->title))
                            $title = $newsItem->title;
                        else
                            $title = "";
                        if (isset($newsItem->field_news_auther_link['und'][0]['value']))
                            $news_auther_link = $newsItem->field_news_auther_link['und'][0]['value'];
                        else
                            $news_auther_link = "";
                    ?>
                        <div class="blog-item">
                            <div class="blog-item-image"> <img src="<?=$news_image_item_url?>" alt="" />
                                <div class="blog-item-date"><i class="fa fa-calendar-o"></i><?=$news_date ?></div>
                                <!--div class="blog-item-comments"><i class="fa fa-comments-o"></i> 7</div!-->
                            </div>
                            <div class="blog-item-title">
                                <h3><a href="<?=$base_url?>/node/<?=$newsID?>" ><?=$title?></a></h3>
                            </div>
                            <div class="blog-item-author"><a href="<?=$news_auther_link?>"><?="by ".$news_auther?></a></div>
                            <div class="blog-item-text"><?=$summary?></div>
                            <div class="blog-item-button"><a href="<?=$base_url?>/node/<?=$newsID?>" class="btn btn-primary-1">READ MORE</a></div>
                        </div>
                    <?php
                    }
                    ?>
					<!-- BLOG ITEM -->
					<!--div class="blog-item">
						<div class="blog-item-image"> <img src="<?=$base_url?>/files/blog2.jpg" alt="" />
							<div class="blog-item-date"><i class="fa fa-calendar-o"></i> 03.10.2016</div>
							<div class="blog-item-comments"><i class="fa fa-comments-o"></i> 12</div>
						</div>
						<div class="blog-item-title">
							<h3><a href="#">We are giving each of our patients<br>
								the healthy smile!</a></h3>
						</div>
						<div class="blog-item-author"><a href="#">by Dr. Kaeden Bernard</a></div>
						<div class="blog-item-text">Dental implant placement is no longer performed only by oral surgeons and periodontists; general dentists are also increasingly providing difficult surgical implant services. Dental implants may be used to replace single teeth, replace multiple teeth.</div>
						<div class="blog-item-button"><a href=# class="btn btn-primary-1">READ MORE</a></div>
					</div-->

					<!-- BLOG ITEM -->
					<!--div class="blog-item">
						<div class="blog-item-image"> <img src="<?=$base_url?>/files/blog3.jpg" alt="" />
							<div class="blog-item-date"><i class="fa fa-calendar-o"></i> 03.10.2016</div>
							<div class="blog-item-comments"><i class="fa fa-comments-o"></i> 7</div>
						</div>
						<div class="blog-item-title">
							<h3><a href="#">Protect Your Child's Teeth with Dental Sealants</a></h3>
						</div>
						<div class="blog-item-author"><a href="#">by Dr. Kaeden Bernard</a></div>
						<div class="blog-item-text">Dental implant placement is no longer performed only by oral surgeons and periodontists; general dentists are also increasingly providing difficult surgical implant services. Dental implants may be used to replace single teeth, replace multiple teeth.</div>
						<div class="blog-item-button"><a href=# class="btn btn-primary-1">READ MORE</a></div>
					</div-->

					<!-- BLOG ITEM -->
					<!--div class="blog-item">
						<div class="blog-item-image"> <img src="<?=$base_url?>/files/blog2.jpg" alt="" />
							<div class="blog-item-date"><i class="fa fa-calendar-o"></i> 03.10.2016</div>
							<div class="blog-item-comments"><i class="fa fa-comments-o"></i> 12</div>
						</div>
						<div class="blog-item-title">
							<h3><a href="#">We are giving each of our patients<br>
								the healthy smile!</a></h3>
						</div>
						<div class="blog-item-author"><a href="#">by Dr. Kaeden Bernard</a></div>
						<div class="blog-item-text">Dental implant placement is no longer performed only by oral surgeons and periodontists; general dentists are also increasingly providing difficult surgical implant services. Dental implants may be used to replace single teeth, replace multiple teeth.</div>
						<div class="blog-item-button"><a href=# class="btn btn-primary-1">READ MORE</a></div>
					</div!-->
				</div>
				<!-- BLOG BUTTONS -->
				<div class="carousel-btn carousel-next" id="next-blog"><i class="fa fa-angle-right"></i></div>
				<div class="carousel-btn carousel-prev" id="prev-blog"><i class="fa fa-angle-left"></i></div>
			</div>
		</div>
	</div>
</div>


<!-- =========================
    END BLOG
============================== --> 

<!-- =========================
    TIPS AND FAQ
============================== -->

<!-- =========================
    END TIPS AND FAQ
============================== --> 
<!-- =========================
    INSURANCES
============================== -->
<div class="insurances">
	<div class="container">
<div class="row">
        <style>
            .dentologist-list li:before {
    content: '\f05d';
    position: absolute;
    left: 0;
    font-family: FontAwesome;
    margin-right: 5px;
    color: #1f63ae;
    font-size: 18px;
    padding: 0 4px;
    vertical-align: middle;
}
.dentologist-list li {
    
    display: block;
    padding-left: 30px;
    position: relative;
    margin-bottom: 10px;
    margin-top: 5px;
}
        </style>
            <div class="col-md-12">
                 <h2 class="section-title">
                <span class="bold700">Insurance</span>
            </h2>
               
                <p class="large-text">We accept all dental insurance plans and will help you understand your benefits. It is impossible for us to be in-network with every insurance provider however, we will still be able to file insurance claims for you as out-of-network providers. Our team will take the time to help you better understand your benefits. Please give us a call now, we are ready to help. Below is a list of our in-network insurance companies.</p>
              
            </div>
            
            <div class="col-md-3">
                <ul class="dentologist-list check-circle list-unstyled">
                   <li>Aetna</li>
				   <li>BCBS</li>
				   <li>United Conc.</li>
				   <li>Guardian</li>
				   <li>Cigna</li>
                   <li>Metlife</li> 
                    <li>Humana</li>
                    
                    <li>Principal</li> 
                </ul>
            </div>
          
           
            <div class="col-md-3">
              <img src="<?=$base_url?>/files/aetna.png" class="img-responsive width-400 display-inline-xs" style="margin: 0 auto;">
            </div>
			  <div class="col-md-3"> 
                <img src="<?=$base_url?>/files/metlife.jpg" class="img-responsive width-400 display-inline-xs"style="margin: 0 auto;">
             </div> <div class="col-md-3">      <img src="<?=$base_url?>/files/principle.jpg" class="img-responsive width-400 display-inline-xs"style="margin: 0 auto;">
            </div>
              
              
              
                  
			<div class="col-md-3"><img src="<?=$base_url?>/files/bcbs.jpg" class="img-responsive width-400 display-inline-xs" style="margin: 0 auto;"></div>
			<div class="col-md-3"><img src="<?=$base_url?>/files/conc.jpg" class="img-responsive width-400 display-inline-xs" style="margin: 0 auto;"></div>
			<div class="col-md-3"><img src="<?=$base_url?>/files/guardian.png" class="img-responsive width-400 display-inline-xs" style="margin: 0 auto;"></div>
			<div class="col-md-3"><img src="<?=$base_url?>/files/cigna.jpg" class="img-responsive width-400 display-inline-xs" style="margin: 0 auto;"></div>
			<div class="col-md-3"><img src="<?=$base_url?>/files/humana.jpg" class="img-responsive width-400 display-inline-xs"style="margin: 0 auto;"></div>
   
</div>
    </div></div>
 <!-- =========================
    END INSURANCES
============================== -->
<!-- =========================
    CLIENTS
============================== -->
<div class="clients">
	<div class="container">
		<div class="row">
			<p class="section-subtitle">PARTNER COMPANIES</p>
			<div class="clients-container">
				<div class="owl-clients" id="owl-clients"> 
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients1.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients2.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients3.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients4.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients5.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients2.jpg" alt="" /> </div>
					
					<!-- CLIENTS ITEM -->
					<div class="clients-item"> <img src="<?=$base_url?>/files/clients3.jpg" alt="" /> </div>
				</div>
				
				<!-- CLIENTS BUTTONS -->
				<div class="carousel-btn carousel-next" id="next-clients"><i class="fa fa-angle-right"></i></div>
				<div class="carousel-btn carousel-prev" id="prev-clients"><i class="fa fa-angle-left"></i></div>
			</div>
		</div>
	</div>
</div>
<!-- =========================
    END CLIENTS
============================== --> 

<!-- =========================
    POPUP FORMS
============================== -->

<div class="bookform" id="bookform1" >
    <div class="bookform-left">
        <h2 class="section-title">
            <span class="bold700">BOOK APPOINTMENT</span>
        </h2>

        <form class="bookform-form"  role="form" method="post" id="user-book-appointment-form" action="sendmail-book.php">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item f-doctor">
                    <select id="doctor" class="form-doctor" name="doctor">
                        <option value="Dr. Osama Darweesh">Dr. Osama Darweesh</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item name">
                    <input type="text" name="name" id="name1" data-validation="required" placeholder="Your name" />
                    <div class="help help-sm help-red">!</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item phone">
                    <input type="text" name="mobile" id="mobile" class="mobile" data-validation="required"  />
                    <div class="help help-sm help-red">!</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item email">
                    <input type="text" name="email" id="email" placeholder="E-mail" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 booking-form-item date">
                    <input type="text" class="datepicker-f" id="app-date" name="date" data-validation="required" placeholder="Date" />
                    <div class="help help-sm help-red">!</div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 booking-form-item time-f">
                    <input type="text" class="timepicker-f" id="app-time" name="time" data-validation="required" placeholder="Time" />
                    <div class="help help-sm help-red">!</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">
                    <textarea name="message" id="message" placeholder="Your message.."></textarea>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <label  for="how-did-you-hear-about-us" class="form-doctor">How did you hear about us?</label>
                </div>
            </div>
            <div class="row">

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item form-channel">
                    <select name="how-did-you-hear-about-us" id="how-did-you-hear-about-us" class="form-doctor " data-validation="required"  >
                        <option value=""></option>
                        <option value="Internet">Internet</option>
                        <option value="Friend">Friend</option>
                        <option value="Mailer">Mailer</option>
                        <option value="Insurance">Insurance</option>
                        <option value="Facebook">Facebook</option>
                        <option value="Other">Other</option>
                    </select>

                    <div class="help help-sm help-red">!</div>
                </div>
            </div>

            <div class="row latest-row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">
                    <button class="btn btn-primary" >SUBMIT</button>
                    <a class="fb-close" id="fb-close1" href="javascript:jQuery.fancybox.close();">Cancel</a> </div>
            </div>
            <div class="form-messages form-messages-modal"></div>
        </form>
    </div>
</div>
<div class="bookform bookform-1" id="bookform2">
	<div class="bookform-left">
		<h2 class="section-title">
			<span class="bold700">ADD REVIEW</span>
		</h2>
        
		<form class="bookform-form" action="sendmail-review.php" role="form" method="post">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item name">
					<input type="text" name="name" id="name1" data-validation="required" placeholder="Your name" />
					<div class="help help-sm help-red">!</div>
				</div>
			</div>
            
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item name">
					<input type="text" name="position" id="position" data-validation="required" placeholder="Your position" />
					<div class="help help-sm help-red">!</div>
				</div>
			</div>
            
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item phone">
					<input type="text" name="mobile" id="mobile" data-validation="required" placeholder="Mobile" />
					<div class="help help-sm help-red">!</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item email">
					<input type="text" name="email" id="email" placeholder="E-mail" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">
					<textarea name="message" id="message" placeholder="Your message.."></textarea>
				</div>
			</div>
			<div class="row latest-row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">
					<button class="btn btn-primary" >SUBMIT</button>
					<a class="fb-close" id="fb-close1" href="javascript:jQuery.fancybox.close();">Cancel</a> </div>
			</div>
			<div class="form-messages form-messages-modal"></div>
		</form>
	</div>
</div>
