<?php
$category=substr($_REQUEST["uri"], strpos($_REQUEST["uri"], "/")+1);
$posts=ApiManager::request(array("operation"=>"read-posts-categories", "category_title"=>$category, "length"=>12));
?>
<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>آخر الأخبار</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<?php include "header.php"; ?>
		<section id="category-section">
			<div class="main-articles">
				<?php for($i=0; $i<3; $i++): ?>
				<div class="article">
					<a href="/articles/<?php echo $posts[$i]->post_title; ?>">
						<img src="http://damas-times.com/photo/<?php echo $posts[$i]->featured_image; ?>">
						<strong><?php echo $posts[$i]->post_title; ?></strong>
						<span><?php echo $posts[$i]->post_exerpt; ?></span>
						<span><i class="fa-solid fa-clock"></i><?php echo $posts[$i]->post_title; ?></span>
					</a>
				</div>
				<?php endfor; ?>
			</div>
			<div class="articles">
				<?php for($i=3; $i<12; $i++): ?>
				<div class="article">
					<a href="/articles/<?php echo $posts[$i]->post_title; ?>">
						<img src="http://damas-times.com/photo/<?php echo $posts[$i]->featured_image; ?>">
						<strong><?php echo $posts[$i]->post_title; ?></strong>
						<span><?php echo $posts[$i]->post_exerpt; ?></span>
						<span><i class="fa-solid fa-clock"></i><?php echo $posts[$i]->post_title; ?></span>
					</a>
				</div>
				<?php endfor; ?>
			</div>
		</section>
		<?php include "footer.php"; ?>
	</body>
</html>
