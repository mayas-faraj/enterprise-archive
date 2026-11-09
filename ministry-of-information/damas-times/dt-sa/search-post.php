<?php
$search=substr($_REQUEST["uri"], strpos($_REQUEST["uri"], "/")+1);
$posts=ApiManager::request(array("operation"=>"read-posts", "search"=>$search, "length"=>12));
?>
<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>نتائج البحث</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<section id="main-section">
			<?php include "header.php"; ?>
			<div id="find-section">
				<h1 class="page-title">نتائج البحث</h1>
				<div class="results">
					<?php for($i=0; $i<count($posts); $i++): ?>
					<article>
						<a href="/articles/<?php echo str_replace($search, "<mark>$search</mark>", $posts[$i]->post_title); ?>">
							<img src="<?php echo $posts[$i]->featured_image; ?>">
							<div>
								<h2><?php echo str_replace($search, "<mark>$search</mark>", $posts[$i]->post_title); ?></h2>
								<p><?php echo str_replace($search, "<mark>$search</mark>", $posts[$i]->post_excerpt); ?></p>
								<span class="article-extra">
									<i class="fa-solid fa-clock"></i><time datetime="<?php echo $posts[$i]->post_date; ?>" title="<?php echo $posts[$i]->post_date; ?>"></time>
									<i class="fa-solid fa-bookmark"></i><?php echo $posts[$i]->category_title; ?>

								</span>
							</div>
						</a>
					</article>
					<?php endfor; ?>
				</div>
			</div>
			<?php include "footer.php"; ?>
		</section>
	</body>
</html>
