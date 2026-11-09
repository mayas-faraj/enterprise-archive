<?php
$header_videos=ApiManager::request(array("operation"=>"read-gallery", "post_title"=>"header-videos"));
$sliders=ApiManager::request(array("operation"=>"read-sliders"));
$breaking_news=ApiManager::request(array("operation"=>"read-breaking-news"));
$latest_news=ApiManager::request(array("operation"=>"read-posts", "length"=>8));
$mostread_news=ApiManager::request(array("operation"=>"read-posts-mostread", "length"=>8));
$important_text=ApiManager::request(array("operation"=>"read-option", "option_name"=>"important_text"));
$important_image=ApiManager::request(array("operation"=>"read-option", "option_name"=>"important_image"));
$friend_sites=array();
$blocks=ApiManager::request(array("operation"=>"read-blocks"));
$sidebar_widgets=json_decode(ApiManager::request(array("operation"=>"read-option", "option_name"=>"sidebar-widgets")));
?>
<!DOCTYPE html>
<html lang="ar">
	<head>
		<title>بتوقيت دمشق</title>
		<?php include "head.php"; ?>
	</head>
	<body>
		<section id="main-section">
		<?php include "header.php"; ?>
			<div class="main-block">
				<div class="videos-section">
				<?php foreach ($header_videos->media as $video): ?>
					<div class="video-block">
					<iframe width="100%" height="220" src="<?php echo $video->url ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="video-title">
							<span class="header"><?php echo $video->alt; ?></span>
						</div>
					</div>
				<?php endforeach; ?>
				</div>
				<div id="main-slider" class="swiper">
					<div class="swiper-wrapper">
						<?php foreach ($sliders as $slider): ?>
						<div class="swiper-slide">
							<img src="<?php echo $slider->featured_image; ?>">
							<p><?php echo $slider->post_title; ?></p> 
						</div>
						<?php endforeach; ?>
						<div class="swiper-pagination"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</div>
			</div>
			<div class="side-block">
				<div id="breaking-slider" class="swiper">
					<div class="swiper-wrapper">
					<?php if(count($breaking_news)>0): ?>
					<?php foreach ($breaking_news as $breaking_news_text): ?>
						<div class="swiper-slide">
							<h2 class="card-title">خبر عاجل</h2>
							<div class="card-content">
								<p><?php echo $breaking_news_text->news_content; ?></p>
							</div>
						</div>
					<?php endforeach; ?>
					<?php else: ?>
						<div class="swiper-slide">
							<h2 class="card-title">خبر عاجل</h2>
							<div class="card-content">
								<p>سنوافيكم بكل جديد</p>
							</div>
						</div>
					<?php endif; ?>
					</div>
				</div>
				<div class="widget-block">
					<h2>آخر الأخبار</h2>
					<div class="list-content fixed-height">
						<?php foreach ($latest_news as $post): ?>
						<div class="list-line">
							<p>
								<a href="articles/<?php echo $post->post_title ?>">
								<img src="<?php echo $post->featured_image; ?>"><?php echo $post->post_title; ?>
								</a>
							</p>
							<p class="list-meta">
								<i class="fa fa-clock"></i><time datetime="<?php echo $post->post_date; ?>" title="<?php echo substr($post->post_date, 0, 10); ?>"></time>
								<i class="fa fa-bookmark"></i><?php echo $post->category_title; ?></p> 
						</div>
						<?php endforeach; ?>
					</div>	
				</div>
			</div>
			<?php if($important_text!="" && $important_image!=""): ?>
			<div class="important-section">
				<div class="important-layer">
					<div class="important-article">
						<div>
						<p><?php echo $important_text; ?></p>
						</div>
						<img src="<?php echo $important_image; ?>">
					</div>
				</div>
			</div>
			<?php endif; ?>
			<div class="links-section">
				<div class="link-block">
					<a href="http://192.168.3.233/index.php?uri=new#s1">
						<i class="fa-solid fa-briefcase"></i>
						سياسة
						<br>
						13 خبر اليوم
					</a>
				</div>
				<div class="link-block">
					<a href="http://192.168.3.233/index.php?uri=new#s2">
						<i class="fa-solid fa-globe"></i>
						سوريا والعالم
						<br>
						8 خبر اليوم
					</a>
				</div>
				<div class="link-block">
					<a href="http://192.168.3.233/index.php?uri=new#s3">
						<i class="fa-solid fa-chart-line"></i>
						اقتصاد
						<br>
						5 خبر اليوم
					</a>
				</div>
				<div class="link-block">
					<a href="http://192.168.3.233/index.php?uri=new#s4">
						<i class="fa-solid fa-atom"></i>
						منوعات
						<br>
						2 خبر اليوم
					</a>
				</div>

			</div>
			<div class="main-block">
				<?php foreach($blocks as $block): ?>
				<div class="news-section">
				<div class="news-section-title" id="s1"><?php echo $block->block_title; ?><i class="<?php echo $block->icon_name?>"></i></div>
					<div class="news-section-wrapper">
						<?php $block_categories=ApiManager::request(array("operation"=>"read-block-categories", "block_title"=>$block->block_title)); ?>
						<?php foreach($block_categories as $block_category): ?>
						<?php $category_posts=ApiManager::request(array("operation"=>"read-posts-categories", "category_title"=>$block_category->category_title, "length"=>$block_category->post_display_count)); ?>
						<?php if(count($category_posts)>0): ?>
						<?php if($block_category->slider_display==0): ?>
						<div class="news-block">
							<div class="news-header">
								<h2><a href="/cat/<?php echo $block_category->category_title; ?>"><?php echo $block_category->category_title; ?></a></h2>
								<a href="articles/<?php echo $category_posts[0]->post_title; ?>">
									<img class="featured-image" src="<?php echo $category_posts[0]->featured_image; ?>">
								</a>
							</div>
							<a href="articles/<?php echo $category_posts[0]->post_title; ?>">
								<h3><?php echo $category_posts[0]->post_title; ?></h3>
							</a>
							<p class="post-excerpt"><?php echo $category_posts[0]->post_excerpt; ?></p>
							<div class="more-news">
								<?php for($i=1; $i<count($category_posts); $i++): ?>
								<a href="articles/<?php echo $category_posts[$i]->post_title; ?>">
									<img src="<?php echo $category_posts[$i]->featured_image; ?>">
									<?php $title=$category_posts[$i]->post_title; ?>
									<p><?php echo strlen($title)<120?$title:substr($title, 0, 120) . "..."; ?></p>
								</a>
								<p class="post-excerpt"><?php echo $category_posts[$i]->post_excerpt; ?></p>
								<?php endfor; ?>
							</div>
						</div>
						<?php else: ?>
						<div class="news-block news-header">
							<h2><?php echo $block_category->category_title; ?></h2>
							<div class="swiper slider-category">
								<div class="swiper-wrapper">
									<?php foreach ($category_posts as $category_slider): ?>
									<div class="swiper-slide">
										<img src="<?php echo $category_slider->featured_image; ?>">
										<p><?php echo $category_slider->post_title; ?></p> 
									</div>
									<?php endforeach; ?>
									<div class="swiper-pagination"></div>
									<div class="swiper-button-prev"></div>
									<div class="swiper-button-next"></div>
								</div>
							</div>
						</div>
						<?php endif; ?>
						<?php endif; ?>
						<?php endforeach; ?>
					</div>
				</div>
				<?php endforeach; ?>
			</div>
			<div class="side-block">
				<div class="widget-block">
					<h2>الأكثر قراءة</h2>
					<div class="list-content">
						<?php foreach ($mostread_news as $post): ?>
						<div class="list-line">
							<p>
								<a href="articles/<?php echo $post->post_title ?>">
								<img src="<?php echo $post->featured_image; ?>"><?php echo $post->post_title; ?>
								</a>
							</p>
							<p>
								<i class="fa fa-clock"></i><time datetime="<?php echo $post->post_date; ?>" title="<?php echo substr($post->post_date, 0, 10); ?>"></time>
								<i class="fa fa-user"></i><?php echo $post->read_count; ?></p> 
						</div>
						<?php endforeach; ?>
					</div>
				</div>
				<?php foreach($sidebar_widgets as $widget): ?>
				<div class="widget-block">
					<h2><?php echo $widget->title; ?></h2>
					<?php include "widget/$widget->name.php" ?>
				</div>
				<?php endforeach; ?>
			</div>
			<?php include "footer.php"; ?>
		</section>
	</body>
</html>
