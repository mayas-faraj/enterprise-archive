<section id="contact">
	<div id="ctl-map"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">Contact Us for Any Question!</h2>
				<hr class="primary">
				<!-- <p>Contact us phrase goes here. Possibly 2-3 lines of phrase would work great here. Possibly 2-3 lines of phrase would work great here. Possibly 2-3 lines of phrase would work great here. </p> -->
			</div>
			<div class="col-lg-6 text-center">
				<div class="row text-center">
					<i class="fa fa-phone fa-3x sr-contact"></i>
					<a href="tel:214-545-5820">
						<p>214-545-5820</p>
					</a>
				</div>

				<div class="row text-center">
					<div class="text-center">
						<i class="fa fa-fax fa-3x sr-contact"></i>
						<a href="tel:888-831-4892">
							<p>888-831-4892</p>
						</a>
					</div>

				</div>
			</div>


			<!--
          <div class="col-lg-3 text-center">
            <i class="fa fa-phone fa-3x sr-contact"></i>
            <a href="tel:214-545-5820"><p>214-545-5820</p>	</a>
          </div>
          <div class="col-lg-3 text-center">
			   <i class="fa fa-fax fa-3x sr-contact"></i>
             <a href="tel:888-831-4892"><p>888-831-4892</p>	</a>
			  
          </div>
-->

			<!--
          <div class="col-lg-3 text-center">
            <i class="fa fa-envelope-o fa-3x sr-contact"></i>
            <p><a href="mailto:info@ctlmed.com">info@ctlmed.com</a></p>
          </div>
-->

			<div class="col-lg-6 text-center">
				<form action="mail.php" class="contact-form" id="contactForm" method="post">
					<input name="skey" type="hidden" value="<?=$skey?>" />
                    <?php
						if(isset($_REQUEST['formError']))
						{
							echo '<h3>'.'Please Check Form Data'.'</h3>';
						}
					?>
                    <div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="form-group user"><input type="text" name="fullname" class="form-control" placeholder="Full Name"></div>
						</div>

					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="form-group email"><input type="email" name="email" class="form-control" placeholder="E-mail"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="form-group mobile"><input type="phone" name="phone" class="form-control" placeholder="Phone"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="form-group">
								<textarea name="message" placeholder="Question/Comment" class="form-control"></textarea>
							</div>
						</div>
					</div>

				
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="g-recaptcha" data-sitekey="6Ld_hi4UAAAAAM9B6BzbMOlFYZEyt10boE35Uq2Z"></div>

						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<button class="btn btn-primary pull-center " name="btnSubmit" type="submit">Send</button>
						</div>
					</div>
                    
                    
                    
				</form>
			</div>
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<hr class="primary">
				<a href="https://www.google.com/maps/place/CTL+Medical+Corporation/@32.9784514,-96.8355218,15z/data=!4m2!3m1!1s0x0:0x92920368de76879e?sa=X&ved=0ahUKEwix1qnYjL7VAhUmAcAKHYuRB5YQ_BIIcDAM">
					<p>CTL Medical: 4550 Excel Parkway. Suite #300, Addison, TX 75001</p>
				</a>

			</div>
		</div>
	</div>
</section>
