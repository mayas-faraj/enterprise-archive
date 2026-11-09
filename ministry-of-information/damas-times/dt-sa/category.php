<?php
$header_count=3;
$page_number=1;
$category=substr($_REQUEST["uri"], strpos($_REQUEST["uri"], "/")+1);

if(strpos($category, "/")) {
	$header_count=0;
	$page_number=substr($category, strpos($category, "/")+1);
	$category=substr($category, 0, strpos($category, "/"));
}

$posts_count=ApiManager::request(array("operation"=>"read-posts-categories-count", "category_title"=>$category));
$posts=ApiManager::request(array("operation"=>"read-posts-categories", "category_title"=>$category, "length"=>16+$header_count, "offset"=>($page_number-1) * 16));
?>
<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>آخر الأخبار</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<section id="main-section">
			<?php include "header.php"; ?>
			<div id="category-section">
				<h1 class="page-title"><?php echo $category; ?></h1>
				<div class="main-articles">
					<?php for($i=0; $i<$header_count; $i++): ?>
					<div class="article">
						<div class="article-area">
							<a href="/articles/<?php echo $posts[$i]->post_title; ?>">
								<strong><?php echo $posts[$i]->post_title; ?></strong>
								<img src="<?php echo $posts[$i]->featured_image; ?>">
							</a>	
							<p class="post-excerpt-slant"><?php echo $posts[$i]->post_excerpt; ?></p>
						</div>
					</div>
					<?php endfor; ?>
				</div>
				<div class="articles">
					<?php for($i=$header_count; $i<count($posts); $i++): ?>
					<div class="article">
						<a href="/articles/<?php echo $posts[$i]->post_title; ?>">
							<img src="<?php echo $posts[$i]->featured_image; ?>">
							<h2><?php echo $posts[$i]->post_title; ?></h2>
							<!--span><i class="fa-solid fa-clock"></i><time datetime="<?php echo $posts[$i]->post_date; ?>" title="<?php echo $posts[$i]->post_date; ?>"></time></span-->
						</a>
						<p class="post-excerpt"><?php echo $posts[$i]->post_excerpt; ?></p>
					</div>
					<?php endfor; ?>
				</div>
				<div class="pager">
					<?php for($i=1; $i<$posts_count/16; $i++): ?>
						<?php if($i!=1): ?>
							<span> - </span>
							<a href="<?php echo "/cat/$category/$i"; ?>"><?php echo $i; ?></a>
						<?php else: ?>
							<a href="<?php echo "/cat/$category"; ?>"><?php echo $i; ?></a>
						<?php endif; ?>
					<?php endfor; ?>
				</div>
			</div>
			<?php include "footer.php"; ?>
		</section>
	</body>
</html>
