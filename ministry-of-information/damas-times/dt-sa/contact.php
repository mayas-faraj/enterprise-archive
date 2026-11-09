<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>أنت المراسل</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<section id="main-section">
			<header>
			<?php include "header.php"; ?>
			</header>
			<h1 class="page-title">انت المراسل</h1>
			<div class="row-section">
				<div class="column-section">
					<picture>
						<source srcset="/assets/imgs/reporter.jpg">
						<img src="/assets/imgs/reporter.jpg" class="responsive-img" alt="بتوقيت دمشق انت المراسل">
					</picture>
				</div>
				<div class="column-section">
					<p>
					يمكنكم مشاركتنا في صناعة الحدث, ان كنت تملك مادة اعلامية قمت بتصويرها أو حصلت عليها وتريد مشاركتها عبر موقع بتوقيت دمشق, ارسل المادة الاعلامية عبر البريد الالكتروني وسوف يتم التواصل معك بأقرب وقت
					</p>
					<strong>يمكنكم مراسلتنا عبر البريد الالكتروني</strong>
					<address>
						<a href="mailto:info@damas-times.com"><i class="fa-solid fa-envelope"></i>Email: info@damas-times.com</a>
					</address>
					<?php include "widget/send-form.php"; ?>
				</div>
			</div>
			<?php include "footer.php"; ?>	
		</section>
	</body>
</html>
