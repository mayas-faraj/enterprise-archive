<?php
$menu=ApiManager::request(array("operation"=>"read-categories-menu"));
?>
<header>
	<div class="header-menu">
		<div class="header-top">
			<!--div class="header-logo"-->
			<a href="/"><img class="logo-header" src="assets/imgs/damastimes-logo.png" atl="شعار بتوقيت دمشق"></a>
			<!--/div-->
			<div id="header-link">
				<p>تواصل معنا</p>
				<ul>
					<li><a href="facebook.com"><i class="fa-brands fa-facebook-f"></i></a></li>
					<li><a href="instagram.com"><i class="fa-brands fa-instagram"></i></a></li>
					<li><a href="youtube.com"><i class="fa-brands fa-youtube"></i></a></li>
					<li><a href="mailto:info@damas-times.com"><i class="fa-solid fa-envelope"></i></a></li>

				</ul>
			</div>
			<div id="header-search">
				<p>البحث في الموقع</p>
				<a href="#!"><i class="fa fa-search"></i></a>
				<input type="text" id="search-text">
			</div>
			<div id="header-title">
				<strong>بتوقيت دمشق</strong>
				<p>موقع أخباري شامل</p>
			</div>
		</div>
		<nav>
			<ul>
				<li><a href="/"><img class="nav-logo" src="assets/imgs/damastimes-logo.png" alt="شعار بتوقيت دمشق">الرئيسية</a></li>
				<?php foreach($menu as $item): ?>
				<li><a href="/cat/<?php echo $item->category_title; ?>"><?php echo $item->category_title; ?></a></li>
				<?php endforeach; ?>
				<li><a href="/aboutus">من نحن</a></li>
				<li><a href="/contactus">أنت المراسل</a></li>
			</ul>
		</nav>
	</div>
</header>
