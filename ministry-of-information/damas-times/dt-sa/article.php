<?php
$article_title=substr($_REQUEST["uri"], strpos($_REQUEST["uri"], "/")+1);
$article_title=str_replace("\"", "&quot;", $article_title);
$post_detail=ApiManager::request(array("operation"=>"read-post", "post_title"=>$article_title));
$category_posts=ApiManager::request(array("operation"=>"read-posts-categories", "category_title"=>$post_detail->category_title, "length"=>8));
?>
<!DOCTYPE html>
<html lang="ar">
	<head>
		<title><?php echo $post_detail->post_title; ?></title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<section id="main-section">
		<?php include "header.php"; ?>
			<div class="main-block">
				<h1 class="page-title"><?php echo $post_detail->post_title; ?></h1>
				<figure>
					<img src="<?php echo $post_detail->featured_image; ?>" class="post-image">
				</figure>
				<p class="post-content"><?php echo str_replace("&amp;nbsp;", "", str_replace("&amp;ldquo;", "\"", str_replace("&amp;rdquo;", "\"", $post_detail->post_content))); ?></p>
			</div>
			<div class="side-block">
				<div class="widget-block">
					<h2>آخر الأخبار</h2>
					<div class="list-content">
						<?php foreach ($category_posts as $post): ?>
						<div class="list-line">
							<p>
								<a href="articles/<?php echo $post->post_title ?>">
								<img src="<?php echo $post->featured_image; ?>"><?php echo $post->post_title; ?>
								</a>
							</p>
							<p>
								<i class="fa fa-clock"></i><time datetime="<?php echo $post->post_date; ?>" title="<?php echo substr($post->post_date, 0, 10); ?>"></time>
								<i class="fa fa-bookmark"></i><?php echo $post->category_title; ?></p> 
						</div>
						<?php endforeach; ?>
					</div>	
				</div>
			</div>
			<?php include "footer.php"; ?>
		</section>
	</body>
</html>
