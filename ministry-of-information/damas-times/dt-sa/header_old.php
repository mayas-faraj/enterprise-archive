<?php
$menu=ApiManager::request(array("operation"=>"read-categories-menu"));
?>
<header>
	<div id="top-header">
		<div id="logo-header">
			<div class="svg-header">بتوقيت دمشق</div>
			<div class="svg-curve-header"></div>
			<img class="logo-header" src="assets/imgs/damastimes-logo.png" atl="شعار بتوقيت دمشق">
			<div class="svg-curve-header"></div>
			<div class="svg-header">سورية والعالم</div>
		</div>
		<nav>
			<ul>
				<li><a href="/">الرئيسية</a></li>
				<?php foreach($menu as $item): ?>
				<li><a href="/cat/<?php echo $item->category_title; ?>"><?php echo $item->category_title; ?></a></li>
				<?php endforeach; ?>
				<li><a href="/aboutus">من نحن</a></li>
				<li><a href="/contact">أنت المراسل</a></li>
			</ul>
		</nav>
	</div>
</header>
