<?php
/**
 * Created by PhpStorm.
 * User: Ramez
 * Date: 6/17/2017
 * Time: 8:42 AM
 */
?>
<div class="" id="bookform1">
<div class="bookform-left">
	<h2 class="section-title">
		</h2>

		<form clas="bookform-form" action="sendmail-book.php" role="form" method="post">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item f-doctor">
					<select id="doctor" class="form-doctor" name="doctor">
						<option value="Dr. Darweesh" Dr. Darweesh>Dr. Darweesh</option>
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
					<input type="text" name="mobile" id="mobile" data-validation="required" placeholder="Mobile" />
			<span class="bold700">BOOK APPOINTMENT</span>
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
			<div class="row latest-row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 booking-form-item">
					<button class="btn btn-primary" >SUBMIT</button>
					<a class="fb-close" id="fb-close1" href="javascript:jQuery.fancybox.close();">Cancel</a> </div>
			</div>
			<div class="form-messages form-messages-modal"></div>
		</form>
	</div>
 </div>
