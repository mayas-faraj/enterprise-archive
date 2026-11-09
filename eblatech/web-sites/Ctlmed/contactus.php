

<!-- Contact Us starts here-->
<section class="contact-us  padding-section text-center" id="contact-us">
	<div class="container">
		<!--<h6 class="heading-underline centered link-color no-margin-top">CONTACT US</h6>-->
		<span class="heading-underline centered link-color no-margin-top span-small-border-bottom">CONTACT US</span>
		<h2>Request an Appointment</h2>
		<p>Fill out the form below and we will contact you during our working hours.</p>
		<div class="row">
			<div class="col-md-offset-1 col-md-10 col-md-offset-1">
				<form action="mail.php" class="contact-form" id="contactForm" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group user"><input type="text" name="firstname" class="form-control" placeholder="First Name"></div>
						</div>
						<div class="col-md-6">
							<div class="form-group user"><input type="text" name="lastname" class="form-control" placeholder="Last Name"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group phone"><input type="text" name="phone" class="form-control" placeholder="Phone Number"></div>
						</div>
						<div class="col-md-6">
							<div class="form-group email"><input type="email" name="email" class="form-control" placeholder="E-mail"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="styled-select">
								<select id="day" name="day" style="width: 100%;">									   
                <option value="not selected">Appointment day preference</option>
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
                </select>
							</div>
						</div>
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="styled-select">
								<select id="time" name="time" style="width: 100%;">                      
                <option value="not selected">Appointment time preference</option>
                <option value="Morning">Morning</option>
                <option value="Afternoon">Afternoon</option>
                </select>
							</div>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<textarea name="message" placeholder="Question/Comment" class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Who is the appointment for?</a> </h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-12 service-detail">
													<div class="control-group  pull-left">
														<label class="control control--checkbox">Myself
                            <input name="service_for[]" value="Myself" type="checkbox" checked/>
                            <div class="control__indicator"></div>
                        </label>
														<label class="control control--checkbox">My family
                            <input name="service_for[]" value="My Family" type="checkbox"/>
                            <div class="control__indicator"></div>
                        </label>
														<label class="control control--checkbox">My family member
                            <input name="service_for[]" value="My family member" type="checkbox"/>
                            <div class="control__indicator"></div>
                        </label>
														<label class="control control--checkbox">Other
                            <input name="service_for[]" value="other" type="checkbox"/>
                            <div class="control__indicator"></div>
                        </label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input name="service_for_others" placeholder="Other" class="form-control">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Why are you scheduling this appointment?</a> </h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-12 service-detail pull-left">
													<div class="control-group2">
														<label class="control control--checkbox">Check up and teeth cleaning
                                    <input name="reason_list[]" value="Check up and teeth cleaning" type="checkbox" checked/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">Follow up
                                    <input name="reason_list[]" value="Follow up"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">Veneers
                                    <input name="reason_list[]" value="Veneers"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">Tooth whitening
                                    <input name="reason_list[]" value="Tooth whitening"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">Braces
                                    <input name="reason_list[]" value="Braces"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">Emergency
                                    <input name="reason_list[]" value="Emergency"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
														<label class="control control--checkbox">other
                                    <input name="reason_list[]" value="other"type="checkbox"/>
                                    <div class="control__indicator"></div>
                                </label>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input name="reason_others" placeholder="Other" class="form-control" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-4">
							<button class="btn btn-default blue-btn" name="btnSubmit" type="submit">Send</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- Contact Us ends here-->
