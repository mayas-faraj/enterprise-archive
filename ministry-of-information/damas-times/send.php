<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>أنت المراسل</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<head>
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
						<li><a href="index.html">الرئيسية</a></li>
						<li><a href="index.html">ملف أونلاين</a></li>
						<li><a href="index.html">سورية والعالم</a></li>
						<li><a href="index.html">الأخبار الاقتصادية</a></li>
						<li><a href="index.html">علوم وتكنولوجيا</a></li>
						<li><a href="index.html">الرياضة</a></li>
						<li><a href="about.html">من نحن</a></li>
						<li><a href="send.html">أنت المراسل</a></li>
					</ul>
				</nav>
		</head>
		<section id="main-section">
			<header>
				<h2>انت المراسل</h2>
				<strong>يمكنك ارسال أي مادة اعلامية هنا</strong>
			</header>
			<div class="send-form">
				<div>
					<form id="report-form">
						<input id="name-text" class="small-input" type="text" placeholder="الاسم*" required>
						<input id="phone-text" class="small-input" type="phone" placeholder="الهاتف">
						<input id="email-text" class="small-input" type="email" placeholder="البريد الالكتروني">
						<input id="attrch-file" class="small-input" type="file" placeholder="#" accept="audio/*,video/*,image/*" required>
						<textarea id="description-text" class="wide-input" placeholder="وصف للمادة المرسلة"></textarea>
						<input id="submit-button" type="submit" class="btn wide-input" value="ارسال">
					</form>
				</div>
				<div>
					<p>
					يمكنكم مشاركتنا في صناعة الحدث, ان كنت تملك مادة اعلامية قمت بتصويرها أو حصلت عليها وتريد مشاركتها عبر موقع بتوقيت دمشق, ارسل المادة الاعلامية عبر البريد الالكتروني وسوف يتم التواصل معك بأقرب وقت
					</p>
					<strong>يمكنكم مراسلتنا عبر البريد الالكتروني</strong>
					<address>
						<a href="mailto:info@damas-times.com"><i class="fa-solid fa-envelope"></i>Email: info@damas-times.com</a>
					</address>
					<picture>
						<source srcset="/assets/imgs/reporter.jpg">
						<img src="/assets/imgs/reporter.jpg" class="reporter-img" alt="بتوقيت دمشق انت المراسل">
					</picture>
				</div>
			</div>
		</section>
		<?php include "footer.php"; ?>	
	</body>
</html>
