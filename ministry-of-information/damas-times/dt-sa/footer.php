<?php $footer_text=ApiManager::request(array("operation"=>"read-option", "option_name"=>"footer-text")); ?>
<footer>
	<div>
		<img class="logo-footer" src="assets/imgs/damastimes-logo.png" atl="شعار بتوقيت دمشق">
	</div>
	<div>
		<h2>بتوقيت دمشق</h2>
		<p><?php echo $footer_text; ?></p>
	</div>
	<div id="footer-friend-sites">
		<h2>روابط مهمة</h2>
		<ul>
			<?php $friend_sites=ApiManager::request(array("operation"=>"read-friend-sites")); ?>
			<?php foreach($friend_sites as $site): ?>
			<li>
				<a href="<?php echo $site->url ?>" target="_blank">
					<img src="<?php echo $site->logo; ?>" title="<?php echo $site->name; ?>">
				</a>
			</li>
			<?php endforeach; ?>
		</ul>
	</div>
	<div id="footer-link">
		<h2>تواصل معنا</h2>
		<ul>
			<li><a href="facebook.com"><i class="fa-brands fa-facebook-f"></i></a></li>
			<li><a href="instagram.com"><i class="fa-brands fa-instagram"></i></a></li>
			<li><a href="youtube.com"><i class="fa-brands fa-youtube"></i></a></li>
			<li><a href="mailto:info@damas-times.com"><i class="fa-solid fa-envelope"></i></a></li>

		</ul>
	</div>
</footer>
<!--js scripts-->
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="src/node_modules/moment/min/moment-with-locales.js"></script>
<script src="src/app.js" type="module"></script>
