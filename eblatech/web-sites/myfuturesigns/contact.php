<!DOCTYPE HTML>
<html>

<head>
	<title>Future Signs Inc | Signs and Banners in Dallas/Fort Worth</title>
	<meta name="keywords" content="Contact us">
<meta name="description" content="If you have any questions regarding our products or services, please contact us by calling or e-mailing us and we'll get back to you as soon as possible. "> 
	<script type="text/javascript"  src='http://www.google.com/recaptcha/api.js'></script>
	<?php
include 'shared-layouts/head-metadata.php';
?>
<style type="text/css">
.form-submit.rectangle-button.green.medium > input:disabled {
    background-color: gray;
    cursor: not-allowed;
}</style>
	
</head>
<body class="contact-page pc">
	<!-- page header -->
	<header id="home">
		<!-- sticky menu -->
		<?php
include 'shared-layouts/menu.php';
?>
		<!--/ sticky menu -->
	</header>
	<!--/ page header  -->
	<div class="top-bg">
		<div class="page-title zoomIn animated"><h1 class="page-title"><span>contact</span></h1></div>
	</div>
	<!-- page content -->
	<div class="page-content">
		<div class="grid-row">
			<div id="content" role="main">
				<div class="title">
					<span class="main-title">CONTACT</span><span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span><br/>
					<h5>GET IN TOUCH WITH US</h5>
				</div>
				<p>If you have any questions regarding our products or services, please contact us by calling or e-mailing us and we'll get back to you as soon as possible.<br>
				We look forward to hearing from you.</p>
				<div class="grid-col-row clear">
					<div class="grid-col grid-col-3 sidebar">
						<div class="contacts">
							<div class="">
								<i class="fa fa-globe"></i>
								<div class="contact-content">
									<strong>Where we are:</strong>
									<p>Future Signs, Inc.<br>
										Dallas/Fort Worth Metroplex</p>
								</div>
							</div>
							<div class="">
								<i class="fa fa-phone"></i>
								 <a href="tel:+1-972-205-9090">
								<div class="contact-content">
									<strong>Customer Care:</strong>
									<p>(972) 205-9090 </p>
								</div></a>
							</div>
							<div class="">
								<i class="fa fa-envelope-o"></i>
								<div class="contact-content">
									<strong>Email:</strong>
									<p>sales@myfuturesigns.com</p>
								</div>
							</div>
							<div class="last">
								<i class="fa fa-share-alt"></i>
								<div class="contact-content">
									<strong>Follow us:</strong>
									<!--<a href="#"><div class="contact-round"><i class="fa fa-twitter"></i></div></a>-->
									<a href="https://www.facebook.com/Future-Signs-214003928730801" target="_blank"><div class="contact-round"><i class="fa fa-facebook"></i></div></a>
									<!--<a href="#"><div class="contact-round"><i class="fa fa-skype"></i></div></a>-->
									<!--<a href="#"><div class="contact-round"><i class="fa fa-rss"></i></div></a>-->
									<a href="https://www.linkedin.com/company/27126970/" target="_blank"><div class="contact-round"><i class="fa fa-linkedin"></i></div></a>
								</div>
							</div>
							
						</div>	
					</div>
					<div class="grid-col grid-col-9">
						<div class="composer">
							<div class="info-boxes error-message" id="feedback-form-errors">
								<div class="info-box-icon"><i class="fa fa-times"></i></div>
								<strong>Error box</strong><br />
								<div class="message"></div>
							</div>
							<div class="info-boxes confirmation-message" id="feedback-form-success">
								<div class="info-box-icon"><i class="fa fa-check"></i></div>
								<strong>Confirmation box</strong><br />Vestibulum sodales pellentesque nibh quis imperdiet
								<div class="close-button"><i class="fa fa-times"></i></div>
							</div>
						</div>
						<div class="email_server_responce" ></div>
						<form action="php/mail.php" method="post" id="feedback-form1" class="message-form clear">
							<p class="message-form-author" style="width: 50%;">
								<label for="author">Your Name <span class="required">*</span></label>
								<input id="author" name="name" type="text" value="" size="30" aria-required="true">

							</p>
							<p class="message-form-email" style="width: 50%;">
								<label for="email">Your E-mail <span class="required">*</span></label>
								<input id="email" name="email" type="text" value="" size="30" aria-required="true">
							</p><!--
							<p class="message-form-website">
								<label for="website">Your Website <span class="required">*</span></label>
								<input id="website" name="website" type="text" value="" size="30" aria-required="true">
							</p>--> 
							<p class="message-form-message">
								<label for="message">Your Messege</label>
								<textarea id="message" name="message" cols="45" rows="10" aria-required="true"></textarea>
							</p>

							<p class="g-recaptcha1 message-form-website" id="g-recaptcha" data-sitekey1="6LfCejcUAAAAAAMzmPd-IVNAAHm7jK03BvOz6cml"></p>
							
							<p class="form-submit rectangle-button green medium">
								<input name="submit" type="submit" id="submit" value="Send"  disabled="" >
							</p>
						</form>
						<div class="email_server_responce"></div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<!--/ page content -->
	<!-- map -->
	<!-- <div class="contact-map contact-page-subscribe">
		<div class="subscribe">
			<div class="grid-row clear">
				<div class="them-mask"></div>
				<div class="subscribe-header">subscribe</div>
				<form action="#" class="clear">
					<input type="email" placeholder="Your Email Address">
					<button type="submit" class="button-send">Send</button>
				</form>
			</div>
		</div>
	</div> -->
	<!--/ map -->
	<!-- page footer -->
	<?php
include 'shared-layouts/footer.php';
?>
	<!--/ page footer  -->
	<a href="#" id="scroll-top" class="scroll-top"><i class="fa fa-angle-up"></i></a>	
	<?php
include 'shared-layouts/js.php';
?>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script>
		
		  

$(document).ready(function() {

	if (typeof grecaptcha !== 'undefined'){
		grecaptcha.render(
			   'g-recaptcha', 
			   {
			    	callback:  function(val) { console.log(val);$("#submit").removeAttr('disabled');
			    	 }, 
			    	sitekey: '6LfCejcUAAAAAAMzmPd-IVNAAHm7jK03BvOz6cml'
			   }); 
	}
	if ($("#feedback-form1").length) {
    $("#feedback-form1").validate(
    {
      onkeyup: false,
      onfocusout: false,
      errorElement: 'p',
      errorLabelContainer: $("#feedback-form-errors .message"),
      rules:
      {
        name:
        {

          required: true,
          
        },
        email:
        {
          required: true,
          email: true
        },
        message:
        {
        	 
          required: true
        } 
      
      },
      messages:
      {
        name:
        {
        	 
          required: 'Please enter your name',
        },
        email:
        {
          required: 'Please enter your email address',
          email: 'Please enter a VALID email address'
        },
        message:
        {        	 
          required: 'Please enter your message'
        } 
        
      },
      invalidHandler: function()
      {
        $("#feedback-form-errors").slideDown('fast');
        $("#feedback-form-success").slideUp('fast');

      },
      submitHandler: function(form)
      {
        $("#feedback-form-errors").slideUp('fast');
        var $form = $(form).ajaxSubmit();
        console.log($(form).parent())
        submit_handler($form, $(form).parent().children(".email_server_responce") );
      }
    });
  }

  /* Ajax, Server response */ 
  var submit_handler =  function (form, wrapper){

    var $wrapper = $(wrapper); //this class should be set in HTML code
    
    $wrapper.css("display","block");
    var data = {
      action: "email_server_responce",
      values: $(form).serialize()
    };
    //send data to server
    $.post("php/contacts-process.php", data, function(s_response) {
      s_response = $.parseJSON(s_response);
      if(s_response.info == 'success'){
        $wrapper.addClass("message message-success").append("<div class='info-boxes confirmation-message' id='feedback-form-success'><div class='info-box-icon'><i class='fa fa-check'></i></div><strong>Success!</strong><br>Your message was successfully delivered.</div>");
        $wrapper.delay(5000).hide(500, function(){
          $(this).removeClass("message message-success").text("").fadeIn(500);
          $wrapper.css("display","none");
        });
        $(form)[0].reset();
        grecaptcha.reset();
        $("#submit").addAttr('disabled');        

      } else { 
        $wrapper.addClass("message message-error").append("<div class='info-boxes error-message'><div class='info-box-icon'><i class='fa fa-times'></i></div><strong>Error Box</strong><br>Server fail! Please try again later!</div>");
        $wrapper.delay(5000).hide(500, function(){
          $(this).removeClass("message message-success").text("").fadeIn(500);
          $wrapper.css("display","none");
        });
            }
      });
        return false;
        } 
      
      						 });
      
      
      						</script>
      </body>
      </html>