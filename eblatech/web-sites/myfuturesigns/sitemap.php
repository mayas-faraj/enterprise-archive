<!DOCTYPE HTML>
<html>

<head>
	<title>Future Signs Inc | Signs and Banners in Dallas/Fort Worth</title>
	<meta name="keywords" content="sitemap">
<meta name="description" content="sitemap"> 
	<script type="text/javascript"  src='http://www.google.com/recaptcha/api.js'></script>
	<?php
include 'shared-layouts/head-metadata.php';
?>
<style type="text/css">
.form-submit.rectangle-button.green.medium > input:disabled {
    background-color: gray;
    cursor: not-allowed;
}</style>
	     <style type="text/css" media="screen">
<!--
.l0bg{background-color:#2381E9 !important} .l1bg{background-color:#5BCCF6 !important} .l2bg{background-color:#9CD159 !important} .l3bg{background-color:#65A6FF !important} .l4bg{background-color:#FFCC00 !important} .l5bg{background-color:#984DFF !important}
-->
</style>
    <style>
    .map{
        border-left: solid #000 2px;
    padding-left: 15px;
    position: relative !important;
    }
   .l0bg:before {
    content: "";
    position: absolute;
    left: -15px;
    top: 50%;
    margin-top: -1px;
    height: 2px;
    width: 15px;
    background: #000;
}
  
  .widget li {
    
    border-top:none;
  }
.l1bg:before {
    content: "";
    position: absolute;
    left: -15px;
    top: 50%;
    margin-top: -1px;
    height: 2px;
    width: 15px;
    background: #efefef;
}
.l2bg:before {
    content: "";
    position: absolute;
    left: -15px;
    top: 50%;
    margin-top: -1px;
    height: 2px;
    width: 15px;
    background: #000;
}
  .l0bg {
      font-size: 29px;
    background-color: #2381E9 !important;
    display: inline-block;
    max-width: 500px;
    padding: 10px;
    background: #009ddc;
    color: #fff !important;
    text-decoration: none;
    border-radius: 4px;
    text-overflow: ellipsis;
    margin: 5px 0;
    -webkit-box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
    box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
    position: relative !important;
    
}
.l2bg {
    font-size: 18px;
    background-color: #9CD159 !important;
    display: inline-block;
    max-width: 500px;
    padding: 10px;
    background: #009ddc;
   color: #fff !important;
    text-decoration: none;
    border-radius: 4px;
    text-overflow: ellipsis;
    margin: 5px 0;
    -webkit-box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
    box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
    position: relative !important;
}
.l1bg {
    font-size: x-large;
    background-color: #5BCCF6 !important;display: inline-block;
    max-width: 500px;
    padding: 10px;
    background: #009ddc;
    color: #fff !important;
    text-decoration: none;
    border-radius: 4px;
    text-overflow: ellipsis;
    margin: 5px 0;
    -webkit-box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
    box-shadow: 0 0 1px 0 rgba(0,0,0,0.2);
  position: relative !important;
}
</style>
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
		<div class="page-title zoomIn animated"><h1 class="page-title"><span>Sitemap</span></h1></div>
	</div>
	<!-- page content -->
<section id="about" class="about-us">
    <div class="grid-row">
    

    <ul><li class="map"><a class="l0bg" href="http://www.myfuturesigns.com/">myfuturesigns</a><ul></li><li class="map"><a class="l1bg" href="http://www.myfuturesigns.com//">Home </a></li><li class="map"><a class="l1bg" href="http://www.myfuturesigns.com/aboutus.php">About </a></li><li class="map" ><a class="l1bg" href="http://www.myfuturesigns.com/products.php">products</a></li><li class="map"><a class="l1bg" href="http://www.myfuturesigns.com/services.php">services </a></li><li class="map"><a class="l1bg" href="http://www.myfuturesigns.com/gallery.php">gallery</a></li><li class="map"><a class="l1bg" href="http://www.myfuturesigns.com/contact.php">contact</a></li></ul>
	</div></section>
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