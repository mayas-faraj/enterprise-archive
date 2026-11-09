<?php
$content=file_get_contents("http://cb.gov.sy/ar/exchange-rate/all");
$matches=null;
preg_match("/<td class=\"view-order\".*?>1<\/td><td>(.*?)<\/td><td>(.*?)<\/td><td>(.*?)<\/td><td>(.*?)<\/td><td>(.*?)<\/td>/" , $content, $matches);

?>
<section class="currency-section">
	<div class="currency-row">
		<span></span>
		<span>الحد الأدنى</span>
		<span></span>
		<span>الحد الأعلى</span>
	</div>
	<div class="currency-row">
		<i class="fa-solid fa-dollar"></i>
		<span><?php echo $matches[3] ?></span>
		<i class="fa-solid fa-arrow-left"></i>
		<span><?php echo $matches[2] ?></span>
	</div>
	<div class="currency-row">
		<i class="fa-solid fa-euro"></i>
		<span><?php echo $matches[5] ?></span>
		<i class="fa-solid fa-arrow-left"></i>
		<span><?php echo $matches[4] ?></span>
	</div>
	<div class="currency-row">
		<i class="fa-solid fa-clock"></i>
		<span>آخر تحديث</span>
		<span></span>
		<span><?php echo $matches[1] ?></span>
	</div>
</section>
<style>
.currency-section {
	display: table;
	font-size: .9rem;
	line-height: 1.4rem;
	width: 100%;
	padding: 15px;
	box-sizing: border-box;
	background-image: url("assets/imgs/currency.jpg");
	background-size: cover;
}

.currency-row {
	display: table-row;
}

.currency-row > * {
	display: table-cell;
	padding: 2px;
	border-bottom: 1px solid  #0e918c;
}

.currency-row i {
	font-size: .7rem;
	color: #30475e;
	margin: 0 8px;
	text-shadow: 2px 2px 3px #333;
}
</style>
